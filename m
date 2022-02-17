Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B000C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1086F41677;
	Thu, 17 Feb 2022 20:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fv0rZtk-gMd; Thu, 17 Feb 2022 20:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A02441670;
	Thu, 17 Feb 2022 20:30:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89F891C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E8C183F65
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiT97FezlKiU for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A65E583F5E
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B517B83785; Thu, 17 Feb 2022 20:21:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:29:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83f9f0b881fa401b67f2523faa4d68d20ca7cc17
X-Git-Newrev: e389bf186f732729f9e5b3ec84aedd1f925b4fe9
X-Patchwork-Hint: ignore
Message-Id: <20220217202156.B517B83785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: don't override XZ_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=e389bf186f732729f9e5b3ec84aedd1f925b4fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XZ_CONF_OPTS is wrongly overridden in a conditional since commit
0dbc17abcb5c254d60a8d59e1ae0d715c2db4324

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xz/xz.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index ffbae4c873..af611975a0 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -14,9 +14,9 @@ XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-XZ_CONF_OPTS = --enable-threads
+XZ_CONF_OPTS += --enable-threads
 else
-XZ_CONF_OPTS = --disable-threads
+XZ_CONF_OPTS += --disable-threads
 endif
 
 # we are built before ccache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
