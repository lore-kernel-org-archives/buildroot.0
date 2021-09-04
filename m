Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBEAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A9360ED6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65A9360ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30BF840167;
	Sat,  4 Sep 2021 20:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PHCP4RQP9mlD; Sat,  4 Sep 2021 20:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D4BC401E3;
	Sat,  4 Sep 2021 20:48:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B813F1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9961240460
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvfwp6jyaEut for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C36A4045B
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:46:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D815884AC; Sat,  4 Sep 2021 20:44:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:27:07 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: dc016c5d16759499ece7d6ea2106130768ee04a3
X-Git-Newrev: 42e02f44bf7b1aa9672a41a637d269dccee6f272
X-Patchwork-Hint: ignore
Message-Id: <20210904204450.0D815884AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/prosody: security
 bump version to 0.11.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=42e02f44bf7b1aa9672a41a637d269dccee6f272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

fixes CVE-2021-37601
see https://blog.prosody.im/prosody-0.11.10-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 047b85e7d5c1b936d886bcda49fea9e7f435cbfa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/0001-enable-syslog.patch | 2 +-
 package/prosody/0002-add-pidfile.patch   | 2 +-
 package/prosody/prosody.hash             | 8 ++++----
 package/prosody/prosody.mk               | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/prosody/0001-enable-syslog.patch b/package/prosody/0001-enable-syslog.patch
index 16acc89c5a..5f09fa903e 100644
--- a/package/prosody/0001-enable-syslog.patch
+++ b/package/prosody/0001-enable-syslog.patch
@@ -11,7 +11,7 @@ diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
 index a0fc6c9e..af3cc0e4 100644
 --- a/prosody.cfg.lua.dist
 +++ b/prosody.cfg.lua.dist
-@@ -155,7 +155,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
+@@ -166,7 +166,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
  log = {
  	info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
  	error = "prosody.err";
diff --git a/package/prosody/0002-add-pidfile.patch b/package/prosody/0002-add-pidfile.patch
index 6221fd0856..0653ed7239 100644
--- a/package/prosody/0002-add-pidfile.patch
+++ b/package/prosody/0002-add-pidfile.patch
@@ -11,7 +11,7 @@ diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
 index af3cc0e4..675db12f 100644
 --- a/prosody.cfg.lua.dist
 +++ b/prosody.cfg.lua.dist
-@@ -176,6 +176,9 @@ log = {
+@@ -187,6 +187,9 @@ log = {
  -- HTTPS currently only supports a single certificate, specify it here:
  --https_certificate = "certs/localhost.crt"
  
diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 50d5964712..4579545e39 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  be7e1c66c06b0eb4bdce37b67bcc6b51  prosody-0.11.9.tar.gz
-sha1  632c2dd7794d344d4edbcea18fc1b5f623da5ca4  prosody-0.11.9.tar.gz
-sha256  ccc032aea49d858635fb93644db276de6812be83073a8d80e9b4508095deff09  prosody-0.11.9.tar.gz
-sha512  fabbbbb1acb3de4ff01e3e8c6e9e4dc37cb161259f1649683a1f9d925ed9f1709e052bfc831cba3f1861a9cca599f2b725ee739bfcb57164d6f50ac07011b52a  prosody-0.11.9.tar.gz
+md5  6130b79fb64141909330caf83a79a131  prosody-0.11.10.tar.gz
+sha1  4dc8b2f783b43e7a5e781b1fc8aee48b0e106def  prosody-0.11.10.tar.gz
+sha256  c6d714e6d4a6ddd1db1266b205d9d8a3ed91818f42755c9268ffb18359d204e1  prosody-0.11.10.tar.gz
+sha512  419d8f8465f1807015f0a52d8f35ee89892b0869084dae38b60fc833d63c3d70892d8e59ae00039cd15e0e25f46d042954896f51f8c0520650a877f5296707cb  prosody-0.11.10.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 92c812ebfa..0eeb32cd3f 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.9
+PROSODY_VERSION = 0.11.10
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
