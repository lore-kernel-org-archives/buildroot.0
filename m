Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9D6606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Yb+0tdQ3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nGPlfWLA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392CE405B3;
	Wed, 28 Oct 2026 22:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTDAQrL7qhJC; Wed, 28 Oct 2026 22:33:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC5D140775
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226800;
	b=RhrLquKznhSSM+KZbvukrZX0sGPgkpZjUZs0rFsNi8jd6wsuYFKx/8GDITvJp6wefcal
	 eIg6DPT515AwTyjf5GOXiCftaEgawq6YPGBWE3yrvVzmTrFU0nXqaNsAQ75UcMUS/9Vea
	 49DcTJpQZIgGxs62ILxfYw0K8PJaDwW7A2X6VzZU3GmBjOopsVBo9IZovVDD+gQ0hWWzW
	 5XD5n8/vO8VIkOkXUZuPhTy0aiCYX0Supj40BO/yRZ1++heN7zPsRQ/Y5vRyHqaAykBCd
	 WvWoZ6wlyBIIThZKwYZTubGpBmxYdWpf5WnymjCfmfQO/wUzRMCml2YACBOCUK4JAHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZBgLRrUMyg0mpUkyaZMatFTb1lAaCa8JLlS0qz2gobU=;
	b=XJVPmprFR3CafxokOdsExBEJB0gzorVFQqRnEVod5iOmCNMJzOvMolO/H5rtbzMGStAF
	 T734B/lAZU95mwLla7FObiMkCN3kq8VuXocLqRmCS2WPawDjMVVAoyMDdeuQ43eWx17tN
	 gxEpUD3Cm2RGmSRNqjUpcePizGGCL7qs5kmTSC1+rIVOTjj3gEtAQA+sxZ4I20l40RjH7
	 aznEgoJRdMMef9YFC0SeQH5a/FKNrYHiG1d1FB5E9/JMqV++54rptjOVSHNA8rnz9lHm2
	 WdW7Z6+IS+jr1ObFRMF4qFEXgifK8wPIBqbMFNKswMmDzXQkeP7g7rzCyrNKEjzM5Zw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226800;
	bh=ZBgLRrUMyg0mpUkyaZMatFTb1lAaCa8JLlS0qz2gobU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yb+0tdQ3CJnjgWmfSKuNM6A6kmsiurh0tKDYITeE1+eRKDwGxN/CDIdQFQcn4XuvL
	 0GAl7Tqmh5MjbjLPR3ZZYYKWAQJA3TZjzsoT3D56LgFPhtxoFnRCfYrXdQpBk1CahQ
	 bKtc4W7bxAWwRLPGbs1tBkdiPrBAjOPFBVtSCS8Kic6rXvLka+lAm2YG5WD+CVxlqq
	 R6AKJEtrUSh51E0exubcQN6Qp//CQlE9FQl58Px4tSiuRIyogGjn43VM29IU3cHX/b
	 BCEZQ6nOSs2RVeBFLRRx2uehPPFgKl2p6FttCW8GpG+Wc988Pp8IUHd8+JgdohJr2W
	 ah1SlCG7tsPcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC5D140775;
	Wed, 28 Oct 2026 22:33:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 326CB2E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FF8581000
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyMOgXeQlFaa for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:33:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 141F580A53
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226798;
 b=KkJNltVT++daWGx/HoV6qsuR1cLEomsOS4+928OPwUau7vFGVQC2IdKxOmn7nGKg7zKJ
 z2ka7G74+sTtILBclSszRiA5nbWyS38hbysS8xJ3DZ01qFK6kyY2Y4uyrG9CA5b32fHRy
 8k/y1JwtU9TaCb6b2WvCF22erx0LN6b4VpEjpQF2SNZc/srMmTo4LtZStqOWFm1JY8WWL
 py1ChbtNf3usPQHLaTHo2K+j4/ygnlWlqIJwcFWm/avjge1GPjuGRuHZWNghUqfDbEinB
 C1I9WaU5vC9sUDP1ZYDUt2n4WH+vQp8CH3xBYBON1TUfk1oAgBf2TkXerofnYCwoWuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226798;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n/+LGAEZJLiIorP17BCoVnupvWfgZyfVfxYMnovnNqY=;
 b=VrvPcdzwbJ7ngmpCbNU0LTwFqSlj8UQOU1nmJQlWOnXIzBsXIZ5yky61hmCOmcd9LVNZ
 RvAPn0wSHv61/TY9m+xMwLPQt+L4ObVb9e/N4WmBf7qUuTFPnx8kxupLsfAZ2CDTjEXF+
 S8vxaVy8rZx9zpBQ+XOXiLwmD86LVcIERftbmSBP+RYhA3h3uMpfshBtMgOCndKvKpUov
 VBr1NLb7EyzCu5ZPMLyVy+I7laqa49MlcvZJy2eYS2SEAz0Fer1jt96wWdBCM6bPPyepP
 o8hNjopknBqr9zuHhEQ1AraGjVFPvpIxpoZc2/TNfFHvFM/mJxrlPhoo2CLpXdDi+Zg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nGPlfWLA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nGPlfWLA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 141F580A53
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226577;
 bh=n/+LGAEZJLiIorP17BCoVnupvWfgZyfVfxYMnovnNqY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=nGPlfWLADgz3JgbzCH2kGEFOaet2yBllfKE8qegShQB1Md2tUBhtS0wBC2+j74UWZ
 1BZIUCQkN8oMJM5WEAFyBxZz4XP3e/c2/txI2Cz4whX/cFb6z/yw8GDxFk/R8V+keN
 Ly0kaOUalb6zt6Y7hZfLzcLq0HlrfSWkcVLCvR2OsXUev9+82La0cJfaYXlpuAaOhi
 EwUjJtnHhcSahWPpopjr1qx3FG71rLB2HlpgfosnljYeUkYkKBzm/0m+sBDZLBF4Ue
 kzQzBg46vJMlc3/pba0nfHrcRb5lY2GuQQvNCRO3lPGBIDLcelHWlFYUuh4akvEuzL
 HtiOdPXVeRwzw==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 shgZ6TGIViPVcWPSHN/sznchg5KtG7dfQ07t9Sjj/OKi/dow2OBChi8C2f5KnCZWWq7+T6FY+gf
 ttLZmXAtjGpvKN7GtBw4FJLBzthl1ac0Zh3Ht2ZiWksqfcdXe4Arzaq6YH3jReRjSqmtr38cM8d
 aCLbHAW884HCZoW1JBbh2V54G7m9RoU1RRpINlAEOQPx4Csz4FRwDl8y7PuYT5Z7z6ftydL8DVY
 aWuiUPjg6iDRU3ePe+cm+XzoRd44XufGuUvw00DeL+twpOpfXRdeTdDXtln83/IjwpbpZYPzRKD
 yAXRLRZytUZZ33cqNcc/MdHoJrAxM+V0JU/66pQcRoQDWekKxN8/txHy/1PBDtHz5wdmpwfNoud
 Y8aTTfVVwkNWYz6pscH9ADwUUeRzEgvW8SP61WTq5VepOZSIbtwk2Oe0HQbyzAhhQQCaW5pChyz
 bZQRiPn2wrN4a7nbjm4OREsrR8KcwdwP88ev+B4TTN9g7rFt7iBqxz0upYZVNospcvikAbpRvdh
 jyqA+Q+vT4IEyjIj1OZUd2VQ6ojLsW5mhkztatg6OgWu/LHHZNx8c41WHO0afiPn6bXqyolC4Xs
 Qxbm
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E3EEA4C6FC6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9J-000000001i7-1SaD
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:20 +0100
Message-ID: <20261028222936.514451-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 03/18] package/kodi-audiodecoder-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash    | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 2 +-
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash  | 2 +-
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk    | 2 +-
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash    | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk  | 2 +-
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash    | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk  | 2 +-
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash    | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk  | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash  | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk    | 2 +-
 .../kodi-audiodecoder-vgmstream.hash                            | 2 +-
 .../kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk  | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index d011e38fe9..84eb36bd80 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2828685f1c353bf7123d0f9e88b28f53064388f6ea3ee357b8fb22d5c237ac8  kodi-audiodecoder-modplug-21.0.2-Omega.tar.gz
+sha256  9a0b5bfce44d937726529a5c32d1f33e4d70261eeed5ace443dffd1d159641f1  kodi-audiodecoder-modplug-22.0.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 15a1d96635..9f3e089527 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_MODPLUG_VERSION = 22.0.2-Piers
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index d743433027..7093b6c48e 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c82bf0ffab2d09f26b84d382fd00f70695d5f6a6d781be2818f9f5e10bc675a  kodi-audiodecoder-nosefart-21.0.2-Omega.tar.gz
+sha256  f0b89b0ac85c2248c6aeafba1b805c2c21524fe5dd229f2a5ba362b3ea8dd313  kodi-audiodecoder-nosefart-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index ca45739a02..ede46e0698 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_NOSEFART_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 87cf151859..c03bf7434f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7d10dd65baed2db1272ff57fde76f0b268a4a434d57022539c4dc5bf6f8b54e  kodi-audiodecoder-sidplay-21.0.2-Omega.tar.gz
+sha256  1657509ee534600bec9f66cd651e7d6342502fde1a213e81a807eb17feb3c565  kodi-audiodecoder-sidplay-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index d98fc4a7f5..a99cd32f9f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SIDPLAY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 0ebd6cf128..16e353d2e7 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98afd81a9653efd9c6fe69dd7918755c75a4671322b793a35bce610acac0d128  kodi-audiodecoder-snesapu-21.0.2-Omega.tar.gz
+sha256  5bffae158b9e02d2fba2fca7950fc9497dc65928f90ab336f37ae51819b662a7  kodi-audiodecoder-snesapu-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index aa8178c55a..03b3e121a4 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SNESAPU_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 560c93b74f..9d463dd168 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  089ddd6c890e571f69eda0a85077d8ffe91c4b31fd0f9e20f47d4053c1e984a8  kodi-audiodecoder-stsound-21.0.2-Omega.tar.gz
+sha256  c40edfdc694f62d0ce0129f93b16fafa97cf254526d8d874a473560819c31894  kodi-audiodecoder-stsound-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 2bd37a8e04..086e2ff6ff 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_STSOUND_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 22e7015ff8..5240efc8a6 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb7bee9453825f86275ae05c4561fb52ee7fd9fa21857e303933cb57d28ccc4b  kodi-audiodecoder-timidity-21.0.2-Omega.tar.gz
+sha256  90354522f51889c341541694bc964f24a4739c342c0c8f28ae3c002ac41eebbf  kodi-audiodecoder-timidity-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index c165492416..ab417ee150 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_TIMIDITY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 010315db59..27a721d85d 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6f5dddc0e6161426b8c40bfd1136ca555588db27ae78c02178b6ac5da93b377c  kodi-audiodecoder-vgmstream-21.0.2-Omega.tar.gz
+sha256  c6ae413f47d9261f3a20cd4e2d380b44a57a82a93d03ddfdf2ac0666b230ac6b  kodi-audiodecoder-vgmstream-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 66beec0a37..74a5f05a0e 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
