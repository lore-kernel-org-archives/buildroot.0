Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979D2C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 14:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 619894122D;
	Sat, 19 Jul 2025 14:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgCqWLj-Al_c; Sat, 19 Jul 2025 14:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2C04124D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2C04124D;
	Sat, 19 Jul 2025 14:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5BEC117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBB8B4122D
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg8xYFmi9yfk for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 14:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C67C41228
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C67C41228
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 14:40:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07823864A6; Sat, 19 Jul 2025 14:40:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 16:30:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9d99eae4d735f80dc7fc30eda9dd10b36135095
X-Git-Newrev: 2c7d6b9dbe2ce91ca68434d4ef1798e41752bbf3
X-Patchwork-Hint: ignore
Message-Id: <20250719144026.07823864A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: bump to version 7.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c7d6b9dbe2ce91ca68434d4ef1798e41752bbf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/libbpf/bpftool/releases

This upgrade fixes as well linking problems to LLVM libraries in
the previous version on Buildroot 2025.05 and master.

Signed-off-by: Federico Pellegrin <fede@evolware.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bpftool/bpftool.hash | 2 +-
 package/bpftool/bpftool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index 4f83e71a76..5112bb997e 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  89d3ce783d5c9e40b9060b380869911ee9d5ab6732a4b1dd19a90103c5e41e6c  bpftool-v7.1.0-git4.tar.gz
+sha256  ff95bc8a057c84e61863fcf95e354199041ac524f5b9f5d487cf0b2c6e9198fb  bpftool-v7.5.0-git4.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index cd68d89799..1b765ba38f 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTOOL_VERSION = v7.1.0
+BPFTOOL_VERSION = v7.5.0
 BPFTOOL_SITE = https://github.com/libbpf/bpftool
 BPFTOOL_SITE_METHOD = git
 BPFTOOL_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
