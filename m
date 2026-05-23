Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC49CD5BB1
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 11:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 871578131C;
	Sat, 23 May 2026 11:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3lzvCG8L93p; Sat, 23 May 2026 11:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A51B481323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779537025;
	bh=qSbSCV5ypEtB4jziwAP4FNuIb8rm5Qac8BgpZuDMZP8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZSrqVFSglG6pOuOvYAZX4WWcVMrEFaN/fILzb36H0EVhClb/CBMSN5FEIp9kRqrYW
	 HNbHLn86G1jeXn9GbwQhUfPGoGYWPdyCr/+ZZes/vOGs+DiLThKr/1X1Q6MJm3t4tr
	 2mxA/2rQ7S3QFv3+XG5jLtDYGTdjiqx8iUFS2C99Ti9NhU98+i26JiiRvD4ASZ4kEB
	 xqNbvFZAYENLVtmz8053n+3LZYy/xg24GBUDuf2FkhM9Av6673Hezh2KcmLMdNBSbq
	 TKsIAtUn0klxtpdvZGHDJhSl6cWcLicE7yodpEI1TUrBfqoe2LRV0/NBAOWyHprv5w
	 y/EIUXKsS9PXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A51B481323;
	Sat, 23 May 2026 11:50:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E0A73B9
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14B20608C6
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9q6AHymdbOk for <buildroot@buildroot.org>;
 Sat, 23 May 2026 11:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0682D608BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0682D608BD
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:50:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66A4A86B61; Sat, 23 May 2026 11:50:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 11:01:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f778891f10733d988e232a52aec67a729e0923ca
X-Git-Newrev: 852e39ba2cf107b898c5ae413dacc84ccc6079bd
X-Patchwork-Hint: ignore
Message-Id: <20260523115012.66A4A86B61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/852e39ba2cf107b898c5ae413dacc84ccc6079bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-May/000851.html
"The bugfix release 26.1.1 is now available."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ea6c328134..83e0d6a5c7 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.0
+MESA3D_HEADERS_VERSION = 26.1.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index ae95f9cd3a..93a9680a1b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-May/000849.html
-sha256  a5095e6dc2986c78f0cef4c5555dc803e93b6bfe5670e991f9e8bd49395bae19  mesa-26.1.0.tar.xz
-sha512  02972b1a2e6a2d10fa9c970ab579ddd6f0d3acfb782d82616b91cca7a28dd494b15fb14748fff333b1078898cf990a25666e9122d7fd41cb212a151caf933786  mesa-26.1.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-May/000851.html
+sha256  8bd36c031cc6d0edfec04617527609454ee3a09ad53bdf983b45fc2c1e129b2e  mesa-26.1.1.tar.xz
+sha512  384a7db33d2f06e287337329f2f17503082ba6b1cd876a1884e940fdb6193ffae6d6b14344625256f3b3b39972ad697130a4d2ea25c40979f7aa76c2176f7988  mesa-26.1.1.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1eaa4c577e..b229b02378 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.0
+MESA3D_VERSION = 26.1.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
