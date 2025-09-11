Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD92DCA1016
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 10:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40C5461B62;
	Thu, 11 Sep 2025 10:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12YLfBBWEEJb; Thu, 11 Sep 2025 10:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AA316176A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AA316176A;
	Thu, 11 Sep 2025 10:10:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 615E3234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 10:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5333581B53
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 10:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rli-UjvmjPx7 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 10:10:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B27728195D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B27728195D
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B27728195D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 10:10:10 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1506A35208B7; Thu, 11 Sep 2025 12:10:10 +0200 (CEST)
Date: Thu, 11 Sep 2025 12:10:10 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aMKgAvthoDM_oXwo@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.41 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1757585410; bh=PVELJjAK5Co7aXNG7fjW7NanupC7C5iwsT73KSOx9jQ=;
 h=Date:From:To:Subject:From;
 b=isC59xR/VxWN8JXjmRlqq/A+qPEKq3q8aq27PPu5zTRQC++jdmCFtNWye2GWAfcjV
 ggvvNVC5X3dIlVgCkXvq0qNMN6+PND1bY/dvw6EYCoUzPk2NJdfS9tc8rQnwNwPgbD
 93SNzLYRMFZin8Q46UWDLbZP/sWRcfgw+sF41T4UjWNHXVtwqPxZItcJeRxdkom6tm
 KP2tf29dY95RqmVoNhKGmMDUrue/0S32XKSLWRxd6Wo6ap/0eucSJSFgvo1sJ4zuSY
 dWT3dEFXifxJPhPIHsTTlPyoq8HXMDm1XLTDDMg+SN2EEJQre58R60Z72Nb0mH3HFv
 0DECWnl3AdqOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=isC59xR/
Subject: [Buildroot] [PATCH] package/xlib_xtrans: bump to 1.6.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is following compile error with gcc 15.1.0:

auth.c: In function 'GenerateRandomData': auth.c:320:5: warning:
ignoring return value of 'read' declared with attribute
'warn_unused_result' [-Wunused-result]   320 |     read(fd, buf, len);
|     ^~~~~~~~~~~~~~~~~~ In file included from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/string.h:548,
from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xos.h:62,
from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtrans.h:54,
from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransint.h:79,
from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/transport.c:55,
from xstrans.c:17: In function 'strncpy',     inlined from
'_XSERVTransGetHostname' at
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtrans.c:1351:5,
inlined from '_XSERVTransConvertAddress' at
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransutil.c:188:12:
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bits/string_fortified.h:100:10:
error: '__builtin_strncpy' offset [130, 319] from the object at 'name'
is out of the bounds of referenced subobject 'nodename' with type
'char[65]' at offset 65 [-Werror=array-bounds=]   100 |   return
__builtin___strncpy_chk (__dest, __src, __len,       |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   101 |
__glibc_objsize (__dest));       |
~~~~~~~~~~~~~~~~~~~~~~~~~ In file included from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransint.h:105:
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/sys/utsname.h:
In function '_XSERVTransConvertAddress':
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/sys/utsname.h:54:10:
note: subobject 'nodename' declared here    54 |     char
nodename[_UTSNAME_NODENAME_LENGTH];       |          ^~~~~~~~ cc1: some
warnings being treated as errors make[2]: *** [Makefile:696: xstrans.lo]
Error 1 make[2]: *** Waiting for unfinished jobs.... make[2]: Leaving
directory
'/home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18/os'
make[1]: *** [Makefile:796: all-recursive] Error 1 make[1]: Leaving
directory '/home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18'
make: *** [package/pkg-generic.mk:273:
/home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18/.stamp_built]
Error 2

The update fixes the compile error.

See here for changes:
https://lists.x.org/archives/xorg/2025-March/061900.html

The COPYRIGHT was updated from 2005 to 2025.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.hash | 8 ++++----
 package/x11r7/xlib_xtrans/xlib_xtrans.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.hash b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
index 9595a73d0e..530f2e858a 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.hash
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-June/003399.html
-sha256  1ba4b703696bfddbf40bacf25bce4e3efb2a0088878f017a50e9884b0c8fb1bd  xtrans-1.5.0.tar.xz
-sha512  e8091f11d4ad2b14e01de3eac56bdf2267ea26687ce66e3056374d0d02e049480c0b27c482f8828a0efd086f1e4c485108ca4dce3f83d66c1896effa3b38b228  xtrans-1.5.0.tar.xz
+# From https://www.mail-archive.com/xorg-announce@lists.x.org/msg01797.html
+sha256  faafea166bf2451a173d9d593352940ec6404145c5d1da5c213423ce4d359e92  xtrans-1.6.0.tar.xz
+sha512  e0ac4a2df0eeacdf23cedd74fee063a8eea81d05c4c4c9a9a113b9b4238db7cacb3c831973ac647fe1a5b06426dcdf0b2f8be5ac27862700333269880e25725b  xtrans-1.6.0.tar.xz
 # Locally computed
-sha256  22616bf00b6db85ee3164775a95206894af987b85ff1a7703de55644bc722a39  COPYING
+sha256  3fe68a84ab89e82947e560316ab70cf2d02a8b978ae5cf4fbdfd53fc5b917308  COPYING
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 001705bb2e..152c080a87 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.5.0
+XLIB_XTRANS_VERSION = 1.6.0
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.xz
 XLIB_XTRANS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_XTRANS_LICENSE = MIT
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
