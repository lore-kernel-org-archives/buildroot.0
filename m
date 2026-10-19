Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB3B606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XS8768u+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F9C406A7;
	Mon, 19 Oct 2026 17:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PG2KTD2IovZ; Mon, 19 Oct 2026 17:32:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF14640699
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431159;
	b=j8qx2E0e4Rj3QpXfXBTB9gzombyPd9w60aRrgtOrt0yBiZUaeJtL5PQd/9lB2XYOCFI9
	 7jPeNB246f906qH22YR86HdRVt8pDS5b9WAJDj9qVdWplsPIMU7yaIfwUAh5TfK68BTRS
	 os9udWWZlaw9AjXAmqy3Txjzz9sV+HJFkK+mqS2u6lKv71R6Lrt/Zq0bsDtdCxB0TqSGe
	 gma94kKxk2VGtMFnO/JYYPUJSSRcXVXcLEEOPNTzC1kFn+mLGrRststZQEZfxpfOjlhf8
	 QlE4BM1kKOhsIbfY17hNkPtWCfR36gwxvMu61Qjsejrnt2j3GTf0KDnBSNdE9TBln7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FTktVUQOD2c2ayJNxT7fzz0xQDpieAfMDRd9fQexJnM=;
	b=AB8IBC9BIGO+/eCNO76r3HuR0xyedYSdz41hsOlwp4AWmkh0AVSMoV88Jkf77lqzttVK
	 qHajEzcZmjqbMaLAlsDQRuaXmz+aiAwEoKfzYXe1KUt4iEKevj5TSA5IK1+1VQu/8b/EY
	 Ki+YiZ3IQhe5WwS3HOdl6JWdrq7DJUEln7QXFZgyRuGTRf/yEL4TgXAD/VeSfPvtqa940
	 WdH9TNSWF88SZZr29PuGZNWhiIxIP9z+KmY8v7Nj8YVLuxOlxsL5zR3UYlWjddRUUHqui
	 w+MY7SMOtLavrMEZW4DEMCq4YcRLlvGfw0BbgLzhXbWAoNFNDLR2q4X4RQr49hErQTA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431159;
	bh=FTktVUQOD2c2ayJNxT7fzz0xQDpieAfMDRd9fQexJnM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XS8768u+4wrinI7KA7fyAj+k6aHes1/Z9cM1EJbF6ep+qQMdY9raJ9tfuYvnQS+fk
	 nWR2tlG2NoTt6oJsvvzDM+q5ieZSTsFZhg4QQHmwIvPjln9yzMZrgwXy7K74imJlwy
	 6fARV5/vYWHkUbje2yo0qYHTWkQ35aPhWQ8W/BTM2Qf02GFRvacbiNHtvoOCwAQ6xQ
	 Sb84PMRvjZeJyWRhNW+Re1sIOQG5fCU6KKcNCl7tYCt6WnrAYfzDDgPUZYRl3qpyH/
	 LikZNoOA5UspqK6vJtPbYSlE7QOVfq/E5aYmO2vb4tWFNQlfrl5FdFuQAtxws1J2MJ
	 NftLHPIbL59gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF14640699;
	Mon, 19 Oct 2026 17:32:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69A2F11CA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FC186071B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcvLxWpv1jdY for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A4D8E605D9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431155;
 b=SXslPw8iYkAYiUYkrtVPYHdi6qmHEYRnjAIw9SV4k+Z5o/MFSpVtKIAFqOnYz13oePQU
 GYWx+uCWqhjd01mXf/LTfbfMZDMRhvOM6fq8qRb/iKQSoFB0jDXbMwmP9p2sc73gfz4oX
 wrkOZNgkszTgn146GkXI325Xu0o8HnbV6fLtusvK6J/kdgjjpNra8Jdlj/mArDw1UUNhC
 zYAt8Wl/gKRTW5H+Gnquw9X4QEjRoC+vJ+HUsN/fXqxFUmeWAyCXMQzIP3DVgIvtpE7nl
 Ft5qCfxKTNx1MFSSPOlYZ/L9HkhsgY5qVnMC9zeoRJm3qZz14bEGPZwAvKz14/sgLaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qDLtFg+SJjlHWp496mmrqR/yGfoC1Reihow6xXWVgI4=;
 b=LfXr9IHYt9PEB5oC+O08hvosrZ9/H6Ap/kkokaqoelpYPY3DSwigdpemgP8vHjxNSA7k
 0mj+jenDZWNfN71WPy+kHbZRrRrS08M2f791HG4FzuATj8WFRFp1Gw1EeFKxZJvUs9Jbs
 DoqBsxV/8JP/ilQMxXmngDtyDPYyEQ1mg1SSHXJiyMhpKPXm3WstS++JUkm61921E7WxS
 ZPyT1Pk5LVtLUxdBtF50/EIS63MRzx7XmYjSCt7g9T/NgvOgEmkcpoUCHnkRNMJvA9KA3
 06hyrvM1RwbzaYN6ul/QGVGgjRADxYBKy/gvMCSjrzOPvjkXK1uK+qQK4DtevI0wuvg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4D8E605D9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED6E19879B; Mon, 19 Oct 2026 17:31:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:31:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 807096866b2c8902afea3e497dd99bdb43e0cb4f
X-Git-Newrev: 368c7c278497cd633f9b9232a204ee3f3677c8c1
X-Patchwork-Hint: ignore
Message-Id: <20261019173112.ED6E19879B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.148.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/368c7c278497cd633f9b9232a204ee3f3677c8c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 8c4142b76b..d45c91abee 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  1acee1cb23e9a402c5d8afc54cf5078a  fastapi-0.146.0.tar.gz
-sha256  e96047fc353ff43f7fda069c3578a7d94902a762d9aca2e065f7f801abd91a49  fastapi-0.146.0.tar.gz
+md5  252e224309e54dcf795e8ffee564823a  fastapi-0.148.0.tar.gz
+sha256  06ee16c50e429daf993a58ecbb5306d284c4c1ee8135380af39a5e1cfa715187  fastapi-0.148.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 6301b61742..4ef5141a5e 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.146.0
+PYTHON_FASTAPI_VERSION = 0.148.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cd/5b/f3b4277844c3ce66c16f62670cd2a26236489aa97115d04182171ce714a9
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/72/da/e962004c32f34fb630e8393456cadcd08d4300b6fa0099ec0ae5052b8418
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
