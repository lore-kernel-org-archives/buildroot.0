Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED81C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:01:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3DD61026
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B3DD61026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEF140646;
	Fri, 10 Sep 2021 10:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xft5RwSKTNLf; Fri, 10 Sep 2021 10:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C95A40665;
	Fri, 10 Sep 2021 10:01:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6811BF2F5
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB04D405F4
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p53QECH0Ro4H for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 10:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E146040620
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:01:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 80C258896D; Fri, 10 Sep 2021 09:59:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 11:59:47 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: bd112c6928076dc516bffb34bdd2c2278211c6ff
X-Git-Newrev: ccf33a704aa0cb38f0c4faaf965aeb719f038cba
X-Patchwork-Hint: ignore
Message-Id: <20210910095952.80C258896D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/python3: security
 bump to version 3.9.7
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
Content-Type: multipart/mixed; boundary="===============0128040200238184695=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============0128040200238184695==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ccf33a704aa0cb38f0c4faaf965aeb719f038cba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit c8bf903e7acbedf54c1dd66d5fad6fa624329c80)
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
index c289d41dea..0fab0dd9ba 100644
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

--===============0128040200238184695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0128040200238184695==--
