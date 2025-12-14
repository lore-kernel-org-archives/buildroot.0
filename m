Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A906D5B171
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C57581467;
	Sun, 14 Dec 2025 17:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYrdDbOh9tcc; Sun, 14 Dec 2025 17:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278D18149A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734468;
	bh=iCq8aB3O2fKdo5n0HIGTNgXjHGuN2wmmUuf/lAAiTTI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rllykZaU2HmHPBhszaYWbh77nhbAbYOOJ/MPmLkUtsaodXfWBsxEamD1jjq8MbRZB
	 P/L9ygYvFJKKmtkCGJYhj5IIwq2jQCCWZ/uCDyXEdFZGsh2EERzZXhU7jI97BrmYCc
	 aJId5Nplqx1CSyjFWJoyJVP9r7t3DdN1MWZEaTGYgK2MNsSup13PY6KtzEHC7j13iM
	 JeqHL+/eiUmf7w0eCbUAAHF0K360o4VaePD6aSm1TM7YOc6imnbbW9E8A7PDl6b5J5
	 sf7uceiSJ/f3W37+ER9p7Bqxq17OB65uVnb3ho2+rK+lNMRXXC4gB2MG0D+BYHesWt
	 uQSF79uIqpa5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278D18149A;
	Sun, 14 Dec 2025 17:47:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E2432D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D043406D8
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkwYctkaefdi for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B9624005F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B9624005F
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C9E886E93; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36b5896db8f8e1d6bca9c84a3658163220006b22
X-Git-Newrev: 6636c30dd2e8a13083179560283df14a9fef217f
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.7C9E886E93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiocoap: bump version to
 0.4.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=6636c30dd2e8a13083179560283df14a9fef217f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/chrysn/aiocoap/blob/0.4.17/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiocoap/python-aiocoap.hash | 4 ++--
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index dfe0d02c80..045a325b93 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  028b0ce02cb94317a24d31adbb22150c  aiocoap-0.4.14.tar.gz
-sha256  01a34233b6f9a97df9a61f30bc64c0399bac498eaa160189a7f1f48f89d18717  aiocoap-0.4.14.tar.gz
+md5  27b37cc163f3a7f777d131053cbdae6a  aiocoap-0.4.17.tar.gz
+sha256  464c8d2b85ec1ef435dabeaa3fb6c8256b40fadfe6ce4ca83b93acb8d555f436  aiocoap-0.4.17.tar.gz
 # Locally computed sha256 checksums
 sha256  8baefb820ca33d8176df8d0430ce05d15764617cd07ec04238c56d641273f472  doc/LICENSE.rst
 sha256  51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  LICENSES/BSD-3-Clause.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 26909e7dd1..bb08eaf133 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.14
+PYTHON_AIOCOAP_VERSION = 0.4.17
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/28/76/de52f7fa51ddbb5255f7b80d8965903bfa718420ac5d21b0852f5d81c1b1
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/1d/7c/10483df04d7910e21d55d47ab7c014fb02644b5b58ba741161360f8e9e8d
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
 PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
