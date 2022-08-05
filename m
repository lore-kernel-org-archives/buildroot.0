Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8C6C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 15:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE36D83F16;
	Fri,  5 Aug 2022 15:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE36D83F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSB0_OX0tNbu; Fri,  5 Aug 2022 15:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5404883E82;
	Fri,  5 Aug 2022 15:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5404883E82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0F71BF345
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87F8D409F8
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 15:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87F8D409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSdLxBhTdmdg for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 15:59:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3B3240635
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 15:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3B3240635
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CA12886E7D; Fri,  5 Aug 2022 15:45:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Aug 2022 17:58:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 466d65d73e38545252528a81c31632ba316c77fa
X-Git-Newrev: 192b754bf420c1fd55f4590f97fd36175db64ff4
X-Patchwork-Hint: ignore
Message-Id: <20220805154526.CA12886E7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/broadcom/northstar: Fix defconfig
 make target
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

commit: https://git.buildroot.net/buildroot/commit/?id=192b754bf420c1fd55f4590f97fd36175db64ff4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The readme.txt contains a make target that does not match the actual
defconfig file name, fix that.

Fixes: 1500b7d5c818 ("configs/broadcom_northstar: new defconfig")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/broadcom/northstar/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/broadcom/northstar/readme.txt b/board/broadcom/northstar/readme.txt
index 18c9b03c13..523bb439e3 100644
--- a/board/broadcom/northstar/readme.txt
+++ b/board/broadcom/northstar/readme.txt
@@ -25,7 +25,7 @@ device setup).
 How to build it
 ===============
 
-  $ make broadcom_ns_defconfig
+  $ make broadcom_northstar_defconfig
 
   $ make
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
