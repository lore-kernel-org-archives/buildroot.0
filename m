Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAD5C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F37804031D;
	Fri, 14 Oct 2022 20:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F37804031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMP5B2WcH9IS; Fri, 14 Oct 2022 20:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33CD6402F7;
	Fri, 14 Oct 2022 20:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33CD6402F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 001EF1BF47A
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBA9541974
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA9541974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwfnhZgA3Dr5 for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 20:08:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 984564199B
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 20:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 984564199B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8465186D2E; Fri, 14 Oct 2022 20:08:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 22:06:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c7f1a439ad44c8c7bd56a9e550fc059a14aeaa6
X-Git-Newrev: 1db79dffcae63dbed021143203f1908f3f7db33f
X-Patchwork-Hint: ignore
Message-Id: <20221014200810.8465186D2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: no autoreconfigure
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

commit: https://git.buildroot.net/buildroot/commit/?id=1db79dffcae63dbed021143203f1908f3f7db33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit ff0d53405157 (package/iwd: bump version to 1.19), we are no
longer patching configure.ac, so autoreconfigure isn't needed anymore.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
[yann.morin.1998@free.fr: reword with reference to ff0d53405157]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iwd/iwd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 4a818f0b82..297e1fabe9 100644
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
