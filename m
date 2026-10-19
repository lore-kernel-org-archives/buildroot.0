Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50319606A328
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F4cJ6zwx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4ABC60740;
	Mon, 19 Oct 2026 17:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmUEbv6lUlj3; Mon, 19 Oct 2026 17:32:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 644D560782
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431167;
	b=M/49/XFAfk/CbCgVRs6sPWA/wXa87ixoCKij4oTposwUMC/smfqGpxLxvXDC4f4/syIl
	 RtJmittiHa6oC1IDGiH0tXpr9Ltj/dN/kGPxiQdSeK/reXf9HkrzitxBg3ZUVUxtVeD1y
	 /MV9WGeKij3sWmV995SK/NrjqXfZGEBjwqS2EyD+H9Ho+JIzKunX6iJhCHyZ4k5qVp0jq
	 lSuX7YjoRJvVj6JaJRv4g4U/Vz+1qxpHGzSHB20ya1tr5F9L0R2NNXVKCgkaSe7sVC+5g
	 h5qM/cqjZ9w/9uDVuY+cggI63nGcointQVLB2Adilj16FfurPC2CUh4ljowMgOua2oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AzKyBkE4cRIWAeE5K0+r4XultVP39jxX3gBqEfZhU1I=;
	b=hqkJ6j2wySmPPkPyI7ZAvEoislerNzqivlpjRr8zmjvM0DOnLE3Lecp1Y6RjVJX3d+v2
	 qjShDTkPCt/FxWD8+BAh6ahHOGs3oXwWIweiGxxFgIK8Cu4eYcU7KVbVjvdKtAy3KL2fk
	 JCvEyZ0yTKX+q3/xlxaEHjgHl3B2rZvVCP6aBOVWc4EHNyrVx3y3BMmM0xwasPlGq/NF7
	 3wZfCVhY9FWOU84gc1gIJpkc57mjgj/A27rwd1XPjD/Kj7XYndIIISoRzcWbFWM0Y/qTW
	 U4d9r5LW+XRvgMcQVxdxVH2msLdqjatDaoXJ+/XyHSbiA6IT4e1/sqOsSSKT1H796ow==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431167;
	bh=AzKyBkE4cRIWAeE5K0+r4XultVP39jxX3gBqEfZhU1I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F4cJ6zwx6fo8g1j9qAfC0iHINj2tM1kfLFpCdqT0UKHSEIrE0oKB/pH+M40CgELxr
	 jDaR+Ujg0n9hB6maEsn8KDOADe2fflc6r6D+W28RZ7lN/NbubcOnko5JAmW5v7zY3q
	 CI0WgYQ4r5rFJ8yyi/IN+/o8yJPMmCOWPaVDqPAODy9PafsbN99b51bkCoPKT3pEmw
	 aOKQYSZGOirIQ6wqOXlh0vItfhpUMXxEWoYWHzRQcQEw5pca1cabK+n++IrDKtvOJl
	 Z5vFEsibTiCDJrtG25TC8RVw4DD1B+uzVYK6vg3I9s1OEZWNXoZeP8KU/Vj7Gm32k+
	 LgSR0xsW7E0PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 644D560782;
	Mon, 19 Oct 2026 17:32:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A27411AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FB31400B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSjOxSQr3RwT for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E2BE74008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431155;
 b=P+obZnL4jTXwcls6I9nmU1PA2SojTLapFW8A5IhJNp0QvlnyoLHKi3MYJy3zIhardJd7
 EnEAa/YDan/neIRysAy1Ti+6RZD5ttlUm4PZNGM0ygrDAc2ElWEM+DHDejsq6QbjhB2bb
 nN56JYLvWrZzdxxnfLZRznZF2ZONWa5LrP068fulhVqn18jto/hgfJeiCfsTSXiGmZHAc
 5vRKQcuyCkE+GWUaIC6GVG/fn97xHT25qPRNM8+HVQkib2MATc5arjRWlU8mTDsTzoHVD
 N+CZHdhQMF0JYp1YZ9ylg3BDg5NOpEw2nyB9SHcbjIncKsTcvTxploD8bRvo7+8mXBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=quWlOkTCBCVDW+vdKokNdN54HWVESxP57JY5I8zleLQ=;
 b=V36j/u659JgpDZZHcFHjkshwb1e5TYfBXhdsw2Vqpic0+6vOevCrl8QhKRHyti31af0w
 kO2grQTYFo+lTPde0cj5N8lryscsamUXrFAWojXp19jeSYVLcV2b6Ak0fYC7n6I5EGCh/
 DYI0bK3it7AkPeuBXUqco+2LtWLnA6vFJ2bGBqA7yUqi6l9SIBalk3bgPJzd/tfbwF9JH
 /zp0W2uEOfqG2jxBdyRugrRBD7v7bgek1nAWThH1MQ/VRDSi6sJ03AXJjnF6HhJtTC5w4
 kIhZFpZ7BHkVhlGW3Sz3Qdnbx9qZoLxVDh1t3wcmDu3pPqV2BFNquw/48G3CIN5Ukww==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2BE74008C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CC179879B; Mon, 19 Oct 2026 17:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:31:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83e29e2d24067fd67331650c25106defea108ea3
X-Git-Newrev: b0db8c26518d7489d1e09749a8dba8474da589e6
X-Patchwork-Hint: ignore
Message-Id: <20261019173113.2CC179879B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitarray: bump to version
 3.12.3
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b0db8c26518d7489d1e09749a8dba8474da589e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index 41d9c1389e..4a933c0225 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  29c4785c85eac1d397d49fb27c4b1cd2  bitarray-3.12.2.tar.gz
-sha256  940b64a0701cea18c0698ef23ec2d9a038e47103b0402b19cfb298d71817d27b  bitarray-3.12.2.tar.gz
+md5  2664d3d633071ae31cacef0d09e9fcc7  bitarray-3.12.3.tar.gz
+sha256  919e35a951c0a551631b94bf568f3f5e38d004e0c60866cb2ca51bd8c4778fec  bitarray-3.12.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 40dd9cb2ca..ce811a10cb 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.12.2
+PYTHON_BITARRAY_VERSION = 3.12.3
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/21/46/2e429b78a594006417d8a5f8971e027f3e6a2657c288d7875cf9bde64295
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/a9/cc/aa09a20048dd650d9a36bd70c26b2688413066d65acc9f484f94b9929108
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
