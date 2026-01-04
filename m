Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77895C2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2748F60728;
	Sun,  4 Jan 2026 10:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQkOYYT-SJ6R; Sun,  4 Jan 2026 10:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E3F0606DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767522689;
	bh=LWdzFcj0+Nz+KyCY6AkO4Vmpyl+Zh+1DE+lUHky31iM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q8crXjjKIDOMqJZJVFt5B1KWaFy3j6mtrUeABy2Z8Zdp55kutwl8PW4QFBdjyRxt+
	 qexxsRYOYpWw8qnK4H3V+i5m20R/zzsKqZ4DsZaTZ3aYNad+tKfN5FCqaoBVrL5mJa
	 5brP4nQqr1binAPcS4lo+qtBZ4rSqYOpyq0WtN2UHSwFmmC7y3n2cr4YlVRCxB8lLw
	 v1BWmQxXUziSCDngOVdnWyMx68is3dqqRxzHxWwfIVwyd/Bcxl7xrnS5HQ1Lp/Q8aI
	 0Xwzfmjl/yvIaHxiTqMM6XfQmQAMqfU/jSFhFWooknx7bznNhGYEOhgiuFipHhFS3C
	 9ZuORf9T3bA1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E3F0606DC;
	Sun,  4 Jan 2026 10:31:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8D5D249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB64180B84
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJQ_BaUZvXmn for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBCA980B34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBCA980B34
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE5A687F37; Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 11:21:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b4d7621a1e99837637b4209187668975cd91d82
X-Git-Newrev: bfb545d502f19a86481c75f96b0233780da2a17c
X-Patchwork-Hint: ignore
Message-Id: <20260104103126.AE5A687F37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 3.20.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfb545d502f19a86481c75f96b0233780da2a17c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 30bd3b1c97..64930ad418 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  273703b56caed22470cda2a528182fef  filelock-3.20.1.tar.gz
-sha256  b8360948b351b80f420878d8516519a2204b07aefcdcfd24912a5d33127f188c  filelock-3.20.1.tar.gz
+md5  c422db4828e34fcadac68449fafd5cb2  filelock-3.20.2.tar.gz
+sha256  a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64  filelock-3.20.2.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index ec958869a0..83699377e1 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.20.1
+PYTHON_FILELOCK_VERSION = 3.20.2
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/a7/23/ce7a1126827cedeb958fc043d61745754464eb56c5937c35bbf2b8e26f34
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/c1/e0/a75dbe4bca1e7d41307323dad5ea2efdd95408f74ab2de8bd7dba9b51a1a
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
