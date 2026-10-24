Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147F1606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g6hYsIxt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD7AD81B35;
	Sat, 24 Oct 2026 15:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id No1Fhski8mJF; Sat, 24 Oct 2026 15:01:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A731F81A47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854086;
	b=ZYNxylEp4w/NV7LXYqh3sjy5j/k/+B9RtsD01/4WZBLH5gmq9sOKLSp8wxnIK2GJ0pVk
	 eeEjHgPCuf7NAYr+/ibFddf77n3Ef1MFRTM9QRMXgfGREuPtSQZBUummdwBg1YDIcxQUJ
	 LwHG/dvs39g8mUNJSEOP9R39VzYcvLBSttlyIGLplAuWlGjaP46T15pSx9w3h0Qf1VciM
	 jAzLmmUCjz9tnnVI0xf3IKz1cBbZazNgBj7ZcsCZdqVHz0lhS3SyHQ1ATQBcw2BR4jLG+
	 5rxz0mSYlxzg2JvMQBZgUe0gm9cf4TawJuv1IuQwzljLYnVJThqR/Lt4nt44ya5436A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854086;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dH2VmM8vC/jmNYR32yZ9Jj9UeI44pzJNIuKKsq10RRo=;
	b=VNJmHExGrABAYkGfZtyk4jKdbOFJ77YlkW0pKDIYwiRszPzrIkk19ZVqchnvefjnPZtK
	 Yraz3TCfZQYvX5WX9KvPVahPR8ew/nJewfFbQzUQ2jyr4p9+lJXGhWTow4N1f1thnsDXU
	 1jBknBBhh0HmRmZuuTEoJamdJ1kBJhej/mMRpu4Jr4iLJhqHm6OkRD8DQfCthpzh83xyX
	 aIa5tNo1HTbn2UBWb85txZ2XweiuCulzM/rGqUei0cLrQvXl6cRiaqi8DyRMzEVZkYJim
	 sU5Qsg69O0jzJN8xotV76M80oH5Fr3Zw2kmFGz6XcTKknyN2NN5O5CXb7VhnwgQcBFA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854086;
	bh=dH2VmM8vC/jmNYR32yZ9Jj9UeI44pzJNIuKKsq10RRo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g6hYsIxtYozRjUD1g0geqZ0HES7J+kZ6CmxEYaYE7HL14TLEXHKKcqeSYXqo4Wqt+
	 XU0sPSvNw9UBOD4eu0tRv3m1/rdQ7T2ZuORECW3BqybxocCyhAaX/kWOfVBMx06yZQ
	 lLwZ3Z43umrxjRgxydJUAZITmYpvPh3gHMKjjffoRge9YsCb26o6YGTYsAnq9PNPKb
	 JYvEZUrpHb1D3b/1sFd60rdPU/2Eo3tpg2l4vgYl1A4mqkg3Vxsb3sKBZAxECLo8sn
	 pQ8CZ5dH8IefEI3GGfjQ1gsCGNNvYTp0UP+fh5i0QRlVYTzriPqQx5VmBMhHJg0vTH
	 mheeekFs/bJSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A731F81A47;
	Sat, 24 Oct 2026 15:01:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 302093AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 213D340978
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HmHi7F5BmGI for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2560B40A29
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854054;
 b=ZmY6BBx1CxC8pwa3ntLgFxnO43xMDAPMHkPC6fxb6CdcSWwrjJffj9OXmQ5WBLDLqY6/
 XDUkXmbFCfpmVDA57UdhpabHeSxEKVN4/+RE4E1dhoOWuwLKHWmR1GZcNikdv/T221IQZ
 O23nHHJcLB2/h5j1bAwksbXchNtNYa8LL2xO5N2jqu20Ui9QS/RsE/9n5ymJf3DrXKed9
 IddtlJkSlL2gpKyMCPd3tHCxHmfqYIstj+gYCJEXehWvLWR2vsFCX730QqmW2p+lkN8yz
 hgeixeTqkFohmq000JDRQ4rDnlV+btmMQ+VOo6QnMmgYkaMjGqPiXDhdK5mec9e4y7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sHx1h3JwuAqlgXYTlPWUfI6DVryMlFk3sjowpmbst68=;
 b=YjjWOjX5oeLIWBn0zUisUCAjlQ0PeRfmm7Kl+Kr9JCbeFo2XjYUsjEvsNPasXBU5y3xE
 YCeDZnLZxBOE/TyOJOdemn4rFo2hT0u6NDBU+kEUl7p+XjUG7TtGKely+D2DCEbtZZpgj
 FclTRVDzRT/XlOqnScDxIbttIen/1Oz9TQPI7CMNkEtY97/9of0ZpYSeUiw4QhWzDtB+f
 DjGFiZJCGTtbBWSz2fHPkIjgwEkwIqUs1rFfNiHoAPo+ufNq/s8aCXT1MpabGhUtAzRYk
 +XNHgWgVaJ/CrgCVudctuleqsZzzniF9WrYniaeaUpQ44h1Y0XsHnRRO/BrvbcdENsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2560B40A29
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B32D9C7D5; Sat, 24 Oct 2026 14:59:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 760fd221a1b0d6e4607fb5d5518441f3fe41b80f
X-Git-Newrev: 2027954db7f5f42ed976ea2f4655e0cd224c7ee7
X-Patchwork-Hint: ignore
Message-Id: <20261024145929.2B32D9C7D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 84.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2027954db7f5f42ed976ea2f4655e0cd224c7ee7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index d0ed270e9c..16b4cf7bb6 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
-sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
+md5  251cbfc8f83414155e0e595cc4cffdd2  setuptools-84.2.1.tar.gz
+sha256  3ff8b3b5492a0aa66960f4419365a86b84e013070d4313e4d4a6894f5d64d6bc  setuptools-84.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..a74db0e592 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 80.9.0
+PYTHON_SETUPTOOLS_VERSION = 84.2.1
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/70/b3/c19426f783614d625699a4b247faf628ea9ab1db228674491767b417f9e1
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
