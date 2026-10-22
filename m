Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B9E606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hAekRHyQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7DA811F1;
	Thu, 22 Oct 2026 21:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHX5Ce9GQfiE; Thu, 22 Oct 2026 21:21:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4EA5D80D49
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704098;
	b=ibF3QGyVyh4KZJ7LnKAxOzFD0Uc5W6e3FgIKpqK7mGwWMEtgNMy/xx8ZyPj+kbeWEI65
	 qNB/PjDaUXf4718Dyq/rifDT5pCbDDTJGeZPtkfdg2w2RcfHatUT8VZf5GSRYiNrZOUd6
	 5WESojHmEwq5gmYqnRtb/gsFeOyLsz5veMAgfDJkbrw640Vpwy+RMvmuAc3Jc5h/xBU4Y
	 GQqDxcZVUDx/pk1kHqIrQsQ+kQyewBr18shjLnCCimoIKfZxwtET350dLtF1w/VXIJ94O
	 bK9Is7hlZxxKxZEm2gByWhUwGC3WRZr/p0VZX/QA3gVFNgad725cbz0dSU0fSfVx+Rg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704098;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yRPjQxSD+KdlAbnAOiPXtA/uR4qUaVE5rgtAHz4kvlg=;
	b=gbYzknBZ/hAikygJbtAz2mw9PiAxn1kZ6NBrYOmAgUN56hXU6KZVSyPNHhp2mIrwwf5O
	 QrepwGcqBSBbcfFmjNKAOrKbqLda/3sSjiZzWIMFeerAPRNO4Y/mEoekqg3j1fn7VDhZ/
	 QZdaiPDt1LoQBnByzqSjdMb0Xv7Hi1nYcAemBb3ZPpPbgwXFTM8SRJ71ds4rb8v4K8QDF
	 G1KRfGJ0Igqp9ACnyWCbll8fzy/2J8dKcoZmGl/nyfO2Hz+aE6OWExUmmd+mIu/YbPnU0
	 gEx1V2fCySVXYicLMODZR+mjBBxHo+284CpJQZ/FP+fYuHtxj2tHqMpEEKMiSgjixTA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704098;
	bh=yRPjQxSD+KdlAbnAOiPXtA/uR4qUaVE5rgtAHz4kvlg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hAekRHyQeOU1y993iinMmAp/84U2hVhf7jmZoaNqkQCAJzYaVUHoRIteXyCeFdpZn
	 7RxmdzVXYA3W6IwxXjWnF9XCDrHt2Mx2//I6Bxl+3bLSCWYPCM5I+Mwc36DQ4gnurj
	 WrjYapEDBFLELS7Lc13uECtlPx5KTncGnNSuC+hcLFbyX3RPajnd8CBZQC8sOdqbxA
	 38ToYnKDX5EZBPQnOVimgo+wwD9adcSe8BUGI14kZy5AwgxE+xNH4105RdVrMVP970
	 3C3lkL00Mtsu7Gqphwi0qfU4SiVdOmfZRJGQ+69KmzndDhBKwR95A5KS3vvSLTDd5j
	 LSBzNhQQyjmzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA5D80D49;
	Thu, 22 Oct 2026 21:21:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 719013AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F06A8125F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdGVj202y8ij for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:21:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA3C681134
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704096;
 b=Wg8gwD7gHlnOscaD9sW4ZZkplQ8GEtY3FnXlOnwNu+TTvYVJIAZv7tv1GmpU/1aEUvZj
 ppuOZQLhyhBgT5vZvXttO0XotK9+9vze/zF1kSatuYZqGGx0rCGJaG+AhfEA9qOSnRibc
 HLuHzHfqcSvjvC2Vmj0N1oMANLym3E/u5I0bE56sgSa5QCEj3NuL6ctC2HNb/mEyVJ5WC
 qrevMbVsePytzsUu0gwxuWioBfHcDXQGCoc7uLkUBiEjMlH9z3tmbzDvWfQdG7KZxY4mV
 tt/YKfkZ8m9+6cxrPMlbunSKmMKdPXjZu2c64H/sT7DeT9n0OFM6sgOq+scIez1Du4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704096;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=P1CLaQtBiI4hyL8l4lI405rTaSAT6s8ZyBjJrSA4YNE=;
 b=cLGd9M3QNEYeI8M0+00qiLNseN+EN5c6RrrxzRuoS3P8k5UesJSc4y8jOX31Qeyj2ewF
 aVSUbUoj5wK9bzTFHQAGLlHXCnNfGUNLw2tPGt0H6/LkejCyDW7E5fX2Jp4GsL9vUS97T
 pZRPrToAvg6RHn+aJbcg9d4uSdSrwNQLbJ2zglRSNlCNJqPe2pKNaej0PvaVo40flO5iG
 CqXLtj8iYDE7YRdElE1+XOoV4rjDLQUKBi4EBd7dneoBpjTI7ImHNkPdcHgQWLUWZkkBI
 VsoeICjoKDYDZyLXhZ/nTjtmWcFcHtEPD1a1FnyU5BbQ5PlB/z47trGxrWsliDmZFxA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA3C681134
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:21:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 876559C27D; Thu, 22 Oct 2026 21:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:20:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57f11cc69fdb19841e2396af93cd64dc7fd4c74c
X-Git-Newrev: 1af96e786ef1d420bdb66c285a77d18df97db689
X-Patchwork-Hint: ignore
Message-Id: <20261022212012.876559C27D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.14.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1af96e786ef1d420bdb66c285a77d18df97db689
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.python.org/downloads/release/python-3149/
https://docs.python.org/release/3.14.9/whatsnew/changelog.html
https://discuss.python.org/t/python-3-15-1-3-14-9-and-3-13-17-are-out/109595

Fixes CVE 2026-12345.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ae4a00c319..20abfb573f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3148/
-sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
+# From https://www.python.org/downloads/release/python-3149/
+sha256  e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53  Python-3.14.9.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b86453f145..1916982dfe 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
