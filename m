Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26D4EEB57F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2326815CA;
	Thu,  1 Jan 2026 09:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HL3xRS2cEnpr; Thu,  1 Jan 2026 09:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FA0A81EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260585;
	bh=0IaNXoV/V82q7HoQJady2EiPOq9OY7/DOBLMJbtP+Qw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l3nMXFM9UbWoK/a48RjnBCqqCUvlyjBMD0X39CWhCy0Mbi9P9KxVROSHbAT6HU3sL
	 DAjfoEKn/vDBDkPBe4ZAg289Wt6TwFRYp5R+Xc6hmIgPCorTYdxk+c5mw3cBO6DTKq
	 X0v+rZIauwBwL0TTLiwYZQiQQN650EssyfzjIl8x5su8nN7a8JyOS38NlcID89RSK6
	 u6ieBku1l8C6AmBz1ODWJHHQjAfd7t6h9j8K7YcrQdWGzCGHRP5uJyYOBMU7EJVbqy
	 TBC9CpoAXMbOlukt1srIV5LnSjbEwX7F+tikyjoxxnqoIES6PBdYBy1dxLeVkQ8nYZ
	 eC4vFK1AWqUeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA0A81EB2;
	Thu,  1 Jan 2026 09:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15F1B206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B39D981521
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfOg1B44d1u9 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD51481511
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD51481511
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC13E878FB; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e84ea38d1849cf7d2c9ece137e15fb1f4559a63e
X-Git-Newrev: 39ccf809ee9dc176c9350c0a9406a8f9625e4bc6
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.DC13E878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysnmp: bump to version
 7.1.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=39ccf809ee9dc176c9350c0a9406a8f9625e4bc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from poetry to flit build backend.

License hash changed due to year update:
https://github.com/lextudio/pysnmp/commit/3a8cbfe6d22f7d159ce128058bc5d901a675bf6d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysnmp/python-pysnmp.hash | 6 +++---
 package/python-pysnmp/python-pysnmp.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index cae02270b3..6019925c4b 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  a6c2189839202b7ab76144743d7824b8  pysnmp-7.1.16.tar.gz
-sha256  51581c70e410e456eb3faa24c42a094c82acfa961d16ad659b57c5818379dfcb  pysnmp-7.1.16.tar.gz
+md5  33203585898e346a35bd49c2344deb5b  pysnmp-7.1.22.tar.gz
+sha256  37ac595c7f0c1c00514505939b4dcf5b4fd5a9ffe51b0349f60bb640c11b0f77  pysnmp-7.1.22.tar.gz
 # Locally computed sha256 checksums
-sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
+sha256  1c372007e7b71c1773a8ccc4fa840061822cb8053000f232a51da830b9d6d287  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index a04c3e4be7..e82ba2bdcb 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.16
+PYTHON_PYSNMP_VERSION = 7.1.22
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/a2/b1/c94dac49a002eed96e2cb7aeb1d148b1c98826e5cd1f6e8eebb4a20f8d49
-PYTHON_PYSNMP_SETUP_TYPE = poetry
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/c5/f7/63a4833b675f3f85296d85f2fddaed93d76799f29a813a2d5ca2bbe7fc50
+PYTHON_PYSNMP_SETUP_TYPE = flit
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
