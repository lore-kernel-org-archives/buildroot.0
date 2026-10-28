Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE8606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fNIlVyz5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=duwc+nq6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551B640743;
	Wed, 28 Oct 2026 22:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHGxR7mWDyQW; Wed, 28 Oct 2026 22:30:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5E8F140786
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226637;
	b=HUe5FHU6EBkrOs9HLDVR7SW8x8wcxX16C8C9DXw/Z//prUf88xabzaM0abN9wraLdCT0
	 0DXpVPPlpEDmmi8uvLR9e1CTj9F6hJWhIeUIqlaOrB/kV6mqCwmhMUH2kMXm28tXMRt3i
	 jag33AnCiGFMsQIctxk1RIZQoevXy1T97UERKfCiyerOfk4mAXNyJTYuehajwljqVZaME
	 KBcv20GmtQJza+qasesUwRbO4rXoqd1CPqxXtNyGwDTZ76wwxMAHyph0KFqXBEYoHTzhM
	 jXiNrPqewuNmM4uK1Z1Wkk+filINOlkxUT1IxgebrQIBnaWI4h1CDdB7Lw5LOvpvPEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226637;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HgZxbPNrz6XbwWoO+s5mVqsoKXzF5phEcC0p+GN7ZGk=;
	b=C37g2THgbrWgH+RIJ2sxL4sy2KuB4aQpMmJvH0joImA4Bc5EFpuyY82wYPUTXFKzG8vo
	 iBCbvtdE3kIgEfA5LMMuFnzQCv6M0qna5k8qWcBowE5KhslGHaa4AzcfHZ4ZsDFmeUxRo
	 RCt5G947STHY9ZAeWSZlOhzlbfv8J8eOqCNl1d3GlKFLL4N2exhQU3blg0+EtglrkiI0l
	 sym6ZyMIo2hy8h53EwtGcyYQsBXB0rQ+obEW42I7wIBUALM7HJbeSCa9NMxTkBEkKijJ5
	 UTxr66JHl+ntqKRTzi2R0DWLwxiQKIRH9tTgvcEQvAHleEWTZmuhQ2rC4L2LAUQK7fg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=duwc+nq6;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226637;
	bh=HgZxbPNrz6XbwWoO+s5mVqsoKXzF5phEcC0p+GN7ZGk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNIlVyz5vCH4HOtDMPB1ZP9BHoUF8wrO8tmnnLnsdoOaDeMBn8x4qUK71c24lw2+T
	 ji/t9AeWKBdz5WLRsRj9ncuEvLE+FdjaQPp4jGUrlUoVpLpnYcdeKNZA8raVnOkLs5
	 u1BU1jy9g/+SyzVyUakEdDl/vuAZhptYK7Hrje7l8ik7Vqjqe6leMh9ZFw8Jk6TOrh
	 B9xZZ954cHRJ6M+6bBl1S0OBLNkSWN2AW45F0ueE8MOoD7WqyAw+0SwII0pKVgZxKE
	 60rFYR6uayuMz9OV0h2O+qsqZe0jx6GfPKw2oU8LbBDG8rswWlkIqAfOTye5PopaFe
	 3d3Ar/9CvNL+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E8F140786;
	Wed, 28 Oct 2026 22:30:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E1B32E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FD2D40786
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhoZ9ikxntWe for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:30:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8165040743
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226635;
 b=AC+EDPEUgx33/t7FQW/3t/SkqI3q56akxIv3ecPDaYxP9WSn8cNWsyHJvabxxFBZgtkw
 8nJPgtAREDPa0LZF1ruGDGIuCZE9Vyu0bxsbFTT100GO8l2fHSmG3tWaUJ+HBdhdnQgQB
 JoNAdkYc+BxT6A5G1vjfUfcnbM10m2UnuDI7oWRC6z90znK1MtHROSQEV2svjjd95b0Yf
 AtbfPokWwqEp+2kDH32HiWNyokdoV4u7Y9JAuVgx625MEBYGBxo1kglJ+iHE/4zK9QDtj
 XEo8OgQ4cosFnDypqTrhG1AEYCUzX8WkEJUo/PX8rqe8G5tm95EQbcyl/qUgbua3spQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226635;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qNvK/z9O961s9SpyggsTn+GJuAnNmFg+q+nHlBx0tQM=;
 b=jTWhrO178RZ0xPb/p4yBV0rv1BHyzT+6VSaZVTFmArhIPNHwKtyfh3eyVPlE2yjcGCph
 2oEOWKQdBlGeD/v26Ycckmg9K7Rp8Wbjkcfr9cc2YTUdKYak1919ayJXRVvW5+fLH8t7/
 OUuWBE4z6HpTYfgiehCDxi53/OVXnKhxzTzy+jiLL1sDrkCksUTej3XRNWLSzcGBiT4XO
 SeTarG9cV3jam4OOSB+OjJmteZdDZStCub2n9+TK5/vOtcFZl+iI8Y6Qy+goTkydZ8IF4
 eDJDZXp311R55kBGwUcYWkR3pfqWovGjNPS1WyeRacV2txycGm37PbyWl5mp4NdWPFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=duwc+nq6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=duwc+nq6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8165040743
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226542;
 bh=qNvK/z9O961s9SpyggsTn+GJuAnNmFg+q+nHlBx0tQM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=duwc+nq67LEeVhkVttu4L6THSVAEqVd9xayuo+oMXSwKvncQLu0ZfOY0QETCzn3yk
 8Rm9aCwL7ljQoGjXflgUbAGwobjroMm1ntzFt7i/hn8ct0Yqp+cZqpuWO43ZHBQnCY
 H5yOZwri6VAi7/4jOeWzm23cxiWVDcUPLMr815n/2msccDYR3UJQcG0/TVpxcQE1fX
 5eiS4fUh1i08qK0YY3tutYlfRxJQR6VzJTBCt7X31T85FpfDHoatSGqFHreVoYXx8o
 dZTgxAn7JPKCHRKTT/NUheSOdTYkbr8RW8hSPEaFyUKUtNpiPSGclE5YGt1G9kPITy
 OrZahHl7i5jQA==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 +PlNFjJhAjEEwfiqh4lAGolFWQzO7B480LhSjlyjL2g5xr9ZEcFfMMD/73yHvwud6LYer5sqbcv
 UZEitwE2WrSK9vhwqw08ZGUa67gx1lX/M8gwzSThM8pCrHbMfbcTFMHmGysSgbmUDLT3nXnmZHl
 cIU62kcFrRsxR2QXvTbvdgQqN7Bt1C2n9PIsEz57odKuxzAQOklAWWFEAvul0Vor+/hdSUphl9o
 JlhI1Hx/HQ3tz0gX+rvJFQ2wanX8NV6s+49H5KMrPUqTyoZymlsb46lLLvERKpzGtoYT5lsZXmD
 uQ0/G3FjFUCmqGtV2jB/32RtDmRv3zMUh7XIV49KGvhsb6Y1cRAN7l4Obzv+wmKw3el3cMfj9u2
 6QmYg+cJ4nbBcWtyMDPbBgeAIftEn4Sw+Xig+yr2pS+nCC08G5ygCexjyQK169rEnxt+E/r2Z7e
 2jaKuLoM3+I9fhVbZOQwdnSoew0QZH6V6kiN3tjY8OpAyuDX8NfDKI58F/z4bAYJ9S4xrX0X8Gm
 6HG4cxxHtn9ChKG15StGtR9Bk51HSD/FvKroY6+NPLDkI0QRSSNqRZd6y7k4rSgvs06sAiSWXtI
 17aPtQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DC4EAA4C6FD1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC89-000000001Tt-0F7O
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:10 +0100
Message-ID: <20261028222822.490779-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 09/20] package/kodi-pvr-hts: bump version to
 22.9.6-Piers
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/0001-gcc15.patch  | 26 --------------------------
 package/kodi-pvr-hts/kodi-pvr-hts.hash |  2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 package/kodi-pvr-hts/0001-gcc15.patch

diff --git a/package/kodi-pvr-hts/0001-gcc15.patch b/package/kodi-pvr-hts/0001-gcc15.patch
deleted file mode 100644
index a62c5f836b..0000000000
--- a/package/kodi-pvr-hts/0001-gcc15.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Mon, 9 Dec 2024 00:19:15 +1100
-Subject: [PATCH] Fix build with gcc-15
-
-Backport upstream commit to fix build error with gcc-15.
-
-Upstream: https://github.com/kodi-pvr/pvr.hts/commit/b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/tvheadend/HTSPVFS.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/tvheadend/HTSPVFS.h b/src/tvheadend/HTSPVFS.h
-index 1fbf9d18..80f9fea3 100644
---- a/src/tvheadend/HTSPVFS.h
-+++ b/src/tvheadend/HTSPVFS.h
-@@ -9,6 +9,7 @@
- 
- #include <memory>
- #include <string>
-+#include <cstdint>
- 
- namespace kodi
- {
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index db2c69e67f..153d1c8d1f 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c98e29433bf4a007662b20279748dccd95da7817ab73b7e78c0b45fbe31c22b1  kodi-pvr-hts-21.2.6-Omega.tar.gz
+sha256  36e04924b200700f8c4ab58f5333ff739e7ddbbf36fff642807f50babc7d9f48  kodi-pvr-hts-22.9.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 0e34a4bb09..23e3ea0138 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 21.2.6-Omega
+KODI_PVR_HTS_VERSION = 22.9.6-Piers
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
