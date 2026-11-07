Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BBD606A32F
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=efNLqfsJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E8D811AA;
	Sat,  7 Nov 2026 10:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M92efF-vAFll; Sat,  7 Nov 2026 10:30:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DA7EB8121E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047406;
	b=UDXXPyAhUoAFJUjhxIv5jdxxOp95GrCEEKvrT+dXGuFfWX5xD9T31uiJz9DPQsTGsA60
	 ILFHlF/pqNG4tE6OgbJoWn86g2/wB8r6Mtpeppc9bJMlKK3CqhtPZA4+POilfXFOTSQpe
	 rj+tGHe6haHFbxI07XcZZMxtfyGfhh7aQ1yvWpgSlz0O2AzRLP7DwuFMQh5+mBLJoaCvc
	 WE1w6hzSVgh7qrzbrMJKPs82tUNdGVRiYAKu+ighVa66RTCnrpq7ZGcSPTr7xwrPZIvDz
	 NWRzDQP71ETLRdOZGIIDlR21zBpMIJE1TYRLXIfynSD2FUEalcvQ1K1DO6RPCIXLBOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047406;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2rFx6+dVP5Voo65zXZHhAYzBH9eqxMZQWdDZ+rpCOjA=;
	b=We4RucMyx0Ge8IFHrG6RZCTrzkSU1C4S6EUjqkLomxd5Eg9GDiy3Ad7ySqF+svnwjpLi
	 Tvl2Wlo4t7dd6OsJwf7zl649ILQmLNa7+NbQPHtM7NXFWChiHUOvqMDCc2k/XukSvk6vL
	 L2w56fxL3spJRXeGWCYgIzFYIz54S4eQ3c1Gy+u4E5N+KXJvZiYGh3zZCQJBrJA3cJqUJ
	 TR878aCFX1rEPFzrl/UASU7WiJW/ASkY60t7n6w2awBAj8PaaLqNFnxcZmE5JnRyZb7mN
	 zfw8Z7Po3yJoVVu9UXmnMo7N8+rhs8Nj3SpxfEjNsgYaNA+aI9byM+TD0Ku/GbRvgZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047406;
	bh=2rFx6+dVP5Voo65zXZHhAYzBH9eqxMZQWdDZ+rpCOjA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=efNLqfsJAS/rQ1U00Sp6R4e1Kw+N3XU9WrrTMARfyC7UPJhLSNa6fVF5sDDvbVXHv
	 k6btU/traN6kTJMcF6IZPAzSdTv5p4Frp7olHOBuWRIuPXcTJWOfaE+9fm9Mtmq9tD
	 gQ3UX2ZXRWkHkocEbDZhVAM+w+B06r4rdUhJoIqt0c9LEGYz6C9f2MphLtDZLih/ED
	 Z2r08H6i1bTbaHi0c++qolAXDd0NYDDwF6FvL2FI6Qh4YA0Lq3rLp+bwHK9j4qFCt0
	 CIFbolpunM39NwbM+EJkXHv8W8AdkaCD/qjEYkx/VPKurcKbbE/NVSB4HNSYQTf3ws
	 yfp/Lk7JRjppg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA7EB8121E;
	Sat,  7 Nov 2026 10:30:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95ED632A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C4084008C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Qp4l17rfoQR for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BD6B6400B3
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD6B6400B3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8488D886E0; Sat,  7 Nov 2026 10:28:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:14:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f0e8d3d5955a6e806984498a5cce9be46a9a0c5
X-Git-Newrev: ea4951bd704605eb99e87fd8e43a73aac0aec899
X-Patchwork-Hint: ignore
Message-Id: <20261107102827.8488D886E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-anyio: bump to version
 4.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea4951bd704605eb99e87fd8e43a73aac0aec899
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-anyio/Config.in         | 1 +
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
index e06dc8fc4f..b8b1fed07c 100644
--- a/package/python-anyio/Config.in
+++ b/package/python-anyio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ANYIO
 	bool "python-anyio"
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  High level compatibility layer for multiple asynchronous
 	  event loop implementations.
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 8bd80e86fb..5ea915a869 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  790c9bef76fdeac4c2e4e4ea757e14ab  anyio-4.13.0.tar.gz
-sha256  334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc  anyio-4.13.0.tar.gz
+md5  33e8d5621bda0e16ea54d26021272336  anyio-4.16.0.tar.gz
+sha256  59bb03251907983d1603d27c3087ddb1e93299ea2163adcdba37899a4fb12ffb  anyio-4.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 4cd435e265..5b09cc0c73 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.13.0
+PYTHON_ANYIO_VERSION = 4.16.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/a1/98/7e457a3b014976887a050561955c0b76e1e7e2d6e27b78ecef2ef80518f2
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
