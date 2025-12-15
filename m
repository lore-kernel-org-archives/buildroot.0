Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C385ED5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A20E60F2F;
	Mon, 15 Dec 2025 21:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVESFH1mF39U; Mon, 15 Dec 2025 21:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1617760F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834754;
	bh=mKe6rvJkapR2lf0YF8ULz95vXgcJDCBR4er367PHesQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rcSoDsQ+JLxt30r161p8zf9nu8RnfDjdu+NIOmogID8h6gWVPri3e8ibOJTT6P3+b
	 hcsJe0/MjaFePEXElzlIm+0IraqOlXU/eRk/xGetXjCCFkyMW7sPBbrJueTk/EbPr6
	 TBDF7HzqyaOUNwWdGDzk7U58juXIOj+vPu7qvdcLDOJNdmM8VSTxAcKZ135fsoTvOi
	 6WXudpBnHp3HXK63TiSf2bRLx26Vj1M1obHkn1z0es4rcIeZ3wuScObBw62RUSVyOk
	 KkzmX1gzjDd0Y1dBCfeGAFR5nrS6Udl72+9DyGZ2Huw0aHswi+x7gRN28mo96d9grv
	 Q59kohXqE4fmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1617760F83;
	Mon, 15 Dec 2025 21:39:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15051117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DBD44056B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbBuGFGKvWwJ for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97F340AD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97F340AD8
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D899C86FC1; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d85001219e9d9d0b102620b72e06b43de2959db
X-Git-Newrev: 64064dc39dd8bd2cf7a1b408cb59f8d62bae1f53
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.D899C86FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rsa: bump version to 4.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=64064dc39dd8bd2cf7a1b408cb59f8d62bae1f53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Please note that this project was archived by the maintainer:
https://github.com/sybrenstuvel/python-rsa/commit/42b0e14ffbeeb9d99d1037e6440a2cc61780e4ea

The only buildroot package using python-rsa is python-google-auth which
did not switch to an alternative yet:
https://github.com/googleapis/google-auth-library-python/pull/1771

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-rsa/python-rsa.hash | 4 ++--
 package/python-rsa/python-rsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rsa/python-rsa.hash b/package/python-rsa/python-rsa.hash
index 0e2b3a9119..040b86637f 100644
--- a/package/python-rsa/python-rsa.hash
+++ b/package/python-rsa/python-rsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rsa/json
-md5  26a1efb79164a95c363e550c3eefe683  rsa-4.9.tar.gz
-sha256  e38464a49c6c85d7f1351b0126661487a7e0a14a50f1675ec50eb34d4f20ef21  rsa-4.9.tar.gz
+md5  a1d93db78c604788f56a84f6df6f1eee  rsa-4.9.1.tar.gz
+sha256  e7bdbfdb5497da4c07dfd35530e1a902659db6ff241e39d9953cad06ebd0ae75  rsa-4.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  073f28b7d389c8fe74f607e17c27f81eaa5ace69edc43a884f23f41b41c5c726  LICENSE
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index f1c6cf5f3f..aedf19da8e 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RSA_VERSION = 4.9
+PYTHON_RSA_VERSION = 4.9.1
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
-PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/aa/65/7d973b89c4d2351d7fb232c2e452547ddfa243e93131e7cfa766da627b52
+PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/da/8a/22b7beea3ee0d44b1916c0c1cb0ee3af23b700b6da9f04991899d0c555d4
 PYTHON_RSA_SETUP_TYPE = poetry
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
