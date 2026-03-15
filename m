Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECB1F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAD19612DD;
	Sun, 15 Mar 2026 22:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwNn6lIdawF9; Sun, 15 Mar 2026 22:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B797761330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613146;
	bh=FWgNml+aFeZp21sjVPsr9ACbKATLUhOIuaqvHURPn2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ffDlCq6tCVwqpJS+q5PEpftrXhqkAKVq0+Bhq6YUAqBvLJ/yCzNXWad5gh4yfSCa0
	 2s2Uyc/98KH83dIkFx4QgBqo8J6xpty8wIqiyhN6XnnnHQSaK4olvIdSkj97pE9XZm
	 BMAiqUWv5CJEgRMNJAFHK3QsoTY+NzO9dv/M7PBjhqYdvmRLg7RQtXTBYUQnLItJ4u
	 GJH436kjC5B2Xhulc/Bthrd74rrdtWlzZvbv83zIo6fTusV+B5mkIQufwaF1YclqDs
	 S1OSgeE+l/f6cag6eXr6lr5k/64AlplP8sfMSOb0C1pE9nMAL1pbbTj9fFGj1458pD
	 hRl5y3aE7iuCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B797761330;
	Sun, 15 Mar 2026 22:19:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D1B1B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44D4D40ACF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbF0OM-0E-EI for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D29904095F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D29904095F
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20E2D85BFF; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4cffe0fa2eec114f99a2b795677237e450003c0
X-Git-Newrev: 4c6a163a89bb8d20dbb9517587ca15b4a9922b20
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.20E2D85BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-settings: bump
 version to 2.13.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c6a163a89bb8d20dbb9517587ca15b4a9922b20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pydantic/pydantic-settings/releases/tag/v2.13.0
https://github.com/pydantic/pydantic-settings/compare/v2.13.0...v2.13.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 90a1260219..7d450bd9a3 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  597adf8b487b9297eda123b211666e98  pydantic_settings-2.12.0.tar.gz
-sha256  005538ef951e3c2a68e1c08b292b5f2e71490def8589d4221b95dab00dafcfd0  pydantic_settings-2.12.0.tar.gz
+md5  11f7d886512c22a68c740c3e2b58651f  pydantic_settings-2.13.1.tar.gz
+sha256  b4c11847b15237fb0171e1462bf540e294affb9b86db4d9aa5c01730bdbe4025  pydantic_settings-2.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index a7c50b8027..8ed968601d 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.12.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.13.1
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/43/4b/ac7e0aae12027748076d72a8764ff1c9d82ca75a7a52622e67ed3f765c54
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/52/6d/fffca34caecc4a3f97bda81b2098da5e8ab7efc9a66e819074a11955d87e
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
