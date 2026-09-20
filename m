Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9C4C982D0
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 06:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55538810E9;
	Sun, 20 Sep 2026 06:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFZF7MuE4uX3; Sun, 20 Sep 2026 06:01:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A39B9810C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789884102;
	b=JYuGx/APASkGEk/CLF6Xv5csme+v8V2++T5lwVYDaA3KtNZiPEfda4wXFjO9ePCcYGrd
	 CsG/yh5FugRnvDPnqVEer+Xh5EQ3segIdP9xEKSLRVkSdpCPdCnhtafRbzBx1gWpiKz6a
	 +6ukwOhE2ss2QuTG9BeNyNZw1jGE1LinuY2Ng+GhTSKQ8cHFeOypcHK+OE7XGbL9iL8WC
	 qzV6NvP8tWg77+4zpgykFK9eDIQjnRK3DxRD+ZvrRxGpta+6NgVnrFrqRlPS7DX77IPwb
	 URr0j8zoFCw/Xx4RtuFGlFugXBppp026j40ykmxSnEO6EV59yP0j+XmolJHwF5zTucQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789884102;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a0Jabu9Dtn1JYFpAAX6FhKi43z5Vcw99bzXcLtCKGt0=;
	b=UldCpFoVB04conK+3L5geufLKz8h2CX962pwS7Ri0jp3qpUqaCRN6JmgYq2NeWQ+iu7J
	 fiVDZQ+uzi5xBFxwzJGabobVbO3VZVLZpIJLUm5R2V2tferTLhwiIh7ZVeeIf+tw16KgN
	 sPBtNFjrt+oWBt/DV1tieeaPZwn0IdWNV2Yhz+NvlbvwYcsXQl3TthN0XsxhqRfoMp2L+
	 MquuH1HQRwxRi36Moq+3HL8hpO02qDxXEXEDargsT3IC4Lo0EYWk7AYi8Kpb4w5IEplom
	 Q1BsuKDzJl3yTlsEAU1b0KkWKIKMsea5tAdIGMP57qB2Ekx9wJN5ndr+2+EZg98Ks6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789884102;
	bh=a0Jabu9Dtn1JYFpAAX6FhKi43z5Vcw99bzXcLtCKGt0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m2zkWEhNYEJaSpSvajudkrOZ+Omkx6o/gquyVvKU/5ypBIwipK9cU3JlE3PgvAP/Q
	 2PIYPJv5BzLab4evEKq8gBhqa76IMblU89mFjJX7THFL1WVwsf6GGaUjJW9icvwRa4
	 pigGmXpiUo2hv2hMFdPwhPNkE0S72q80SpHtSIrutyVkZynPE9Q4uTtrIYHf0HUYwt
	 Scfz/qbYZfOLC9Uf1sTyQQNjSxIKJHmmeDSlGbaC1Y2Q5lr6FASi3vWA1iNklN/fwy
	 uZ0vqFdAxFfwrtjFJKhia4q7aQJerAuay95ypiA3L5jF0+vVHcaOBZuQ+IaiMzyFMA
	 xmP4nhVs1P34w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A39B9810C5;
	Sun, 20 Sep 2026 06:01:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0C22392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 06:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADF7C40A8C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 06:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmQyRJ0OEEtX for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 06:01:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 26C2340A74
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789884099;
 b=VdhElQMXgkwmYObyQpiHwNmrkxsldZxXWoWxbVwHTbKgfC7+d6GeR/+uzuCGObkxuxpO
 HkdmwjeCWLheiVOEfNDF66y/+Jyi5ozJZuXz+TkDXapqVFa+Bx76Lw9jpgVhI6UTaMxx/
 bfq3DxawpD23UCWxzyEnSPhjdfZqm2dgK5N69Y1qiSR8Q+w/dY1OXxBRXKOx2UrUeLvA4
 vuHrhBM5qD/33Aj8IW4FdB/6LgQKZQCGLcLP9oTgZMrK8dRgd/MZCeschdE/DQcE3+Z+B
 b50Txoi9ciecCGt74+UwdzOBRN48fNot2wodRjl5gcOkF4nzilD3tEyraUO9Olu9PpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789884099;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=boBF2kgZ6BFuEpiUtYvzpU5iW32k/y7YwAaXb0vTLZk=;
 b=DkxccqXR7SCnb105oWThUTNewPVDClz0SpzXV8e4hlO4scP2SSPLjJTjvCOnBJVgNZdP
 ZnhOW0dIT6MT+O6x+bQjVAMKGt51OFi/6IKS6hSIOpQPkrg7xgGQh5qsRlLRiCmQMliw3
 wq4s0jOEkQ4S4tlSw8m04N9S8m7jhHLS7psKZL6L+c5XxiiHnu8kRgd5c/t4BdPkuEeKr
 MyQSzfPW/565aqmsncqNCv089sb9s9VM8vrSPdltk1aYrPSoqT6fvovJBGVUYcwqzrGrZ
 IDN7BsFpdSQ+g1WLqTlRj2S2g/XlMJNSehn72b3OSjeShuLjlB2LodS39O5yxVK+QbQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=h9c8nqtI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=h9c8nqtI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26C2340A74
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 06:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789884093;
 bh=boBF2kgZ6BFuEpiUtYvzpU5iW32k/y7YwAaXb0vTLZk=;
 h=From:To:Subject:Date:From;
 b=h9c8nqtI904Rn4X0TZniiZ/n3uHzw6YS8cXMim0FbWgVNq9sdK0kpzd8jMhluW0j1
 C9zJ/Z2uM6tZFRgQtMINd+Hx0ZEcM56qrHG2kIRPtvJDeQa/6K97afWzlQuzerd5zf
 dRsB8u1o708F6SXTUKEGsVhlrteNhCG/T49fTz5/eWCcXDvUlbKhftB/4VlWFRzTKz
 PsxQiaABUEnO/FYw4llgmyQwS7UO3vy/s+0kUm3Bo+dIsRZfxaiTHHiUYFtWpSX7AF
 t+icn1dKhZx3ukGPkvHmKJBKnppJ4TzuEatc/1lbn9dg0LKtKPcbHL7/dG5I802Gsj
 ryH6riH8/X+mA==
X-KAS-Sym: v3:f51bdf72230551df:eQ7Zj7dfZfs8LYhKZHjuKaqtkupe8i9qb7f1PxU4h6rwocleM5Sftq7OdkGda93Si1t+SqbITC5Y1RQxAkMpT/tH+zodMwExfx7aVTVHbdobFYvvdmGwQX1UqrHyUb9yxzZ413Gy2SM0wTxmqV6FQUhnTo9tUEc9tAEYBwrV4C53D+9opSGKVD4wXVQzewCUlVe8qWxKzl/8HiAT1R/e/uv58+/XrMzamlQ94MHFtEOSkPxSextydiogtO2/iQ8mxXauDga3Ux1FWlETh+ZxGQs02zbj4aMGwVDRwAiLAdDImAZA8fBCHbphMcTpR/jisnLipQiKiMPqKn29pqp2UA==:JPYhHek2HdeqifZhqZcwKeUlRcdGDQXSawBbq/Q+jI2HVmkR1IHA0m7/R0GaBLMUuoyJI3n1gW10kaIbJKNAYws66Cx0Sx0V3F7+FcXXn/wVK9IfsHCg/4dmTYdaGR32t1e4HRAZh5ByLtu3FqUv4tiI1hpWJr4ba4jScNSL/sUSLpP4cn1B05qMQ40gtD/JqZ/ibWa/szA7FRony+sCiew2+T623BDqfyaTT5xTeOswyQIBeJipvW6FdjPO7oDBoHmayci+oMOk3I6ol0aD1KqV7lK9fuqH+v+OMTjcYIroXLztQ1SJLzkdWzUaHsek76U1m6x/yEq+E8v/KQbZBjkjbjGb+jCj5cO8SY15DkAbMWjX0KwJMCR2Hx5MfYAmwGivmCVL9yt28+s8NcJnnPj12A5gR6bM4JrvR38hWx/59Es8J6knrqw3v+DAG/rjlPzA9z4HALxhDJi3sRNp2dCJidgPQyIfyKfs8WUBaKjbj/veyzrp1pYeZa9VIkfiqXs9SPaxpK8nGwSnoR2Ycq1x0xFhidc3Qd3D74t2+bMqZGq2hMcGPBAeKmKXI/epL5qjDhDDlVMaUNPjuvPxBPPJ/PFjoMt34kXMK42NU2PHr8
 tUaZbmpzrbDw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68AF2A4C42DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 08:01:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49496)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8AcH-000000002Iz-0SUS
 for buildroot@buildroot.org; Sun, 20 Sep 2026 06:01:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 08:01:33 +0200
Message-ID: <20260920060133.4184-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 1/1] package/libdeflate: bump version to 1.26
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

https://github.com/ebiggers/libdeflate/blob/v1.26/NEWS.md

Switched to sha256 tarball hash provided by upstream.

Depends on gcc >= 4.8 because "libdeflate now requires a C11 compiler":
https://github.com/ebiggers/libdeflate/commit/a7cbb2258188cd459e436b0c0a1e4b892e2b1ac7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Added dependency to gcc >= 4.8 (Thomas)

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c4b6c7b32132ae1237554fa6c0b3cda3a3cebc54

 package/libdeflate/Config.in       | 4 ++++
 package/libdeflate/libdeflate.hash | 3 ++-
 package/libdeflate/libdeflate.mk   | 2 +-
 package/tiff/Config.in             | 4 ++++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libdeflate/Config.in b/package/libdeflate/Config.in
index d2fb0d6c55..b8f452e601 100644
--- a/package/libdeflate/Config.in
+++ b/package/libdeflate/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBDEFLATE
 	bool "libdeflate"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  Libdeflate is a heavily optimized library for DEFLATE/zlib/
 	  gzip compression and decompression
 
 	  https://github.com/ebiggers/libdeflate
+
+comment "libdeflate needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 24aad4a799..851926182f 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,4 @@
+# From https://github.com/ebiggers/libdeflate/releases/tag/v1.26
+sha256  125856d4656e0feab660f94842f835923410c9281fedbcee64598c918da42b5a  libdeflate-1.26.tar.gz
 # Locally computed
-sha256  fed5cd22f00f30cc4c2e5329f94e2b8a901df9fa45ee255cb70e2b0b42344477  libdeflate-1.25.tar.gz
 sha256  4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 889e04c97b..a0b99cbf23 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.25
+LIBDEFLATE_VERSION = 1.26
 LIBDEFLATE_SITE = https://github.com/ebiggers/libdeflate/releases/download/v$(LIBDEFLATE_VERSION)
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index d357d08406..ff5bbd2355 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -13,9 +13,13 @@ config BR2_PACKAGE_TIFF_CCITT
 
 config BR2_PACKAGE_TIFF_LIBDEFLATE
 	bool "Libdeflate usage (still requires Zlib)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libdeflate
 	select BR2_PACKAGE_LIBDEFLATE
 	select BR2_PACKAGE_TIFF_ZLIB
 
+comment "libdeflate usage needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_TIFF_PACKBITS
 	bool "Macintosh PackBits algorithm"
 	default y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
