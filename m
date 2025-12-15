Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7A2D5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2BC81E57;
	Mon, 15 Dec 2025 21:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3o6z4ZZJQIh; Mon, 15 Dec 2025 21:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 826A381EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834734;
	bh=FTWgb/j2NuaVNtLBH6+tWNdxmahcEtmjL6G9NxGE4+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E3G9xdRqfvRP/6QetAtc9CX0LtqUzQwXmsOgk8OezQqRBY9qCrKHfF2Io71hq/Uks
	 n5pyi50h5KA0d+O74wm5X1NnJikCiuNalclWAvpXMzVRcM6y38SlidPYQtpfq8D8rw
	 B28BBhTwmaiKdmmyvMMvPkSq3FGXlxVprHeuA2Syrl3tq+VdPiHwrElgQ0WLCMDMHj
	 d98yz9SDE8AppsZZOhGJ7dgEIBdTGin7xWRFC6v5uVF2jb45nRHuQLEl2SAjXIMvKR
	 LL03ypg2arNl/QVrpVr9B66RsHrgeISO87c8vC1uHwNHG+7JHMkJ3MYwcHdEBeqz7t
	 M02lNwPnVDM5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 826A381EA5;
	Mon, 15 Dec 2025 21:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 855EB151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71D6D81DE3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zt_3gOVFFzp3 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A63781DE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A63781DE5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4798186FC5; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d038740b7c143d22347105213409bbe0fa6b59bd
X-Git-Newrev: 4df1c7afb0b70bdcf99720855ccd6341086e4a27
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.4798186FC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psygnal: bump version to
 0.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4df1c7afb0b70bdcf99720855ccd6341086e4a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pyapp-kit/psygnal/blob/v0.15.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-psygnal/python-psygnal.hash | 4 ++--
 package/python-psygnal/python-psygnal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psygnal/python-psygnal.hash b/package/python-psygnal/python-psygnal.hash
index f378861063..7903fcff26 100644
--- a/package/python-psygnal/python-psygnal.hash
+++ b/package/python-psygnal/python-psygnal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psygnal/json
-md5  13955249103622604d4022e7d5ef94e0  psygnal-0.11.1.tar.gz
-sha256  f9b02ca246ab0adb108c4010b4a486e464f940543201074591e50370cd7b0cc0  psygnal-0.11.1.tar.gz
+md5  9d1939a916e54ddd9324a623fb360bc8  psygnal-0.15.0.tar.gz
+sha256  5534f18e2d1536675e181c6f81cf04f4177b25a9e60fdcf724a25ce5cc195765  psygnal-0.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  50169b145e35e6ae11a1e05cebdaa7052a58a8a2325dd5c394f8a68199c78415  LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
index 5bfa1e6742..2708931f1e 100644
--- a/package/python-psygnal/python-psygnal.mk
+++ b/package/python-psygnal/python-psygnal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYGNAL_VERSION = 0.11.1
+PYTHON_PSYGNAL_VERSION = 0.15.0
 PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
-PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/bc/b0/194cfbcb76dbf9c4a1c4271ccc825b38406d20fb7f95fd18320c28708800
+PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/5a/20/70430999aa609adb0601ec0f72bd23790a6e51a80ae6e7dc6621e6c5ee2a
 PYTHON_PSYGNAL_SETUP_TYPE = hatch
 PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
 PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
