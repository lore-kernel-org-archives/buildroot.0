Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0F4D3F09E
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E5440BDD;
	Wed, 28 Jan 2026 17:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuQV-Fujh2w1; Wed, 28 Jan 2026 17:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7740840BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620932;
	bh=c5tc9FOAiV93SHQ5gSpX5ld6bNg/8m7BLUlY0L40GvY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bhnt1XSWYawd4nNX7uZF45LD8I0Rjf3y9a0kVrj1P+8VGNS7VuaVBTIOJoHtfk9Xi
	 vqbjiq278IQaQz5HlTDFP8QhfTOSyKS55cgrP1PRcQgn332uuIFTnDg4ZNAaJ5VyPC
	 o0LqhAJGYkE4c1XJZn8T+K3NZZ4WA9vjn+29OBjuWmAQz5uoa2WEj7IG6amlAkM1I6
	 mdsqejzZ9wURPCHhfGioAXZG5XVUW9NjnWTGJHC2RZf8zftDFjy+XIaeT0C+/n9+BP
	 JUqlRz4EA5PAZ0ifs+wSu+19XPPZnglPw6EXInTXidrlNnYhpaNLbFiBro6s5Tdixi
	 O75hj5kgGm0LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7740840BE6;
	Wed, 28 Jan 2026 17:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29FF11AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 381EB60782
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLpS9tjnswXe for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6129860787
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6129860787
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DBEC86082; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:52:32 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 287cc7fbe0df1230493ee150759e675ce5908f31
X-Git-Newrev: 2a2d01a42a0db80a0d07c749ca1211a0a24b3564
X-Patchwork-Hint: ignore
Message-Id: <20260128172152.4DBEC86082@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libgphoto2:
 remove optional dependency to lockdev
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a2d01a42a0db80a0d07c749ca1211a0a24b3564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The lockdev package is unmaintainted and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5f9d8b6e54f51bb1b3cc8f8e659267e9f9e3540a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgphoto2/libgphoto2.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 851eb401a1..95c0190ee6 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -53,8 +53,4 @@ else
 LIBGPHOTO2_CONF_OPTS += --with-gdlib=no
 endif
 
-ifeq ($(BR2_PACKAGE_LOCKDEV),y)
-LIBGPHOTO2_DEPENDENCIES += lockdev
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
