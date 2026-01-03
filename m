Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095B8FC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B9F40359;
	Sat,  3 Jan 2026 11:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1SF6IrOZUkL; Sat,  3 Jan 2026 11:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC3C540399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440459;
	bh=2VaUrUyJbad8bGHkpA0PA5fTrRdZh1c47y9XzY3sCco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RNJMVGtQMRW/2FRZ1r8Jk9D+YCR31whf3xvZfVKwMq/AdaEYT0zH8K8gSR3Nkg0lz
	 GUikYpZ6jeMUFHupTbLqSJ0XKFSHQAfHINfUDvWLHcXigaqp+jk6UdOGtUt8gSJzY7
	 wK271bzNOjAWO1Iz9EUvLHCcItCjjksdOI2kQsfKaggPTfaxtIgjQXC+he3Jr0y7X/
	 aPKw/3YF631Z3dnzsHn5ncuAu/2NW/hK89mpnhfKSHLa1hcK4ad71zlSnp47s/6NI3
	 zTqz3aTpGs7GcN3Awl/eIR7gfNyaiutBVfbN/fWBeM7SSKXpmowaBH/WuDTfDbnakE
	 dKtDQlPRxsTiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC3C540399;
	Sat,  3 Jan 2026 11:40:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C30E440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49C30607AF
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ujw7ThVu5Wv2 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D789607AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D789607AC
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B57F88111; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:31:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d095402afe4659eed495b3e4149b0fd35c19eb8
X-Git-Newrev: 67d83670c72d895ff7806f4b31f0f3e7a20dd0bf
X-Patchwork-Hint: ignore
Message-Id: <20260103114057.6B57F88111@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-cors: bump to version
 6.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=67d83670c72d895ff7806f4b31f0f3e7a20dd0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-werkzeug runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-cors/Config.in              | 1 +
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
index fc0908e870..a9b72f662c 100644
--- a/package/python-flask-cors/Config.in
+++ b/package/python-flask-cors/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_FLASK_CORS
 	bool "python-flask-cors"
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
 	help
 	  A Flask extension adding a decorator for CORS support.
 
diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 974d4a7a9e..399cfb707b 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
-sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
+md5  3900828750db0cd4aa93fd9964d533a0  flask_cors-6.0.2.tar.gz
+sha256  6e118f3698249ae33e429760db98ce032a8bf9913638d085ca0f4c5534ad2423  flask_cors-6.0.2.tar.gz
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index c7bc338867..5049371956 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 6.0.1
+PYTHON_FLASK_CORS_VERSION = 6.0.2
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/70/74/0fc0fa68d62f21daef41017dafab19ef4b36551521260987eb3a5394c7ba
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
