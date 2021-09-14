Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C0FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:03:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED88860F58
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED88860F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C895960AC8;
	Tue, 14 Sep 2021 13:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZAnTJ09JofZG; Tue, 14 Sep 2021 13:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F570607DA;
	Tue, 14 Sep 2021 13:03:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFAC91BF2F6
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADBBD607D3
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2obSMKeTTXuZ for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 13:01:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0489607DA
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 13:01:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0CC4B8B38B; Tue, 14 Sep 2021 12:59:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 14:59:38 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 18b0456713beacd07581021b714e78805e5332d4
X-Git-Newrev: 9eb977f0022408ad9d7bf6e2f53b8dbff81a95e6
X-Patchwork-Hint: ignore
Message-Id: <20210914125932.0CC4B8B38B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-pillow:
 security bump to version 8.3.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9eb977f0022408ad9d7bf6e2f53b8dbff81a95e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Fix CVE-2021-23437 Raise ValueError if color specifier is too long
- Fix 6-byte OOB read in FliDecode
- Update indentation in hash file (two spaces)

https://github.com/python-pillow/Pillow/releases/tag/8.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a7919e68a60c6055bb2a729b5aeb6d47e7bbe924)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.hash | 7 ++++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index fb1ec53a00..3b5bdf2535 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  e42fc66e41b5309436a573af49cec47c  Pillow-8.3.1.tar.gz
-sha256	2cac53839bfc5cece8fdbe7f084d5e3ee61e1303cccc86511d351adcb9e2c792  Pillow-8.3.1.tar.gz
+md5  a7fc550b80819eab11e01cc097913700  Pillow-8.3.2.tar.gz
+sha256  dde3f3ed8d00c72631bc19cbfff8ad3b6215062a5eed402381ad365f82f0c18c  Pillow-8.3.2.tar.gz
+
 # Locally computed sha256 checksums
-sha256	5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
+sha256  5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index a55a937c11..168c9d632c 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 8.3.1
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/8f/7d/1e9c2d8989c209edfd10f878da1af956059a1caab498e5bc34fa11b83f71
+PYTHON_PILLOW_VERSION = 8.3.2
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/90/d4/a7c9b6c5d176654aa3dbccbfd0be4fd3a263355dc24122a5f1937bdc2689
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
