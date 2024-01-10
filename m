Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A626C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D723B436E5;
	Wed, 10 Jan 2024 20:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D723B436E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxTwxut4C726; Wed, 10 Jan 2024 20:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9A32436EF;
	Wed, 10 Jan 2024 20:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9A32436EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B00011BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96112423D9
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96112423D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3g-aMCtaeGD for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6B4B42233
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6B4B42233
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4AD885CC4; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:38:19 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: d321e346d2fef757888250a3716a1ac8d9452763
X-Git-Newrev: 611458d90a8b6c5763ca54a765f959cde4fe0157
X-Patchwork-Hint: ignore
Message-Id: <20240110201651.A4AD885CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/pkg-qmake.mk:
 drop host-perl dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=611458d90a8b6c5763ca54a765f959cde4fe0157
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Since commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e ("package/qt5:
bump packages to latest kde submodule versions"), the
QT_HEADERS_SYNC_HOOK hook no longer calls the syncqt.pl script, so
host-perl is no longer needed as a dependency of running this
hook (and as a dependency of building Qt).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b678091a1c68327d086b6534a27224763db23006)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-qmake.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index fdaddf08df..ccf78692e8 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -50,7 +50,6 @@ $(2)_DEPENDENCIES 		+= qt5base
 endif
 
 ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
-$(2)_DEPENDENCIES 		+= host-perl
 $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
