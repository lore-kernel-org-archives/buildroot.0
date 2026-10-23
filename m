Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E62F606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GEyLvt6q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=K4XeeHrF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E6160668;
	Fri, 23 Oct 2026 07:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1zF_15CBlJT; Fri, 23 Oct 2026 07:35:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21BF660650
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740922;
	b=tBk9qUWnic52gW8QkUJXmWxEBsZUk8EfovRzsoyY5WwT+aWOZQ/jKwTtPfXNKmTn73be
	 8//v4aiDF/oH8QWwbjF8FdvzOWmZFdVPJcyQcy71WkuRbVF4uvXfO2JtVp0s5K+cIUWpc
	 nsBhj0N7D9Jejg3zD5OSluQ0q+hTyU4JICai7XCcRksCkTMsEfAQP/2a/1rJ9weLKMm56
	 twBUxgHQ0GFNhCtKAR4hl1PCZ+lFzaMPq+wy47n1rLXqpZB9/NyLDhgsK5R/6SDXwB+1u
	 RXeNPWG1/Kv8cm11ALf8uWXmHzHO4ShdkGP2To9CwgPgyXv6mBTB+zmhF8aRG9L9Q9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XxLLtHL8nc0rIgW4yx45hFBicl54ayt/P6qYIwFs4j4=;
	b=rMaSQXemPvrFlMY/lk6YZYU3d6Pxg9YM1Y9wzzQXDCZwuPQuKQPlb2DIDupgdmZR3lQ2
	 877wzAeO+HD/HUYR1fZmInXvoxkHax4AsX3MqN5Zja95rZfaxc5R4E7dUFZmiI1MifyiM
	 l6nrtV3o52btW+C9pmADewW09P2AWR2aHrbR5EHJTe7WkITr7ETcM5okChdOcWi88mqku
	 eXMT6v+C50TwviggF7+glPhU6BwzpD2U843heZan53iBvtKhCdLLe16F0PJh4st4uBTUW
	 6x8jc3epwc5fVS+VKk1MPbTrqXlzXAB5JYrLa3KqeGTdiVtH4FkJXgCpTCMhlZUhFyg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740922;
	bh=XxLLtHL8nc0rIgW4yx45hFBicl54ayt/P6qYIwFs4j4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GEyLvt6qrQMnXGTRZp5SJ2kHYneVTlRzBF8GdIxnvncVv6kI1CvcVQf3lTECV5Mua
	 y9GebXA/feg5Jf5II3AFXpde9OKoanK9++cfLRWgx7wkbJSOFYVbDxcG3HyqAMjxDq
	 ATf4fTlkngCmlr+yxdVd5+frcEZAV68DoT6OAIrI7Ty68sUH1KPfllsc9A0CyCkaey
	 FsNn+rrATAATRhU2ok0pVMW6ujJ5FOoT2o7T1wC9a89Y1N28dhday1OFfnWk9CMMWC
	 I1gM/9EJrqNvfbQQD5objPb6KDuSquQLVblSjh6W0IcE1Nz9sOvC0eGX57O0Qj5yzM
	 0Z7F8T6kNBMOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21BF660650;
	Fri, 23 Oct 2026 07:35:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA6E3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13B184008A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AurVUrNeVmra for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:35:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5D87C4004A
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740917;
 b=Q9+nvbdgHQXOoQd0jQNfK217VEr7JeybDs0nEJ5MfjW3OvZEqeP/GPu3EV6dxYcv9nPp
 TaOLZkScGaqrukKfufjdqPUXhygkKrTLmwSRZlE0mfc/iZ4g7xy98+ZI3Fn+sn3Om62Up
 4ySITB5UzyC1lpXByP2kD4J7hSwHMUal1Z0xibmP1i6lxy8qoKMUB6vxhIIn5ViTcvrxA
 ljb6/5e4gNmiJkedbHpUQ5M36uYckgF/flXVXW2uKICjOgZTIBDRfe1b9i0nLa/GLB10e
 AotuxBsbTwM3TmqTNiP15L4nEFsMAEH/I0crowvCfeejQ+Eq065ajgkkWn0jjzK8d/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740917;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=2nppcj5MOdt57++X7GILfJekD4GGUHcDDarIuDhM5GQ=;
 b=MquKczkqnay+p592TjDwfah0NSNamFwFBlTcOlf1OLUmuGJ/IqzYAPwk2NEsBlF4t5F8
 ZfPz38CKYx31lWKIkGoCWkNZ1jLTC4W649PDhthDcT0wGt1GJyU0nj+GeMijSmkGKWyr/
 UP5SO6lxzIlp9/FrTe0FVxvQ4E1iW4U9ydZlkcAZr8tY6jwuaNRmxm2aZWvroNfPTUtNn
 JPlanYWbmVWdX17d/PluxO37YZ5pWL/rUwfM1hk2oYGkCUJTcDPWQzMnv/Ltv9i5Q+lVI
 iZ/+1P2wfTvFkZhIvl2eAoKuVv0MySCEuMPHAPrN8gcRDkd4YEtrUE86vq5WgoYVHKg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=K4XeeHrF; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=K4XeeHrF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D87C4004A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:35:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=K4XeeHrFaJfIapMkCeu1gz7BGHEx/IonqifHmMK9DyGwyau+RMkAG+1LD/rL9e56HIVk9UYZQvwT7tYFlXg+b3oUu/biDM774nMDlo9ELnSqEJ0jmo3U+YrK8JRzULZ4H+KOC6bF+llKzWi5wyNZ5BYg+Kq0ma4fzEmXqyP9+LPAMUOO9FnYovrZNekTl1QD2JKSyPsG8M0EwoQ22cZA9qsRvAPGFijkiLkVLfa+KXoqN0z/xOQMEIgjDqkmTdc9MhRO5drwxfb/oNBRuqSZLwA1xzN3EdHwW3jvLPkH4/YLoEpuKDZFmPZDxnGjzuD4H8mKG8sYTK55VsKwnlCZDw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=vZujBUyk8L6omTd+n81zzcFfS7o6JkdFSEHpRLwdx54=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -98837624; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 07:35:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xK9nz-0000000FaMd-41F1;
 Fri, 23 Oct 2026 09:35:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 09:35:05 +0200
Message-ID: <20261023073509.3714686-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 1/2] package/brotli: security bump to version
 1.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following vulnerability:

CVE-2026-111497: out-of-bounds write permits remote code execution

https://github.com/advisories/GHSA-9v8h-qqgm-4m35

https://github.com/google/brotli/releases/tag/v1.2.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 9ec1f79c7d..a777737338 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  f94542afd2ecd96cc41fd21a805a3da314281ae558c10650f3e6d9ca732b8425bba8fde312823f0a564c7de3993bdaab5b43378edab65ebb798cefb6fd702256  v1.2.0.tar.gz
+sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  v1.2.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index aded9cf17b..c040878c36 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROTLI_VERSION = 1.2.0
+BROTLI_VERSION = 1.2.1
 BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
