Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914F4D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BCC40886;
	Wed,  7 Jan 2026 17:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVCyhw8cGRX3; Wed,  7 Jan 2026 17:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F014089D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808024;
	bh=3n9GotvUmsVjLhPhT0vnnbH37bnPWOTkxVhDUjCzRj4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zere6zv/lzsAkTPfEn5KlihoP2HAfO7tTSACGe21xDhIZjg1JJEPPHSfb2oC0Uf4Y
	 1EMHzyEk1JJxmmSDZSEjTZzPE9jdJ+6xFUuMrEa/ApNKlsTSQnHbgRo/1zNlUu3yJS
	 zTGANuusYpGo+6mtthU3ofbnmwr/bTme8p66ELW35N0mNcjtBWyVMfE5WgCkPvnOrY
	 vfVFcFEfJ9sSqjgkVRBfq+lPzLvZkLtJz5x4v0Dqn/sfRvSBNkxZ0hVrMde9TiSL80
	 KxLXOJ+xQZczkCfZPON1fI6tLxUe8e4CA9uVaXNoDSvzlWaH+3cx0nlDagFMUZkOir
	 gUpkORRH8aWCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65F014089D;
	Wed,  7 Jan 2026 17:47:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 156CCA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 565B660A80
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldmAuCINkWBG for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5C4607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A5C4607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 258CC88354; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:45:13 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e81d65de87f710d711fb204e2af4ac07d26feb20
X-Git-Newrev: 9f252cfc66a5f423fb31e810690c460b360a12c6
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.258CC88354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-urllib3:
 bump to version 2.6.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9f252cfc66a5f423fb31e810690c460b360a12c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes a regression in the 2.6.x series:

- Fixed HTTPResponse.read_chunked() to properly handle leftover data in the
  decoder's buffer when reading compressed chunked responses

https://github.com/urllib3/urllib3/releases/tag/2.6.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 974b5ce907e4b14571e528afccd00e55dc21ac3e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 9376221040..76fe4e5fc9 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  52150787074f43057a0e691c7ebe00d8  urllib3-2.6.1.tar.gz
-sha256  5379eb6e1aba4088bae84f8242960017ec8d8e3decf30480b3a1abdaa9671a3f  urllib3-2.6.1.tar.gz
+md5  838e0ffee00ec870a3ba6727a7832ab8  urllib3-2.6.2.tar.gz
+sha256  016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797  urllib3-2.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 5b68dea6bc..d57473566b 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.6.1
+PYTHON_URLLIB3_VERSION = 2.6.2
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/5e/1d/0f3a93cca1ac5e8287842ed4eebbd0f7a991315089b1a0b01c7788aa7b63
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/1e/24/a2a2ed9addd907787d7aa0355ba36a6cadf1768b934c652ea78acbd59dcd
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
