Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C6606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BbtLj2SE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jknNdo9V
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7E364087C;
	Wed, 28 Oct 2026 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7kTgDBfMi1F; Wed, 28 Oct 2026 22:36:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BCF8340856
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226962;
	b=nTpFvdjrE0SwOAbujbElt7Q5io2MhINbSqkGM7pyRRCMRaEkZ/JuqhgK3DVAu8doBJYN
	 WFG7xWNgLBvxGES9JZg7sGYhhKt6uP9X8eoO+4Sayix9TjXx8UWwmQ39VGmksQLiW+tDg
	 sG+gOdXCQWRQsDNki092ZozRPrKdItLJTvpgcdcLIb43Ts85Bip/4rhMW4KNubEKk3XaK
	 YNsyMnxbLxUU4mLqF5xe/fFCnhimd+Pf39R77AbIsLZ7pGaMJx50JXr+ptBQfLzhU7cbB
	 by/aHXgZADz44Fh/PYYNcH4WqWikK+9r7IHCJSS/b/SRbBWiRo/RDACCaZwdwINyOeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ePAx+Hv44AwhQEzxm0NKu/LQHoZBBpGt5XYFbcFVQxo=;
	b=Awq/G2ULYDDZLsAltLin2uy3Df9W47G+PCrQXlXnD1PlcxpFUoXcuwqnLoYTuqaE6lbM
	 j7diZxR9QQ6cOXtQ7LGEgvEMqpqbopxe29QOjh9ZIAOyToJaI2mtRIXpBdml7mGLe4jTo
	 yseeDdZkN6S+9cNaeVs196jivIbHZWotqNfjiLJhyuLZ6ZSWlE5rOoaMj0IFkDWbRAhvy
	 SKrJw0/NEKsSlvjc0oYjb2cnyiMgtk2dBZLjIEUjSAlT+441b8gTqVTd/u6mejP44Kcm2
	 YBI9tKExrGAsXOdvnybDNGHVFzPg+92j5vzx8buUHCROHxPw2qWF67LZdpakTQbkOFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226962;
	bh=ePAx+Hv44AwhQEzxm0NKu/LQHoZBBpGt5XYFbcFVQxo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BbtLj2SEfN6fTNSgehO5sDf8hUluL+bU7KoX5+VrEJNgNMyOmdip2+fCdxlWCMYIA
	 aVIIVKSe9lwtfGEN0nHfyizeJGaVuGOJXM2gFnPnfLQ+p11GHldQq4fBGJUvGwAVZv
	 SqXObCo3rPpgUjSE+/+eVRONOvq9OUMTqNX2qnmohF4mLTUzVgKIbtod6NhKbdAP8o
	 UqQkUSDen84klMfmxdAA338jibdnpLTTMmZIGI2e86syP7cwykCPqL7IU6lbKULk48
	 W9YqFrh2cW/HzEHrnTfNj3KOYluJef2pNXiQgWGzX6Zykn8QRTqmCPX0yTl8yk0qP4
	 RxJJBb24zSlAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF8340856;
	Wed, 28 Oct 2026 22:36:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D34562A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9CBD400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIu0XNVg6Qtk for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:36:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E558D4004A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226961;
 b=Sca9SDxYvuJYujlQF4lez2/SKKlcOfj6XPCyyNX+Tipd7vx2kb48/8LlpHI1chaMnTeL
 SUcbSflTLl1q6bzxMxF4nxzNyn7qSlHWinSygqOwNSY3N5D9vraQx7bmqSchANf+LuHlw
 Cxt8FIBehmqTVbR2Vp6yR8PFhmU+HJzspKM+QYK0NO4E+Trm1G+bjpc2cXzhQ/ynP5VLW
 5AlfRRPASn8TiYovVKG0DyAEgm63E+C1tc0aXAr1ivrt3RNKkgBGmIqP8wathVWiIc2Qy
 OaYHL8EC8L2JQveXzgQpZ2dt+8TI7AsazDd7TJDXNWMK+PQgtnpR4l2cpwutndM8HYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226961;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GFB/BgmhdjHVjEKxDpqktrv8nPA4UyF2upJMJWXHAYU=;
 b=R8T8SXL1QmMQkKnXzsyPWR7t7iMfhn2tLIHwXqc7RyIkJxSGgs2WdPPwbd+B6Oo33TCh
 ymNonhLxnMQzHiCNXzmdXPiVwoVxm7b/es6YPpixUTYqbE0cgyTTob9pTotqfTHc8tsE2
 QzuJC7YtqH7ZsyeFT83hilWE2lUfmAcmp11hwcvJkBIefBMjtBQ4lIS3JmyPZbBzuj6+L
 1xYF12eNfajWfTJmtDdZra2Np7rKTrMsRIGzkA9IA4abbpj8Mboja8giyASzeA8WJ7enl
 ZIT8AV0j0UzQhnD/Xqzbfs7RQxeOJvwt2HtASzodbwflJAPI8EkbadgdnBSm9ivvocA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jknNdo9V; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jknNdo9V
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E558D4004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226602;
 bh=GFB/BgmhdjHVjEKxDpqktrv8nPA4UyF2upJMJWXHAYU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jknNdo9VEgMXngi6shzKbB7Gs5Flq8nY/eZZ8DWSxceGX6iKE64N01AuahOcLEqpm
 vZGSsrsATUVcdnBsf2pHNSISO1j0Pd/YVPVHXRR8wmdhMC3UxUrBoGElLzBc3t5k87
 A5w2i1AH90RpbbiudC5XBGdddf1Cc5CG3ZPbVbrDDEfFTx3Gqx1pMsclXMzI4yocA4
 zsGE3DUzH/O93mKoXKZCy4XY1Q5PTT/Zqo4mF282yJdRN7xUUDc8fjcv+NdsJha5Bi
 G4XfI4iPZCIAaL3rH5D95YRE2riSDbWsmRUY9MzX+6RgmK0mvrlUn44azhYYa2CKbg
 YCUWx9FGOeikQ==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 SpNzN6MpNm4IuDe96Mv3WwWfhzeCO8Es11y6L9mGbFrHswrNJ+YKF8bTzwHp9KRqwfBFgjC7FAy
 azRn3bK1Cr6LIcAO75tNhecCVIPPcTomzq+qAxNKIIdD3zixKfLvDGn1FBrxQbhG7osSLm/eyow
 jY7oDneFF4KMjl4OgIN3Ep6gEB7BGxZSpynBRGIuYJFLcbsAY3Sc6YbnMB41TI3pS8sSw8n4Jv5
 J0DnnisHiewLdwiNeS4x5wnPh13ameaWjUWrVdFiQyydOL6tYkI7K9p9n6NBQIuko07RpsuqkGS
 JjCfKCimotCn/NBMSTm3bojv+i0JOIMfNhdrYfEed0XKTemsQbyCccUi/g0fACyD3kbFo149pDE
 4lu2k4uyJFB4IhprBhZuWih0pnWBR7LBxYjzhUkKHvctGiXb3oDB2QatxNT8BLfcdzJzO7AW1pB
 FY8I3w7rxNwCUBI5adBKus6KgxGI7icbf/ku0w+JYLveXWnTRuhhciBKOQVsrfOYOUfEFW6TCC2
 tXChmvbSpar/Yj/4wx1O9BwcR6r8DEMs0hX+X8gLBRDI4Mrtb+4jSjcwoPKoLBfHb7OeeRq3Z13
 jTp7uw==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CBBA0A4C6FED
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9L-000000001i7-14CK
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:34 +0100
Message-ID: <20261028222936.514451-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 17/18] package/kodi-vfs-*: mass version bump to
 Piers
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash               | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk                 | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash             | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
index e65ba18fa5..79e861b1aa 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aab35cb6b03191609a7e97df02f2f102659c12e414f7b95595f9bb2047554daf  kodi-vfs-libarchive-21.0.2-Omega.tar.gz
+sha256  378ac05a967e80dc02d36ddcaaff97dd8324ebd58c3ca7cc82b943037dec14a4  kodi-vfs-libarchive-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
index ee1ca59b52..7ee7547f2b 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_LIBARCHIVE_VERSION = 21.0.2-Omega
+KODI_VFS_LIBARCHIVE_VERSION = 22.0.3-Piers
 KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
 KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
 KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index c69e57758f..eded39b35a 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7492cf73d52299218acc982c4b35b020ea801d36d47e40460341f4dde712de50  kodi-vfs-rar-21.0.2-Omega.tar.gz
+sha256  b640feaa5579afbf1ae911eeb47abed78501d2bc2bb177ecc06022da04707181  kodi-vfs-rar-22.0.5-Piers.tar.gz
 # License files
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index 7cffe1274a..cc96dab863 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 21.0.2-Omega
+KODI_VFS_RAR_VERSION = 22.0.5-Piers
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 3a59241d7b..be2471c77b 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  01a23958331cb0cd78fd2e9367d1269d4319c20b84db5b132632f9c1acd5f3c5  kodi-vfs-sftp-21.0.2-Omega.tar.gz
+sha256  e0d54427f74874da2352afdea0288864dbaf8dc38ecc5bbc0b1711a129233e0c  kodi-vfs-sftp-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index 18ea2bc099..c6eb220d18 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 21.0.2-Omega
+KODI_VFS_SFTP_VERSION = 22.0.6-Piers
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
