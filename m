Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284DDD5B16E
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7014B60A3D;
	Sun, 14 Dec 2025 21:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SClOLIF8SIAZ; Sun, 14 Dec 2025 21:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E0A60D8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747302;
	bh=wJPP0na+p6otdMBcNvps8I06Mcr0HjveZhv8gYX1PYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WgXOf2KAxIE1MW89JysQelNM7OSc40hj9MhuAb6dyxIUoicwpA1jqIMWof980QBdN
	 zAe0Baykr1Y2PZzyJLAaILQYAfAEkonBqELXHsJsPIODxfS79uFcgGzKEWZ7bZmItk
	 ooD9fvFAqN5atCc0B0RZMyc0VZLnBBThFXXz1Yt/Umtl1yxhFI8zO2htmK/WUaz6wV
	 +y2D05BCdQuWB5wZG78W0lvvErE+omLAvI21f3R0MNpCFXmDN1YPRy/l843MMWWzwJ
	 UD/P7sSNbdCxRgwI8gu3LU0eXH0fZ0JdmxIO5ocGE88Lok/SiS2SWnx/yPKN8z5LC/
	 bn568udD2HGGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E0A60D8B;
	Sun, 14 Dec 2025 21:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4A2E2ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB4A660B39
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwCVJewYnVu9 for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0DA760877
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0DA760877
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E27C984524; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc2321bb50076f585b7a9a0f1858c381d13a2051
X-Git-Newrev: 1fa6431284ae0fa27d5da72e9bea547c6f2ede8b
X-Patchwork-Hint: ignore
Message-Id: <20251214212139.E27C984524@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-falcon: bump version to
 4.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fa6431284ae0fa27d5da72e9bea547c6f2ede8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://falcon.readthedocs.io/en/stable/changes/4.2.0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index fb5d4dca71..f7d2d358cd 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  062a6d925bdf9c0be791d736ab6b0e82  falcon-4.1.0.tar.gz
-sha256  dbc3fa642b43e7662f121d0a7b5d7ea42a1a31fb22ae63572c42ee3ecd1f79d0  falcon-4.1.0.tar.gz
+md5  d4d156864d62dfd93abc2fde90ad6fa0  falcon-4.2.0.tar.gz
+sha256  c13e86e49696d6655411fe09473c34997e49ff45e8cdf7576297b0ca71ceac3d  falcon-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 91bcd1dd18..e6ad8f5d80 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 4.1.0
+PYTHON_FALCON_VERSION = 4.2.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/90/85/a4abc8357f6bc6b6b0b3d80e2c319c895900c518a3528279a222d7a53b7e
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/ba/15/5a4d8d62e8b338d2ec4430965b51b592695e859d0c6bf104afa1ce927eed
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
