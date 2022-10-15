Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7468DC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11E4E81AAC;
	Sat, 15 Oct 2022 15:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11E4E81AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UC6j7DGr3Qe; Sat, 15 Oct 2022 15:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC3381A33;
	Sat, 15 Oct 2022 15:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC3381A33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E98D1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C678415A3
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C678415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ug_yY2RQIHpp for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E4914157B
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E4914157B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 878DE86DCF; Sat, 15 Oct 2022 15:38:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:36:14 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 0b74bc5ead7844b639d383a804c6793e1dd48613
X-Git-Newrev: 444611a9a12dd81635a635a994b4718afcc3cfdd
X-Patchwork-Hint: ignore
Message-Id: <20221015153823.878DE86DCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/iwd: no
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

commit: https://git.buildroot.net/buildroot/commit/?id=444611a9a12dd81635a635a994b4718afcc3cfdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
index fc10c5f1d4..d179e46ebf 100644
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
