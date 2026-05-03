Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD8ECD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7753E8422A;
	Sun,  3 May 2026 14:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwXYM4YAq_rZ; Sun,  3 May 2026 14:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 926CD84228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819866;
	bh=Cb8cMwU+241Jyn5vvDM/tjLt0pdRoPbqYmspHKnTiQw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WgWIVIV5/MB3HxNtDrnsCbDyIfk50CR+s3EduUfPg/CRQ4WFmuWqH+8lRHi+jOvm4
	 T+cvYcHxIQ0cPUPwAtVy9uBLRbr5683ZLEWuxhSeHNItJzfvKrTSoL1K9eN4pmCBRC
	 /HJs4JW3Qrq/v0b6UanjmwD0rP7+aI7WKXqntPnSwJ/Dl/tiyq7DbSnpcueLTHsT3Q
	 AeA+2POiQNaXzQ8uA9/h1X+7F00/aHrPP2lnXsVO4p6CS4xcVZNU+7M8RSDcORw6WZ
	 cudwV1U1rJLzppzawNKwrnoF1zAPvRrYzjS6kcd4MtEkMqg7cNOi36vJxbvlGo6xvn
	 Tu/A2eWOp2w3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 926CD84228;
	Sun,  3 May 2026 14:51:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C156D190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8119C40D99
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3xRPVsWwFJM for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D87F441531
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D87F441531
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EA7D83E54; Sun,  3 May 2026 14:50:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8000bbbfb527a06892402956853fdb7114b8c14
X-Git-Newrev: 2be360a44de5754251d2ee0c7074cb1068725cf3
X-Patchwork-Hint: ignore
Message-Id: <20260503145032.8EA7D83E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump version
 to 4.9.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2be360a44de5754251d2ee0c7074cb1068725cf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tox-dev/platformdirs/blob/4.9.6/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index cc92e4a824..3e2f4ea59a 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  8168f7450c9606bfa4a28268f0f59a37  platformdirs-4.9.4.tar.gz
-sha256  1ec356301b7dc906d83f371c8f487070e99d3ccf9e501686456394622a01a934  platformdirs-4.9.4.tar.gz
+md5  6b9f7a12243ab0609a433bcf2f641c6b  platformdirs-4.9.6.tar.gz
+sha256  3bfa75b0ad0db84096ae777218481852c0ebc6c727b3168c1b9e0118e458cf0a  platformdirs-4.9.6.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 11e8acd078..c3a7df9037 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.9.4
+PYTHON_PLATFORMDIRS_VERSION = 4.9.6
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/19/56/8d4c30c8a1d07013911a8fdbd8f89440ef9f08d07a1b50ab8ca8be5a20f9
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9f/4a/0883b8e3802965322523f0b200ecf33d31f10991d0401162f4b23c698b42
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
