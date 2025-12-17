Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B0D66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544A540F77;
	Wed, 17 Dec 2025 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOkP_kRLEAbi; Wed, 17 Dec 2025 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7870740FA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007921;
	bh=9zjZ1cnYz/YqzmXrvf1GqD3pi8w4S8JkECu+TSQ6IFA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rwYWt44fu87bsAHv7NFwV0PK3ecFjyMm+AKMdGUBDmCjcrDzYe1pA8iAjbADVKELz
	 Hu5WAaybBl271+3HRjWraguS1FIHnBwVpzgd+D0yhujmMRobVK6W6BvMuXYeaBV33y
	 ++1GEUHFgFzmJjX5Ju/M9WOE/PQVxsOisHzwW1aNrsD0s8/j21bSw1Y2vDGEvhE/wU
	 b8+UGDMalfu+w537XcG+FVUMMCAWOat8wEkuaJCchaljoDcRJFpH0ZIEBH1TfyhNHy
	 4FY1XH+N/E9QUw351dteZ4zqnq8J6aQ3fiImVASIef4F3jyK+qEqW4y5JTLvIlnkXj
	 Lwp3aBAn310WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7870740FA5;
	Wed, 17 Dec 2025 21:45:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 154A6375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4E6040F83
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOgO7rqn7hFn for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D3640F89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9D3640F89
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8F3B8120D; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:11:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 476ebb35858d738a0773930379ebe0e8b1c2c7ac
X-Git-Newrev: 2ce6f09ee155a55b7d74e910e4336b68b66e0d16
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.D8F3B8120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zopfli: bump version to
 0.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ce6f09ee155a55b7d74e910e4336b68b66e0d16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/fonttools/py-zopfli/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index 0fd009879c..f452e2bdfe 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  2c42e8d5918059b84a42c0d53c5a6852  zopfli-0.2.3.post1.tar.gz
-sha256  96484dc0f48be1c5d7ae9f38ed1ce41e3675fd506b27c11a6607f14b49101e99  zopfli-0.2.3.post1.tar.gz
+md5  c744c18043764ab6aa82443cee243038  zopfli-0.4.0.tar.gz
+sha256  a8ee992b2549e090cd3f0178bf606dd41a29e0613a04cdf5054224662c72dce6  zopfli-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index 47a27b1084..d2816364a2 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.2.3.post1
+PYTHON_ZOPFLI_VERSION = 0.4.0
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).tar.gz
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/5e/7c/a8f6696e694709e2abcbccd27d05ef761e9b6efae217e11d977471555b62
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/be/4c/efa0760686d4cc69e68a8f284d3c6c5884722c50f810af0e277fb7d61621
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
