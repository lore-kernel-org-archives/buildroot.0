Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A595BCA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55DE680D99;
	Sun,  4 Oct 2026 15:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSaPO8mYr9kz; Sun,  4 Oct 2026 15:59:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3119B80D9D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129585;
	b=qOgdq7uh5bcSe9DVXUPcYRmh1HUr+PgAN0Ic2zkDLrw0LlJc0YbvXxaOokF1BLNOYHMK
	 frK48R4g6u1N1+/N4ZxGmaczhPxgDfsKatDoHtf0F2fxVGseSUFmdxkjz4IPi91TmniJz
	 0T+Uk1UYh1pAdku6Uov+VzFc5+9ORyT2L6oZxCXU14K0QTVX8urQhiZC1/R4XEb+2GgfZ
	 qfw+u8oq95d63yfEL1cyxQvT+j6lM4ymohKPUjyfRHPz5m4dkx37D2z+az9Pg13c4NKxH
	 ZdPeDQZixUx9OfwXbfwdiq2qOS1zcb6AgekBKAJ8B+VgCmmgXFx8WbxtA1FNEwbwiCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/KXldU+inLj70g29Tuk/hWdGVespc7cO/5BhZdwpdNs=;
	b=dXCRLjY1WBQlHJbxQjAaYGLaCZR/ZQvTPFAgBzpBtNnzQI4i69AHJtjslbIYIliL9K2C
	 ndXn1FxC+QmStn8r/oT/5cxZtRmdn3/31aRomoPj0bewu4Pj+aaG/la0/C5JYJkbYgyNJ
	 k9uwyRbw4hqkQmcXyLlceUeU43cRLV1+K0yNLLw7buvC6xGhjAcGPBT9xM3Yd6e3AZuRB
	 DRUoE5GRNe/FLfYS1+1u807A/wCsC/NoY7NLhUFDj9zBFUrahfEDcOHrmks2zC6ipc/rR
	 u+XsFuwhYGGP8o1kWGXd8nL5f1TQv/ltH19U3+6zEp+UPzDR+vH7snITCyOdOAwLSGg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129585;
	bh=/KXldU+inLj70g29Tuk/hWdGVespc7cO/5BhZdwpdNs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tEy6CnA/KvW3PYJZcPRJNUbDUQxsBkaPXoAZb0Y8VuwSK/MP99Sg+3t5zZisx+8M7
	 cMasFkc8o3mBJTqn9bv0mdz88KVJpHoS1mRN7iuw5zXVV7xmovebXh4qfCvvLLjjZr
	 h6j2Brg6SBDp6kybsBix2iJv3m9t1BPSzc1EwLQHX8AdYRK64Crrk2OkIs4B2HUr2q
	 R55XBKYkKnlA3NAmTMTBbsYDGp+hEZmmAV7gPefyd/ClBKCCnhUmANYX4GfrtZ47A9
	 ImyMfBJYiI+pVF8dw7en05Xi8DduK4NsRdE5gUxSYrBzJvQbEg7rQaO1T4MyooO43r
	 5jOG8K4649ZwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3119B80D9D;
	Sun,  4 Oct 2026 15:59:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB04435
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53C7A405A1
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XUBA79Y0CZV for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 901B4405A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=fqlkjYYVOrEQ3G0zIP+SrkoWDPWU5tSER8iTMuP08Kfv7EM+FK/N6eHRzg55kW1Zzg+a
 H9V5ompsfN83qNnk55/SdwbOMZn8oochTnM0BP89JgnEJiSTmYMOGH8AiERN1Axd8QsiQ
 FdwqOktwNXz7XK1MtZ+fDi0Y7JzoiGily6z6vX64EI44n62HZ2Zx2fuuXlOzurQek0bW2
 e12JKHvNfhg3EBy2yzDmobR+GZUnC/b6wsFcO6raV4K6SwmwJ0frey99GOyEGpaCvGq6m
 vkVMUMkPRaMt9TT1YmWPE7eogk7ONLIu+9yS89OdJ3SvCJRzrnmQj4IXbaWbL4QLmHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5wPYmbZgf6iShJ6EO0KRBTdN/OKcHowuu98BzOkXs+s=;
 b=M4RsSjfAueo3P9Yo8SUYHBO5f3kH6V+lUG3A+onQ8DcphKOIow6v4uFVwQ+JOnh2OP9f
 0hZNvSBsyiOJmnsubolDDQUmei5CYWaTYP4eJVB1jTYWC1ejMmW1zQvNtlwEIGjd8e85X
 y3Jz7bzPA7ctLWfR9ITqQgbVwmmcaR3pN6piOLWYt5Id5vPcrmsVi/1xz7/9uMB7ly/KO
 FwpogDlnu+ltp2tZApygZuI69nEtka/7M92eq8+QtSn7ZC3UaMK8Clo10tpDXJe982vqh
 /R1WrHa+HdrM8dms7bRbmH8MTcve5DoE3JRWTq6/DvLBmzH3EcNHgo0MCiqelHeWGFg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 901B4405A4
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 486118B562; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28fe8d91032aae1d5f12486eecc200580d076201
X-Git-Newrev: aaeac510a107ac67ccf182e4830acf6e5a019407
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.486118B562@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: bump to version
 4.66.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aaeac510a107ac67ccf182e4830acf6e5a019407
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 57e03d1f08..388546308e 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  c9a3637bc4d32de7254a1cce3212eff2  fonttools-4.66.0.tar.gz
-sha256  ef0610dfe7bb5bf574d9bdad6f597403ebc9807d124ac6f148d7604b2609be98  fonttools-4.66.0.tar.gz
+md5  2a762cb1eff7c310f0be506618a23e40  fonttools-4.66.1.tar.gz
+sha256  64967c6ddb0d4c610dfd8cb1485981b2d27972ddfb7d4bbbd9e199d2a089c450  fonttools-4.66.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 16979468ae..028861f4ec 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.66.0
+PYTHON_FONTTOOLS_VERSION = 4.66.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/a2/24/86f9930b930b97fc82266083320f3c34643ef67261c32651e893db525aca
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/87/b6/126c659ab7e0e03e01a5f5d223abf7b2c0691ae92718085a212a3924a2a3
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
