Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90477C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 257A460E49;
	Tue, 19 Apr 2022 20:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSda4UxjC-g0; Tue, 19 Apr 2022 20:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2421D60AD6;
	Tue, 19 Apr 2022 20:32:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 960391BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9123A83E47
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBxRRW_l0JMb for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:31:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D132483E50
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 276E983DBC; Tue, 19 Apr 2022 20:21:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 22:29:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fd41e56e0e26fd3f3265f0e0015031211e441cf
X-Git-Newrev: 3c1324248d7855b35652ed367ec815429d559a7e
X-Patchwork-Hint: ignore
Message-Id: <20220419202147.276E983DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: add upstream security fix for
 CVE-2022-1271 / ZDI-CAN-16587
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c1324248d7855b35652ed367ec815429d559a7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2022-1271: Malicious filenames can make xzgrep to write to arbitrary
  files or (with a GNU sed extension) lead to arbitrary code execution.

For more details, see the announcement and advisory:

https://www.mail-archive.com/xz-devel@tukaani.org/msg00551.html
https://www.zerodayinitiative.com/advisories/ZDI-22-619/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xz/xz.hash | 1 +
 package/xz/xz.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 3dd0cbe459..9577e98e80 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256  5117f930900b341493827d63aa910ff5e011e0b994197c3b71c08a20228a42df  xz-5.2.5.tar.bz2
+sha256  98c6cb1042284fe704ec30083f3fc87364ce9ed2ea51f62bbb0ee9d3448717ec  xzgrep-ZDI-CAN-16587.patch
 
 # Hash for license files
 sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index af611975a0..cdb01e06a9 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -13,6 +13,10 @@ XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
+XZ_PATCH = xzgrep-ZDI-CAN-16587.patch
+# xzgrep-ZDI-CAN-16587.patch
+XZ_IGNORE_CVES += CVE-2022-1271
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XZ_CONF_OPTS += --enable-threads
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
