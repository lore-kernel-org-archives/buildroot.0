Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785ED606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dlMTZrr/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA37B60A70;
	Sat, 24 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwHb7lrthTL9; Sat, 24 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 136DB60688
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792850766;
	b=FQIMamcBe1W6NJ1z4kjQENSYzLDqk3TmPjyB5MV8SdnfynsOYmUcyUHe/DZ3hmIDWhua
	 AVFmLy4M5oBzR/k92KO1atPjY5t6z2hnMRwz36zFUCntUfWESXqWM7Btvty6NGbrKYKvw
	 yeyUqWW+zXcLqPRpy3q07H57k3oetKi5wWO8WxnIa781oIy7CDVUOo5eg27+Tr10W688N
	 OSHRp4LmY2WtHml19YWt2o5zK1feJV6zoY9KAaQPXKUXZVUIAqwCcB7+FfsqcYuHGllwF
	 5Y8AFVKVsf8VPZWZR4CjlCohtHXuwpsqasaA16vX+ZGZnPNrRrS84/mIb3mF5xqu8/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792850766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j5e/X8RFwCdhJPa9xHdAmsrZXk6o9IiKp5rWojiWUBs=;
	b=kBLwAiCAzRPpNjzN/Iu5DMzti/869tjp+EMrmYqqhQPgR5Jg+bewdu6J54bvBFFQZrmr
	 FWXCSeY2fZWmXGMbxWNSQVPt+h2G69zvYEYw+7z5HjwXTxF/bxYXwEiFJ1ut9DyZH360a
	 xp7mhW6Ayaiky4whwlMQUhMA8Uz+fdvsk7V2rKse+V5fkuWnoq4LwCG75jkQcux0pAQUJ
	 YYLtxXDlFPO2Nm9Tafm6fmw3EpPSdvkNAtQ+Ghj+KwC9DUWyQt0AHwJ4xWy0R72wrtyFA
	 1sUdywjRWz8mAtSp0NBM5FqCWJv2oEV571FVFrpkUOPed9FWfRdsE2/JuyvV6QC42Jw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792850766;
	bh=j5e/X8RFwCdhJPa9xHdAmsrZXk6o9IiKp5rWojiWUBs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dlMTZrr/DmNhwvs7RFd7Hl9ncCjAGROEVx+ObILHQNVEnsJuOahCULXq0r37qJrxN
	 IIiWNjACDKvs3MEDql/+vpJJmFSw0VECHOfN2vhOivDJCikoBcvKP0kGhJJwMBGzNS
	 pI9tKgDPUKLM3YBHGPYQto+vSy+95eZfXoypZyi9mPxiVZQEq+rDjwXm9jrI0auYZJ
	 Z1p1hzWoaOcQlKSrTGf3AxCIoepuwms/+khZyAiNtmlR6zwTl/aym4IS5idZqymyge
	 omqHYkGkM1IQa2Lsmk7k9P+FKX/8/iRv3l56Um7hBalV8EwmdYJ/i5DrWpxq5s1MWf
	 S1ER0TVTCVbDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136DB60688;
	Sat, 24 Oct 2026 14:06:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93443D32
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79E314006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGxOTiQh6k61 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:06:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BDCDB40079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792850762;
 b=fOWZqm3AJ6DFkQ2wnDi72VgdLT/rbDOnZXyJCSzpKDeK7A1FaMVR5s66t7Wf+KwwvcnX
 2ZVZVJ1rW71rVT0NgFXzttcttcNC+6PEHl7msq9XvXxYIDEWZJeQmXPJSdsQ9Rjdlo5nN
 6DmfSJdWwPvLYBZGcbFUzNhoLcTsNELGvxFEViGWr4ouwRJIIk2iOcBToE0Lt3gvd9QFd
 sh36m6BZH+wQ5Cj6a56k/8CRCj5nivAEr8RrgqKy60goTFACrhQrnH+Qnq+INqaSdvVCl
 AzLSvGUlWIUJi77XvgGjGIPXzJJrgRnEi0KX9hsMNFXFSKspqVVnIOw1DFbfhKIBO3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792850762;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tJWVK6bFnuvRSTQu9W9SP6LaSir6Qan9lKrb2bYF4M0=;
 b=DRrhWslJCfSWW7c+/8a9B6QEf56hncWgiDPYTNfHoEqo8hDAK8SqBKcVBRicqjlBa7gA
 qx0IRd+wfCZdJScqdYkvsoM3fmn7rCM1PDjh+Xc1NKhTSAa2SxxbCFpQRQuXyhIIXp2Ql
 L7BqMUP5oo5uThbpN++xMD48l3ah1L4uTseKgumLSGht5Gd/4VrI1iqrXIgNMSvxtshhl
 Ir0YSIGuvkGf8XZeWerrL2Ty9Krrq2HCUjz6VLI6FEt3ro8L/QP7VTKD1QNbei8ZfVxpq
 5FMLdQ+WKJ885AQulRteSVCPg8KRovlHNJbDXKIv9YSbEOdsIR7JQSut8D/DaY2Qclw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDCDB40079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE1068D4B4; Sat, 24 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 15:51:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04eb6870f66f00152e23d22d12024dbf7d3230d8
X-Git-Newrev: 000b15018a7bf328ba8b94c77b574dd1c72df6a7
X-Patchwork-Hint: ignore
Message-Id: <20261024140437.AE1068D4B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpx2: bump to version
 2.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/000b15018a7bf328ba8b94c77b574dd1c72df6a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-httpx2/python-httpx2.hash | 4 ++--
 package/python-httpx2/python-httpx2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpx2/python-httpx2.hash b/package/python-httpx2/python-httpx2.hash
index 3c14598c5a..e347ce95ae 100644
--- a/package/python-httpx2/python-httpx2.hash
+++ b/package/python-httpx2/python-httpx2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx2/json
-md5  3efc94e9a67ec11572873e2f32d50cb7  httpx2-2.14.0.tar.gz
-sha256  47ad61a3c40282cd8d0dc96311531f00f5bfc71a066c6fe3b36d8f63fb9e4f6e  httpx2-2.14.0.tar.gz
+md5  47d96fcace1556149f50a07cd85a5eaf  httpx2-2.16.0.tar.gz
+sha256  0d54c98128e8f2ff7fbbde0fca8c359e5f032edeaaaac443cdb7f31f685bcd7f  httpx2-2.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7e7d6dbaf7fe160d39fd6e84fd02c33cab96bcbea34d36998d545bceb4a19c30  LICENSE.md
diff --git a/package/python-httpx2/python-httpx2.mk b/package/python-httpx2/python-httpx2.mk
index b75a36f26e..c35dd46516 100644
--- a/package/python-httpx2/python-httpx2.mk
+++ b/package/python-httpx2/python-httpx2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX2_VERSION = 2.14.0
+PYTHON_HTTPX2_VERSION = 2.16.0
 PYTHON_HTTPX2_SOURCE = httpx2-$(PYTHON_HTTPX2_VERSION).tar.gz
-PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/e8/67/58353f1848b4ba568e1ec22ea1e0d8e039f0bca5fde7e2d1f07739fd83e7
+PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/43/73/5ca2cedf5e4e50423d1c258877865a6b62793633b561c58499f8aeb33b7e
 PYTHON_HTTPX2_SETUP_TYPE = hatch
 PYTHON_HTTPX2_LICENSE = BSD-3-Clause
 PYTHON_HTTPX2_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
