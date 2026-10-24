Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C04606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cqFJwyOG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 699EB816DF;
	Sat, 24 Oct 2026 10:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAlNAbxxc2RU; Sat, 24 Oct 2026 10:33:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9BF1D816A2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792837999;
	b=DepWPtDpOJ24143Yz9vj5hiI45ZoY46SoM4z+XqpBtWNijd0R6TXnblk/W9jlPRqV/VO
	 XNg3YuCyN1gDpznsjS4279gVk3fMyDpYo0Igb2Of6WTm5ZCZ6NGy1vQvVgwqomRAWKPuD
	 Sq1MsBASpl/9wVFYxB3FG2jZERmo0GYHy8RCGDshKCSPZWBkSDNLMu9nfp72pqqmBp9gs
	 3mOyNPSn3DHC4SI90HDs6EbUkXt1lq5dLwLLluggghdyTig7AcFqdQ4S4dtZnSLmzqqiC
	 FfyAQxwgpDHj33WWevUeVZosGCvAI7bOYF5rkczI9+Eoto33CPa8r8pbkaJlrnjrK2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792837999;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VTwvKUwAGl+5Hls4wAYnNaTboCPQDCLo6fWu0bL1bqk=;
	b=dNXT4ogs56CwWeYz9uEyrq4G+5NyGfyAaH46AGvBca08oZ68iCRe577F/S0LKmOTaqt2
	 1ouvAjGKo0xx35sx4jftqc+awsi9jWqGKZc7haxAOyiwUGlOhyPTbi5HkeFBbrCLgRjWE
	 QNTRatasISF7F0hvPWNuNS96EHeJOjBxupOgsTs/cBdSIq53+jraqDqcV0PRkpDsh4jFT
	 NeayQSiR25BKLRXd9EK1On64ErR9b2MlelGgk0VWnTepuSzYM/qubYlQZvElT69Q8Ir/D
	 mJyr7Q2RuXOu/sGX4DqEXLj4rLeSCEtqH5qPnq8v5FvKCgAUFhHyPB6lQydPnKDRyWg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792837999;
	bh=VTwvKUwAGl+5Hls4wAYnNaTboCPQDCLo6fWu0bL1bqk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cqFJwyOG8B03d6TGcQotGiKfT+GQ1SQqqluxiKJCyqtI5YRgBGzTx0S+rZTLkxqlQ
	 bcmZ5/G2HSqziEWQdra4x9t05ZODUW3Lm2msJTPFK+IOaU+Fa8SJ1lMBEjvUaZlo3M
	 3+ntWaeyXXWghIFpROVhtR7wlDezJwZvI0kvdb1i9zrHqfOeEQWUc8ebgDPrLF58Yi
	 vQVWWG8nWQHqUfPQf3Ay0drfbVCckHK72RozkN0d0xLPoegt6GsrxdPH8YSVYolSRp
	 +aw5Yy6P8BFEsjvEKrOUE86+uRRk1fgy9qdBWAm4UJy0MWEj/qGeZci8U1o7jIHJjE
	 TSpXkRSrmPTiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BF1D816A2;
	Sat, 24 Oct 2026 10:33:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F46543
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 211284009E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsRMosT2Vhqy for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2B8C440068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792837992;
 b=P7kRHPE3SkWnMy2naL/Dex4qqgnW8JhWCdwgxE1bQt5NpMQ2ALwKiInMs1f0c1EPfUPO
 WQdtntP0u1tQi3oc7xjynlSTzJQo6YUMgbwKKXuoGOfPYTfpkrUFuGvp/+r5DSut64yYf
 kdij6E2/sD/raxr9X6I66/Uj99FeB50ruZLR+ksKEDkzFzGT5sbQF5iiUTytSyh5Q+k1d
 lPT/kpdH72Lbx+3W/UhIEjeMUP+xG5/mJopMzx4Vp76lh+hojAuXWWJkzvvIbWty0mDUK
 oBc6XbXtPLERmAPJzeltvnFQHi2eyg+wC3ilFMvhR0t2dYR/8JJhKjByuHXHrdloMgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792837992;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vGHYjd15a7HyKgGJE1BiVtr2wSKX/loiZCDbcml7/JU=;
 b=k6MGRTnWGvK9Hz97o8U6oxY+kw60KgBPNMfTBJnNN9hMeEGj2nZPDMbjZV4Jxv6GVXPv
 8B0/cU/6JUe9fk1Mx3Gm/V2QqmSOm1p/NNbRvSCwsDFuCqeKSU+VtQ7/t2xAfxz+XszwD
 UHrZV5mCXb2cGWR6K5vfSDqIyFa9/GOCijevpQHTbRPhGR+SIbLsgqVMmhOQnQGgIT5+L
 iLvIj466TLuzM5se5wq16WbMEPcejlpby+YZP7qwjy7Sh3JCXEOolYs00jnYzsjrtEDMo
 4pciPA3QuhBnSRgH3XPHGpfWGj9XiWEw3l8Zi2AD78wkwLEaEwhgWqmRX0kKxnIEtXg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B8C440068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 272599BA07; Sat, 24 Oct 2026 10:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 11:54:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a853913b9150a89f90b08dba25222a62a12b61e
X-Git-Newrev: 8f3bc67d341603d6f53bb0b9fdd4bd914c6f2957
X-Patchwork-Hint: ignore
Message-Id: <20261024103147.272599BA07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycparser: bump to version
 3.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f3bc67d341603d6f53bb0b9fdd4bd914c6f2957
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pycparser/python-pycparser.hash | 4 ++--
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index 680a4e4581..4064d46534 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  57e8f58d1a6aaf5e7f829f5e3874258e  pycparser-3.11.tar.gz
-sha256  d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2f1c2935e97c2bc  pycparser-3.11.tar.gz
+md5  cc06f1510f0304ad53f6b1c70b847ea3  pycparser-3.12.tar.gz
+sha256  f03387877eab82ce01bbdfd0ba7252ee55a90b1c708d5129e2ce915475cf1db6  pycparser-3.12.tar.gz
 # Locally computed sha256 checksums
 sha256  0a9e78156ae8b96caf1b4f11ac2df424b83de29736f9e757630548a6272fdf90  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 973a063e8a..6eae6a65ed 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 3.11
+PYTHON_PYCPARSER_VERSION = 3.12
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/da/a8/c5fdbeee588bb8ada9458774f43adf1bdd30bd59157055142183e769a024
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/cb/27/eeb9f307bf07060f3d9f9aa0fb8c15b01bdfded0a941e4b2719c7f94cacd
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
