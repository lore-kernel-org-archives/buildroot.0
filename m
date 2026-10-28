Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BFF606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rj82ftm1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BtzAqIIB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E70407E7;
	Wed, 28 Oct 2026 22:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gOcSoNUmlrJ; Wed, 28 Oct 2026 22:32:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CFE0140775
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226761;
	b=r8odpQ5QmM8Ljv/HWLjyScTAYgD6YzOraXzzvxcAv7sr9e4A6L5mUe5lu63NN4lvUTcT
	 BZXSqL1BY7nshIeP31adxePOub7zm9ya13xndoFXnNOJi8maHrtX5rV0fTcjJrb53k6s/
	 xLeFQzo3meb8IOzNGHWItF3IryOQ8dQvmOsGb6cBHnELbmV/pYGHkRGhQZMxMJsf1GRfX
	 AQRFKzalkPEs8Ge/jSVmd0wSVbfbqCRezb0jxyH41gBGUtglwcF4ALyP5mMtq1c9zKSbH
	 0JfizM12HrT41YGjXyWM+eGJxxQlnLWOb7dq2+n9lAhr1I/p5WjJ3iTJRIxYhob4H+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YBt32S6Uf/6Uh5i1qWElljGdcI32pZDk1Er82WSVeRM=;
	b=DsZIiOWkJO7MuQyUsqP9HQM8DWAI8F1SbrjSTK98nbi79QCAiA3Q2f2f3FaYv8elKVCx
	 bIuQAwd9VfaiR0aX72tRA82y5CrBeET1H5l1xupDxdqxLJzeC8H8jmaLJyP/JMBG3WEjQ
	 DmuKTYXtfdnGPTzinDIgriV+n7tSk9cOillDv4vJznRhyzloa6jEbjR9qowTtrD0KFLZ7
	 W8inU+Bj7IiOCmtl3Z40TAcclNXoKkUqpAJr+LMT7fBZvebfF10Eo+YNNoMMIRgu0g30F
	 QLQuSGUvuel78FsqNsl/v2wtrI+/mPhMp1uOUXUDOG/VYZJGX6sBJbs7U/dvfMvXPng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226761;
	bh=YBt32S6Uf/6Uh5i1qWElljGdcI32pZDk1Er82WSVeRM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rj82ftm1KkvlxJ5fDYt+xqdj6U1ImQspsKSW8yh6WVM5tP4NdYSCJ2o498cQSc63k
	 jW3Ru2iL9T6LqZRV1qVMuqqLxoq6shd47nIoW/MCTpbhI8HjQNOiHRxw7rhNiqIBIw
	 LG0+egK79gfnob+43EfDWUjdCBT15VFq456G4oBZHjzvkRVbw7vYpccxjarji8M87l
	 lngHQJTrnc9n3QvI/MZgbYDwoEzlAKwmdeqPvNgpcis6UThaOzpo+r5CD3LbXFV07n
	 7T7VP7xhlJqqnXCeQ3EvBX+A6aoHGu/vhsg4WW+204lACBxr8nODTqPI0gvlDw9HT0
	 cimzvnMxkwiYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE0140775;
	Wed, 28 Oct 2026 22:32:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 896F92A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B3AA60709
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5lhA9c48ojM for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:32:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D7FB605D2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226759;
 b=UePwenN+Y5YqzT17nVYgvhasHEQSJDSfaACNnhLs5Z1MLcrX88izhejOdvBovs8UyVQa
 K4P6UiyqaZDqQ32uMpr4A5twJMouSW6qOFB1BfzkOpbrKNbLUY+dArIT6IkMIMdR2KXl9
 P3wn9HvLUukOk90N9ao9BDEBvWyBq3NiFUGHc3TS8Fy3lBfZSox/UmVCC/0HSoq+YfkOQ
 08g8fsCfJm5YIWJCSHxUP9psVeBEAQDIO1y4hv0hh6tkZ808UU5W1OK26QRl7CwMWCd9q
 YiB1ch1ojOZXuqvxeUhq8zW05145iheBKuSe4ZWxJWVClShK+zOsvyLAXWafqhrLgNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226759;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XwKQEnzBAHqTeZySi1o+lNTXj4vtAZN/G+QMQLgp4iA=;
 b=gq2BFeAo7iY50htkfAhcIg02F+r7RWfVoZ83kmqqP382F2/XIHcUso/O2CFgXBCJOZbb
 mANqhflyt3WFeHYb17v/CrpKejmQCi8jxCiLqebLVHO2Tk5MJ1YYSgen4jfoNWxq69IOw
 2ZjAU43QcavjZsyPu5KXp6koEIpfSFgJzPWAlHm78zno6f/l/J0Ay5N9RLaeKOuXXH1tx
 PXrLXmmJrv7GQ6zmpXNL84elcQ27sIOYzhSHoKHBWEZ6Xi9t/luTXIPd1Gv64L7zGXH0R
 BCkvv9ivZfBDe9OLKwc05tni1qTdSPjmhZkeeK9y/EG24AFukh6drrdRLUL1ysYM5XQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BtzAqIIB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BtzAqIIB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D7FB605D2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226576;
 bh=XwKQEnzBAHqTeZySi1o+lNTXj4vtAZN/G+QMQLgp4iA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=BtzAqIIBd03MJLygzYHsJQPYgXCebQYrpabFvbWLQV57GmdO92LOuxq+gID3A0cAs
 lkR2uERMDZx32v8/v2nY+9AGby0/OvRXoy/sgHnFxEdC8j8RW/ioxHT98ZEYrbGDtv
 5z5x3D+Aomy2mpi8lsaL1qaWpb/DhlUDD5B6OJx7xOeM2CrlTemNd8xdNgv1oc2hpX
 bL14oP+rZSPL4DMpxCT7mCWmCmKCBLJBGXyKpJlqz8GikS86/OGO3bEc0yDoRO6Djk
 ovBiO04tvbynU/2c7D70OlZl2Yn2mJW+Y4fwOj2TOF9A2WTlFe3QnMNkijUE8AMAqJ
 36nx1272AQYtg==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 41yGVMSFUkpZdqeAFq9Qij93PA/EWKp7Cr818G+jEauOgdmSs6rotXuVg3DzOhVDOUunt7wrQ01
 fJURY0BTecCk/YYqjxqHzmYYBnB1VQ+apQG9OgEfug33+0/z43fq0/GUIEVBNBOBQbZ17C8dFrO
 58gIq7HTofoSVYvGC82JQ+N8wYpFYznO06bB5gm8nM98iLrNnU4X9rHedw6Kd4VYhDJCfoZ2c0P
 ayy/SLcZlheODLrET3/oqXuFopSOz6nkEsWC4Z2f0kkcVxCVfgGsn/+RTiqw9Rd6uGmKtkNZIpB
 V8SUHA5hPrtiu6dyVOkxsqhPTejDVNQcyeUHc6jdsB3p3OpF0iFq8Q0dha7moVeULV0D1Q1Z5h0
 hYrBAi5+IOiaGd6cO+rpFSIN1SGcNZh3dH/sfXvX280HBQzRRV3xd3A66yURyDr/goAXYlrzLGq
 37tc0VOdR6zRui8yVbN+/rllbZafT1d5bVQldJ9mJo51xcEHORyiY/QTDexgAh75bvvHv/luHEO
 9EExtBsTsuknKBWA6TdNhr77jMjvqTmjfzMHwBp0C1qTWvcP6pCs48raqsbS+XdSXPfH+Mp6nO6
 2jHO
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88A66A4C6FC4
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9I-000000001i7-267q
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:18 +0100
Message-ID: <20261028222936.514451-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 01/18] package/bento4: bump version to
 1.6.0-641-6-Piers
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

https://github.com/xbmc/Bento4/releases

Removed -std=c++11 from cflags due to upstream commit which added
compatibility with c++20:
https://github.com/xbmc/Bento4/commit/9380a868a74252fa53c80174a3e942168e6c0d85

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bento4/bento4.hash | 2 +-
 package/bento4/bento4.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bento4/bento4.hash b/package/bento4/bento4.hash
index b933c74d2d..bbb10785d1 100644
--- a/package/bento4/bento4.hash
+++ b/package/bento4/bento4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1f8cfa4f7cb651b609e587f825607cb4b06fe5b08af876fd0154a434f9a5315  bento4-1.6.0-641-Omega.tar.gz
+sha256  cb5006cd30889238760556e6148f69be34fef4dc48e8d895a9822f805504a5c0  bento4-1.6.0-641-6-Piers.tar.gz
 sha256  7daae92c8628ada28def8d096fe2fde298b72ec3e2d64a3c408afce38edb361b  Documents/LICENSE.txt
diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
index 569e320a2f..bb91c9b65b 100644
--- a/package/bento4/bento4.mk
+++ b/package/bento4/bento4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BENTO4_VERSION = 1.6.0-641-Omega
+BENTO4_VERSION = 1.6.0-641-6-Piers
 BENTO4_SITE = $(call github,xbmc,Bento4,$(BENTO4_VERSION))
 BENTO4_INSTALL_STAGING = YES
 BENTO4_LICENSE = GPL-2.0+
@@ -20,6 +20,6 @@ endif
 
 BENTO4_CONF_OPTS += \
 	-DBUILD_APPS=OFF \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
