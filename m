Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB40606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y/BPaUF+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B7860A55;
	Fri,  6 Nov 2026 21:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tK-HZRJckhPT; Fri,  6 Nov 2026 21:15:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F69760A71
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999714;
	b=kn5B4o6NL620PdKsj0bPKg+LaI+Qf3WWeSyRwGwuoLPUyny8qTnAVNcgBu5YkLMOprZe
	 ipIzgVrBNU6xnVouqq9V+8GQbUJU0zGVBJQM0QOK3O6XGblCvg0orywd4gFlMEleO1rH6
	 mzDRCel/cgDYeIN58yQ1aHu9ALOt+2ptoHnsQlR5qaFHZDlWNaV+dDTvOgrypB3ZuQjuB
	 G7VSGh3SHR9YaMUYz849EbqyqxsdMdi3n0yiegqSfpt6O/YXjGmIBqqhY55Xo8R/wrnU7
	 Vk1lBmVmh+lkjQB7p8y2kTKwQvIRcJ91f3nMqeaPRq6bFsX1rr2YoGRzvCvLvlmSWXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999714;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=G3+TohLtDDukAT4p+t6f1wnU0v7NuLpkGrbwrKxJiLI=;
	b=jLRxZuzyqesHuKM41/f0ZsLYi7lKl3ct6QmUhUnpXJ5bls61jaA1cfVSVdqVvnXsK9qY
	 JRQR9GVCXrsbXdkvW8epFrrcKN6cj3Isol+xhK54iQnWtcDw43wqKxE/osN0nY02r9Xfo
	 /h8K6TF87j7vUFS5VbNwElPI8+BRGoT71x9kX59FV6yMZJjOP9uBEGtj9pz74wriyj5Pc
	 bJTP+pE+NJDDb6lcguGef6TX+ywrvh+Qes1Ql5MBxWBm74NL/jk4EtPrLelbj0wEFejYE
	 prdOt+sHro5y8Em9l9SiadkGwmwK9EwDMXp00Dj5ToRNifzduaE9K5MAph9XhPk8f7g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999714;
	bh=G3+TohLtDDukAT4p+t6f1wnU0v7NuLpkGrbwrKxJiLI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y/BPaUF+hkNGPLX8puZVOrlqpidk3BQwfqGET68yq4NM83X0GmBacFBfbINrSBr6Y
	 70s2cq4MRhUTsHF8pWHKw0iF2hEpThhp+FkB0x3vPy/7Pxr4JGeEqU2wbblSOkI4Qe
	 ZK+cHGgrW8FldgskRKUO8DCpc/6Fo0YxXBGeAi9edHnEzwXyX9pVpznQcp0tKEooqc
	 qx4IY6MmgJ4Yzvsk1LNXQP+xm8bPuPrfi3A9pN17v2zeuMGmDOQ26cUAKTtdUgAwDg
	 y3tSuSCloIokqJoT1Mjj0+6ilGvumN0mxo2itYV5z85CwI6IJh4tqQIikOgopPja7o
	 VU+sQSI2Ic6vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F69760A71;
	Fri,  6 Nov 2026 21:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B98EAFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D61540401
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSIkxFuKa6Ec for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B0E2F40400
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0E2F40400
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD11F9E08A; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 364094d2456cdad77150cff9eb19e979c233b176
X-Git-Newrev: b91230282c2964a70c56a037167aa31b97f37bf1
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.CD11F9E08A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-watchdog: bump to version
 7.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b91230282c2964a70c56a037167aa31b97f37bf1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 8026ead945..e40ec46caf 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  f557f9f886650d23ee3e5ba12ad54ad9  watchdog-7.0.0.tar.gz
-sha256  128583e0ffa0e5c0531f9f37e2e24be1e7b0503561f6aa8b0aac5a1d646e2bf2  watchdog-7.0.0.tar.gz
+md5  e58c49ff618f1c9f93c760a8fad879be  watchdog-7.1.0.tar.gz
+sha256  d3861e255416f49a1384474cb2efa097de165fb330d4c5432ce6708b509ed922  watchdog-7.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8dfd87df299f156db7dd6387dd025f914568419b10db3e074d224e67d7621d2d  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 72d38e597f..7af9f36341 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 7.0.0
+PYTHON_WATCHDOG_VERSION = 7.1.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/92/68/6477c65315fd5b58ea5c7fbfe871c3ca6e5ec951be6c48c2f5fe8ee5e34d
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/e2/55/087e45c2a3ed8223bc9f30d6b65f051de35513cfc30c989c2b1a14bf862e
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
