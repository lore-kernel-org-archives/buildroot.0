Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78432C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 352D4815AD;
	Sat, 14 May 2022 09:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Axq8ip5aRJQ4; Sat, 14 May 2022 09:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB468146E;
	Sat, 14 May 2022 09:51:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A66B31BF909
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3756B4167C
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRGjXCM3JW3E for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61C81415F5
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1D8DF8376C; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:37:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a1e3ff0713b04373d4838c75ffcb84ee021ace4
X-Git-Newrev: 437d0433d36fd2e81ea9a2fd2d5018bf56e3df8e
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.1D8DF8376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pciutils: requires C99
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

commit: https://git.buildroot.net/buildroot/commit/?id=437d0433d36fd2e81ea9a2fd2d5018bf56e3df8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 3.8.0 pciutils requires C99 toolchain as documented in its
README file. Use the gnu99 variant because the code requires the GNU
extended getopt(3) and the 'asm' keyword.

Fixes:
http://autobuild.buildroot.net/results/1c9988105b64594185a4002ca046aec8b87ea141/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pciutils/pciutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index c1445968b9..140276dbc4 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -13,7 +13,7 @@ PCIUTILS_LICENSE_FILES = COPYING
 PCIUTILS_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	HOST="$(NORMALIZED_ARCH)-linux" \
-	OPT="$(TARGET_CFLAGS)" \
+	OPT="$(TARGET_CFLAGS) -std=gnu99" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	DNS=no \
 	STRIP=
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
