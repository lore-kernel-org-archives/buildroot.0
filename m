Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A12CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3553608B3;
	Tue, 13 Oct 2026 21:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNpv85ESGLxu; Tue, 13 Oct 2026 21:31:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9320E608A1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791927098;
	b=lFq6gMor1ob6LO8uw3co0guQN7lRuxfH6E/I7D/upQEEDRqBOfrWfSe837LK93DMdmat
	 87ArGQfeauoyeAdfbV9n4yCnKWdp4+t1aeEYJOG25KddZPNWVx7BuI0hCLSL7ljDBDfxA
	 QGpbKXOPMymc2vJpxiGCkEx2wjNH0V0A5txb2wAs2MSlM2VigCrQgdFkCPMql/GOUwf/K
	 v7ZNsT6dvOUvvklNqEP0ZvAyKzIyT+hZUhPfb7ziD5V/J46tls9cDEszeLE+kQWYFPavy
	 D62LiuAzWZQOTF/e8OjOXl3sETPT3eFTTjtoagy5vA5UoZNNaxQSQfDNucpJgu8f8tA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791927098;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ylqpMNJMBL+vjuqi9Zl+IRXf/nsoa1me29yM9xPuGQc=;
	b=RPwbMvjXyZ12L0yByVu4JNdOzOQTPel1PCBWSIY7G0ElBrJAaobz6KnhOLnl2TsPc2jc
	 CT+cW5og2c+924eGiNKWmIvgjHAH/kg8Gp7Ffof9ewn5VvLq9UaT1wHWkwNRMDiEI2qxX
	 EU8ghVC3Arz/hvgZmccv+ptvhecaWh4I2/nrZsJrLA7Xz26/mBbzt6n7Vh0DiB1xM+tiB
	 FdbtTXKHDUP0lgE6IkEwc2h4KrFBqoJ8EAX8Xpwua9hISVugwG7FKhUhlHkjYOFSEDY3O
	 njXuEbPWMrkMHHY1qRCCSPJy959az0GTR5mXGmVo1NB109ecHPQkD0NaRDQGGSplnSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791927098;
	bh=ylqpMNJMBL+vjuqi9Zl+IRXf/nsoa1me29yM9xPuGQc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XO4mXpWRy4zC2xlzPhaKcWZsU8a5ZEf266IZgQbCh7f/C2BvjioUJTk01sEZjhiqr
	 SHh0U6dsDUDQyCS+BZOivPAj76B2MwrUB/N2Tag/eIr9aGNUgFxKB0MQPr3OAMpCDJ
	 wdCgQxDZu1fNc5q9E/Nkj/M7PfeHxNve80lAY4+g4lQ3j+p+bdhstDV8QANcwqNpHt
	 dHxA5BH2HVdplEM+KCmj0a5T3vI8+qJ7ACJZhwNqtolnUpcEy2aQo8gAYxC+wrCMZn
	 syJJsAJA4JIUsNrLOKhnVcbA8TOU1SgDfcMDEH87JHZNuDO6JDjjJ7MV0cT3b1UNi1
	 /Qz/x5Yx+lYbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9320E608A1;
	Tue, 13 Oct 2026 21:31:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7E9B2E0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DD14405C5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbxyhgnPQyzS for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:31:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C11844055E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791927094;
 b=RRHGXKUenjCO5HyqMXTTxfv75HZxoidcDbRjQKbQN5M5VqWNoIsus3dQID7Jphz4YAV1
 rM6LdMO1gxNpQFc7oypTZ9IB0FihOVAV7rlquVTaGVUM4W+TqayonEyz5GHKyqc2H7GCQ
 SmR2TIGuBHgIzKb2flM+d5x0giEAivRwSvuwQTpKO9KQIMEqQeD4EG74iC4Vbkb+ERh0D
 8Dn4tYs8rbdOfxRMXci4E0+DVtSl2MR7lDgPDPbXhL29SrCOBofiMZBsWttpKUPZptHrS
 Y7kVb7xsexdE+cITAs0jR4pfaVUedtPDp7mVqToYEiJ2RJN/vLso4XEQfWGMgt3kuGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791927094;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RCl5d6nkgaaNYZPCpzu5aCGzWYO8lqbaY92HDVd7Dng=;
 b=XK6WiGnqJDefIOw48GVnhy8AJDitGK4ZbGCL/1yohZwW5M3+Zo8OA6Tmymko0JBq7vKq
 wI9/eIxV9ihk0C0JeDs6SisQup9hUTRH2oJt107IMgxm5ry+bMyrFUjdF/iimd4sI/Iit
 7je3FnFLCT+7JM3KLyZ6kV+ueoQpi73HJfdntlwoJZkY1HWQdSvxS7HutniZdmf5jI9PK
 uypkJ85OOaMgY4SOr40UihTtMZJr1E7uBANbEG1uFWGLHZFjkXD9bcqpPIxCttNM9B8os
 epL0PCOZVqLdFGDpVOy+ZFiAgicU8T0o6CMiLB2ZQCLn5/XrTiAn2f6/8YPB8yfaYmw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C11844055E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7ED995B62; Tue, 13 Oct 2026 21:30:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 23:28:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90702e00569f43d743add49ef25a71a20ba1d32a
X-Git-Newrev: 42a336e15f1e65ee988c9036b8844bbd73ea4a49
X-Patchwork-Hint: ignore
Message-Id: <20261013213014.E7ED995B62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-configshell-fb: bump to
 version 2.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42a336e15f1e65ee988c9036b8844bbd73ea4a49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to hatchling with hatch-vcs and use the PyPI source distribution,
which includes the version metadata needed by hatch-vcs.

Restore the compatibility symlink omitted from the PyPI archive so the
wheel continues to provide the configshell_fb module.

Drop the obsolete six and urwid runtime dependencies. Select curses
explicitly, since it was previously pulled in by urwid.

Update the license hash for the removal of a trailing blank line:
https://github.com/open-iscsi/configshell-fb/commit/36306fd6f839b66e958d692230ead8d49883abd8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-configshell-fb/Config.in                  |  3 +--
 package/python-configshell-fb/python-configshell-fb.hash |  8 +++++---
 package/python-configshell-fb/python-configshell-fb.mk   | 15 +++++++++++----
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
index ed7f9e0234..2c3fe52dab 100644
--- a/package/python-configshell-fb/Config.in
+++ b/package/python-configshell-fb/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	bool "python-configshell-fb"
 	select BR2_PACKAGE_PYTHON_PYPARSING
+	select BR2_PACKAGE_PYTHON3_CURSES
 	select BR2_PACKAGE_PYTHON3_READLINE
-	select BR2_PACKAGE_PYTHON_SIX
-	select BR2_PACKAGE_PYTHON_URWID
 	help
 	  configshell-fb is a Python library that provides a framework
 	  for building simple but nice CLI-based applications.
diff --git a/package/python-configshell-fb/python-configshell-fb.hash b/package/python-configshell-fb/python-configshell-fb.hash
index e090501056..cfc7be7b38 100644
--- a/package/python-configshell-fb/python-configshell-fb.hash
+++ b/package/python-configshell-fb/python-configshell-fb.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  44696b92bea2b44c1d0bf2828477dddeb3b4dfb312ad82ce06d7b704c0985e27  python-configshell-fb-1.1.30.tar.gz
-sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
+# md5, sha256 from https://pypi.org/pypi/configshell-fb/json
+md5  049b7dcbc47e4699241c520b88fc4766  configshell_fb-2.0.3.tar.gz
+sha256  dbb086c16c1603a230f9017ef85baccabfd5d87439a01e963377e50f10220f53  configshell_fb-2.0.3.tar.gz
+# Locally computed sha256 checksums
+sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index 3446a86e8d..e59e7f61d9 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -6,11 +6,18 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and targetcli-fb at the same time.
-PYTHON_CONFIGSHELL_FB_VERSION = 1.1.30
-PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,v$(PYTHON_CONFIGSHELL_FB_VERSION))
+PYTHON_CONFIGSHELL_FB_VERSION = 2.0.3
+PYTHON_CONFIGSHELL_FB_SOURCE = configshell_fb-$(PYTHON_CONFIGSHELL_FB_VERSION).tar.gz
+PYTHON_CONFIGSHELL_FB_SITE = https://files.pythonhosted.org/packages/5c/cd/3575aae7d0302c3a9d7a9999870475c289209a2f5b633a682c94f9dfc08c
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
-PYTHON_CONFIGSHELL_FB_SETUP_TYPE = setuptools
-PYTHON_CONFIGSHELL_FB_DEPENDENCIES = python-pyparsing python-six python-urwid
+PYTHON_CONFIGSHELL_FB_SETUP_TYPE = hatch
+PYTHON_CONFIGSHELL_FB_DEPENDENCIES = host-python-hatch-vcs
+
+# The PyPI archive omits the compatibility symlink included in Git.
+define PYTHON_CONFIGSHELL_FB_RESTORE_COMPAT_SYMLINK
+	ln -s configshell $(@D)/configshell_fb
+endef
+PYTHON_CONFIGSHELL_FB_POST_EXTRACT_HOOKS += PYTHON_CONFIGSHELL_FB_RESTORE_COMPAT_SYMLINK
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
