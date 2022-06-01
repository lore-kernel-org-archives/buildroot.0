Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2916EC43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B50CC41852;
	Wed,  1 Jun 2022 21:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14e6uC-7qu2T; Wed,  1 Jun 2022 21:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D51B8416AF;
	Wed,  1 Jun 2022 21:23:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD8261BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD02A831F8
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hH_5rywEM6tq for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:23:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D61831F5
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:23:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9540E868B9; Wed,  1 Jun 2022 21:11:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 22:54:57 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ff4546c9bc9346ea5a7107536d850c8d8bd09199
X-Git-Newrev: 7d3f1549617084ba45f3024820d2ad88fc87d9ee
X-Patchwork-Hint: ignore
Message-Id: <20220601211122.9540E868B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/strace: download
 from Github
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d3f1549617084ba45f3024820d2ad88fc87d9ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Some corporate networks may be blocking access to Russian servers.
The server "strace.io" is in Russia, which will make it inaccessible
from some networks.

Use Github instead to download the sources.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 45115ea557f0c6b8a522cf222351a650160391a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index c8c3590f6e..c0e89ef6ce 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -6,7 +6,7 @@
 
 STRACE_VERSION = 5.16
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
-STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
+STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CPE_ID_VENDOR = strace_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
