Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B4AC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1833F404DF;
	Sat, 20 Jul 2024 21:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lz94P1q9kO7; Sat, 20 Jul 2024 21:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D02640471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D02640471;
	Sat, 20 Jul 2024 21:03:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2AD1BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70140403D4
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WMSY8ImOR_z for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD7F40405
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DD7F40405
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:03:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B12786D80; Sat, 20 Jul 2024 21:03:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:02:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5466a4303d7652c217139bf0dc0b1eb9d6ba0c5
X-Git-Newrev: 321e065516a64198f586632bd83411767d98fe6c
X-Patchwork-Hint: ignore
Message-Id: <20240720210313.4B12786D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/augeas: bump to version 1.14.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=321e065516a64198f586632bd83411767d98fe6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with gcc >= 14 thanks to
https://github.com/hercules-team/augeas/commit/792fb220a31a42043de6962fac6a1f6c030d67c5:

internal.c: In function 'xstrerror':
internal.c:436:12: error: returning 'int' from a function with return type 'const char *' makes pointer from integer without a cast [-Wint-conversion]
  436 |     return strerror_r(errnum, buf, len);
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/hercules-team/augeas/blob/release-1.14.1/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/65014642966721115ae4050c23b083a7f39e1300

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/augeas/augeas.hash | 5 ++---
 package/augeas/augeas.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
index 03b71349ac..b3b2a2427c 100644
--- a/package/augeas/augeas.hash
+++ b/package/augeas/augeas.hash
@@ -1,4 +1,3 @@
-# Locally calculated after checking pgp signature from
-# http://download.augeas.net/augeas-1.12.0.tar.gz.sig
-sha256  321942c9cc32185e2e9cb72d0a70eea106635b50269075aca6714e3ec282cb87  augeas-1.12.0.tar.gz
+# Locally calculated
+sha256  368bfdd782e4b9c7163baadd621359c82b162734864b667051ff6bcb57b9edff  augeas-1.14.1.tar.gz
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index a0bc294565..ac4bc7d0be 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AUGEAS_VERSION = 1.12.0
-AUGEAS_SITE = http://download.augeas.net
+AUGEAS_VERSION = 1.14.1
+AUGEAS_SITE = https://github.com/hercules-team/augeas/releases/download/release-$(AUGEAS_VERSION)
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
 AUGEAS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
