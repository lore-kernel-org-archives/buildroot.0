Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB8DF483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E243682250;
	Mon, 23 Mar 2026 19:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bduuvdu_u97B; Mon, 23 Mar 2026 19:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 181748224E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295270;
	bh=vYpgJnrt5G5DWIdLxh8FgYQIAcVe2XXVqeXZu4AJ7x0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EWFRAzk8WPxQie2EJGWRScjm7FvLMnrCE4CUcIqoCBQ78w5cDv0cKvwuMrpYgD98b
	 9cTq7HQfMH3JUAB41qCQEOps2A81mKIl0c+ZYuNWHmjkPHeU4aeNVZKARriThx+n5y
	 PEbiCD0HTWAtkMCOJBA8TeglGtJaCgUogiQOCaM3Ntfoo0bQNSD3DvertETlQaUp21
	 YB50IghbNLAJ8g1gGbGBwat2H/bGOICXilSqkNmuSG0ew9l4Bx5E16SltwxK6gd5rv
	 qS7MHMo07kBEZCCUxwfciRyIKcPMluLUPYbzN5Qh0sFVgQtRRf2upAseQ3rwQ6LGhI
	 MC9qHxJm6Oxjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 181748224E;
	Mon, 23 Mar 2026 19:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07B92353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C494821ED
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id At4hubU95R0X for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D1B821D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08D1B821D2
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 468C184054; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:56:33 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: aae6fb35a0ba75ebd4930d9e9854956b2f817085
X-Git-Newrev: 548a063cbb8c1a6bee381959b24e1cc58398cdc8
X-Patchwork-Hint: ignore
Message-Id: <20260323194729.468C184054@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-pyasn1:
 security bump version to 0.6.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/548a063cbb8c1a6bee381959b24e1cc58398cdc8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/pyasn1/pyasn1/blob/v0.6.2/CHANGES.rst

Fixes CVE-2026-23490: https://nvd.nist.gov/vuln/detail/CVE-2026-23490

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 517cdc8e13068cca524da33c3c5bab3b507c70c0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyasn1/python-pyasn1.hash | 4 ++--
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index 4268d82c38..4977abf4bd 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  75cdc260597f112fdfefec85379e710d  pyasn1-0.6.1.tar.gz
-sha256  6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034  pyasn1-0.6.1.tar.gz
+md5  93dbc09023fbd1b724fd8233ffe2a343  pyasn1-0.6.2.tar.gz
+sha256  9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b  pyasn1-0.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 7a5cde40fb..2dc9470ef0 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.6.1
+PYTHON_PYASN1_VERSION = 0.6.2
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/ba/e9/01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/fe/b6/6e630dff89739fcd427e3f72b3d905ce0acb85a45d4ec3e2678718a3487f
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
