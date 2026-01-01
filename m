Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65877EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3441081E88;
	Thu,  1 Jan 2026 09:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXWXL6y6fufX; Thu,  1 Jan 2026 09:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29F3881F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260589;
	bh=gRQL7WOibAfBjUmfUU9dnh130Q+rj5Poj2hQ5MmVEMQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SIxpcm+bOQ/QnccPHlLkPs8ahSIGT9GYMluUn26dUAKYV4zcTA/1HTjtjXpVcA1a8
	 im6nu533TG1+DnjZZlN1FmS566+yqu+owuRgPACA6wbjajhFX4hcn5sUCI9RHXLRcm
	 NoJ+U3iZlSGYubOfJgRuMgM03mapeL175sP/fOVn7+7bg2pwud0g7kE9GNBBjf+rMJ
	 gj3r6sHew/3cL/qxiEl0fjp2UpP8HEar8AX98ocDU97jNkziQBHe27qbQGnjfTMp2C
	 XorcKN5dDjbBGOD3+Iple+/IWRcv7kCxsYxhV5OG1DRLLdoBBDpis2aPCI0FkoqG0z
	 EOhIJSsR+Duvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F3881F1A;
	Thu,  1 Jan 2026 09:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF38351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A28D814DC
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psh2C7SEcxin for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1432814EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1432814EA
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF36786FB6; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 020b8a7a5567b622481b2de473f9ad8ab6092eff
X-Git-Newrev: e84ea38d1849cf7d2c9ece137e15fb1f4559a63e
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.CF36786FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: bump to
 version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e84ea38d1849cf7d2c9ece137e15fb1f4559a63e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index a9b33e0ebc..fbd141d76c 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  84f54204d53c46291c412bce27562480  pytest_asyncio-1.0.0.tar.gz
-sha256  d15463d13f4456e1ead2594520216b225a16f781e144f8fdf6c5bb4667c48b3f  pytest_asyncio-1.0.0.tar.gz
+md5  f9bf0eed023c7b6bb1d68ebea82d0398  pytest_asyncio-1.3.0.tar.gz
+sha256  d7f52f36d231b80ee124cd216ffb19369aa168fc10095013c6b014a34d3ee9e5  pytest_asyncio-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index f8d1e87e64..da0bbfeb81 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.0.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.3.0
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/d0/d4/14f53324cb1a6381bef29d698987625d80052bb33932d8e7cbf9b337b17c
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/90/2c/8af215c0f776415f3590cac4f9086ccefd6fd463befeae41cd4d3f193e5a
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
