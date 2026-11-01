Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41E0606A327
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eqIZEI+J
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB56780C97;
	Sun,  1 Nov 2026 17:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDLh-12GRYEn; Sun,  1 Nov 2026 17:07:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F189E80D5B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552868;
	b=mzyAWOWrWXdkIRazhcvItl8SKVYyxJlhNSwtGGJVTe5tGKtH6rnPxC/73mfRvDIycZE+
	 6I5XqRe/7vrvIFMtLaZDFr7TCUpmugR40JhPNOxTbUoBIqvcU/ueVtyW64ie7kf4fhKkI
	 3mjLSE/Xu/nReNEj3FpKPyFajqntx/oh2kANRjnYU8MeLTp/heLu/KijNePZpNPW30RVi
	 i/MCtujNOUqoEQBtxuIUQQ7EBzjoePzj/i+4IAQT+Mi4s7JtxbCA2uexOcQCUa35ldqHD
	 HCgSRdstRD2EsgIztLsiYeKTw0prcEEBef/Ypjc3GEeKdya4jTP0Zw50O0pq/nPIzFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FpZsJFPvG6vF5ULSdtKJfJ+aCSfBqysZ4HD0hbaIV2I=;
	b=Rdfx6do1Ypbw8rGv3CmSajh8TJjGlfVc+fDbSHyrx9s9/zGPMtO/bsS2aDtRgGnwrNcO
	 7lmV0yzVX4ZtAQz1QrcrqpwFgjkxM3oq7STkLHCYbnYO09wEeui0S6JjUyRlfE3o6f8Bz
	 dVJlBZdSO5Bs1AllNAR7qkSrlz4RROoHCJTknsJH2y3zLlCd/IGGixnZAd9eqUUmHh/Rd
	 gIbdFVF7EYy5MUp7bTQqWM2I6hjuU7gC+3RpiWE4O38BMhgMIeCBC15R1rBuzuNFefec+
	 0XITCh3GK7UtrkN722xEi+VIKrH4A3qCRtfmbC0Tq24CWM1OR8yrRbwer4CGf6S8rhw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552868;
	bh=FpZsJFPvG6vF5ULSdtKJfJ+aCSfBqysZ4HD0hbaIV2I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eqIZEI+JCyHGzoADrVcbDWRMJTFlQB2rJMQTHR4L8seV20lRldZJ/OsrvzFQNR6um
	 Xe3VGuDwlHu1uJ9lNMgynd4WIgeOV6sSVY3oEKsXFrS0n4VVw0jnUBxOGprUrmb3p0
	 immbxDWNmXZz2gwlTc6r5Z1M13ifUigflr9wvUIeRBBxKHS3G89a4lR+BItHYO7XWe
	 ifxF9FbXFV1eMjNqbqBM1SJie21vQzKCEgTYuhtXdb9W5RcCQwmLvfhB19Jouz0JwY
	 1FBkCKbunC0CaCEjLBBTDFdww8l0tkEoz5EsmCmAPwlIxuNezfRgJcdlty85TgNNbL
	 G8HJnbgaAQl4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F189E80D5B;
	Sun,  1 Nov 2026 17:07:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE79C2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFF1180DC9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tRIW2qTfBYZ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E8B4280C97
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552838;
 b=BUAGWkZC4025VdE4eymL3hY+PDzjfKmH3x2XQ4c97PoZmeYKyP9t2bOjoKvQObtV7TBm
 mZvHYjRg+Dgvx2BfCAQPVQWauesN76Mrd50yL2Ubluzqxp8LzV9wYQ/w7qpSqxlVUC5SZ
 LiDj0AibjSQM2UPUmrHN3rHuuRQyn11GymlhuxyQsm0jxZOe3mvxLB3vryYctWGeDZglI
 etquTJrL05xkQ0YmghUzLQgMAsLmybGZJNgugsErSKXj7n89zAlZl2/jPCfiHIJiLDx2Z
 Ghqe+I+tcBmJ6qkFm/cgEatzYWr/p+DRZ/egakVLkmOzns7vWEgT+DFExnLHoe8t/8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552838;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=81+BjfV68TbKNLYnoE+qxaPLtKq1N8jSLi0bXH3g9+4=;
 b=VAw2NwwG5/GKss7QRr5EGnLiAHGwMaujAoqx+dBto4eopkmjYqSFwWhuDIu2FHq5WvdP
 uMbxCtPmccS79ijITBCNvfZIji2SUDNvpzmGm0Gwr03XyjJTgAb713hgY+BaQBiH6kUKz
 hdYwSkfK9t6BrEPuXX89TkTsV481ue2rgxcSjLsYA5oqKnk45Qc4xEOcKa2O0me5+0epD
 rIXxLfLdsgCP1AET8vPh1VRISr6yXQmV7zSFvdotpq16tgFGpL2h59pnJA8qP8xFduGky
 foAArvpHMkqsJ8oP5nH9exGnQKiWtNMxNWgoK7mkQSWFsW3DviBWO0XDGCSKLmjZ2CQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8B4280C97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9F519D4FA; Sun,  1 Nov 2026 17:05:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9b2f15d406b4c78a266e7f9be7014c3c397995b
X-Git-Newrev: a54c1574e4e0e3106df11f7a78bf9c4b7f303e39
X-Patchwork-Hint: ignore
Message-Id: <20261101170549.A9F519D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: bump to
 version 1.4.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a54c1574e4e0e3106df11f7a78bf9c4b7f303e39
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index 3df3a36190..f26b450a5f 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  2495e68fa8e724cb6c69460d35a8f177  pytest_asyncio-1.4.0.tar.gz
-sha256  c6c0d2259945122819f171a32ecea2c349ead889ee28176caaf492143424be42  pytest_asyncio-1.4.0.tar.gz
+md5  51f6e86e414e3c0130deaa8e29e04425  pytest_asyncio-1.4.1.tar.gz
+sha256  e8266eb094e5ee9ffdb2068c9836f33e209ea77a970eb846933d416b5602669b  pytest_asyncio-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 54f719f21a..3dcd9cbcaf 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.1
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/43/7c/d36d04db312ecf4298932ef77e6e4a9e8ad017906e24e34f0b0c361a2473
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/f8/9a/887535e477847f5159377ab35303923644840b13c0ca03c0a467f84d4680
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
