Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FA9D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC288148B;
	Sun, 14 Dec 2025 17:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XHtKzUumE50; Sun, 14 Dec 2025 17:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF4581567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734481;
	bh=6ND59WjEvgIiDEKfJ/n+qOAjJhPpANwpw7aq6SCq6d4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A6OM+nB8ZCpLIUQyuUwYDBS+ih3xacldMdVvGPjj/l4CpnlnJ2WZ3jTAUW3sLATYx
	 h9oVWFzi0w7GD/D0ZE+CueaRtDfn6m/oRTLHMCWIqy/UVKwz2sZ+pkxtJyWYYFzBG2
	 ixAAAtNWLrw8k13xyUjlo730bIRntW0Yu8dQpWX4oHV1A1cVbt0Os7j4ru4h/DGOZd
	 tIIh6/rTKGA00CoQueA2VhG9agd5KK4B9+QEL8hY08Qh01YZw48AldPwgHnSxZ3vUz
	 YaoAhRk7+knmixx3QhXlhJYRo0TPEs2zf74hevQ1vSFNwt/Upt2x9nf+lY1m58uazn
	 8hY0iajL/06GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CF4581567;
	Sun, 14 Dec 2025 17:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E19A117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B924D60A8A
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNzKlSkarXpZ for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51DB160D97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51DB160D97
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5182586E96; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc9568d588d389a5dc09c053ba0a7a62ffcdfbb3
X-Git-Newrev: 7b24c6e6c1b979f1fcbf0d0dc6c3cbfa13d83593
X-Patchwork-Hint: ignore
Message-Id: <20251214174743.5182586E96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-orjson: bump version to
 3.11.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b24c6e6c1b979f1fcbf0d0dc6c3cbfa13d83593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/ijl/orjson/blob/3.11.5/CHANGELOG.md

Fixes build with python 3.14.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 54594749fe..f55aab62ef 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  b4a77b2489f8ffe81f9b1037f1c17fd6bf89291b82888f176dbeac00e9cdc0f9  python-orjson-3.10.15-cargo4.tar.gz
+sha256  ab71a5f3d6efb4a3dd0cacad24e62d774907be42ba2e01be8a3ddeecf46d078b  python-orjson-3.11.5-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 29325e2f67..9b5016c9e4 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.10.15
+PYTHON_ORJSON_VERSION = 3.11.5
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/ae/f9/5dea21763eeff8c1590076918a446ea3d6140743e0e36f58f369928ed0f4
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/04/b8/333fdb27840f3bf04022d21b654a35f58e15407183aeb16f3b41aa053446
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
