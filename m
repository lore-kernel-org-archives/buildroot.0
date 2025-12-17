Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6DFD66BA6
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31AE640F6A;
	Wed, 17 Dec 2025 20:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FrIqWJyGPOb; Wed, 17 Dec 2025 20:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1BB40F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766004335;
	bh=mUMp/DTfERqCJEkfayiRa1ZcQXtt8Ozdf90bGuzvjHE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dCE4QcqcV9DgfxDkaNLQq/gyFLl6lupam0UIrl0v3iLs19tpTo2vyMZa15DeA4eM/
	 aMS2cdWhVYnuTWaFPCRXxe9i/qylSk4Nx1aJO9JiQngg7JPRJG2/4e8dvduSkBS2a8
	 IZHY2NQb6a1SfxtIQt7qlCOd6nnS98rtUPl+GC1ogwrLjApDyzIRit+ZNsezmGgHAQ
	 eI29mlqrPNMkAqaVL6nNNVHqP/z8hs2Q68CLX4Ho/WS4sTZ/0Bi1J91hbkgWCLs19g
	 wMGPOxQhv+2SVS1TU+ldA2YajidexzJtOxvwIZABKMilY5HAl6TLt3ecllzPjvFcka
	 VDUZlMGDePGEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1BB40F3B;
	Wed, 17 Dec 2025 20:45:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D24AB37A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C380D40497
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HV-AZn7XtzVc for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C67740460
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C67740460
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:45:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD0D187110; Wed, 17 Dec 2025 20:45:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 21:34:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7f1ab80cd65616f437ed12b700a4bc2a32e50c8
X-Git-Newrev: 79f5c7267476ff32b4f7809278087373c961d9fa
X-Patchwork-Hint: ignore
Message-Id: <20251217204532.DD0D187110@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiodns: bump version to
 3.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=79f5c7267476ff32b4f7809278087373c961d9fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/aio-libs/aiodns/releases/tag/v3.6.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index 8e3e66d0f1..a4a242670a 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  dd1c76c0b2897589ae9787530cc0e468  aiodns-3.6.0.tar.gz
-sha256  9b0ef54339e6687cdbd39a7d73d7de2467cb5c115281da28f2598f058633dac8  aiodns-3.6.0.tar.gz
+md5  c1552fe562a1f9c98ea4c2311a2c75ba  aiodns-3.6.1.tar.gz
+sha256  b0e9ce98718a5b8f7ca8cd16fc393163374bc2412236b91f6c851d066e3324b6  aiodns-3.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index d0a1ed6e1e..7476c76b72 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.6.0
+PYTHON_AIODNS_VERSION = 3.6.1
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/e6/11/238e97cbf5c1c0f725d590a092e0618dcdc50f44dbd1e2a926fae27e6f06
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/85/2f/9d1ee4f937addda60220f47925dac6c6b3782f6851fd578987284a8d2491
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
