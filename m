Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F2CEACFB
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 20:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38C36608D9;
	Tue,  1 Oct 2024 20:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUraZqhH96Sk; Tue,  1 Oct 2024 20:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1885D608DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1885D608DE;
	Tue,  1 Oct 2024 20:03:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF6E21BF294
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C2AC4022E
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 20:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RthVIXnGHX5l for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 20:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC0140600
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AC0140600
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 20:03:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66D0E84631; Tue,  1 Oct 2024 20:03:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Oct 2024 21:59:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0509885d8dc221978fd332f9768b427ed2775942
X-Git-Newrev: d4cbc887a3bc6df8bf5d7c1a2a8bae349c275228
X-Patchwork-Hint: ignore
Message-Id: <20241001200318.66D0E84631@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.12.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4cbc887a3bc6df8bf5d7c1a2a8bae349c275228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.python.org/downloads/release/python-3126/

Fixes CVE-2023-27043, CVE-2024-6232, CVE-2024-7592 & CVE-2024-8088.

The fixes for bundled libexpat are irrelevant for us because python3
depends on the buildroot package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index d680a96810..0cd852c325 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3125/
-md5  02c7d269e077f4034963bba6befdc715  Python-3.12.5.tar.xz
+# From https://www.python.org/downloads/release/python-3126/
+md5  cb669514937d3e894e74081627722aa5  Python-3.12.6.tar.xz
 # Locally computed
-sha256  fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397  Python-3.12.5.tar.xz
+sha256  1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c  Python-3.12.6.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b31e6df141..4b328f70fb 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
