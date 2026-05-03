Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C1DCD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C5896104F;
	Sun,  3 May 2026 14:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCQb8MAXPinx; Sun,  3 May 2026 14:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4166E61182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819822;
	bh=NSY0VYHFtQT/J3/9vV5wRof3lmu+pNxvJvB3T3Hifps=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GrAHkEvKNR9x9fA05JmD3Dof36/ESsH+lpaqV85OhkxmwoHHmmyuvKNtS2wy0xA79
	 N0SlWQrmnVzFA+a6+3Tl1FnmuI73W1G/RKHg2WgMRIcpXxRt/a1LkepoPcR4AHRqHo
	 5+iC6ro+pfwCF0gWX8tE5dhA1BQiBUxuxQmO2YqNlwj16hwe5wfLnHROCBf7OsJGWS
	 BKGMhUUjynMx/LwGKHKcXh0HfU9hciTBVQmLnBf1mlQ0+/dXEF+YzSvEH6VWdDUy5i
	 SrLZrFXyAFqORWHeH9MnBwO6xBF209s8vY/iH5zXet2s44sNS0W/CQ6dDcZkpLf+FR
	 2IpTwTHYtWBwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4166E61182;
	Sun,  3 May 2026 14:50:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 497D6127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B06D61182
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFwEG5IoLP-X for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59D5E6104F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59D5E6104F
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40F6B83FC1; Sun,  3 May 2026 14:50:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3491e3e58826561da13d5448c1011411d0f57aa
X-Git-Newrev: 11e5013d97525365f19e794583bc2071d48f6fd9
X-Patchwork-Hint: ignore
Message-Id: <20260503145018.40F6B83FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-lru: bump version to
 2.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11e5013d97525365f19e794583bc2071d48f6fd9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/aio-libs/async-lru/blob/v2.3.0/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-async-lru/python-async-lru.hash | 4 ++--
 package/python-async-lru/python-async-lru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index 40cb990ee4..bd875cde78 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-lru/json
-md5  588dd2fcc8ca6a808a8ecbfca4f92ca1  async_lru-2.2.0.tar.gz
-sha256  80abae2a237dbc6c60861d621619af39f0d920aea306de34cb992c879e01370c  async_lru-2.2.0.tar.gz
+md5  11ff9ba26a6a52d3ec751a57dcacbde5  async_lru-2.3.0.tar.gz
+sha256  89bdb258a0140d7313cf8f4031d816a042202faa61d0ab310a0a538baa1c24b6  async_lru-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index 1a146ed2ad..2825c46053 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 2.2.0
+PYTHON_ASYNC_LRU_VERSION = 2.3.0
 PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/05/8a/ca724066c32a53fa75f59e0f21aa822fdaa8a0dffa112d223634e3caabf9
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/e8/1f/989ecfef8e64109a489fff357450cb73fa73a865a92bd8c272170a6922c2
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
