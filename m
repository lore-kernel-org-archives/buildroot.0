Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40CDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:21:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751AF60EE2
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 751AF60EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E2181842;
	Mon, 11 Oct 2021 21:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_iUdZ62YEYf; Mon, 11 Oct 2021 21:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE27381839;
	Mon, 11 Oct 2021 21:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A84D1BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834F040386
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXWewHmStqZ7 for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:20:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EBF740375
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:20:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 475719547E; Mon, 11 Oct 2021 21:18:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 22:59:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebde8da7ccb5f239823ed94a5816285a68e4f5a1
X-Git-Newrev: c63b00f3922592c285e404165a7ff04c7f316d0f
X-Patchwork-Hint: ignore
Message-Id: <20211011211803.475719547E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburcu: fix build without wchar
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

commit: https://git.buildroot.net/buildroot/commit/?id=c63b00f3922592c285e404165a7ff04c7f316d0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.13.0 in
commit 9cedbcf494e647371f92368014d31091848772bb and
https://github.com/urcu/userspace-rcu/commit/8b2f0590d94f6bc3f1d31bd3e0c9ea744b5b55cb:

configure: error: The compiler does not support C99

Fixes:
 - http://autobuild.buildroot.org/results/435d127728b014d565dd75861f87e18716f9fe5e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liburcu/liburcu.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index c0a44764f1..e29784abe4 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -12,4 +12,8 @@ LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+LIBURCU_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
