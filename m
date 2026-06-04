Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85830CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D4A41054;
	Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdK-ZNya9zV7; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5114105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663133;
	bh=6KSnXat9DjL9f6LkM+5H2yZATfeo88Ms1v4kkD3ZFJM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y1pxn9sXs42hVvYykKNF4f9+GwNE9uOZh6/WDV+KH+yEHsDrTVmFgOCMoTisAI4Mt
	 y1YdAdV2BAq8Nh7+iiGzMsZqa7O8cRdAeslAdVkVrfuWXQEDvB05tj3FdyUaA4khrn
	 3XFPzbYOqDc5E9Gov6vNo30j1fgfwrUF2cBedhWzxIl0jfUrSy0meMA0N6cQ0+zw2b
	 H40YYFeCTOnFySdizoHAR9msMleBhnBelyrDt5x7Tl9hUV5fwICrnfc0kYDslDDUI4
	 4lC7Yxzd9bbblxnbdAM8m6ZA+dsPPOQNYPMiDHRqQc1uIeKB02qe6nh9sgBa2Gg1xj
	 YB/2IlK4Ql06g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD5114105F;
	Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECD3388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C660381EA3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6tu9ckWBMov for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C3C81EAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16C3C81EAB
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4124F87B3A; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:35:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: adec6e4f9c39a439a21bd94c7c7f8296a6405e2a
X-Git-Newrev: 2cb350c2b418927f76634f97fb002ea7e4a1a1ee
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.4124F87B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/crucible: needs
 NPTL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2cb350c2b418927f76634f97fb002ea7e4a1a1ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

gcc_stack_unix.c: In function 'x_cgo_getstackbound':
gcc_stack_unix.c:28:9: error: implicit declaration of function 'pthread_getattr_np';
 did you mean 'pthread_attr_init'? [-Wimplicit-function-declaration]
   28 |         pthread_getattr_np(pthread_self(), &attr);  // GNU extension

Fixes:
https://autobuild.buildroot.net/results/e07/e07198d7864331027d21cd2109054d86e7ac1c3d/

The build error also occured in Oct 2024 so a backport to buildroot
LTS branches should be considered:
https://autobuild.buildroot.net/results/ebb/ebbd051010c27f97fafc0b203b22c8b0af7e5ccd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1eeed7e97867feaffff38bfac501eb3f5624e411)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/crucible/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/crucible/Config.in b/package/crucible/Config.in
index 1e1b29c3df..f52f871d0b 100644
--- a/package/crucible/Config.in
+++ b/package/crucible/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_CRUCIBLE
 	bool "crucible"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
 	select BR2_PACKAGE_HOST_GO
 	help
 	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
 	  i.MX family.
 
 	  https://github.com/usbarmory/crucible
+
+comment "crucible needs a toolchain w/ NPTL"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
