Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424AED30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E3484083;
	Tue, 13 Jan 2026 21:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiYYqd4wtpq3; Tue, 13 Jan 2026 21:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD808407E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338038;
	bh=4hwvKGLcyJjaZgDD2G9RSCELFw17sI83wGJIJh4c+y8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j8Rkze6xbwNdd4psqYY1imU1MSlbert0qi73vCRhXPeCDqh5byOJfHmNywfiM6k/s
	 W/NXM3luS/BIP384WGu1K0bqmo8QnPvtr9mGdPOPxAtteA6k1js1iaqalIceaB5tID
	 FmXESYD4r584tG9fUkyswAuAyeuATFFTeMq1Tz3Mkl8b/0rwuas66EIL4QQwYZmIXu
	 AShKYNXsUEmNrkaYI2zJlg0jHNnwmKfUuLldLy3WYRHUGW1vhe+HrJWUDa7HMMrQfA
	 sp8Yp1P3Q6riWb0r8cYECvr+2xg5k8Yisl6pPw35qsmkAVmdp+MUSYJjIIIQirLD0m
	 BZlMu1b6WmJcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD808407E;
	Tue, 13 Jan 2026 21:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FAEB1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 092C5407CE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qJnfYmJDbUa for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67E3E407D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67E3E407D6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 657FC81124; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 965a86b38ab6d9d74db5f114929a3eed3106ae01
X-Git-Newrev: 88d6e75a53c0cab855e0c4b70cfa8496ef59de75
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.657FC81124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXrandr: bump version
 to 1.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=88d6e75a53c0cab855e0c4b70cfa8496ef59de75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2023-October/003427.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash | 6 +++---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
index 3d3bb640ed..e2914eabd7 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003262.html
-sha256  897639014a78e1497704d669c5dd5682d721931a4452c89a7ba62676064eb428  libXrandr-1.5.3.tar.xz
-sha512  0c385fc304a872048ffca5cfb8789dfe3132e3126894d54b2fe642dff19d286e7ade1d2f6da894e03788df9c5cf31427c674e987143037b7d385b19285590edb  libXrandr-1.5.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003427.html
+sha256  1ad5b065375f4a85915aa60611cc6407c060492a214d7f9daf214be752c3b4d3  libXrandr-1.5.4.tar.xz
+sha512  f7c0b083943e11b4cc3c97e10e2cbbc3920fe0c9c5031ef86fca2eb5df413d767caf53dca266abf65395eb10e55354c8fe59ed6b3265402ffccb919a813bc781  libXrandr-1.5.4.tar.xz
 # Locally computed
 sha256  73777e5be1cef2827d843e4b186803f050c66db472cf8076d88e2b5f71696e67  COPYING
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 5e88173ed7..20b6805b51 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.5.3
+XLIB_LIBXRANDR_VERSION = 1.5.4
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.xz
 XLIB_LIBXRANDR_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
