Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1FD606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d4cUlDA5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jLVGmLFz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA1F405B3;
	Wed, 28 Oct 2026 22:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-2UjvH_h-Yw; Wed, 28 Oct 2026 22:34:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7EFD34053E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226874;
	b=fro4ZzdKTqA6t2RlCVJ6wsVADBcyuijsIQCQlMywFNx1pkerPfGjnWDu59LDJFoTl+D1
	 5JlSzdK80BMT0f4vRHn5dNN02BK6/RAaRw9tKwvWKhA8nHr2vH8st6EULoXNDVgrGioJ6
	 9ByejK8NgHWRMX4PCzEPHfujZheK85y0QRESNtovkIufu9N6KjD5Gur0rV6dwhiCOdWMi
	 eXYn+2wi6mwPTwAW5Fqe9hgbN7W9Jp5eBL9OoM6pCJu6Mu8YgFvHMBrkjOkVcKoEh/8+q
	 /R5F+71GyIQKuQ/8NCg4Q40AP2yEm/U9kq5blz9mZy1g368PF2+zTfETtPQdVf695fA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HgZxbPNrz6XbwWoO+s5mVqsoKXzF5phEcC0p+GN7ZGk=;
	b=Tzc5RU9oT8+xLRfCSNRgsWS2tzebAk6VHGImKyIQqL6+JNuuFJaqqinO7eVUNKYWZBJd
	 3oaj9oOVhLynv2UBiwPQ2bD2L6sRXln+qeuem4SmgH1zclRpRIb6jvUkHRLfI+7ePNmYL
	 GfdAFT6kckChAlmfJsjAiD1kzUuwQJifwuvCZJMjfiUUrAA1l7pUvV3aQbHi//UusN4TI
	 RKvLSFleT62I8TddwuzZERLm3QUZEaIxVnclEN6A5j2tHIljBnd6O6UvKrHSeNCM+rozr
	 eLKbBh+VSKBxfTimSOHl+OAwVhDN7DEtl1RGyhewGqLXNiUFSRMnQq00wX+tQEJoD1w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jLVGmLFz;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226874;
	bh=HgZxbPNrz6XbwWoO+s5mVqsoKXzF5phEcC0p+GN7ZGk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4cUlDA5xdcA3yVwLypFCF+rENDs1S6itMp+8RBAV+S3JYMkgJsXh/aOWNYig0l4M
	 bV1f2MD83RzY/zK3tQyTo/EuwvaMpcZVjgoCbDpYOF1KpxKWYx1c62JfPY1pqt2OWR
	 AozDgOWtTe/+y6Mv3CFjF21GZr+h6PmwGoHYmb3xbPVDBNczzo1zMdXnkjBAv4NtWG
	 4YcgZKYdDNgLk4Hv1snKZtiPqDe3Gi8cY6k58Lsas7KhkzDpuBqYHYJcexNfyWhOV6
	 L2glZNXrnxCNCFWOV+0TvuTZxlmneeWI7yxDeHIe9/MCpuIN2rQ2NDonuroDc1gNPV
	 aTOvfH1/r4Z5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EFD34053E;
	Wed, 28 Oct 2026 22:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 231D72A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08E0D4053E
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKcfN-Lb-LAT for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1ECA9403B3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226872;
 b=OZNLvX6J4Wi4Bp19hBFedhG9x1BenAxG3jbRxVlhUxzkPHercUdkpn+mAQWNikjnrAuT
 IZBU+88EHoacZsSZ5QJ2yDqBQDkFptUOnov0ztnq5wUObag9kNqwaeUmfyYn9TjBJsIYF
 1bB2MUSu9HG5J82Swzg8B1aoYFkEivTYRcDBj8CV8EbjJBxCEw5vGGuU0oIxiBOKCWKoJ
 aPnvmK82JE543oxb7zkM6j0PqeozNX5EwVLtRypcL0xONijQGRUctF5f9k5/PSSdLzEXG
 AcEUKPOCsmvn01YrHOc8U8d3yGcwZh43B1DPCTOz8pXswJV0sdIF6Ka+SVf8Zh/gpXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226872;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qNvK/z9O961s9SpyggsTn+GJuAnNmFg+q+nHlBx0tQM=;
 b=hM8eTIzrUbQ8A0mbRTYKddbHOMkFN8MCmtMHqxQw+pmdlEXhPy9QwzyXbUluayHn+FA1
 Ly6MSmI9A7V3MJneMZJMNS3JdwOvdRJfHHiFmUlNQ3xhj0Z4SqaeZoD5UH1fX9yx2Z8sY
 qJCx89uz319R1dm26mGdpvRjLD0h0DufM5NcFl2e00LreZQX/+dSDsqowp0RQ2bhdIbyj
 cjaJNu5RS5ZDWSIPQkpDNRxNu2Eep8kUJp5vxLfATxqpxJntk+BCINF0Rqz92xVkjdN9y
 hBrPx9Gnv9GYG8eVyMNEapXcto8J9kvKZ7yz1ONvbyGtZ5ThPxm8X5r7EKAVz+/vRVw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jLVGmLFz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jLVGmLFz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ECA9403B3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226578;
 bh=qNvK/z9O961s9SpyggsTn+GJuAnNmFg+q+nHlBx0tQM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jLVGmLFzyFcpN2abUIuXwcxM7hb7Cd1TD8C4ytf355pTGM6qaeI1/lJ7ebrNQ0ok6
 IuhNvyVOgZGnhWChSrzDy3Yv3pzh2DVm/UJNybQZjdac9z2yigBoc6Mn/yZ7e8dCsT
 8ygktL5ACzjJ2SP+NimwlMyjXUSRm6OYujA/15YcsRduDV4zK7UTDqnZiBQMx/OGVh
 yYE8XcCaxxTF0eQjSjKtpIfLbWd2tCReBeWQK/y9a9yU+dmFyKaM1QJOZ+cYUTPOiJ
 eSrCSUi9DwHUXdRf2NccS/aR4pvShn1kSv2SXmNuCy2H1wnussNyGh9yOUySMdk7sE
 C37C/Bm3s+K1w==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 2LnJxbUDc+z1FHE6KCi6kGnSYgKaUX2O5dY0AkcYkx85AxYT+LF1ZBtlC3I3LMYeYbDBbxmwtrp
 Lmn9hvSYBmsaFuboaRyH9PrNg4dddQUvjJmac6yuaEN/MGMpPDQGLf+5CP5/mFBuVt9yElMiX2o
 QeX8mS4V1EYGoIx5rhboJeIGW4ZKolKh+vO5N42HXMAoqCSqhRJKI2TlFkbApQfnE6hyd8vUi4c
 ezl92NRUrx9nOLL3YHkNF1Ua8gwvHtftFQFEn2c9jz0MAau2wutl6yTm4gVE9/I6fRHFoV0tkzP
 ZME7VTGMjYB53t1ehxnTR7T2JxMeurDk/OtJV2mezTvjmTOygU3C+JXIn/zEV5Ls6NQ1Qnk4FRK
 U6oImSHkFRondAM3Oa4H2TTTj70E67hjT7FDs4xaymMs9HRnDnjuE6Nf+75mPzICDVpKA33pZYU
 H4pBUHXCcW3hxdS3B8D2L8LIP9Zb+pM3PqjU7isorGTt/NyuWk3jKD9IDR+Qowq9vXFNt1u7veY
 Un58iX9Q/FstnLOEhazGJn+Um7k5miTMODt92sFoNU8tSX5ukTCOFz+B9iqvqaN7kALUnh7GAFQ
 6DOotg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CDDCA4C6FE5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9K-000000001i7-0Dbx
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:26 +0100
Message-ID: <20261028222936.514451-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 09/18] package/kodi-pvr-hts: bump version to
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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
