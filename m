Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7127FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 353E8859CA;
	Sun, 12 Dec 2021 12:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TGiHYyGr4jn; Sun, 12 Dec 2021 12:23:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B7BA84B86;
	Sun, 12 Dec 2021 12:23:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94B921BF97A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8184A81C6E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiO_4_DRs1gd for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2FD4823E3
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 19DE682B66; Sun, 12 Dec 2021 12:17:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b89163a067f6fd7d555e102ccbbe389a6dddc52d
X-Git-Newrev: 343c8dfc61ce892a58e32d64782f8feb56365763
X-Patchwork-Hint: ignore
Message-Id: <20211212121715.19DE682B66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdogd: enable selinux watchdog
 module for refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=343c8dfc61ce892a58e32d64782f8feb56365763
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for watchdogd to work with SELinux.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Acked-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/watchdogd/watchdogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index b666b56433..1a9d04d938 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -11,6 +11,7 @@ WATCHDOGD_LICENSE_FILES = LICENSE
 WATCHDOGD_CPE_ID_VENDOR = troglobit
 WATCHDOGD_DEPENDENCIES = host-pkgconf libconfuse libite libuev
 WATCHDOGD_CONF_OPTS = --disable-compat --disable-examples --disable-test-mode
+WATCHDOGD_SELINUX_MODULES = watchdog
 
 ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
 WATCHDOGD_CONF_OPTS += --disable-builtin-tests
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
