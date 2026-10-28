Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B8D606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kjpXiPDF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=isEwIEdA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A4D605D2;
	Wed, 28 Oct 2026 22:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNFQM4cmivS5; Wed, 28 Oct 2026 22:34:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E7EC606DA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226862;
	b=daN6YRvKTb+9w4HsS1G60h/lWW953vPTC/vmY1yr7JvXzcqwlizGnYNHrY0SRhZaF2S3
	 1HkxMe/4JyueZ1eWsURQGHRLgEGjd/FogFNZwpFvs5Gwg0HwDj0TRDGbSf630mIo6DUri
	 LeoGHUTkHwFmfixZ60nAuZ4c5vf3zuKlNCWvMnYnCnvhq2XOXfeNLPvH5TLHPhxi5pw3H
	 UN5MohGkkHYVdYttQaunDE8gc4uBWk7n8sBfk0n9p6pt+aoSIDB4jngU6kh/WmL6wAW1L
	 qUFSmEFTe0ZIqPLFMeuYfOLU0zlkF2BQpKR0rctZWbAA6iTdth3lJ6DqgUclDv5JjFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s1fSozJ6n5qF6TrPk8CY6M0uSTmEj2NR8LVDNBGxd6g=;
	b=N6zeBff9ib5KbtU9bDlH8B+pVW7ycTmHo68OaZkIK6UkDIzQ+xfvZpAO8MdtVSijQTky
	 /2u5SMKpJ2bNwtFXrjjE86XjXeNNQc67+PkzohL7vDWPj91tGmUTMa7d2zBfKgPvo1CY4
	 /ielJtGNAR6xBIcGkTTPQsLxpB8nXWY+jXAU9tFPG5T84yQ53wYbcmIidOHQAaPK+2JLA
	 X8IKXKyLeC1md/uuWMEO1hADAp7kf+/WZecptrXJ5RyEExOAy59+PTuup0F1grtP7rtIY
	 FSGRC/xaU05jT/pH9f+3jmrpX98auUjmVaU18+FuHyxckgOikgF3fWA51XB5zynd66w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226862;
	bh=s1fSozJ6n5qF6TrPk8CY6M0uSTmEj2NR8LVDNBGxd6g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kjpXiPDF3rP2Vy1QTc3VJkVTkOdfOGymp3PlEWaX2Poaw7jx+YK4pJnYAU//PVv07
	 bg+1ATG1XzD4Vrtok6cb29KDbPKZp504QieimbM6MbDt+DQH1HQIM5hMdyiTFIIgzC
	 Qf9O5DkAaZg3bbSquX+sk/4mqkKgisNnlNy8J5DCIYSsphqSy0s/uu5/8jjSABeGPv
	 9X1Fq4hBKdZHjZUgNGcCJPA4CNm5Er/FfrVladWAGZKfAl6NLztl34MG965kG/lBBI
	 MVcJKI0zCulRPdgbeK55TN2EedDLeR40jFL//CLeFkQ1ulaTFFDkDKgo/KjztIWyzO
	 PSO+PQb5NEGoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E7EC606DA;
	Wed, 28 Oct 2026 22:34:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E325C2A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99604004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTx66Lw6SzN7 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F28F6400B5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226860;
 b=TbAly3nU2SUXNtfQJN2+HA+GMKvIqE28bhLHi2RgOlbMgCm9oKVqDU0LcPHNC2MPRv5j
 BI8nE09CDGp6z2MEM6EiCX8ThYIUQqFQd2uIhFDzUwCJutotTWj5kPk4xBobq4cJAzMDr
 A+t6VhiNx8zMXwl3+biDbX3hgroc9pE+qLCNXqC8/wV6gppwyP+zd5OzdodPyhwOiSQ6m
 wiwEIR4LYtDDkIzNizNfHqj7m7pifbJvTqb+fjEs+YSzFvdk/Qlglw/xrZqsps4sGKgUr
 p82D4G5v7KRIPas9xy67N9DdUbci8/gjyXCLKRCGzUpwXQatl51/S3lZV4Eqb8zcLQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226860;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KYbYlnckuKmsKSEQo9BBg6b8mss4qkIiiM/LgkYX6mI=;
 b=ToVZpvZxYk7XEaB629HutCaHDTCIBUPDAdB140IEjis43sGKWKhRRRi2DP80cYCF8bcg
 0hgrj6M19TG+gf6IkpvsynzehXoaLY/+u9iRhqyeaxCib4tB/EgYhXSU+m0OJj/58fQlD
 p3MotNUJRV9GPQ9e3Ah0VZK/C5u7nkUQ1uo3eC96zAZiFNG9kTBGTyawJkjJFFfIE5U2O
 GIP8lbRImjPFrwd46kLdfnMll0z/KBGIO5aJqWITnmwgvhCzqdgJWRG2M6l3eDUODTROX
 zYBcKXfahFXe9osqOcKofX889LPZpb4nGOOUHCrVuQKjoJmvNX/n6KaNlIwogIPgAlA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=isEwIEdA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=isEwIEdA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F28F6400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226578;
 bh=KYbYlnckuKmsKSEQo9BBg6b8mss4qkIiiM/LgkYX6mI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=isEwIEdAOu3BkOozLqWuS0xr3tOi1aVMkbQRIUHNSu3ik7pOD76oyDzwNQKMILk60
 3hjNkmCjRXBCVHXhKonnzxeyWIZ8NHvU/IpFh6E2s05eDJ0xClOMoeQZPxzRe/t+8W
 hZJPO8EyJfVKSb4Mk3KdWy13K9wGvJWTxfQTmJ4JtpfAVY1A3PTRnvt2lye7LGqV6U
 +gc6KvIgkFtlTLjHs6M9HVGs/3Y91aRIBqbS8fliTi8QvH3uMSVqEiWoUa8sKTkDkS
 LreeVLpduo2SX88MZO7NQoACS+/O8OuGsr+XUMh8DZvnznY6M5nSPEkz8loQueYgHy
 QOHiAf/hFnBkQ==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 od569P59F1RO4SI+TNKaSulsr/AhKg1dheGsurVQR2Ws2MBYKIrdftQUhSix52yQbcKoBrPoGIn
 rQA85lRQuIAnhMWMjCPQm3PryQVFMenUTrPIs+vN51A/1A8eS1s5EAX9Bz7QqruN4AnibxanXrx
 oVLMpDwpvV4KmP9LsLM/2h2o5HS1PyBgHwy4RwHaFJyURJvc+fo9zZP9OCHDHeL64EVbkBgjg2t
 59dOrXuQnl4XFl+O6R6nBraDHeDpxdsQimJMjVgiFsC6ERP2Unwq8wluLjGwgJnlOS6TQyO0Scz
 BI5DHuH76PoiDRgJ1N/nMlodFC38X2HXhQPELK2sHKUDfB5DXxCUf/ekYyeMk1XjsqzDPT7+E3y
 4mK9Ae03TgSoERPlyPn7mwj7e3L2C9ffwMO8OBEvmSBfS23Kiol+eHNQ6nLX74LaVfee/y63OzJ
 So+tODNUpYGUXTE1H5b2UmU3k0IQqDh+gso73HsitaM+TWj7W154JYgNxbM+GlgT0Z3VFsvcNhM
 yGZeL1yBwOXo0qKD9cQrq8r0KUvNOeKZ+ajRCs6tm03hS71Q5cB6RyMzFie+BZQJUpuRQAIFYze
 tQrh
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06CCBA4C6FE4
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9J-000000001i7-44JV
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:25 +0100
Message-ID: <20261028222936.514451-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 08/18] package/kodi-peripheral-*: mass version
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
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 3be4eef39b..e57e020ca0 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7392c30a9e49b0cd219cdca14f5b20ffce9f4a52c349c2cdf37cb603dd21f516  kodi-peripheral-joystick-21.1.23-Omega.tar.gz
+sha256  cf79e4bb8d413d930fc0821200144a22fb3c0e38a58c04119e4e4134a848b0cf  kodi-peripheral-joystick-22.0.12-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 698b918266..73c8a675e8 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.23-Omega
+KODI_PERIPHERAL_JOYSTICK_VERSION = 22.0.12-Piers
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 833905b9a3..2791ce3074 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f74b0493e0f17e297f271b0befd01406dcaae121305bc7cb9d0ece6200cc675  kodi-peripheral-xarcade-21.0.2-Omega.tar.gz
+sha256  ca391349b0184083ee76918ae37359f2df541597812476c4a18b0c5e0b3d62d1  kodi-peripheral-xarcade-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index a46c616323..0fda4dbdfa 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 21.0.2-Omega
+KODI_PERIPHERAL_XARCADE_VERSION = 22.0.3-Piers
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
