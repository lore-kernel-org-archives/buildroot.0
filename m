Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CE5D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B39F61007;
	Tue, 13 Jan 2026 21:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ST1R7Sf-9cQr; Tue, 13 Jan 2026 21:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B376961008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338015;
	bh=kV81Hzm7lMYQOJ9GC61YHNu+/MUGAm1VTFwBq6bQ1xA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pbpjN3pMq45teisioywoL7dhVvrSNJ62IUJRvxOUV/GoFt6nCrxY+oCcZ4ogaVBW4
	 bgkEWX4S8uB6LF1VT7pJtnX7S0E+ve6MESDhfvejj4HT3m6dgtkDcHkTyqEXVj+TYa
	 o+mvDiaSan3z25CH0EtsXZtwW7JuXl0TK5eVWo6mi0xEMqo3474b06qc0UD7J2wHzo
	 v9WYdIq+IS80VfTOhtNHtpK39HOVRPBjppFhDoGK+3GJX+swRhGriv1h+yFMvSEMVY
	 6XN01G6kAHPg5/oJHy3Y9Pfou9ZMM8ICWTi06aDlNg2SurM+t51HhAlao4u37UPO0U
	 bs1Dnsw+fNCNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B376961008;
	Tue, 13 Jan 2026 21:00:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2407231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCD0040759
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klcaJTn7BMX7 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5527C407BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5527C407BE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5391380F55; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 735bd8bd9f74d7e10cbfc834adfef243f281094b
X-Git-Newrev: d7c2ce79a16293fa7eec197fa42fceebafa27237
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.5391380F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXaw: bump version to
 1.0.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7c2ce79a16293fa7eec197fa42fceebafa27237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003481.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.hash | 6 +++---
 package/x11r7/xlib_libXaw/xlib_libXaw.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.hash b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
index ce2ec4a3e1..d3061132f3 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.hash
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-March/003372.html
-sha256  ab35f70fde9fb02cc71b342f654846a74328b74cb3a0703c02d20eddb212754a  libXaw-1.0.15.tar.xz
-sha512  8edbf280b7b24b9040c291545053c1251d6af7e7f56da43a6065a1848245863eb52bdfc28c2f18dbb6597a4064394a44f4df5d8596a1a467549ccc9ce50a7821  libXaw-1.0.15.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003481.html
+sha256  731d572b54c708f81e197a6afa8016918e2e06dfd3025e066ca642a5b8c39c8f  libXaw-1.0.16.tar.xz
+sha512  1cabad1a9b06dec7de601b977e844536823ee1a0045244acc42ca6b6107da9b4953736d94898a96cab40845eab77dae21e20e1fa66a3dfc4dedf575dfbca04aa  libXaw-1.0.16.tar.xz
 # Locally calculated
 sha256  9f5adb26952f93b3e4650285b94ec6c61a27aab5a21088bfb6694001be1b360d  COPYING
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index f81a7b4a88..b7d6918dd6 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXAW_VERSION = 1.0.15
+XLIB_LIBXAW_VERSION = 1.0.16
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.xz
 XLIB_LIBXAW_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXAW_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
