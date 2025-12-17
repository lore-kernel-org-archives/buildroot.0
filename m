Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0093DD66BA6
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACEBF8107C;
	Wed, 17 Dec 2025 21:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoI8dXelTHGn; Wed, 17 Dec 2025 21:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 046C280E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766005269;
	bh=5uegSd7q1x4LYyDKmNleXNTe5mV7F3YjxqzLqiYKk5I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WaiOlhFLIymWoAGuTF5KQagU1uE4agBjLqQIMzNeauGaRFjDvNL7zk3zDF/Gz/GTb
	 f00+Wdh5NF8Ozxg0fch6+fnPhtTs22ayasE3N9rNvm0AxNmfFlWK6ysxMJvIprg7aT
	 KrSPhd5CRpYGR1iNXRwszTpEPUdqVHkMq2ZEEcQHB8eS0fjqhhdgBCwjwtV2qU3N9i
	 hoHqfP2uU87sFTdyStFFzJFB59ugolCjQVxL3s2Sh9iD8ICDiP73Idm1wlmBnJnuog
	 EtWWqo5FMo+6gcMiFd5vwRZQh9eWFALFXxEheKCVRaJTUsEXYu/qqXpPgdRKOWIWex
	 8NsLhx83lD2tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 046C280E76;
	Wed, 17 Dec 2025 21:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68FCB35B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F8A240535
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZZ4his9VQWs for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D7E2406CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D7E2406CE
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:01:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE59C83CD1; Wed, 17 Dec 2025 21:01:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 21:51:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ffd6166a639a63dd4f00eb735f8dffb78733bdc
X-Git-Newrev: e3f62fca6a9c1aeeb80d1bcd794da6ac99b79280
X-Patchwork-Hint: ignore
Message-Id: <20251217210105.EE59C83CD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to 0.124.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3f62fca6a9c1aeeb80d1bcd794da6ac99b79280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two more bugfix releases:

* https://github.com/fastapi/fastapi/releases/tag/0.124.3
* https://github.com/fastapi/fastapi/releases/tag/0.124.4

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index dc6549d670..14f14a411f 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  d82c1c5040c1d29b7e0cb4bce9ac0e51  fastapi-0.124.2.tar.gz
-sha256  72e188f01f360e2f59da51c8822cbe4bca210c35daaae6321b1b724109101c00  fastapi-0.124.2.tar.gz
+md5  8deab8ab1b623e1428e4753110295297  fastapi-0.124.4.tar.gz
+sha256  0e9422e8d6b797515f33f500309f6e1c98ee4e85563ba0f2debb282df6343763  fastapi-0.124.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 34aa3781b5..36954f8b0e 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.124.2
+PYTHON_FASTAPI_VERSION = 0.124.4
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/58/b7/4dbca3f9d847ba9876dcb7098c13a4c6c86ee8db148c923fab78e27748d3
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cd/21/ade3ff6745a82ea8ad88552b4139d27941549e4f19125879f848ac8f3c3d
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
