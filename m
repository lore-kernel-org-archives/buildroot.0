Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551B5C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 12:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 068FB404C8;
	Mon, 16 Sep 2024 12:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAFRu2Am0lcl; Mon, 16 Sep 2024 12:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B873A40654
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B873A40654;
	Mon, 16 Sep 2024 12:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29A631BF21A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 12:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1835E40318
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 12:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyZ7ou60PEKX for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 12:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D078D400DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D078D400DA
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 12:51:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C44B683915; Mon, 16 Sep 2024 12:51:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 14:51:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 648bd52b4a4ddb6f77dccd42e1733af90d9d9c24
X-Git-Newrev: 91afa8c8ccdfa668b59e00dc566585c6b450dc87
X-Patchwork-Hint: ignore
Message-Id: <20240916125152.C44B683915@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysklogd: bump to v2.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=91afa8c8ccdfa668b59e00dc566585c6b450dc87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From https://github.com/troglobit/sysklogd/releases/tag/v2.6.2:

 - syslog.conf: misplaced continuation character in example
 - Add facility aliases for RFC5424 compliance: LOG_CRON2 and LOG_AUDIT,
   including facilitynames[] = cron2, audit.  Used by the native logger
   tool (and any clients linking to libsyslog)
 - Fix data corruption using the listen directive, introduced in 2.6.0
 - Fix IPv6 addresses in listen directive, introduced in 2.6.0
 - Fix logging to remote IPv6 address, add support for parsing
   [fdd5::6979:c0ff:ee87:8f92]:123 style addresses
 - Fix initial delay for unresolvable remote target.  When a DNS name
   cannot be resolved, e.g., critically at boot, syslogd blocked with
   default resolver timeout (5 * 2 sec)

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 0a5790a1a5..8b1cd63a73 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  e35d5c5f55019976302ac9818890bd6b6858db257506f0e9afaa718a8dee9cc3  sysklogd-2.6.1.tar.gz
+sha256  40a3bb593d7507e49a4379f48ae8a9bc4b68dcc583efcdbf3b9056128442c92a  sysklogd-2.6.2.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 86bd4ef168..eeb3a3748d 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.6.1
+SYSKLOGD_VERSION = 2.6.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
