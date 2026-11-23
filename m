Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE5606A327
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LToUNQ7l
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680F9605F8;
	Mon, 23 Nov 2026 07:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gTCzLBgh9Vz; Mon, 23 Nov 2026 07:36:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8ED8060651
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795419414;
	b=WPtLwb+nQwHeVTKcB9QoZAU3k7GbQMKh4u4TuSmB1A4XiCEeCXO4idLzp/2vQqHYBujv
	 WqwPp+/7LTzD44AEfIcqH5fkV+4O4xAdnWpZgpipNFxsD18SQ8gTxSKwe4K+iRkzvAOVU
	 KYpFW/Ef+V65pWKYjKKSW71HIPxCf5LLIHKd1yYlz2/dHsImu1mtlCLjt70TqkPWbfeHB
	 ccG65XUfytUWZ7GKkrohSp/1kEZERamCFP58rXzmabq6rdG3QZhTdHss4oWDcjGNN74f3
	 5ljiNfFXh9P7jPmhIfth6QSJWY21UEaVho/sM9Zc8ZOI1gQRq3nq5w4N6LMICu8nriA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795419414;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HHE19P4SSjwrqCXA42S2WhljPVAifwRlbdziew1s0i4=;
	b=pnsOZjzgnh5aAGwbT2310dZWkUiGhqtroUAR+VFCu5ecWs1Vb3wqC/eFc0C8Qm1kuQHV
	 KM6CaILU+Lw9BeJJa3bnEtDXCA8BqOAofxiYblYSyI+XYg2qzQLrVSCU9POFTez+7783n
	 SB3De7tPTQTQAZz0d3N0Ry59xYkrnSxg+eyhKxgTb0uXgW8lXzdo4S3NV1WV3yJGa79OU
	 71d/l+Yvy4h+ae6CN7TCjGGCAbO7R/1oc0HlVC//TWfZQn90+ZV8di/oCtA12cXbuZLwU
	 A9R7j9YBX8Lh12jnFpudTwBLwlRRIzrpFbZ6qBFneMAOT9SblOtzdi2CqnU/mrZtq7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795419414;
	bh=HHE19P4SSjwrqCXA42S2WhljPVAifwRlbdziew1s0i4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LToUNQ7lJ+3GMDDDIKoSYGOtpge/I0uavZTYbZ7svvnf+PsqRpwEpC3mUdNgA28ou
	 1AOTA0ISZ0N+csxkSPoG+1cH/SAMhJaLM+jQ6hpUEoV3mMRa4eJy995W8M+FtiGnCN
	 DLPG7oLOdntO0KJeOwlji64hRCFGOlBqtYAraLzJ+R5vJCPA5lXbCfKeP4NIblW7hC
	 826k/u3gvlTJSkxEGlaXeV2XhQKOHW7UPZMXbOjc2yeYaahCn1RkFH93ef+I+iTUlu
	 ubZ1kENyW6kRUgtqlQVmjxDIxLRr7mzRUJAaNMizK9yAlSiFXWoZKKnoOW77VLNn30
	 aXWOa7PAzbLew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ED8060651;
	Mon, 23 Nov 2026 07:36:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C164622B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7737400FF
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7oedI9IXYKw for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 07:36:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 73A89400AB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73A89400AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 07:36:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so21745415e9.3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 23:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795419408; x=1796024208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wXae5I1vM1oZ5dotQXV4drNh3rZA9jrStG/aiLYV6Wk=;
 b=YEUiXN+m+md0kl0uURgJw3xpLfm80bkkeiGohM/oD6Ri7R3URrg71HysNCUJHUW9Vk
 SsPaDaNqYFErjUWLrRLKc9FVjIQe8iBHRZoLTZ68UR2qY5yeA9TQDAShUWNbTMUkpdb8
 BTPqHLKVtABQ9Ga8y4/CZTEhaV+p3e7ECoId540Zu5q0jCr6c/IIoL+p9qXpniz19rYW
 U9Xd7JmJOyxRizLnytfubQBTXDSwliy83TiktDlHNJO+QFc7adssD2x3oMQFJuMvDkoj
 MA0Vk0mcGIKaRvEvD6wJezIzh2OS8izUFhJVPGiRrlf4NLY4cAl8gX2srsnflmDwraL/
 VZoQ==
X-Gm-Message-State: APuU4Z+GGn74jzT7qJ8A3epsNMhV1WYGaE+aCZlI2OuwNjrin/5qnOJM
 JzljSw60Jm/+GyOGjhvhoqDUGg/ShlxK2aG/dmYm2XzDCav/20gJW0osItqpxk2HXp324+oWlQ4
 VnEP1
X-Gm-Gg: AZFdTZcHd21vddLLaQ/3dDC1bFSIG7c7gna+YHlXWo+5XTVTO/LhAi+G7HpZkStObid
 NT6dO0W991IFlyboi+EYfW3NJGZk8ykwT4PQniX6wcQqwqQLfQfcof9BUcppQalMESfrPCH+3Z3
 q7X0y/f8qc9zhwr0Givx15Aj3HDVcoQUeWUnsa6NDOpqWbmkokqbWeTTDy21CL8UYludblW9myE
 j1CjskPeyS6YbbrKVRJ/v7EX60mpaPH7vhcipRVnD90wYWopLgMarJHx+NLBxWU6O9tVPUzfQgo
 xhWyt7mgoYCqFcuh84j6b/YyVXWcq+7nXuXIsMLH2jzhY3ixks8lnzK+frV7k5X6E0uUjRB3J59
 daWs1CDNZfq1npSqIVElInjWTrmtXRwMYaPwRy9whuk+g59fgqb+o6nutuoOKpRLNl6RXV+ZVUK
 RW4VAGrQgRLgcfngw27HWcuJAZ0bV89u8ZxD1mBvMh7nTx3i9jLFUlaRrNZwRtEBIrzHADdZM32
 Mejrw8cq4ZLnwlkybpRr8ifqdTO0HKCPDW2BGgsnAcxCuLVpWrTy01B3+DEdGc2EQZA1AZag0lX
 4EB4rhe98D7XOpQHwNMpCg==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:68f1:5bc0 with SMTP id
 5b1f17b1804b1-4bb88920967mr219516065e9.33.1795419408591; 
 Sun, 22 Nov 2026 23:36:48 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853c9170sm388076445e9.14.2026.11.22.23.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 23:36:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 08:36:47 +0100
Message-ID: <20261123073647.156440-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/ruby: security bump to v3.4.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For more information about the releases, see:

- https://www.ruby-lang.org/en/news/2026/11/18/ruby-3-4-13-released/
- https://github.com/ruby/ruby/releases/tag/v3_4_13
- https://www.ruby-lang.org/en/news/2026/11/18/multiple-vulnerabilities-in-regexp-and-string/
- https://www.ruby-lang.org/en/news/2026/10/23/ruby-3-4-12-released/
- https://github.com/ruby/ruby/releases/tag/v3_4_12
- https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-cves/
- https://www.ruby-lang.org/en/news/2026/09/23/ruby-3-4-11-released/
- https://github.com/ruby/ruby/releases/tag/v3_4_11

This fixes the following vulnerabilities:

- CVE-2026-89078: Double Free issue in Regular Expression Parser
  https://www.cve.org/CVERecord?id=CVE-2026-89078

- CVE-2026-93577: Integer Overflow issue in Regular Expression Compiler
  https://www.cve.org/CVERecord?id=CVE-2026-93577

- CVE-2026-97229: Integer Overflow issue in CI/CD Regular Expression
  Compiler
  https://www.cve.org/CVERecord?id=CVE-2026-97229

- CVE-2026-110264: Integer Overflow issue in Regular Expression Compiler
  https://www.cve.org/CVERecord?id=CVE-2026-110264

- GHSA-34m4-m9fh-gqp5: Heap buffer overflow in case conversion of
  strings
  https://github.com/ruby/ruby/security/advisories/GHSA-34m4-m9fh-gqp5

- GHSA-7x2q-68qv-6p8x: Double free in regular expression compilation
  https://github.com/ruby/ruby/security/advisories/GHSA-7x2q-68qv-6p8x

- GHSA-87fm-7w84-j2px: Integer overflow in case conversion of strings
  https://github.com/ruby/ruby/security/advisories/GHSA-87fm-7w84-j2px

- GHSA-wpqw-5qxg-m68r: Out-of-bounds read in case-insensitive regular
  expression matching
  https://github.com/ruby/ruby/security/advisories/GHSA-wpqw-5qxg-m68r

- GHSA-3p8q-wmhx-vm2w: Heap buffer overflow in regular expression
  compilation
  https://github.com/ruby/ruby/security/advisories/GHSA-3p8q-wmhx-vm2w

- GHSA-7whj-cfh7-xgm4: Heap buffer overflow in Regexp#to_s
  https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4

- GHSA-pvgc-g7gj-pv6h: Out-of-bounds read in case-insensitive
  backreference matching
  https://github.com/ruby/ruby/security/advisories/GHSA-pvgc-g7gj-pv6h

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index dd97a6d867..8f0428a0fe 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2026/06/30/ruby-3-4-10-released/
-sha512  c28d59946c0a1b8e4385a772e0651c6f4154c18ab8a2a62289c3213eb4fe937cec0942e0076cda429576e58ad277b18f4b5611e644d15b122c1cd96baf10f284  ruby-3.4.10.tar.xz
+# https://www.ruby-lang.org/en/news/2026/11/18/ruby-3-4-13-released/
+sha512  6a2df57f072ea341ce219d2d2c6a719dda976ad53d51f1c344d623bd64a4449642b49a9c81311daf367c19d42a11e2d92ac8bb343ff8bf0697247cc09b4b6eae  ruby-3.4.13.tar.xz
 
 # License files, Locally calculated
 sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index ebe3004c6a..117f86ea84 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).13
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
