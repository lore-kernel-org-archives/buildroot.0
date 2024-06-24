Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8EDC2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 06:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8380F81225;
	Mon, 24 Jun 2024 06:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3jdfIxcLsOW; Mon, 24 Jun 2024 06:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 851E98177A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851E98177A;
	Mon, 24 Jun 2024 06:52:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADE701BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BB9A8177A
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH5pKIlsjbz0 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 06:52:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4526281225
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4526281225
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4526281225
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:52:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwZ4-1scLWk1Fdc-015tT8
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 08:52:14 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:52:14 +0200
Message-ID: <20240624065214.22831-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:qEC1auWKTMtvmqTX5eY6XNSGQvfMWfNSN+KAtef3aM6hNEav2RU
 fCwJAzbnlm9uPZAwvB8xSQx/Po2UcMV0b7HJUb7O/SNrGyehdaQGtndcKfN68vBmiKk0STu
 thakVPmvM163AiEMVKEfMmhBqex6hAjv4EepLVxt/DjWnxB4T95FsJjfdaAVtkgwKMeEAnD
 I4LwxGVIsMr5lo7lJT6Hw==
UI-OutboundReport: notjunk:1;M01:P0:0VHi4HX6eCc=;0ZQZE8pia5mQUEFX2BheU8hoKWD
 J85Cdr/JRn5+VaVM42BOIZP90LJt22dO/DdLEeWw1FcMrImVY/lQ4B51G7B071PjaIEuPOGv+
 Yse/+n9Y2maOK3RuOcsyxs1fHd8fYHszVPAg+osJ2OGbKGcuQxl2i5OIKSBBuAnGdpSDgK3gr
 JMioDtfCRbxLpYab6gy0MevEhGUUZidMjE7BoRbP8WDLXEnIXXLqFB/wqoFpycNzIY9odMSg+
 2xks5HVanbhZlw6OKd9NxeizugQaVcDcZExOZpl1fgD627gnJlCyq6JwAVRLO94lLxcQsLvsA
 s/iBAnI8wvd5cCOaVKzOIFFXatGikUtVjadybgZRaUlmcInSp4JhqM/J09FpC1jO1zSVExuAM
 qedGilhQqPHrWxFz+lKt6Qhg8qdLIdYIe46GB0p35YDtoWtXuJCtUKO3yk64hm6rIgdph5VND
 ILsNEXa3+xVQGCMIpJDpU/u6jarlqXaqkdzOmDJdgnpNfskvewxHUxaZ0WEpJge4bSkBKOQeG
 U5dt2zVUcNIe34RsUefW+9gR461abOaso44g+yQif4y4zfp+pGYWQUL080+60nlfg6Fj3tfvl
 FVEKdXTq9x32Bant28OUGBZZPl37+G7DzfDuGmnfMZzEjOf304nSbBFfjQxFnLi2MBjsiuDBq
 gNZxaHDCJJXGKMe8spNtoNWdtq+6e2gn/52FVfoU3tHnCjqKuaupwMK0ArN63ojV9O3L2cYto
 6a0bE/PJeQzakUomqtOaBa9ksHpSHenTy63hko4jZzWJuUbiGoyQZJtw6vXPGVlKT/VeGgZva
 eri4xqhhU374jUVfV2Pypg+EmTQPnwDp5fjuPC7Smb5rQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719211934; x=1719816734; i=ps.report@gmx.net;
 bh=NnA0Fj4CEyk7slCzz7NQvLjdd+npwClS1VBIhvuQCCo=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=RFBTU4M183Q8epOe15CmJh3Ho9TnuI4GGycHj/qpAFnaii8Maarjhg0KvWuxTu6A
 GBQ5l9n31+T8dZDWrqfTUBahg+PdT0ERO2ewCoaz/4feWL+XKnsRUf5Q1LPXvkYQf
 MOFgOAh+ag5liL+v518KYUHSKv0cLd0l9QGZNPwklIVzoVqzE4PgmJzEKPQVRjOch
 hsuwwvHNTiNxj0Rc0Q3NxadBQIaq6OR2IrVsLJ+crl1j/TdXnLQJh3kVmvmvk4thQ
 VStjgCJ17WTUGSMPOPTkYFrSP07wvkT2k67BgZgMkGkXXFX3ROyCEswQhJtS/6yAY
 yiefLc+cKDRc6BSU+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RFBTU4M1
Subject: [Buildroot] [PATCH v1] package/e2fsprogs: bump version to 1.47.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.47.1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 28a47c15d1..94ce2d5bc9 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.0/sha256sums.asc
-sha256  144af53f2bbd921cef6f8bea88bb9faddca865da3fbc657cc9b4d2001097d5db  e2fsprogs-1.47.0.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.1/sha256sums.asc
+sha256  5a33dc047fd47284bca4bb10c13cfe7896377ae3d01cb81a05d406025d99e0d1  e2fsprogs-1.47.1.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index cbaac4f40b..7e2d9a739d 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.47.0
+E2FSPROGS_VERSION = 1.47.1
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
