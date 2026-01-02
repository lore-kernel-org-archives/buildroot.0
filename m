Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B454FA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C35CC818C0;
	Fri,  2 Jan 2026 20:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxXqNmF6LV-i; Fri,  2 Jan 2026 20:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 261D681A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387310;
	bh=vvqsOnZfY4znZjTye+uU2lap52HrCxhsVgp2GIOMhSw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bk0/uKQZ7I7SWdkawKctdrAv7OiFiegRL6+XvsgRRTPodPTesPEf6YC0ITIKwqpuQ
	 nDWxgU+k81PxWzlErrWoJDAm5WOSrLMFaW+qhPljitC+gvWgsihyToGn9qg8ZOOVYQ
	 v5ntkb+ueKHMKfxiFxHqmI8j+sbYyxLLrbQmF5vo0Y/PdN9hZUjppOqMBwQUvzuKJF
	 wxTnn7SU1IiHeeMtvz1NFBkMItZZtILnKoPHn6YaKl7LJiycBTGQaA2x/Pzk+Xa/fL
	 u9pya0C7jXqJ/n7hZebPmPENo+2eOruGglWELJXVzCpD1X364DZtuNMgvHenAy8NF5
	 G1AN16kt/PXIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 261D681A73;
	Fri,  2 Jan 2026 20:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1CB119D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A59C3814B5
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deKRLuinRDkH for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A11A081238
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A11A081238
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99CE88805A; Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 21:52:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26f07744752f027e6eb7a1734ceca03ae8ea8587
X-Git-Newrev: 6b12ef59c57c30f945b4606be41df5e7fe31764b
X-Patchwork-Hint: ignore
Message-Id: <20260102205504.99CE88805A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-portend: bump to version
 3.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b12ef59c57c30f945b4606be41df5e7fe31764b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/portend/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/portend/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-portend/python-portend.hash | 6 +++---
 package/python-portend/python-portend.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
index 98e196bec8..45d04c0662 100644
--- a/package/python-portend/python-portend.hash
+++ b/package/python-portend/python-portend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/portend/json
-md5  0c3a2e8073c384b826f87795766f1e0e  portend-3.2.0.tar.gz
-sha256  5250a352c19c959d767cac878b829d93e5dc7625a5143399a2a00dc6628ffb72  portend-3.2.0.tar.gz
+md5  c52510e0488592005243209246b1d4f9  portend-3.2.1.tar.gz
+sha256  aa9d40ab1f9e14bdb7d401f42210df35d017c9b97991baeb18568cedfb8c6489  portend-3.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
index 5415198ffb..4e9e50c338 100644
--- a/package/python-portend/python-portend.mk
+++ b/package/python-portend/python-portend.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PORTEND_VERSION = 3.2.0
+PYTHON_PORTEND_VERSION = 3.2.1
 PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
-PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/8f/fc/bcfc768996b438d6e4bde7a6c8cfd62089847b0f5381a0e0ec2d8ee6b202
+PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/b7/57/be90f42996fc4f57d5742ef2c95f7f7bb8e9183af2cc11bff8e7df338888
 PYTHON_PORTEND_LICENSE = MIT
 PYTHON_PORTEND_LICENSE_FILES = LICENSE
 PYTHON_PORTEND_SETUP_TYPE = setuptools
-PYTHON_PORTEND_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_PORTEND_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
