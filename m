Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93431606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sOZi60NA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FEE5812E1;
	Fri,  6 Nov 2026 21:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxuOkU14q4MR; Fri,  6 Nov 2026 21:14:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 82D7481250
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999667;
	b=iysFLtTayD11Y/9LEisMzLKllISdAFonRE+3mPyJJayEkjEfnvejmp4GNRxvs7KF7QQ8
	 AYL7On80prKalnoxQFn04qmVOZZHokmdceOTJ9es3LdmmMIbXASOfAIyMIfuxL6IReLg4
	 WuyPcLeeZ1uw7azb0S90OO2xlelKPqxoLrUIOh89DMTOn5UNKk9MIEl/6FlK0S/qmEaw9
	 0nabVKybtu1eyQj4yCQ4kGVRSOVRM1HV23GGYSpo5xgSzh/zes9l+w0zhK9FfB+Xvd6Z+
	 S6r0FnewWY38jCR8rCjxJE+b2i6ey2lgSD6RDOO2IfWfFl7Rl7kyQjpq1QbvTBjeDUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999667;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BY9wQeXE1oI/JXjbYAgItBVkG/EbThrygPwEcEdmhEs=;
	b=FepxTtXDSnIdOaxGc70skqyggKy4vpNrh9xF07fnTDvTyVoq/f/9A8yzWmUGdjDUj1MA
	 LCOpzI0pFCuw9WKs8026V2CdT1Ln7KGc9o4Xd5h7LVgmXQvF1KZ5TfPYJHWdc1iicm10p
	 xjepL5R/YeAVjB3dvzhodOXnFIDNuTad/XnXUPGKwNQ6cLa63UpLG9823+3oE9dXgcIqF
	 3dqj9PcBpk3O/Xwx7UtRhx0E2iPCX6trot2PzYr3otPT7YZrmSPIMhNgc8ZWAwvguLpuy
	 pA2jv9Unbu54PJzZjOIYJ0RfvzHjbxBo7a1iIwOWmAcQb8GuhGdRJTcPR9SG8trOiAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999667;
	bh=BY9wQeXE1oI/JXjbYAgItBVkG/EbThrygPwEcEdmhEs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sOZi60NAcR9XaRMwDeGxPDuqmiKgguAetNqH2/2bKZJpuWKjjWktGVqsGss1RzdEF
	 1uQoOKCZKaY5HG9WkKEuTr5w0CH6nDqsLYkpvOTx4b1G32u8EzC4OX9cA0N1IWIV58
	 JCsF/nksZdxkczhMvQKQaNZSNCKVyiaT7wGev+qebf0qSZ4fXDaMVALOC3thp3dvzF
	 RZcjm+5IS/VeyvypEjCNoYaV1HnLapRPhYvvK4v4T4jNcdQ43Pt/uryepkzfKVnEHu
	 239QqQ9Ph2hSCpi2oIf8Z3ilSEx1YOu496iWuRmGYe1EO9VYSufOAjiEw0Q7DaXil7
	 cnOSRv00cbPdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82D7481250;
	Fri,  6 Nov 2026 21:14:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 269304B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 245B940409
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcjfkPcpT1cj for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 28329400A2
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28329400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 425D89E103; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a17a8726cbec592c3b5e2fdf01fc9802fabe6b3
X-Git-Newrev: b79a7bfa3aa98a8d51bc24549c6f9a7504a7696f
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.425D89E103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.43.125
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b79a7bfa3aa98a8d51bc24549c6f9a7504a7696f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index bb6a31f622..d20aa95557 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  2a0f0c5b960417f5942dee41def3e83d  botocore-1.43.123.tar.gz
-sha256  80948cb9b1cdf1a1a25809089a42e3a1bc4af0258d198222db6e97dcc660dd0c  botocore-1.43.123.tar.gz
+md5  392d367ca819b236ef0a9b03d621234d  botocore-1.43.125.tar.gz
+sha256  e3ae5ebbfa8033015958a9cb16cef67a0592902ca8afb46ef06e8ae77475183f  botocore-1.43.125.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index de4d459434..eff60f9a6c 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.123
+PYTHON_BOTOCORE_VERSION = 1.43.125
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/e0/de/011fc2a47fb066c47064b122498d2fd21f55bc90ea514acbddc37ca0f8c1
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/ad/57/6d638614c940c73a750b8a4203989b3edbde5ff7f83cd9031e65cb97d69b
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
