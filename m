Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF14C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 12:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691F341C60;
	Tue, 11 Apr 2023 12:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 691F341C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Pr70JJXM5Od; Tue, 11 Apr 2023 12:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402C741C3B;
	Tue, 11 Apr 2023 12:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 402C741C3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB2B1C3C00
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 730EE41BF0
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730EE41BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI9WKINImg-T for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 12:21:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67D8E41BF4
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 12:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D8E41BF4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5684183F9C; Tue, 11 Apr 2023 12:21:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 14:19:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 644110a921da65c539fe1c9277f94afaa1e30d83
X-Git-Newrev: 5a8b764cd8aba8a060b3db1acf63c5ffaa9c0a69
X-Patchwork-Hint: ignore
Message-Id: <20230411122149.5684183F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libite: bump
 version to v2.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a8b764cd8aba8a060b3db1acf63c5ffaa9c0a69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes, from https://github.com/troglobit/libite/releases/tag/v2.5.3

 - rsync() does not copy single files correctly
 - copyfile() does not handle empty source files correctly (error)
 - copyfile() does not properly create destination dir

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit be44dcf6957210b88fb2591817bd76eba14ee7b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libite/libite.hash | 2 +-
 package/libite/libite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 8b622d87a9..7dac198ab8 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  baa9bf9931427ef5e9ddfc5b72139981047a8d0d3c03a534d9716de38cf18bb5  libite-2.5.2.tar.xz
+sha256  ca086adc7ebf0c2ebf2ed7a6787f9567fb802db8583576228dd5dd5ddfb7bb97  libite-2.5.3.tar.xz
 
 # Locally calculated
 sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 66a8253c62..1cef992e53 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.5.2
+LIBITE_VERSION = 2.5.3
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
