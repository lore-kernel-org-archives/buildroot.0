Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE78D66B9A
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1672C8089D;
	Wed, 17 Dec 2025 20:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXSDV7dwluxz; Wed, 17 Dec 2025 20:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38AE683C20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766001835;
	bh=YBgTOuWmjn7wysJRifuCEatJqT/z9q/KgP+1JzWC/0g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pxmEP6sIsk/fC2M5/QE86Hen+kmEymKBNoehc7h7OoqWsyBFcqmRdjf4RWlW1b+LD
	 7iayE//re6tV6sSI0Y5c65z0DhCU6Sgwykm8wUQ8qCR4JBp5FaHnMd7+CBCtoWPUjP
	 BhYcHDxcVLeyFQR9wc1IWlhaGV5ZFyuE1WU/Ep1LgyaR+ezAM0AScZ73XyeyYCvZJ6
	 Npt7hAORTWIA95uyUfM7Dpl4oJ+tXDLlO6D0Cu7TY75nvskdx+l573Bl75PLDvGZ9N
	 PSUuLkEjhp6YT8JSGXMkLocHQs5RBOurm6/ytNAUTpl3rRzuLMG9clEaA86Hxy1N8J
	 HqCXRwEPAInQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38AE683C20;
	Wed, 17 Dec 2025 20:03:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BEBA361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E0583C20
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufa1gMPmCcn1 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795538089D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 795538089D
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:03:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 670C1870D0; Wed, 17 Dec 2025 20:03:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 21:00:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a058aa701dda250bea2911c2e5db5199929f551
X-Git-Newrev: 3d7261b27a9cb47c25602061333bea632ad80c2c
X-Patchwork-Hint: ignore
Message-Id: <20251217200353.670C1870D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cage: properly propagate wlroots
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3d7261b27a9cb47c25602061333bea632ad80c2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
libgbm dependency, but forgot to propagate it to package/cage.

Fixes:

  https://autobuild.buildroot.net/results/dc185c3d4886e9cfd9e6f46b50b864e5b2f28605/

Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cage/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cage/Config.in b/package/cage/Config.in
index 4f823c768c..95c68732ed 100644
--- a/package/cage/Config.in
+++ b/package/cage/Config.in
@@ -1,6 +1,7 @@
-comment "cage needs udev, EGL and OpenGL ES support"
+comment "cage needs udev, EGL, OpenGL ES and GBM support"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_PACKAGE_HAS_LIBGBM || \
 		!BR2_PACKAGE_HAS_UDEV
 
 comment "cage needs a toolchain w/ threads, dynamic library"
@@ -13,6 +14,7 @@ config BR2_PACKAGE_CAGE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	select BR2_PACKAGE_WLROOTS
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
