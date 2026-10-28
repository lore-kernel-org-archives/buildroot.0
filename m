Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639C5606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MvILLe0I;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=DVGz0vKX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FA88407EC;
	Wed, 28 Oct 2026 22:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qldMIe6ZWO-Q; Wed, 28 Oct 2026 22:29:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 39183407D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226575;
	b=C7HCMHc6rFSxJUFeuhVTyxzO7Rlnt4tggiO/T/kUYbyXOt5NqNJG97pGnsWmkzth9LmL
	 bE87KOzhtVMLrak+2f8EUyjzfunTAe0vjzTu1lKM/2apdQXl59oScSVJvNWLXYN2QPEZC
	 yM2ZNHr+vdv9vn8blJ/OWVUOYhKzlGtmp1+G4mbrI9Ud35dr21rHUBmQtCZWlfMXrDz2U
	 5UwaoeLsLRobfmN2XyHL2isC/TwmXmS/KqGHRlnPp/9frM6/34eXmRb3MOl1IrDAXhUD7
	 syHK4obR2Le/GiTHylcJwpq1LJb/VwqQiHg382kU6svghD187zebzGE3mFMrqt8hllQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226575;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ePAx+Hv44AwhQEzxm0NKu/LQHoZBBpGt5XYFbcFVQxo=;
	b=c9raPgk560B4pMgm6Zgyg9idRsyZd9j8sovvbniEDLyxmhEPD42RfGftT/zPIaLmxFzW
	 hkKYmX+rEYIEU6fQ0DD9oQcWJuHDs50qTaApfVUqiKVs3MSMLotF62Fr+hLGMzRHSaDhA
	 8QFKT3trhscCTsQ5BcaSC3gDjh1tvJp7WMvvYFioPIB4vNKD7x6KChUGSsMPnZbs9B/up
	 J/51E89sEZJX9XD32XQknYpFZjjN/En94LMGxvtzp2iUZgeNkRrZRhaxqHwJjL84FvNVl
	 rx7umyyEkpG1MwzpLTIc35z2rUHCy5aBPwKN2xu/IdW0oT9xef1jOHAvbtuv0esp0dQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226575;
	bh=ePAx+Hv44AwhQEzxm0NKu/LQHoZBBpGt5XYFbcFVQxo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MvILLe0I8cWSf1wdaYe6dpmWbdKoQgq03EqTjiuQGoNBzjo85O28mh78OjexzWWuH
	 aJdM6vosnRzRZLDSGvmzrJXnbAXyldGPVD0hAzIfC1ERDsHfmjK8cRVxmxo0G67EGS
	 5Vn2ilEQNjHWbZnazaEPDtW8hv2m1vJUi/l5qcJChyhaCulUQ9mcAMK0+FpbSdTyN1
	 aDWttGUd32/fZTSTtqhu3AD8JrDFkru7lPA1+0iCBRZvH7gLT1uoQGAa6ytBbyhvUo
	 yHLSqOT9NAfsDcxPpj4B41mL5mvkKrhcYZpNWWA7SG6wlFJJes8C6FrLmqsuwWfuwx
	 hEkfDcObgHBUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39183407D1;
	Wed, 28 Oct 2026 22:29:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07DA92A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1EF6606E7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPhNaeoQaS0A for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:29:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D928460613
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226573;
 b=ma9JLZ1f7cTfuovC9ESoPmaRUie1+KqTvdih401I0u24crZnzTbKRN/jj5vwODcD/O2s
 DdRxuYgvb2hX2TJErYOYIYAN1QWXFqR822O0P4jOz4XDOp51M4j+QBnaxlPh+jUA4XCWa
 8XMcNO9ReyJPFcq4hH0qKhoYKS8riFl8R0mkOrIgesCYT8LgVw2OIf5tpLs/B47lO7/tW
 qhM29zZfXTGjAVEdYLP5Mf89OLAiDds8WPJq4/WE3+GK51+IVgR/wxWIwPafZlBg6dnA2
 ptTD9foEYM7/k5b2+b/UZAtj5Vo5fqd1YpAtDa5jJHYru6stE+HCTOIjFNHT4N55tdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226573;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GFB/BgmhdjHVjEKxDpqktrv8nPA4UyF2upJMJWXHAYU=;
 b=mLXqjdd+IkuRRTuCZovGNotCOlTGF4d0Oq8QPtr6N4Evyn2Dsn0B2GYSRRlHZp0Y1ES7
 NlGanUVEdsUCQD3ape2MuPouoDWeImhfIa0Zps3x9k12Wk1MSDcX3dIa2v4d7/aZpAUcQ
 ioEYdur7UoeuzdaEXL5lDiSfvOFPAqAMwACT3D7sbn+7EpqA/ZinLlQwMA0pQtpxdIIZs
 NfZknRKTASW9alYuAVEcegcqdK4IxAITG1Cjc23M1txjD0ahaQ4cYqN02OUaARmx92T43
 AKlB5v6dsYYi/mWg/rAP/Yc3G0PEcSzl79jmz/mx2Y5c6jPzFo9L3KUQ/rXPyUSQZNA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DVGz0vKX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DVGz0vKX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D928460613
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226542;
 bh=GFB/BgmhdjHVjEKxDpqktrv8nPA4UyF2upJMJWXHAYU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=DVGz0vKXVOk8cK7/CGyOwItZUepqfRWWJcYnLzSE+9e5SOjpJJgTprqHsyDdt34am
 au5KOWkukWmTvMz/OERWfT7t1S9TTt3urf+kTUNGCZybaTQ3CQjgOOd/QFuM/q/U2Z
 98xnF8m8pzHTyfAAQ5BBsOZ6ayfhUG4qxkKFxKuJWFCZmdDRxYLWQvqfEFPJxUnz9n
 V19D529EsSlWUwXVPibyJc3VqPdYhzG6r8N9g/OCbfjhdoyED8HBgDTghzRDuMTN8m
 rEs4Ed7o1fyd3dtlEAyEaEGNjNF8rQiVF9/gypeF117RgrmXEv8UGCPvOrR56vMWDo
 Rdtt2KM5CCu6Q==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 +7BK2zVN4DYwFlwxQKyHTNjuZ/zbtw/ue0xRLrHtItZrxOWBwvDmB7SWPvSJWh33V5XQsWVaqTU
 zbFVWmDbdnzcxwrLmjwadgdD1YmZ9y8w3sU05SiNM4gzsOvRaHgRODVUdMZv++zGX/Q4G6Tzb6u
 PeEA4Sje+XVNhFYdTn/VkvKD8ypcLmL863+oDqWMre6nS1nr52F393hma6ORKedR1I7+VX2D/xO
 gCbWHti6dPjyn/i+UH1Z/Ig5z2zMFgLhGgRGTS7FmMkLyT3Ed4fFQMXEkZTZYc7iUpdAh5JwuPR
 5oJvI7T45ZzLVKxClBDNlxlg5FIKAFBme9PkJ1kcwzaTz1CSuNtvxDNkEWzqbUPklqe6CuhHmMi
 4iLFPwGPRXBkTyIv6zApdjf1NPL8YGEWPjn02rXBZ01JEyVQPdP5f5HhIoomBp1EZ0t8+uM/Gni
 xk2HyYR0wB0Gv5pBG3u8O4FZg1YQa2RpONqcoIO/dXh5A7MYqHa7GnchiUemuLoc3GPBAvckpHl
 8C6jl8uwtX/V/VWbkyxVYguWreINPwhOHzqPB09jLNwKdGnDXOFfkM+FxAOEiGbCWH7bmqznNUv
 c9LLDg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1367AA4C6FC8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC8A-000000001Tt-1JGO
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:18 +0100
Message-ID: <20261028222822.490779-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 17/20] package/kodi-vfs-*: mass version bump to
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
