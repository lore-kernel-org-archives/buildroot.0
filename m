Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1CFC77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2348041D28;
	Mon,  8 May 2023 20:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2348041D28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3wE3YIIriud; Mon,  8 May 2023 20:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30CC840B82;
	Mon,  8 May 2023 20:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30CC840B82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63F681BF865
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D60B40B82
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D60B40B82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNf5B_KEWbjp for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:03:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A88D400FD
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A88D400FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48548861AC; Mon,  8 May 2023 20:03:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 21:41:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62962d175d3fbeb0289bce4440005b8129f21efe
X-Git-Newrev: 683563da8095c2eb69e677402b9bef7217ae90d9
X-Patchwork-Hint: ignore
Message-Id: <20230508200313.48548861AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: Bump version to 4.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=683563da8095c2eb69e677402b9bef7217ae90d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to 4.1.1 and update sample config.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 69db9b4b78..f4b74dc8c1 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.38
+@version: 4.1
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 6fce7be996..8ab4d5ac3b 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bfa38fab399441f7  syslog-ng-3.38.1.tar.gz
+sha256  d7df3cfa32d1a750818d94b8ea582dea54c37226e7b55a88c3d2f3a543d8f20e  syslog-ng-4.1.1.tar.gz
 sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index a7176ad129..1c4cec6adb 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.38.1
+SYSLOG_NG_VERSION = 4.1.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
