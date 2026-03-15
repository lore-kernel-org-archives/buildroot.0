Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CD3F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4518C40AD4;
	Sun, 15 Mar 2026 22:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIcFzpwzsuMV; Sun, 15 Mar 2026 22:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6661141313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613112;
	bh=LieLS6bmblQLcM4vxPGzq3V/g65wPXavYN4PkkGjKO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l2vEFpV2GJa9befyzJCEO0KXF4Y8ez6YSVs/nlx3mks/cUKOlcwpAh5IdsuGlozle
	 TTd6mdyL2p+fMly/q5WMbszeUd3AtaKyDrHily4Pfb/KW0CRu/65PEEec6YleMSpF1
	 HKjGxGdGFMHaSHE5qtrkXNt1BQ1p2pOhKmInWRe6j7sZPH9p55JbIeKTDZXRG2cLRU
	 vzOohobQP0IZyro3gU/IUeGXLO0x9Ux/BjhJ/EuiF5rcEOerBa3SS4v0IBmwWjafp1
	 z8r936tur/B4jeBsKd/eHLwOKMUnRTE6lE6P+PYKVzMsJystRDG3G4iyWc55PtR575
	 Mj8/0C87ub+7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6661141313;
	Sun, 15 Mar 2026 22:18:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1531B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5298A610C3
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8bVt1kUm4cf for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C46610A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02C46610A1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45BAA85BFF; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc079e8457a17fe81b1a82e41b0e39296bf84181
X-Git-Newrev: 3b0305613f03f8550185862d6a9566a08207f903
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.45BAA85BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multidict: bump version to
 6.7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b0305613f03f8550185862d6a9566a08207f903
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/aio-libs/multidict/blob/v6.7.1/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index cade81514b..d2fe79e0ef 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  cba8e65b4c65d889395672fd62de5183  multidict-6.7.0.tar.gz
-sha256  c6e99d9a65ca282e578dfea819cfa9c0a62b2499d8677392e09feaf305e9e6f5  multidict-6.7.0.tar.gz
+md5  aed0d99fa532a2b6570b88c900d60b99  multidict-6.7.1.tar.gz
+sha256  ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18c9ad04f82712bac623d  multidict-6.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  93d11a968e2f0f36373c40811ff6d20e173f58c3cab5884cd6617bbfd795492a  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 4de38b9ab6..dc92b653a1 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.7.0
+PYTHON_MULTIDICT_VERSION = 6.7.1
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/80/1e/5492c365f222f907de1039b91f922b93fa4f764c713ee858d235495d8f50
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1a/c2/c2d94cbe6ac1753f3fc980da97b3d930efe1da3af3c9f5125354436c073d
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
