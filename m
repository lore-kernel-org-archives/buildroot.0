Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DFAC9832F
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 11:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E135940665;
	Sun, 27 Sep 2026 11:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0b3XzxTXij_6; Sun, 27 Sep 2026 11:42:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E592C40675
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790509329;
	b=IUbeUtDrPptr+uUxKZ01ZgGhd9UONMVHrDXirrj+2c4JB/CJ7Ugr9/VCuhwlAQ9xRtCJ
	 5inR82ZroncjDD8LABzVma0D9VG3yFAe177nmXm5Dwn9wjNvfClm9P+rlHIVb0daUJJBM
	 tGafln/yL6hv2wMBOYgn+taX1VO7FxS5WoOhzCIJOmQY+N/IC1LRt8ya2Wu/O8cctHxBi
	 5Kp0SE6fPVNfuLHQbrgLWFRdABeK7paF4H2Goq5rc1EeOsAq6QAFip9VNgiuSEclrLlVM
	 FoqvA/fWvDbBRJxo+yDdy6RDiUAJbOTNrffKEfnrMDkONpwjc2ipwem9CuM7mVkflGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790509329;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GlNkT1scIPLzATua4i9c0PaaF0QWSDBYaAbPFIzF1V0=;
	b=Fyb4+Wfns3n25FkcRtXm9gY02P9trb2LsjRLXpRGPFIAS39fVhXMPINRsG2dxEXKE+Vx
	 n2SFHkMM3y79mHUnIgfY2PkftbTVDgUawJtoVnZvDGKbMSpl7ZtjVk6Sz4haanrb7bVYB
	 jKgYE6aEYJ2Fh+VfPSVtRiW1La873nPy9IfZjhSVeJpj6QyqaEq1Ozb6p9lkLHE80b+lq
	 BuVI/Oxh5Ad6867eoBgBHdN/ZQPP3gUPPOZoxrJcasyK37RHkO+i6XBuvks/2o3bt2ZVZ
	 bus70OvHiESDNMvpCJoWWvSW+DP4DFkarC0cAmN9n5628G1wwqFKIV3B23YQpdnexvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790509329;
	bh=GlNkT1scIPLzATua4i9c0PaaF0QWSDBYaAbPFIzF1V0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ag3dwa+n1VhH2pmzHUwn+lJNf9RTyK53EfEW8PgnY4BNIhrhbsbv34buam5HjkBLR
	 SQfBJ6SPS++u3+EgeG5EcW+JUBCNwgFcyMq070/J72Yv1zn+ii3w5mnCQjnWKYsWWd
	 JJgygEwlrwKFONxPNQQpZTlZEsn6a7TRmF9ygNdwRZvfYRZPjbPkGqqPGtrLlDxLN6
	 6r7RMRBJSTLdVClmuF2A2x5rAdMPl/GOdFkOASr4sPI/2+08nNePDPKNbYGAh35Kh8
	 zpIGXXTlVjL/vd4mfyXzcQ9HpHySGXhSeqMT6H0KDYx+bzU4oCfbyvQLWbNIGNYE/b
	 k0ubJ4exjnihQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E592C40675;
	Sun, 27 Sep 2026 11:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44F70335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 334DE60619
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnMDnk7pctCh for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 11:42:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D7DE06060E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790509326;
 b=LIXpnfzElP2go1YaaeU1+Ln6JvIy5IluQoUpV+OqG4X1VoUjs6BfQXB31AdeHfNN4/jS
 x46jflSwhJyQQD70HV2dl6NuLIVSzv4+dEYvFxowpo+7XagEGI/vT9QlgkGF3tZfPJx50
 ge3/u3IGpn8YNnz1AvNcbDuoMNJAO/z9Vrq12xwP0j3mVBndQTi3h1zfvDa+R1zemPpsJ
 TwWwfFG5pRZY7/51n9lrl0NZy6PuWKU4LdXsM9LlWnTf6zKQ7viPL36FWx/nrK8lPzb2o
 5EeDtokkyWKAznkvJoBQA28OK/4TQHehmhPEk0w0EQRaRQidvQ0oZJBFCbN7aXtYukA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790509326;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=rfa3JZ9tqwqzVXyOwtSpI+QG6JE4bjFrINJ/zdV9YgA=;
 b=bUPwFFRVNjGkUNwxe8Fe8qaX89h6m5kzpuFpJif9HEFEROEQ+hc5yGp4ITCPYgXcbVJ8
 LMnQ9B/ScAgWwra5uqBAaa7NXt2xmKVk2ro+lgz8Rcm+CpBLghGGPklwbuAMwxXhf6dh0
 twP1usjLne8XB0lktLlvFsaKzaQ8PBGYreiPEiqBaT49NchSRtOXqI6ao9jX+jaReN3hc
 8v0mOuPAzCjvvTulK6bMTQmxKP+BZkzjuGMr4mdy9Hqwfy91CziHwDvkwq06qC8gimDZF
 QVRNc65y75Ji8ud0J28KKclXMSEAJG5r7CN/5TA6BJBbECKxwTYdo6kKaHFucKFsTQg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="ozs/+oDJ"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ozs/+oDJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7DE06060E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790509323;
 bh=rfa3JZ9tqwqzVXyOwtSpI+QG6JE4bjFrINJ/zdV9YgA=;
 h=From:To:Subject:Date:From;
 b=ozs/+oDJvAggOE3AO5N6DKmdAb0kxaknY+LxURIU/jGUojTCGHaEOE+2NXqw9EiUI
 gizAiWx3cz0K3m0CRIuzE16i3YkS5eVYdTxxxkGZWBWdhpaV5lmWb7lUuSZMVmuHG3
 gvayxlHVKUwc6/2gvrGLbgLOlfes6o+0zVxAwl2/FCisJk6xASMVLRuxkwR1HanFzl
 HcdPkkrqy5wrCKrCFJb+QY737zvJoDQP/kZHB1jdNgCzFqW30GDjXqFFxFq3KbFMnJ
 qJTsz/QR6cGCxJL7tYfK/oNLUAOrggS+S+o+u0pICHY8UHdaD8ArwwvpvFR1fCzozY
 ZFZwM90Z7Npkg==
X-KAS-Sym: v3:f51bdf72230551df:Olb4920A+qiJdG+xx5l52f18rez0tC2Y99WDbmlMp47HH
 sKkQKQ17J77KQ/jSGHLh7rQzrFCnluPaZ5/8Jiuyef2pve8uYckBlDmXiSpDrFzvvrI53YL6k/8
 /GCKmA99kEuHwf0de9OGC6qdEqVYRE2uS4EeKGuc02qubuL3LRMrUa5ODCBl3HC+AqyxnXaQnB7
 qtPf0sMTS6RHSrr5oR/1DinNE641YRgwwKDlQkoeaOJD4Dki07YERlh9JTIt7RaSsJrXPnTp8oX
 8K9G4gqg/eHtYIYbQp7xWk6UV5KEt99uwtsyIkL4j/OXcyxhNDQkuchbQPdN2H47dGF1jS8g==:
 6ZO78IoIGNtoSuz6TQSHdR+KOHNaGPrKRshP50HqB6cTwLbRIEwcDG1Y3Eba/ZWKHLLfQdE/T/c
 JI3hmA/ngxJHtwI8UwUXVJ1GVVY4G4gkLbXolDV0PO/NolVeekHUBQgf/48FujOLEtxoHLlN5hH
 bDekVWUuz4ECvDXy2vU/p/JkBrVuX8MZxqDvxsr86sDZlcvxrC9hsY6wnSzlBbex6YY/iz8gCUt
 HYXmTFbrTA7wdIfSVugyCToPZoDzIBJXK/OF7Ing9n3z+vrcVNKzSoF3tsM6FOo4LV7Pa6hWi+I
 yXzZeE58GBefze/nPyaYn1GNjGX3CTm0LkRt3R5a1qNeyWkaIXjXP2FzVgqesUCjS6y/CuLgHCY
 1G2/A0EL5wbn+nYv85831OXk1MMP+4nnsKlMkoezzLw54y121zN8vlmORjTbzNhQVt+FtHlXHw7
 sDlwcd1M0pVx3bRGhp0QPxuSiO5r+8iehHnjZlE8yvu4kLgebE/GVDsJoPfkgLHOspHNIURWSka
 mRYZdNHh2zAnJn0ft3X+qNsvfhPh7MS7joHwA48oegSmImdmph93DxMoqA6aZ7dG+Q9dkRnDlx3
 uvXegg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C802A4C4EFE
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:42:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55684)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAnGc-000000001xA-3GwZ
 for buildroot@buildroot.org; Sun, 27 Sep 2026 11:42:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 13:42:02 +0200
Message-ID: <20260927114203.2631563-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: remove patch 0002
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

Patch was committed upstream in a slightly different version
https://github.com/openssl/openssl/commit/098404128383ded87ba390dd74ecd9e2ffa6f530
and was first released in version 3.0 which was added to buildroot with
commit 3c66f65a6a549930870f2c0d98abb5ca9321d2a5.

Added Upstream: tag to patch 0001.

Renumbered patch 0003 and updated Upstream: tag.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7c72511a896fe36a6ce73c446f24673691c269ed

Also build-tested using this defconfig

BR2_powerpc64=y
BR2_powerpc_power9=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBOPENSSL_BIN=y
BR2_PACKAGE_LIBOPENSSL_ENGINES=y

 .checkpackageignore                           |  2 -
 ...ible-build-do-not-leak-compiler-path.patch |  2 +
 ...Fv2-ABI-on-some-ppc64-big-endian-sys.patch | 37 -------------------
 ...ch => 0002-Revert-Fix-static-builds.patch} |  3 +-
 4 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
 rename package/libopenssl/{0003-Revert-Fix-static-builds.patch => 0002-Revert-Fix-static-builds.patch} (97%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6d2a024e07..bd3766988d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -502,8 +502,6 @@ package/libnfc/0001-autotools-make-example-build-optional.patch lib_patch.Upstre
 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch lib_patch.Upstream
 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch lib_patch.Upstream
 package/libodb-mysql/0002-mariadb-FTBFS-fix.patch lib_patch.Upstream
-package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch lib_patch.Upstream
-package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch lib_patch.Upstream
 package/liboping/0001-fix-utf8-support.patch lib_patch.Upstream
 package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch lib_patch.Upstream
 package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch lib_patch.Upstream
diff --git a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
index 9353c1ae90..f4baf916e3 100644
--- a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Reproducible build: do not leak compiler path
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 
+Upstream: https://github.com/openssl/openssl/pull/5218 (rejected)
+
 [Rebased on openssl-1.1.1.a]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
deleted file mode 100644
index f74576beae..0000000000
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b57cc2e4ee21babacbffc243626de72c248068ea Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Sun, 5 May 2019 18:30:55 +0200
-Subject: [PATCH] Configure: use ELFv2 ABI on some ppc64 big endian systems
-
-If _CALL_ELF is defined to be 2, it's an ELFv2 system.
-Conditionally switch to the v2 perlasm scheme.
-
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/8883)
-[vfazio: fixup for 1.1.1d]
-Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
-[rebased on openssl-1.1.1i]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Configure | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Configure b/Configure
-index 15054f9..ac3206e 100755
---- a/Configure
-+++ b/Configure
-@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
-     }
- }
- 
-+if ($target eq "linux-ppc64" && !$disabled{asm}) {
-+       $target{perlasm_scheme} = "linux64v2" if ($predefined_C{_CALL_ELF} == 2);
-+}
-+
- # Check for makedepend capabilities.
- if (!$disabled{makedepend}) {
-     # If the attribute makedep_scheme is defined, then we assume that the
--- 
-2.25.0
-
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0002-Revert-Fix-static-builds.patch
similarity index 97%
rename from package/libopenssl/0003-Revert-Fix-static-builds.patch
rename to package/libopenssl/0002-Revert-Fix-static-builds.patch
index 10ca97a240..daeece2a0f 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0002-Revert-Fix-static-builds.patch
@@ -5,7 +5,8 @@ Subject: [PATCH] Revert "Fix -static builds"
 
 This reverts commit cfd7225fbb9507b2e443a494459bdaab5236d29d.
 
-Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-817209126
+Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-3791009156
+(rejected)
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Dario: make the patch to be applied with fuzz factor 0]
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
