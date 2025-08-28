Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB47ACA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 09:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57CF98156B;
	Thu, 28 Aug 2025 09:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7hJSYmAc-oh; Thu, 28 Aug 2025 09:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E0B81216
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E0B81216;
	Thu, 28 Aug 2025 09:50:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86D6FB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E7640D81
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGMhBcIOveJz for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 09:50:01 +0000 (UTC)
X-Greylist: delayed 420 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 Aug 2025 09:50:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 031E540D5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 031E540D5B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 031E540D5B
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:50:00 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7B55D352079F; Thu, 28 Aug 2025 11:42:57 +0200 (CEST)
Date: Thu, 28 Aug 2025 11:42:57 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aLAkodShF1xxCh3C@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.1.0-38-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1756374177; bh=tJOxk6Qdh5RAp7fnBMp+HEaxGTdO8zJSbKDQ7/qkGUU=;
 h=Date:From:To:Subject:From;
 b=gvFEQ3KiA6Tqa+FbusqdJRXFjfpjJ9C8RiFjiMXyKCCQFez6OYWuMOBBA2WQ2mxen
 rn3pPDDuM8IL27eOvyCRIa4fhzuGv+0x0vKxt1gIj0oOddz+xyy5s7iXNZqnrV795u
 zk8VasdHO2+/qPnD+Enug50NMOoF2FcN1tpoahlFMAsHrUZPxiCKlqbxs4+gtHo7oi
 GfRfx9ho+v6d3+Btvt4b8HChEDxkZ759dw87G86xYKhhTd4QZK+p+FdAv/AcNbgEw8
 CRUyqiGQoH2vAB7tV91qzvZffQvo7DgYHTgnRRjTWwYG8xbt7S3LsXQK9XyX2OvAcQ
 a2AkaRJzvCeVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=gvFEQ3Ki
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libXt: bump to 1.3.1
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/x11r7/xlib_libXt/xlib_libXt.hash | 5 +++--
 package/x11r7/xlib_libXt/xlib_libXt.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index 577896d38b..209552b898 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -1,5 +1,6 @@
 # From https://lists.x.org/archives/xorg-announce/2023-April/003383.html
-sha256  52820b3cdb827d08dc90bdfd1b0022a3ad8919b57a39808b12591973b331bf91  libXt-1.3.0.tar.xz
-sha512  64c5978655135b925c3aaad86b1aa6a3f3b57ad8b3592bf142be616b8aa339a02c2fc7badfab9564ea8076ea8f37acfe31709ed528f5a1d251f2d116aa074118  libXt-1.3.0.tar.xz
+sha256  e0a774b33324f4d4c05b199ea45050f87206586d81655f8bef4dba434d931288  libXt-1.3.1.tar.xz
+sha512  c220292f60b0f53134cf9364831a32bbaa9fa6bbb3a7143e917920957b7a48c616e946042747089f29ea9d8a18ecd64de620bcaf56d82462e7107de906f5db38  libXt-1.3.1.tar.xz
 # Locally calculated
 sha256  75c5574ca04731d739b1420f55f2b7b47f30df895817f1b03d0d7f5c1fbee534  COPYING
+
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index cca89145f8..7e639a7ced 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.3.0
+XLIB_LIBXT_VERSION = 1.3.1
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.xz
 XLIB_LIBXT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXT_LICENSE = MIT
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
