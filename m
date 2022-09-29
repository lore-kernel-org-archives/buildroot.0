Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86006C433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 13:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E7EF61162;
	Thu, 29 Sep 2022 13:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E7EF61162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYJutqzP2dk5; Thu, 29 Sep 2022 13:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D7160B77;
	Thu, 29 Sep 2022 13:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D7160B77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC8911BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98AC660BDE
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98AC660BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1-hQD9TBc69 for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 13:56:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2FCD60B77
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 13:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2FCD60B77
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C16BF864DC; Thu, 29 Sep 2022 13:56:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 15:56:23 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: d1814692f10ed02e1af58db9637c9e8a215ba997
X-Git-Newrev: 6221ad98b086d8b6b61247e733f78fce972eb709
X-Patchwork-Hint: ignore
Message-Id: <20220929135632.C16BF864DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] utils/genrandconfig: fix
 flake8
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

commit: https://git.buildroot.net/buildroot/commit/?id=6221ad98b086d8b6b61247e733f78fce972eb709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Commit af494d92d3d0 (utils/genrandconfig: disable libopenssl without
atomics) intorduced a code-style issue that flake8 does not like:

    $ make check-flake8
    utils/genrandconfig:253:8: E713 test for membership should be 'not in'
    1     E713 test for membership should be 'not in'

Fixes: af494d92d3d0
    https://gitlab.com/buildroot.org/buildroot/-/jobs/3045260108

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fa538315dc02ad011edf6a2a9e25f8589100f15f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index efa73e938d..e43452d5b7 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -250,7 +250,7 @@ def fixup_config(sysinfo, configfile):
     # libopenssl needs atomic, but propagating this dependency in
     # Buildroot is really too much work, so we handle this here.
     if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
-       not 'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' in configlines:
+       'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' not in configlines:
         return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
