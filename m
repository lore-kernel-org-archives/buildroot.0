Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E7EC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 21:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB8E8234C;
	Tue, 14 May 2024 21:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68SOyLfKt7Av; Tue, 14 May 2024 21:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ABE7822C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABE7822C7;
	Tue, 14 May 2024 21:26:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4DA51BF42D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B022160633
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Af_fdGw-6jn6 for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 21:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC8CF60626
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC8CF60626
 for <buildroot@buildroot.org>; Tue, 14 May 2024 21:26:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6CF1873D5; Tue, 14 May 2024 21:26:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 23:26:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c091c15ea22d0f5b1e2114bc56e16d77d77247c
X-Git-Newrev: 300cb3dc16efeb592bddcb8be07310c21c2c0d7a
X-Patchwork-Hint: ignore
Message-Id: <20240514212627.D6CF1873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libedit: set LIBEDIT_CPE_ID_VALID
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

commit: https://git.buildroot.net/buildroot/commit/?id=300cb3dc16efeb592bddcb8be07310c21c2c0d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libedit_project:libedit is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/42ACF08B-DD62-48D3-8568-32DAFD116956

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libedit/libedit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index ea7f98fdbd..98e29a9b1a 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -10,6 +10,7 @@ LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
 LIBEDIT_LICENSE = BSD-3-Clause
 LIBEDIT_LICENSE_FILES = COPYING
+LIBEDIT_CPE_ID_VALID = YES
 
 # We're patching configure.ac
 LIBEDIT_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
