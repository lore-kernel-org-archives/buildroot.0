Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A78D606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eiWPmdrw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3ACF60B2B;
	Fri, 30 Oct 2026 14:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYNAWubyltzs; Fri, 30 Oct 2026 14:07:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0F02160B66
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369255;
	b=d8u5urj5eaUYL1DCOD9pLfKDtTIc0hT9AJxi0VPOd2u7C3hHsu9gtdLoVlnbcZdPB3vV
	 MSQgxjGedp0AGUTkHFrvkWrq5iHZsaPqumdJnTLvEvPDyVdUykKOQAuKEEZaoPu7KX6m6
	 6SWDNRUtoBpinNBxic7VzJJeqWU1tCJ6GJFwfycdQZZH8TVXgFuYcz5fuu0J4Iz4+rPfU
	 Zdr3PUGs/UfgA+luauUFwprpk2RvqdaeVVFSuD4PlNQhq6vbHLJzohp9sY0WCmcGeT347
	 5RZgNwJTMkuqZqm2ZaX2YrvvfsrRLHtcYWoE3aJhF+IWBNHJMCnYC9Odc5ntA/mHmOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wzRA40aOUFL7Wfq8OWtATOiNuYgvoHrgMEJIja9CrRY=;
	b=i6h5sMvgYpZe4KwJRf8Jpe09lU6gx07P59qAyQSsp86Fb1AQCothgb0HtBMG6g1UCqJE
	 +mHdyvEOQLPIXXWJXF4je4MtDSqBivM6UTsBv8rCU+Mcs16CXhTvQwCkEXA37LnblFqR3
	 bD/9mq9PAUD7QqAQhdKaYAfpmgkxmJ3DD/n/wqelW3kQtAfrxxWrWRZiD9oNZpWnIx1MZ
	 DHuqYMyCtwzjzbEpERz+PGuFh6GruwuRpjh6/S+iyDvfIg8nc2wiyfW+gr1XT5/ESdTl3
	 aW9PalP1XJMcrzF0rgGAIeyU1cGEfw89gBJmleSkb57gfD6g0ROyWfGHsO/zuV5vVJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369255;
	bh=wzRA40aOUFL7Wfq8OWtATOiNuYgvoHrgMEJIja9CrRY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eiWPmdrw4SzU1pq4XrFqu+bsI5Mu4Nd8u0syfTQp1TXDjpXvLofHddvZJ/wHYLXKA
	 X8hOorL/NdvdsXjVG5zNJ1IbnMYDuwSYKBcXlrvJ2Pxmov2JO1KHHRLUdk7WMjzLHG
	 pE5Bw1Scu3IUiuFn14H7L5blwpAo3PAId7X1on/+gbjqHpnNA0Sx76ClZjfda+cWhx
	 5N6yDa5Aa+h1Cu9NG1bfj79tdLlzjtlKENtdIsC4ckZQjPElKrdokdI1Gn21GcWwZC
	 MRyg/ZJJN6nwqw86SPHOsJpbCPF5mKjz1fXe4R/4wZSM+Zknf1Es2Mcb2Zu3q44j2m
	 sMUMYkeIHtOtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F02160B66;
	Fri, 30 Oct 2026 14:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44C1DD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 358FB60AFD
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_9Uke82ghyY for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7B5AB60AE5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=sPYJ30Y3gRC3Y8CNktiq1/HD3S24uiobZNTCp05E4rCpVW700Z5SfGiiCMpsTlG9PyUB
 8Vc/L8v3pq86Fq56Po2sRcafs/mc7cDa4Ny/9el8fL536cyDWXFDlAkKF5JgsMEFzOKNA
 CmyC26TMyBu5+RegiaN0zWFt6bYd0SiIPjcpQapEAF4A1v8Qmib1J6w8qiNei9xTAicUP
 c4gLL12aINrKKD2OzAmd5UZU2qLPQgUgdKSVdMBusX6qdUNzVs2G+U4gJyclzOfuV3dqJ
 hOxGd78I9ZpCG2sDH+D5pJmoJ1mPiUpdnY9W3rfY0mDtEMT2AuGUnFH8cAaEFv+t6Gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nT9F65mjKNMAoDe5LJONsNqxfZKMKVFJ79RUc6LjVYY=;
 b=AVIPfAzMw0InumzfSO9Qo/j6qDTnkVqASUSAof4DOohG7B8iIBq9f3CLF88g6qkeA19B
 hjQnCZWjMBKqlI9PauxpdZpvknHx4MeDiIcJ/AmEJSXhzrf2xdzGD3u14AIkR3szuHkJA
 2813fgV3VFFhzQ10up8vdbtJp4jcunnrhlh7llRiVVMGcnZ+xHH8lp13TSXPWQPh4VV3s
 0w7qrAaEhQJKIbxi477uwjV13uBAiQpsCOZqwDSeFGXqRlauWhEJdDrI7HimJm6flnhMu
 f1ztAeIFFHkchZ41NtR1cq/tBUsA412h2Y79BuLfyYwK58LXlqa4Hvmit5Dwgp0wi2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B5AB60AE5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EB409D38A; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eb818212fe9a28fcacd419a6c3a24b31b6e6a2d9
X-Git-Newrev: 58e85acd4472d14da367c78f177049eb53f24c1e
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.8EB409D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/brotli: use
 github macro
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7935676347510333525=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7935676347510333525==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58e85acd4472d14da367c78f177049eb53f24c1e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For consistency and to end up with a nicer filename.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a370fbaa27bdb23c5ab27846b49168b2f5856751)
[Raphaël: fix conflicts in package/brotli/brotli.hash, package/brotli/brotli.mk]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 0500fb79d5..8db342ebf0 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  f7f3a7e4620403aa26d69458e0bb886d322f7677685c55717fac824f0b789e0c25cf4ff7d8d455d70a8526d0150d7a09b9df292a11f9ef5d3bf625878cb51368  v1.1.1.tar.gz
+sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  brotli-1.1.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index b7049b104e..f11ded595b 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 BROTLI_VERSION = 1.1.1
-BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
-BROTLI_SITE = https://github.com/google/brotli/archive
+BROTLI_SITE = $(call github,google,brotli,v$(BROTLI_VERSION))
 BROTLI_LICENSE = MIT
 BROTLI_LICENSE_FILES = LICENSE
 BROTLI_CPE_ID_VENDOR = google

--===============7935676347510333525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7935676347510333525==--
