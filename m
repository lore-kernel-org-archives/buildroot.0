Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB790D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C048784036;
	Tue, 13 Jan 2026 21:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFCnwONC3IFs; Tue, 13 Jan 2026 21:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C866B8403C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338029;
	bh=PM9JvgISUOLYQlWszEhkSWe3cpOk2XbIEU6SfjdBEhs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=plCbi8bV18KIFG22wmlTlSrRSfEXBTEl/cQ58qxNfHEE21rI3krAJNXEkuXTqN07F
	 WsYDxDjTqJftqQgzfgxMyBtpXmjifULWFcexs9otgpuWRp2+gPjZzmNNK/d+NB4SkI
	 7EoAmoRDNPOtYhAUt+lDwWSrqFvckDNLEbOetSeEulnEVMNJL8Jj1RTBQvon0d4gbn
	 ai5oPLdZ8N92OfgPf3GWUQv4Rc2j/V6fSO2opGPZlEE9xqqSfmlH+ugpslbUzXr1PA
	 5NKoxVI2svj0zUVqpNWrfMLv+MX+I0TEJfYgzerfO5vMOzzP2ar1a9TUfBSaB4IdLZ
	 a26LB6UFc3MnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C866B8403C;
	Tue, 13 Jan 2026 21:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF80231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0A84078B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24xPWqHRN8Qk for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B559840084
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B559840084
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2E4E88573; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51c05053658c9874145cec6da425e881b03ae107
X-Git-Newrev: 59b504e03d33dfa32cfb368470631c05e39a4a80
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.B2E4E88573@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXvMC: bump version
 to 1.0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=59b504e03d33dfa32cfb368470631c05e39a4a80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-February/003456.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash | 6 +++---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
index 15221969e3..12099ffaae 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-March/003132.html
-sha256  0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c  libXvMC-1.0.13.tar.xz
-sha512  c9d0f73884a586efb9ea4f77fc8555f60d940077d7dff8eaa765b86345c8b4e3d80b860f68191d2830c272b9e464c08450fbb51bb64819753a6f4228c71861ac  libXvMC-1.0.13.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003456.html
+sha256  e4be9eb6b6bafdbbf81f47f7163047215376e45e2dc786d0ea6181c930725ed9  libXvMC-1.0.14.tar.xz
+sha512  fc76c6d591780f3481f5032d1f956f2043f3dc7655a4b776dfda4bae55d4424a36d1a3c63dafe2a851908f33159297c0b038a41329d7a137ca7ea73d3db3eedf  libXvMC-1.0.14.tar.xz
 # Locally computed
 sha256  b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index c1fe31277e..1accda1254 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXVMC_VERSION = 1.0.13
+XLIB_LIBXVMC_VERSION = 1.0.14
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.xz
-XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXVMC_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
 XLIB_LIBXVMC_CPE_ID_VENDOR = x.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
