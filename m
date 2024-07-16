Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2BBC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B124640BAD;
	Tue, 16 Jul 2024 12:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sauQ2ij4NKIt; Tue, 16 Jul 2024 12:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54D9E40BCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54D9E40BCA;
	Tue, 16 Jul 2024 12:43:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 707FF1BF3E3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57E28403B6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPVjoOnwocW6 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F09A402DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F09A402DA
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 350CC86B9E; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 14:41:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a845781866a5de8ae5a60bc447ee130ccc012e49
X-Git-Newrev: dd5bd455de145f98d858bc30cf84d53aecd31207
X-Patchwork-Hint: ignore
Message-Id: <20240716124308.350CC86B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysklogd: bump to v2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd5bd455de145f98d858bc30cf84d53aecd31207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- New command line flag -l to control klogctl(2) on/off and allow raw
   kernel logs to console, use with 'quiet' kernel cmdline option
 - Add reload command for systemd service
 - Add *.conf support for rotate_size and rotate_count
 - Add *.conf support for listen addr:port
 - Fix blocking delay for unresolvable DNS names when logging to remote
 - Fix failure to bind to not-yet-set IP address by retrying every 5 sec

Full ChangeLog at https://github.com/troglobit/sysklogd/releases/tag/v2.6.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 7e00990174..361d68a157 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  9da4444285772ce2bfc9c687be8f978b7a9fe7d3937347cd4938eda0c4545e05  sysklogd-2.5.2.tar.gz
+sha256  c5ae067b479b54ef90fa9352c277d44ff7b4314023fc6ee0a37e81b99a78a917  sysklogd-2.6.0.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 083f505a2b..7abb830119 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.5.2
+SYSKLOGD_VERSION = 2.6.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
