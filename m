Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6BBD10BF5
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B25F181138;
	Sat, 26 Oct 2024 11:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyjRDkMhUFOJ; Sat, 26 Oct 2024 11:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCF0D810E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF0D810E5;
	Sat, 26 Oct 2024 11:03:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 305FA5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A696811EC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5mJAjA1Q6Oy for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B19F811F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B19F811F9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:03:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42F2A83948; Sat, 26 Oct 2024 11:03:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:00:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cf0fd8e9e3f05ec2e2841ef496abb89573d41f8
X-Git-Newrev: 0346de10e3b32b2e1dfeff46c0ad80034985684e
X-Patchwork-Hint: ignore
Message-Id: <20241026110319.42F2A83948@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/double-conversion: bump to 3.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0346de10e3b32b2e1dfeff46c0ad80034985684e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes between 3.2.1 and 3.3.0:

- Fix some compile warnings in Visual Studio by @Ono-Sendai in #188

- Set permissions for github workflows by @joycebrum in #191

- Add flags to control trailing decimal and zero in exponent form when
  input has one significant digit by @ianmcook in #195

See https://github.com/google/double-conversion/releases/tag/v3.3.0

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/double-conversion/double-conversion.hash | 2 +-
 package/double-conversion/double-conversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index a2ecd4422c..e3a5754933 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e40d236343cad807e83d192265f139481c51fc83a1c49e406ac6ce0a0ba7cd35  double-conversion-3.2.1.tar.gz
+sha256  04ec44461850abbf33824da84978043b22554896b552c5fd11a9c5ae4b4d296e  double-conversion-3.3.0.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index af1fbab078..74e90d30d7 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.2.1
+DOUBLE_CONVERSION_VERSION = 3.3.0
 DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
