Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CDBCDD548
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2153E401EB;
	Wed, 18 Sep 2024 16:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfB7ShR7Etkq; Wed, 18 Sep 2024 16:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A201C411C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A201C411C5;
	Wed, 18 Sep 2024 16:50:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF421BF2C9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55FAA40D47
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYgfSrMqNvKC for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E040412F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E040412F1
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2675383B56; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 18:46:58 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 40030e1c6f090969f46fe5ed9afbfa4857450a17
X-Git-Newrev: 6699f2dd5dbd9bc22ec13b051eacede6c6fae24f
X-Patchwork-Hint: ignore
Message-Id: <20240918165043.2675383B56@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/dovecot: security
 bump version to 2.3.21.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6699f2dd5dbd9bc22ec13b051eacede6c6fae24f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes CVE-2024-23184 & CVE-2024-23185:
https://dovecot.org/mailman3/hyperkitty/list/dovecot-news@dovecot.org/thread/2CSVL56LFPAXVLWMGXEIWZL736PSYHP5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 786484e631d34f9630baaa74006a8398aa19ad7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index e42bb577a8..fde96f32a5 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256  05b11093a71c237c2ef309ad587510721cc93bbee6828251549fc1586c36502d  dovecot-2.3.21.tar.gz
+sha256  2d90a178c4297611088bf7daae5492a3bc3d5ab6328c3a032eb425d2c249097e  dovecot-2.3.21.1.tar.gz
 sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index f90996fdd7..de5bdaecae 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).21
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).21.1
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
