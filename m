Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D62CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A5456060E;
	Sun, 11 Oct 2026 13:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgjDYIRAosS2; Sun, 11 Oct 2026 13:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 625D160616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724192;
	b=o8XdgNCqxFGrI7XsKYocctdiFX8xLqC3J13Yz182rtyo0BkzKOf7j+nSLUse58ztgzYZ
	 QpIIZZcb+n6VSIZep7UjvUr2ibjbBsynW76QhEdtNQd846hV4mChO1wVi3xgdmKJYh4Vy
	 LVgv1eY/yeScyZSHP0iXY7OjpF+lwb/jspEq4BM49M7ZYlX/vtBBgxNRMW7lMv43Dzy8c
	 s61xxTUBOKSKI3G+hXS0ZkP2oEhu6+mZ912XTt7mGQoOOy4L1kxnCncUj+TtXyipqEZtd
	 hozKosuX1nbvL4XxZRu7ziko1ftAxvI+QVCEc1C953wxB9D4iZoE0iJz5ZcMfY9QEQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9trwtsarQCzk0FAAldKVNNCAOjZ1PRG735S+DD+FxXU=;
	b=B70cZ8bgQM0AF1lmwgox8B4aZsU+LZBlRnmesM4V1O9reeqEdFFBYGaeRXMneFM+R9vm
	 +o6lybTAwmkdBabutahcTy+KSlRlZjz5rk/XoXQ6OvfgqiLz5TSplAY4Wm1/S1rBGXd4b
	 IZLpAxTxNlODVzq4Q7CzTz16rJXh2Z/xnEnOY8cd/Oowt1xiK81puAWAK7DOC+hrBtb0J
	 us12Ae07bdFRYHP/LdoTyD/DlWpzeIzOmnSGoYUN9SmaUOYy1CA06MHiW3Ry0/jfSGHHO
	 kkp1xLVtkZINzs1nDDcSalBYXz6+4r49rKCZ4/nP0sYVR3pbeNHLzPcUWFDWJV+II+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724192;
	bh=9trwtsarQCzk0FAAldKVNNCAOjZ1PRG735S+DD+FxXU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJvmmqXp4hmApzx1a0C0WjiGN7aKRKDO4yltjXEybgO5AWkylvIRZZ2JjvUa7YLl2
	 7EDAau05V6Cu3ky0U4lFAhsl7yINvDxmIEYSIfVgd4K3JnJbXvOI7TLsi7GY8cp+tR
	 vUgu/wiMJssO8aRXChmaJqBsr8gDUO2NkylUvpcBtbQgpgYpk9PbqkParPI+s2d73D
	 7yQmy4W5pJM9IlPWmotGSCmYIjPK3my0pK7GgbP9bRd1+SQXZFPq4Pj9AAMgwsxLOc
	 CiFVtf/Ullst/1Iv6XgkeN1TFbZib/eLeM2BeTedJeK+gRjW1d3+RJpm31z0t6mV5/
	 OgtB2XPZd48yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625D160616;
	Sun, 11 Oct 2026 13:09:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B097A194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2528406E1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJIN3UxvWIIp for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AA5E940595
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724191;
 b=pUynpona1p+OeM22z2gszqmYCDbVj+NTytAOf+LEl0BgiI4fyGIV4n+yWRfWta9mUlJL
 0P7JOOBvspCO98aLMHr2p0hOt9w00zoP8/LgTLFFbCEDkyB026+++RHbBvNfggpXMIiyw
 IPlILtZtxY9so/icc8KsAWIe9Wy8r+y1Rykd45WM2mm9B6XAQJ3Dv1gvr5Ca1u37z+qkj
 f4eSvoWyYBOBlMJgSle0LxF3UBdK1znN7U+8B7+cc4JvorGvFlco/ZpkApAqyFNjOkSVx
 WG5dd20Jfx3uzDbxXtRw9oSQ4fjFnSr7AKe6O2ob30EhPyd5s86rUczZERStpiwSeNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724191;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tv4fTsumW2i7Hx7FVBtnvjg7WZmh/dAHLmZMEtyfA4U=;
 b=bzvo4sARm/TfJgirLdBMw3TvsHqBc6+Tf/pvPBBHahjSPESh9jpF3NJUFvrY/cK07cnT
 Y7T39AFvZewzQk/US0guJJ3kxiPqw4eEQ12X57HwoEg4v2Itf0qsroRq05Ob41jRc5/Xy
 niutGyHGOQKd0atq0gpdylISt7J0ch0vd8zWGPDfNMdpFtPUs3SSqupXjG4gP1q7AnpXK
 fC7WhcY5qOoBAahxvAb5NW0VZUwfQNwV0Y/rOrm0qlJT8UFMCgkScW5/RxuA5YXPPNuva
 rVRVJWWMhwMgQzx640BP4jEvUKxTyEDuLUB4XN+vjxyhzZxLbXVL3M7R2mZxaX9G4Mg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ifw3DTRJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ifw3DTRJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA5E940595
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723683;
 bh=tv4fTsumW2i7Hx7FVBtnvjg7WZmh/dAHLmZMEtyfA4U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Ifw3DTRJHo4TaoF/ZOhxEwzrdP9y79p87XAIFXDG+2fvsKsBsKZRGVTU50S6ZmjiY
 LK7JMpeKxYPWgHM3SeIvjO/4mckCMFgf64dxyrAschMvF35KbTGl5ZxD956KgMgEFM
 odWnscjjUAJegNrlJeH5+M+NEwi1m35Q3Cd6bx1dhC8rfQovM60TT7d3iVb+4Bo0WA
 s968AAso1mgk2tD++kpAhO0Yn4NTRp9AkCo6EAmhDd2HgZHKqwZVMehZjOHlZPZIkM
 fmtauf7r3LXQP5Msz5DyI2vean73xF5h0jpcFIq7Z17FuFAvba+8qY7drBRtXOuBy3
 VZkxqJPKOn9Pg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 4+mQQ/81HrkJ5jOTrRT2ncad0SDP7EovlRgY8iHBjgtGVGB6A4UW7LZqh6+jIlLo3NEfcpSdvEF
 JtA8J4enYUb4PEGwU6OPHJBdemjAbHfj7uSx+Hh0sqnV1JF7uzzyFUq8uOAE1xQTI1vMXLxJdC7
 wOLK0OwhMtHLjf0cMiwUC/pwo6KD8RPHemfxvW8U3R172IJaF/bpiE8/JkooeOIU7BoBLtU98gs
 TLJFw9MkR4/YiZtWX3N1o8dZqB6Y2ER6OOnjCTXrXHFoots2PtNi+VA1BR8ogxeImGAEmO97iES
 h13Qrt+fJGkwUEuTzRqKLa7idn+DuTTdvLy7BEZkQQjLwRy2huYYJvgh0m7Wdo1koTYRtgbwBLR
 ZkvryfUT1R9IY2NGdwVSy0SL5MekTpHuo6fvdX9BZXLXM89CukxbNLtqQAyivQnKcc7ck2Zl2RZ
 CbztrH4p2zhygotCUz5eWf27vs5P6oxftiGaR2qHIVkFNbocpImSvhX1huCTDDCq7aAgm0FCGms
 /E4FSX+lBYJd44BrtSOKCxZwzEm2yywxpT13f1bU8sBs+D/GJoHUaMin163uGPp9zPlEpf11a4y
 X7vp7LM=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3A5BA4C5899
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-2zCl
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:46 +0200
Message-ID: <20261011130058.3443432-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v9 41/52] package/kodi-pvr-plutotv: bump version
 to 22.3.1-Piers
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

Replaced dependency rapidjson with nlohmann-json:
https://github.com/kodi-pvr/pvr.plutotv/commit/c6d0c6800421d2245922a497c3ff2994136ab374

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-plutotv/Config.in             | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-plutotv/Config.in b/package/kodi-pvr-plutotv/Config.in
index 37441283ce..29e6d8c485 100644
--- a/package/kodi-pvr-plutotv/Config.in
+++ b/package/kodi-pvr-plutotv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_PLUTOTV
 	bool "kodi-pvr-plutotv"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Pluto.tv PVR Client for Kodi
 
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 7381749ea2..f3d4e6f985 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9b65a30f4a5c0cfbf1ab669f06a3afb0cc7b2732ed6d6d4e768d16fd10a0da02  kodi-pvr-plutotv-21.3.3-Omega.tar.gz
+sha256  a56bbd15ea5eca3143feba281fa6f0f6dfc42ebed37e886d7ddd18013cae4f8e  kodi-pvr-plutotv-22.3.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index 898b0aad0c..3bab7ddb1a 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 21.3.3-Omega
+KODI_PVR_PLUTOTV_VERSION = 22.3.2-Piers
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-KODI_PVR_PLUTOTV_DEPENDENCIES = kodi rapidjson
+KODI_PVR_PLUTOTV_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
