Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83505F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BEF840AD4;
	Sun, 15 Mar 2026 22:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFwgVYENhIz1; Sun, 15 Mar 2026 22:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C46A41518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613149;
	bh=2dh46xpsrJlkeRXEjc9SCvnA+CG7ne3Aloj9MDYThCI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kRa6TSBybc1jPQBbts/cp7yh1jZtMM0P7dfLnbBFa7I9erDbSR81bo0y5ePVerD8w
	 s54uWKCWEVMIM5yEP8iXukhmHysZuR2J29siaLIA41hMgXU2EgNIZGgGtEN8W0+AuF
	 +WxFcrt6U6wSOld0p0W4nFw6S69pBx31aTx0i1N2UgJcKPbDqRlVwnYW7qj2hOY5W/
	 S3Ns1sQRZ3/39IhN/3N5NBJluhvyXAe3AdADElNmVw9hT1I+/RW1PiqfDtAMUYShTL
	 MHdEbtRnjsuAcpSoTDsA5Ne0TLKbjEqT0q7uAapkexCdzglhnhsKji+JgqS608ag9W
	 /c+QANq9furoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C46A41518;
	Sun, 15 Mar 2026 22:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 028F91B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B92B6108F
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DL8xpMIs1XTt for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A610461088
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A610461088
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E90DC85C3A; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2990809a2062f5b4a640ed1ffd1f6269b2cf495
X-Git-Newrev: cd1a38e994ea9eb3ca937581d1cb403e11aab232
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.E90DC85C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jmespath: bump version to
 1.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd1a38e994ea9eb3ca937581d1cb403e11aab232
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream removed the old license file
https://github.com/jmespath/jmespath.py/commit/772c03afe10f5b09c5f5a31742a76777f4f0fc34

and added a new one
https://github.com/jmespath/jmespath.py/commit/5634c661b8e42294f04de610ef8906b59ed96eee

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: remove LICENSE.txt entry in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jmespath/python-jmespath.hash | 6 +++---
 package/python-jmespath/python-jmespath.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-jmespath/python-jmespath.hash b/package/python-jmespath/python-jmespath.hash
index 03f64f3b74..e72727b85b 100644
--- a/package/python-jmespath/python-jmespath.hash
+++ b/package/python-jmespath/python-jmespath.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jmespath/json
-md5  2dd28beb22d698f58fe2281bfe5fe3a3  jmespath-1.0.1.tar.gz
-sha256  90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe  jmespath-1.0.1.tar.gz
+md5  ecc9e47d433b539b7fc87e61972d3746  jmespath-1.1.0.tar.gz
+sha256  472c87d80f36026ae83c6ddd0f1d05d4e510134ed462851fd5f754c8c3cbb88d  jmespath-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  66b313cce80ed0623fc7db3f24863a0c80fd83eb341a46b57864158ae74faa56  LICENSE.txt
+sha256  6eefacfa4d71b82d08408c751470ac8d9854538da2142cb27be0287fb13d0ab9  LICENSE
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
index a94a13a229..b717e2e3ed 100644
--- a/package/python-jmespath/python-jmespath.mk
+++ b/package/python-jmespath/python-jmespath.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_JMESPATH_VERSION = 1.0.1
+PYTHON_JMESPATH_VERSION = 1.1.0
 PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
-PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6
+PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/d3/59/322338183ecda247fb5d1763a6cbe46eff7222eaeebafd9fa65d4bf5cb11
 PYTHON_JMESPATH_SETUP_TYPE = setuptools
 PYTHON_JMESPATH_LICENSE = MIT
-PYTHON_JMESPATH_LICENSE_FILES = LICENSE.txt
+PYTHON_JMESPATH_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
