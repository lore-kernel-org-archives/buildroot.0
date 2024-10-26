Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0D7D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7863781E21;
	Sat, 26 Oct 2024 15:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSj7smtSlJON; Sat, 26 Oct 2024 15:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D6881E4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D6881E4C;
	Sat, 26 Oct 2024 15:58:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DDCA75C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCD68605E0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNLFS31XNh-n for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD606065A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDD606065A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 800F383D51; Sat, 26 Oct 2024 15:58:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 17:56:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99db7d2cfd97002f778d0a93220288c08646a501
X-Git-Newrev: ef0903b2bd796b1b0c8e38864cc27ef765356ba1
X-Patchwork-Hint: ignore
Message-Id: <20241026155835.800F383D51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/evilwm: add missing dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef0903b2bd796b1b0c8e38864cc27ef765356ba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing dependency to xlib_libXrandr.

Fixes:

 https://autobuild.buildroot.org/results/9928181557c7f99b7c74065d981f005cbd95145d/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/evilwm/Config.in | 1 +
 package/evilwm/evilwm.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/evilwm/Config.in b/package/evilwm/Config.in
index 86cc17dc76..0f0513df0d 100644
--- a/package/evilwm/Config.in
+++ b/package/evilwm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EVILWM
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	help
 	  A minimalist window manager for the X Window System
 
diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
index b013305c44..78b531095b 100644
--- a/package/evilwm/evilwm.mk
+++ b/package/evilwm/evilwm.mk
@@ -9,7 +9,7 @@ EVILWM_SITE = https://www.6809.org.uk/evilwm/dl
 EVILWM_LICENSE = evilwm license
 EVILWM_LICENSE_FILES = README
 
-EVILWM_DEPENDENCIES = xlib_libX11
+EVILWM_DEPENDENCIES = xlib_libX11 xlib_libXrandr
 
 define EVILWM_INSTALL_XSESSION_FILE
 	$(INSTALL) -m 0755 -D package/evilwm/xsession \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
