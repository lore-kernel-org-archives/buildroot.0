Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429BCC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:10:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0731360EBC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0731360EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D46D9614B1;
	Thu, 26 Aug 2021 22:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjK-UjjBPX6p; Thu, 26 Aug 2021 22:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59BC3614B3;
	Thu, 26 Aug 2021 22:10:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 263001C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CC03426B2
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSMcCkFsmrCB for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08AC1426B4
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5DFEA8DC52; Thu, 26 Aug 2021 22:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 00:02:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 921830e92d8bc79c444b9c03d9af4242226434e6
X-Git-Newrev: 047b85e7d5c1b936d886bcda49fea9e7f435cbfa
X-Patchwork-Hint: ignore
Message-Id: <20210826220129.5DFEA8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/prosody: security bump
 version to 0.11.10
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=047b85e7d5c1b936d886bcda49fea9e7f435cbfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

fixes CVE-2021-37601
see https://blog.prosody.im/prosody-0.11.10-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
