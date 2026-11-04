Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2826606CA08
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k+kHK8ob
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 964F360878;
	Wed,  4 Nov 2026 22:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RW9qsYHiZqJR; Wed,  4 Nov 2026 22:20:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9172B60880
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830832;
	b=b/YE1cJQXs87s1qaZTXEZf3jDlfQQZPn8kZBnBV64lECcHx8wjPxm4aGhSY/yQkyazKI
	 wZx84DEz3VLPopatcXwP0q+zBBBdvHuRfn0sr+vf1KedcksdBEwXrgDMKB3fqAdKaZN5B
	 VnIvhuwAcu/VpR6QJWj8FPF6EeeM72lOFKNy7KYAlilRgKPCKo0mPs86/xWoZlMe5J9Yd
	 XUGrPUy2mQc3cN2eK2+CdJLDqom7SPhXbkD092dLI5r7xoMUIQOZtdrri07DN2imzAHtb
	 MUfpK/NnSu7TOt4zN+DTt4tbK0KqGkoXEr61WvwE/8kH2aiWoQPtk9Fax0TPNv+mi7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=o8F9OlPxIdpmO88KNVPD1RKTnUssThKMxyNYXeD6EOM=;
	b=Ckn+DrBTABphmP5ND43ZeSWumzCIHNbASkU/++BgtvPA0kkzZ9mpuHwtdn+pKxRv2IlZ
	 wARwpuieqZ2N8R3Z4SylvvQjpBgJFaBraQeeRgafj+wBBdXnnob3gz4DFiuQaVrDqw82V
	 LNcvJUdUEYFLJRHqtAK9rJi1Pmd4yy8dTaKaIzbrZDDQb0JN7PtgOLUkMt1pMZzuzmuM+
	 eAXveHUaJ3W1dfA9Jy7HRnH77ASZ8pIaUCTvS8rqlcR9fjCk6rt1K9BtU39RprcIq0VT6
	 b4B7pty/b/HvuCUb91clHJt5ZqNfyBuq4QiT78w4Mw3jbFxDBnAG+3OSDH+/2NeafJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830832;
	bh=o8F9OlPxIdpmO88KNVPD1RKTnUssThKMxyNYXeD6EOM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k+kHK8obiFlOdbR9I3z2bS0ZnYrXWuvhzvcWzhR41o9efCYXOH5y9dYk8+80lHeMy
	 oBvRBEaNw8ip/yMwsgg7euAZS6PMcUxJi8IDi0fq/P//+fpdsNXcgQqhpkD8UYBC9Z
	 HnS3AHbo82WNZIswXq8VublU7batu54upE/D6C1/M1l9jHEwg6ZmJVxLsPvJYsu+G9
	 Sh0/bw45r3QlJbLIg1ANGKCXrGjBXkRZiRFntgxL641UGxvsDyb/0oXLktd/YUsPGC
	 gkcqT6hSYNm3p7+Z08fciJkvIoB9BLfpzFAQpWOc9m+7DMuW0s8YvsmfiOlTFYn9As
	 OXyyvj9XmcF4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9172B60880;
	Wed,  4 Nov 2026 22:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 115B5177E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F6F4080E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzZD-eozPZe1 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 102804080D
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 102804080D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23AE49DF16; Wed,  4 Nov 2026 22:18:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:19:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d316ece99e6212861a216a07b0e86fe075add8c1
X-Git-Newrev: bd0e3871abfc355d72dcda742ac78575f8b22085
X-Patchwork-Hint: ignore
Message-Id: <20261104221853.23AE49DF16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: bump to
 version 1.4.1.post1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd0e3871abfc355d72dcda742ac78575f8b22085
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index f26b450a5f..4e11ff37d8 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  51f6e86e414e3c0130deaa8e29e04425  pytest_asyncio-1.4.1.tar.gz
-sha256  e8266eb094e5ee9ffdb2068c9836f33e209ea77a970eb846933d416b5602669b  pytest_asyncio-1.4.1.tar.gz
+md5  5004d13aaae9be1c548002985d75040b  pytest_asyncio-1.4.1.post1.tar.gz
+sha256  f582d9ea4a1c082195abe8bd29a1fe106aeb1cd435e3dad2d3bc2749935c36a2  pytest_asyncio-1.4.1.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 3dcd9cbcaf..b25411cd2a 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.1
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.1.post1
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/f8/9a/887535e477847f5159377ab35303923644840b13c0ca03c0a467f84d4680
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/73/7f/c60a4338420b33453d4f814ac0c930abd399f162b9bdd21af4b9e363037f
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
