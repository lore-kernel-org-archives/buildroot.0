Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0377AFA3727
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBDED4088A;
	Fri,  2 Jan 2026 22:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_5kGw-jEOFX; Fri,  2 Jan 2026 22:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C559E408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393789;
	bh=mYbqnntd+7QhezS5jCRyjOgxsavjbT9/XerCDSvScF8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r1/TNbxZcMXb4RnjjVmNonOPG3/3JW5JdbLn4+PGbXMevHGZSYjZjtG4ZR95fyAH4
	 y+Ih504u3zM+0kLA9w8pFyzn7xNZba1Kp3F6j/2flaOnJoWCUy1b00PmYKHovJi4h2
	 rEBlKzb5njSTref9L+qT58LTUiRLqX9H28Z8bJ2eGPvjaBN2cKT1Itdnf1Nn3q7QSd
	 pJQpwrdBMuDlpzsFLJ8h99QmPNbyKz7ynV4cyP4cVW9IiNcgxl29AgIsKBou3xlwkV
	 ugjDbZI7BcCHHW4SabCsjQ3cGSOUweoxLc/3GBkUo6aZLKBZCDiJKWdiNUkMal+eEE
	 8LhrlhOOJkSrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C559E408B3;
	Fri,  2 Jan 2026 22:43:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60A7F249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5305740072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTOCezFdnzBB for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B9EF401F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B9EF401F3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C040880A8; Fri,  2 Jan 2026 22:43:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:40:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16edb2ad254ca5386a7de470248c70edbcfe40af
X-Git-Newrev: b403dfe54a178a8477b347a50f9614ebfcd2be4a
X-Patchwork-Hint: ignore
Message-Id: <20260102224304.8C040880A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-functools: bump to
 version 4.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b403dfe54a178a8477b347a50f9614ebfcd2be4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/jaraco.functools/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/jaraco.functools/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-functools/python-jaraco-functools.hash | 6 +++---
 package/python-jaraco-functools/python-jaraco-functools.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index 69edc2384b..f43efcfd84 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  b8a8d165da986efa1966abd91c45348e  jaraco_functools-4.1.0.tar.gz
-sha256  70f7e0e2ae076498e212562325e805204fc092d7b4c17e0e86c959e249701a9d  jaraco_functools-4.1.0.tar.gz
+md5  501918900674199182b1bfa39db200b6  jaraco_functools-4.4.0.tar.gz
+sha256  da21933b0417b89515562656547a77b4931f98176eb173644c0d35032a33d6bb  jaraco_functools-4.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index e72a062fa8..397d5122bf 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 4.1.0
+PYTHON_JARACO_FUNCTOOLS_VERSION = 4.4.0
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco_functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/ab/23/9894b3df5d0a6eb44611c36aec777823fc2e07740dabbd0b810e19594013
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/0f/27/056e0638a86749374d6f57d0b0db39f29509cce9313cf91bdc0ac4d91084
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
-PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
