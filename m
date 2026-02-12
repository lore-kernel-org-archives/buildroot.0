Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8419EE36BD
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 18:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B2F8431A;
	Thu, 12 Feb 2026 18:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Fq6T6tYHLEm; Thu, 12 Feb 2026 18:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D792B842A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770919614;
	bh=h++HdxqXUnHvXAraoTlSmBxZik1LC4B9igEXxrFpctw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MQIQJ1dccYBYbWW4OXRzX70qw62OpNiN6u47aFZNR8FNqYE5bgZj6gaNuOROUKlZD
	 gBkK8hOCb3BzFhqMnNqkw/81NwW1ckwa4+Ec+/D7CVDd4DU/mvu4zZnppDgN4QJ+w+
	 zaDvo3jrCrraPHPJ9OarAZF9xsjNljrUWPVYy1JCragYDJD/YdKU6YQil6FJGOR94v
	 aCmq7RNy3xBT23+I1Ix1KhdH+4ZJvXup1SN4TEMKclg5jbSSEj1YicxqZsNKVxcFi7
	 XKuSiKLcfrOpCOFFySm6lmzt3TyPqZ/r8aaJFfLFmbG4jNrUvzGCK4gC8bfnhG+Rnd
	 xozb5zBZD/Raw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D792B842A7;
	Thu, 12 Feb 2026 18:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95BD89CE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 863BA607CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rli7DPFpwiD3 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 18:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B389660758
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B389660758
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A343386C53; Thu, 12 Feb 2026 18:06:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 18:57:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: babedec9f65c1eecc900a83ad95771763a7266cd
X-Git-Newrev: beba0e7a7852f5d5bce58ff4011be745e8aa9271
X-Patchwork-Hint: ignore
Message-Id: <20260212180652.A343386C53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asgiref: security bump to
 3.11.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/beba0e7a7852f5d5bce58ff4011be745e8aa9271
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2025-14550:
  There was a potential DoS vector for users of the
  ``asgiref.wsgi.WsgiToAsgi`` adapter. Malicious requests, including an
  unreasonably large number of values for the same header, could lead to
  resource exhaustion when building the WSGI environment.

Changelog: https://github.com/django/asgiref/blob/3.11.1/CHANGELOG.txt

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 89495e0257..aecbdf8000 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  554794453502d266a90d2254fcb1f7c3  asgiref-3.11.0.tar.gz
-sha256  13acff32519542a1736223fb79a715acdebe24286d98e8b164a73085f40da2c4  asgiref-3.11.0.tar.gz
+md5  85bc32494d842f4941e2b1fc2c7b61cb  asgiref-3.11.1.tar.gz
+sha256  5f184dc43b7e763efe848065441eac62229c9f7b0475f41f80e207a114eda4ce  asgiref-3.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index e5885a66c6..392f0a1c1e 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.11.0
+PYTHON_ASGIREF_VERSION = 3.11.1
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/76/b9/4db2509eabd14b4a8c71d1b24c8d5734c52b8560a7b1e1a8b56c8d25568b
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/63/40/f03da1264ae8f7cfdbf9146542e5e7e8100a4c66ab48e791df9a03d3f6c0
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
