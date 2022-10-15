Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EBDC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 745F34151F;
	Sat, 15 Oct 2022 15:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 745F34151F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WV-rPCcSzMiD; Sat, 15 Oct 2022 15:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24679414CC;
	Sat, 15 Oct 2022 15:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24679414CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D21A1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 489F181AF3
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 489F181AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDaz7eQtu4wj for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08D4281AAC
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D4281AAC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECD9A86DB6; Sat, 15 Oct 2022 15:37:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:36:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 66a3f84b573a710ba9384121812f14091e01ca08
X-Git-Newrev: 447c0aba40120f75e001b0e0608ecdae1533ecf7
X-Patchwork-Hint: ignore
Message-Id: <20221015153717.ECD9A86DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/iwd: no
 autoreconfigure
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

commit: https://git.buildroot.net/buildroot/commit/?id=447c0aba40120f75e001b0e0608ecdae1533ecf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Since commit ff0d53405157 (package/iwd: bump version to 1.19), we are no
longer patching configure.ac, so autoreconfigure isn't needed anymore.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
[yann.morin.1998@free.fr: reword with reference to ff0d53405157]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1db79dffcae63dbed021143203f1908f3f7db33f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iwd/iwd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 548b508edb..6814a04bf8 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -12,8 +12,6 @@ IWD_LICENSE_FILES = COPYING
 IWD_CPE_ID_VENDOR = intel
 IWD_CPE_ID_PRODUCT = inet_wireless_daemon
 IWD_SELINUX_MODULES = networkmanager
-# We're patching configure.ac
-IWD_AUTORECONF = YES
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
