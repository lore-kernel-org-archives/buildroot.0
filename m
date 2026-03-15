Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D881F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F28614E8;
	Sun, 15 Mar 2026 22:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N446xTjcKX43; Sun, 15 Mar 2026 22:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CC3614B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613203;
	bh=Pu1+DoBjm89643SbFUHvWfqvCjuBtmIYD/MlTluWFIU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a5H/5FwhGNJBB9dvTe693ycIbsXw+MdqWEaznoFjCE1SA75pgXbB4g5itOk6Jty8p
	 TuAh/cOMK6jXTHrMr01EmRiV3l8d58X0fuyElqn1HdaSvIgbOciLfjn/G4wVTZxiyX
	 qYedKRKQTHyXN6+poqWI+fPSJvg3a49LAl68o8U/uo+9zjE/1gdWU6VpEqgpkhfrAz
	 uUuVt38ANTn8Ubq7oJVvtKa1NAYdMz+TDBfKCp4Hs/qimKIQ1M90+oJnO2h86xWpeS
	 NP60bEPThzlB4vdLbQJhO12csV1KhdAj0rb2ZgosOwHBKHMGQprumo2lBLktXw+GO/
	 xYtyN1gWUqsiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CC3614B3;
	Sun, 15 Mar 2026 22:20:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF561B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAA7D611CD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2Sy6VYT0AYH for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 745FE6108A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 745FE6108A
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B69B2839BB; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 374f45b0faf0ca5fdd2488fa8d1fe0e589a3a032
X-Git-Newrev: f90a703b2733a7c1ca8cbf07249dd32c69cc76de
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.B69B2839BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typeguard: bump version to
 4.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f90a703b2733a7c1ca8cbf07249dd32c69cc76de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/agronholm/typeguard/blob/4.5.1/docs/versionhistory.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index e567715fa9..004bbdfabc 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  4f97177b802372a70bb571b2aff09313  typeguard-4.4.4.tar.gz
-sha256  3a7fd2dffb705d4d0efaed4306a704c89b9dee850b688f060a8b1615a79e5f74  typeguard-4.4.4.tar.gz
+md5  c4953b5b4dc1d6a49d6cefa4f47f7465  typeguard-4.5.1.tar.gz
+sha256  f6f8ecbbc819c9bc749983cc67c02391e16a9b43b8b27f15dc70ed7c4a007274  typeguard-4.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index 71d7f11858..cf07bf345b 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 4.4.4
+PYTHON_TYPEGUARD_VERSION = 4.5.1
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/c7/68/71c1a15b5f65f40e91b65da23b8224dad41349894535a97f63a52e462196
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/2b/e8/66e25efcc18542d58706ce4e50415710593721aae26e794ab1dec34fb66f
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
