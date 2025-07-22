Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7040C83F27
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A859941024;
	Tue, 22 Jul 2025 17:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37TOMEX8Uj_l; Tue, 22 Jul 2025 17:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD8AD40F9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD8AD40F9C;
	Tue, 22 Jul 2025 17:23:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 996FAE0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96E0A40438
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YbLMw7VtSky for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:23:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A5240072
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0A5240072
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:23:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C915C869DE; Tue, 22 Jul 2025 17:23:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Jul 2025 19:21:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54240460dcdbb1df76a092ad0f9d30b5b9875973
X-Git-Newrev: eedffe0681004c067ebc69b9294f046a32a4b923
X-Patchwork-Hint: ignore
Message-Id: <20250722172301.C915C869DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memtester: bump version to 4.7.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eedffe0681004c067ebc69b9294f046a32a4b923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://pyropus.ca./software/memtester/CHANGELOG

Version 4.7.1 fixes compile error with stricter C23/gcc-15 due to
incompatible type declaration.

Fixes:
https://autobuild.buildroot.org/results/6d4d4e8ca4269a3d8f795c7c186ef70411f2dc79/build-end.log

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/memtester/memtester.hash | 2 +-
 package/memtester/memtester.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/memtester/memtester.hash b/package/memtester/memtester.hash
index 6e5d156ffd..1606fdbd01 100644
--- a/package/memtester/memtester.hash
+++ b/package/memtester/memtester.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c5fc2382576c084b314cfd334d127a66c20bd63892cac9f445bc1d8b4ca5a47  memtester-4.5.1.tar.gz
+sha256  e427de663f7bd22d1ebee8af12506a852c010bd4fcbca1e0e6b02972d298b5bb  memtester-4.7.1.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 347a158b74..1d3a8329fc 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTESTER_VERSION = 4.5.1
+MEMTESTER_VERSION = 4.7.1
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
 MEMTESTER_LICENSE = GPL-2.0
 MEMTESTER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
