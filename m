Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD188C282EC
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 21:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A43140713;
	Wed,  5 Mar 2025 21:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83Z7Lv_TGgMX; Wed,  5 Mar 2025 21:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2069F40680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2069F40680;
	Wed,  5 Mar 2025 21:54:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97CEFE2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA266001B
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4RY01W5pC1F for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 21:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C034C6066A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C034C6066A
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:54:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E52B874C7; Wed,  5 Mar 2025 21:54:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 22:51:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1b1696b408ad3b9cab1e2b68151c38470806e0e8
X-Git-Newrev: 7a0725723b80ebf5fb0984410f7b4b665f9ee49d
X-Patchwork-Hint: ignore
Message-Id: <20250305215444.9E52B874C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sysklogd: bump to
 v2.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a0725723b80ebf5fb0984410f7b4b665f9ee49d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Update syslogd -T documentation, it applies to messages originating
   both locally and from remote syslog servers
 - Fix hostname filtering support, introduced in v2.7.0, broken
 - Fix parsing of userspace messages in /dev/kmsg, inserted an
   extra space before the message payload

From https://github.com/troglobit/sysklogd/releases/tag/v2.7.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sysklogd/sysklogd.hash | 4 ++--
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 4024965e23..645bc6a0ae 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,4 +1,4 @@
-# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.0
-sha256  6ab74ab5001121bb32697fd2f7ab3cc4b4452c3f721677e06e5b60982a04d0cc  sysklogd-2.7.0.tar.gz
+# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.1
+sha256  69944b2227647bf47ee01c9f482d19a79dbf2b53b8ce8ded0486b08db8c68c40  sysklogd-2.7.1.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index e8b7fe2062..a3e27fd17b 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.7.0
+SYSKLOGD_VERSION = 2.7.1
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
