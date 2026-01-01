Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89717EEB580
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15F52814D5;
	Thu,  1 Jan 2026 09:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcNyBqnWMAHt; Thu,  1 Jan 2026 09:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0792D816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260559;
	bh=bJI8pASDp2ZYLLShuNOrNWLQHb8zDn2IMqoSO4xQDh0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZtVYIaAQweths764+OuZHnqYH7BvIXS/Txf/v+MOIuD2sKfj63MSmMQZAiHQ6jTF4
	 m0BOpfX2BHzxw8aNBEToHJEn8xXcL5VVhLaq+4553rWVjJKfoMq/lWzUP3y/P/klR6
	 1Yea9/ZTNcGrorqwDG+oNXJTjVTYJTjO/fBXGzugW3a6P1qmyjnfMwOHFYxw42+8Wq
	 jAj/Si//b3vedQNByvNKNLFztQuYgLs9ChVbxbdzlGJBy/RSCHYGMAts0v7zXnBuEa
	 ATYnCj/27khstf2tj0td9fiAOi3ouFbJhJR+IYnMrK2BlSWeO4YBhxI3xqKuS8z/Ah
	 UflU02GAhpqgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0792D816DF;
	Thu,  1 Jan 2026 09:42:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4F9B206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D70DD607A1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAmYX8gK17Wk for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1054160779
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1054160779
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0531F86FB6; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b91258e424e68750615b6175f8fb9404522a5bfd
X-Git-Newrev: 9e0f9b5350f0389115c7d0b8affaa0f553164651
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.0531F86FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zc-lockfile: bump to
 version 4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e0f9b5350f0389115c7d0b8affaa0f553164651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Skip dependency check due to unnecessarily strict setuptools version
restriction.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zc-lockfile/python-zc-lockfile.hash | 4 ++--
 package/python-zc-lockfile/python-zc-lockfile.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-zc-lockfile/python-zc-lockfile.hash b/package/python-zc-lockfile/python-zc-lockfile.hash
index 97f05ddd3f..4a7433cc62 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.hash
+++ b/package/python-zc-lockfile/python-zc-lockfile.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zc.lockfile/json
-md5  5e902492de505a0f98e49b1e31cf2bc2  zc.lockfile-3.0.post1.tar.gz
-sha256  adb2ee6d9e6a2333c91178dcb2c9b96a5744c78edb7712dc784a7d75648e81ec  zc.lockfile-3.0.post1.tar.gz
+md5  fb4e4d2cc652aac97805e516ea287bf5  zc_lockfile-4.0.tar.gz
+sha256  d3ab0f53974296a806db3219b9191ba0e6d5cbbd1daa2e0d17208cb9b29d2102  zc_lockfile-4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zc-lockfile/python-zc-lockfile.mk b/package/python-zc-lockfile/python-zc-lockfile.mk
index 60648afc29..b060e537f4 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.mk
+++ b/package/python-zc-lockfile/python-zc-lockfile.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ZC_LOCKFILE_VERSION = 3.0.post1
-PYTHON_ZC_LOCKFILE_SOURCE = zc.lockfile-$(PYTHON_ZC_LOCKFILE_VERSION).tar.gz
-PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/5b/83/a5432aa08312fc834ea594473385c005525e6a80d768a2ad246e78877afd
+PYTHON_ZC_LOCKFILE_VERSION = 4.0
+PYTHON_ZC_LOCKFILE_SOURCE = zc_lockfile-$(PYTHON_ZC_LOCKFILE_VERSION).tar.gz
+PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/10/9a/2fef89272d98b799e4daa50201c5582ec76bdd4e92a1a7e3deb74c52b7fa
 PYTHON_ZC_LOCKFILE_SETUP_TYPE = setuptools
 PYTHON_ZC_LOCKFILE_LICENSE = ZPL-2.1
 PYTHON_ZC_LOCKFILE_LICENSE_FILES = LICENSE.txt
+PYTHON_ZC_LOCKFILE_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
