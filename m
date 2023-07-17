Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E21DEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 11:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE308812C5;
	Mon, 17 Jul 2023 11:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE308812C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2ApF98g4ujb; Mon, 17 Jul 2023 11:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08A1D80EA0;
	Mon, 17 Jul 2023 11:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A1D80EA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40A331BF352
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2888240167
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2888240167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1uYiYyujR4i for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 11:09:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 618D640142
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 11:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 618D640142
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51BE58714E; Mon, 17 Jul 2023 11:09:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 13:03:46 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 62aac0da49efa958aa4f8bed102de7f8b0e5a28a
X-Git-Newrev: cb18e7e6f0252b4bf1133e82c41ebb1e8faaf642
X-Patchwork-Hint: ignore
Message-Id: <20230717110913.51BE58714E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/mpir: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb18e7e6f0252b4bf1133e82c41ebb1e8faaf642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix the following build failure:
/tmp/ccuwJnnt.s:124: Error: selected processor does not support `umull ip,r6,r2,r1' in Thumb mode
/tmp/ccuwJnnt.s:159: Error: selected processor does not support `umull ip,r0,r7,r1' in Thumb mode

Fixes:
http://autobuild.buildroot.net/results/610/61094bc7b7eb1d1e49bf8fcd1864b5cd3d7c4499/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ff037fe5430738e85d9c2270883e71cd77e99ff3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpir/mpir.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 91f704d30c..5dbd760aa1 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -36,4 +36,8 @@ ifeq ($(BR2_powerpc64le),y)
 MPIR_CONF_ENV += MPN_PATH="generic"
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MPIR_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
