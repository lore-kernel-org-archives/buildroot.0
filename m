Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979F6C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 15:08:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2609C610A1
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 15:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2609C610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0273E83EC3;
	Fri,  3 Sep 2021 15:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqslvyGG3c0G; Fri,  3 Sep 2021 15:08:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F7283EA7;
	Fri,  3 Sep 2021 15:08:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03ADA1BF2EB
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 15:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 011C240200
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 15:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8OwKUiq3VPx for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 15:08:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBA59401B2
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 15:08:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4BDE4881F4; Fri,  3 Sep 2021 15:07:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Sep 2021 17:07:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc7eaf3bee861a0e211f7382487e36466c6f6550
X-Git-Newrev: c8bf903e7acbedf54c1dd66d5fad6fa624329c80
X-Patchwork-Hint: ignore
Message-Id: <20210903150715.4BDE4881F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump to version
 3.9.7
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
Content-Type: multipart/mixed; boundary="===============5778176545632873326=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============5778176545632873326==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c8bf903e7acbedf54c1dd66d5fad6fa624329c80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- bpo-42278: Replaced usage of tempfile.mktemp() with TemporaryDirectory to
  avoid a potential race condition.

- bpo-41180: Add auditing events to the marshal module, and stop raising
  code.__init__ events for every unmarshalled code object.  Directly
  instantiated code objects will continue to raise an event, and audit event
  handlers should inspect or collect the raw marshal data.  This reduces a
  significant performance overhead when loading from .pyc files.

- bpo-44394: Update the vendored copy of libexpat to 2.4.1 (from 2.2.8) to
  get the fix for the CVE-2013-0340 “Billion Laughs” vulnerability.  This
  copy is most used on Windows and macOS.

- bpo-43124: Made the internal putcmd function in smtplib sanitize input for
  presence of \r and \n characters to avoid (unlikely) command injection.

https://www.python.org/downloads/release/python-397/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 36e89a0678..444dbd982a 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-396/
-md5  ecc29a7688f86e550d29dba2ee66cf80  Python-3.9.6.tar.xz
+# From https://www.python.org/downloads/release/python-397/
+md5  fddb060b483bc01850a3f412eea1d954  Python-3.9.7.tar.xz
 # Locally computed
-sha256  397920af33efc5b97f2e0b57e91923512ef89fc5b3c1d21dbfc8c4828ce0108a  Python-3.9.6.tar.xz
+sha256  f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57  Python-3.9.7.tar.xz
 sha256  599826df92bfdcd2702eac691072498bb096c55af04ee984cf90f70ed77b5a70  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d491a4c800..3e88bc0ff4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.9
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============5778176545632873326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5778176545632873326==--
