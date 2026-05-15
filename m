Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C36BCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73CA66155A;
	Fri, 15 May 2026 13:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzgOJp0my0ss; Fri, 15 May 2026 13:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CAA661557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851883;
	bh=YaM1nwftHhx//mdJZ2KxPV3y6+cTW4D5QT8kcnH3YbM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NilwwnbVSkfnvFqzoPFpa1+tCn175VN9GCtD03ifTJ/xNPSILJpSFkYorTNQtXJyS
	 pxvYQXQ/Oi3uaDoOPdcyQdIi/Z65MfweBQbJ/+mQg1Sa/JgyBNkM3S+yHYNLb4M0+B
	 LrR8NLc9VwqM40D49V0Ba1c6qDTmvX8cPW2DAF/cDEnpXtMWqmqlnHxJnAO/+WC5mv
	 5zWTYFVtXOvJ+XCL8dWyt1kdV+RO5Hdd6lnF3aKjRd91Kv87NXkVA/jt+8ocjZuMQv
	 h2/obCfabgByZ1LiVT1U4BDIQL6/SZiu31RxunmOMvbaIB+W8ztzZW6ugvmDsQTR/X
	 ohM5rFjCmiwLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CAA661557;
	Fri, 15 May 2026 13:31:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A204636E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92B4540E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TivdGXt4YJaG for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 963CE40E23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 963CE40E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:31:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E96C286354; Fri, 15 May 2026 13:31:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:30:37 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2a872f30321236c5bc6ef375457887969dc073e5
X-Git-Newrev: 4d173cc6e393b3055084c6a70f37a45c784e87cb
X-Patchwork-Hint: ignore
Message-Id: <20260515133115.E96C286354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-pyopenssl:
 security bump version to 26.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d173cc6e393b3055084c6a70f37a45c784e87cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/pyca/pyopenssl/blob/26.1.0/CHANGELOG.rst

Version 26.1.0 fixes CVE-2026-40475
Version 26.0.0 fixes CVE-2026-27459 & CVE-2026-27448.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7bcba8498b257f949cecfb466e56f2891dac51d8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index b42719e3ca..84f4b7fa60 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  d755732945157fb8ca98c2d66a55755d  pyopenssl-25.3.0.tar.gz
-sha256  c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329  pyopenssl-25.3.0.tar.gz
+md5  e48484d4a915a47a71064c10ede7e991  pyopenssl-26.1.0.tar.gz
+sha256  737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b  pyopenssl-26.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 2dee55d8cc..da31da5c5a 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 25.3.0
+PYTHON_PYOPENSSL_VERSION = 26.1.0
 PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/80/be/97b83a464498a79103036bc74d1038df4a7ef0e402cfaf4d5e113fb14759
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/8c/a8/26d36401e3ab8eed9030ad33f381da7856fcfad5691780fccd1b019718fc
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
