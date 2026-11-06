Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39469606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e7zEMoH5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71B5608B9;
	Fri,  6 Nov 2026 21:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8QR629NF0sk; Fri,  6 Nov 2026 21:14:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B63C5608E2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999671;
	b=Qyx70BDNVx4T4N0kbgF0kLwPeXQQWEfqnLl7zImLqTxNdKh0P403HUzGnKE+FTeIla6q
	 fHapnKK/7Zqq9PC1VVNEaSMVM74IXmLhchS5mZlQOuPO/cc60bRDm3vi+4uBVsdl4FkWE
	 tJxiUAXwKo8iub4iTKNTp3UXqIJunFoXUiO2tPh+BdVoZv1p9rGwlS+JEi9JGrmEoCYx5
	 kDIHvDkNu5Nx0pSV9aUUgT4iyURGk+5ZGB9WpDuAK3gJ1bAYSgjQEPBWpyyM2X359z/tZ
	 nnEp+CFYUfHsu8qtI7b8oCVHFW6+T6KXntg+/IHi6Dtdir3ct8OZLz0DnvU4FAf/fdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999671;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RnleCGO1LYZfaQhUrPMe0Nz3ybX497lncDKB61xlZ1U=;
	b=lKtZGBj4lQGjcvbA8iWClaSC774+Q3+I2kvVXEGyc6NTv6H1dZFECq0QUEfiH4imdwIY
	 5/+dLh/G5Onl69TIgN2JRMoXeCa91jxbQT8vQ5MYLc0Vmif/6N2i4mfAuSMJ7UQNKj7kO
	 MfHW5H7acGzaU6S7y77AsvAtdj3P0hy0slQ8varsb206j5IPnN0OzhFrgWFgjkR9fNtDv
	 KnzgAN6SvFJM6Bv5QQ5F1fg7TXIfk/POkFGp5H8zU7SmzyIwkqzssGjsz98mgmEu7gmzC
	 86iY+uYFEySlmxdMaO5oUzjF4dfKZ6O43Sbfl/23la80i1CuACZ3IX1X7JNxV21uZZQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999670;
	bh=RnleCGO1LYZfaQhUrPMe0Nz3ybX497lncDKB61xlZ1U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e7zEMoH5qd0ws83e5nbenwDNY84YHclcXkIgVSRVA2jaCpjvhsUhoMf6g4eThGELu
	 HwjIFO6w43B/Xa0Rnyk94DcBzMeh1gFUlxN6eLYhZp+Z6qpfjVnZVvLeoxzczkyMu7
	 qkMEsW9eCNxpw/poTDWZQzWsiXCjTtfjmstgujup30jFJ+f6CQkfzmBTWDLksgbN/V
	 j9vcnJtI7yPV80DLuWP28K/HghEXOpEZxAlWGyoxuWITLagCafKLI7kHzvt8Q4AoHq
	 dKnjVhuASLlQGfRyAvfcwiGloXeO1s2X7VtXyE4LO9Ma9oDUpjvBDNUFfNJOgqTURf
	 LkDgMkbNn2Iew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B63C5608E2;
	Fri,  6 Nov 2026 21:14:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F26731F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 259C64040A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0_u_7SKUIyT for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2AB2A403FE
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB2A403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36B119E101; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed54b75e06b7e622be594e9725fe2ff4a9c736cb
X-Git-Newrev: 4a17a8726cbec592c3b5e2fdf01fc9802fabe6b3
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.36B119E101@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a17a8726cbec592c3b5e2fdf01fc9802fabe6b3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 6c79ec9e4b..cb5ffa1f5e 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  7d86080792fe50286be0312f32c26305  boto3-1.43.123.tar.gz
-sha256  055fabb990c5d2f31fce4ca569255bd640cdd11a3ca68c9ecad35f4f8a5b83b5  boto3-1.43.123.tar.gz
+md5  194ff46fe8616fbf7d0c5e96baa75a0b  boto3-1.43.125.tar.gz
+sha256  5a635a0fbbd51f319e465b809cf043668705defbb9dddaf26ae66747f70b2a49  boto3-1.43.125.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index f4ff81d9e2..3bd4b8728c 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.123
+PYTHON_BOTO3_VERSION = 1.43.125
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/fc/8a/64b46f075149f9160da44aa7e1052dd18431b9ad4435beb0cfb02cc48624
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/f2/c2/9285c749ca49c213ad90aa239884d0c5cbbdc58f02c4c44bcc4a3bf59023
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
