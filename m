Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73345CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 474F6842E6;
	Fri, 15 May 2026 13:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxYHiOp90Knm; Fri, 15 May 2026 13:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 109B9842CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851821;
	bh=vfAkSUlQfvAyRTOcebuW1K4KaB4212NZUqMIS6Y0r6w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hsx3YAE51ih4SsfvSqAHFz+vZaSbK1LWSQN43eskdVJtM72g13NLM9pfI75x0+B4C
	 6UdDPa7Ys9arj6L8zF3mfEJZ+ksqhdBM6tXi8X7zTvvDKFhw3HHuplzEyEdnATnGA+
	 4+58rdPqeRPS/+B3Y5s21XkdycHXYgX8bZss+MnGvsCtzCEnxSEd0XBA/2dOsOI8kC
	 MR/p3EWaiK09ByG4/TUp+80B5Tvyy2Ve1NrJe5sKvy6rewzBn/3+wuv2Uz4GcW/a5q
	 NtBsmxLmO8DuNPDBfSbFvW+zhFuxTPOVZYRtYmlAJblQ6iKx/oc9pEywZt2IYNlvGf
	 ygi+bd/3/vWZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109B9842CD;
	Fri, 15 May 2026 13:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0159B36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9131341B05
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cx2eHF_QEOa0 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6B3041AE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6B3041AE2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1694B86352; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 14:37:39 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 5b4194680c6bcf664d9127c070455ce36cc9125b
X-Git-Newrev: f7794333cb489f85ddf1d1ade143e31bba6057d0
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.1694B86352@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-pyasn1:
 security bump version to 0.6.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7794333cb489f85ddf1d1ade143e31bba6057d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/pyasn1/pyasn1/blob/v0.6.3/CHANGES.rst

Fixes CVE-2026-30922.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 123136b246f93c78cf9d51df37727d1b2cfcb638)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyasn1/python-pyasn1.hash | 4 ++--
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index 4977abf4bd..eea1118bee 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  93dbc09023fbd1b724fd8233ffe2a343  pyasn1-0.6.2.tar.gz
-sha256  9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b  pyasn1-0.6.2.tar.gz
+md5  b7a8127ed5fc251943e47dbef51ea6c8  pyasn1-0.6.3.tar.gz
+sha256  697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf  pyasn1-0.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 2dc9470ef0..7278b3f857 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.6.2
+PYTHON_PYASN1_VERSION = 0.6.3
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/fe/b6/6e630dff89739fcd427e3f72b3d905ce0acb85a45d4ec3e2678718a3487f
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/5c/5f/6583902b6f79b399c9c40674ac384fd9cd77805f9e6205075f828ef11fb2
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
