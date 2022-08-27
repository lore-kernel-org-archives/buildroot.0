Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95CC0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F0D82BD6;
	Sat, 27 Aug 2022 07:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F0D82BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sI0LHPHoFgXo; Sat, 27 Aug 2022 07:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E02F827FB;
	Sat, 27 Aug 2022 07:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E02F827FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 079481BF963
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D19B3415F8
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19B3415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nK8e_YfAHNt for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67EF1414C8
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67EF1414C8
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3EED5879D2; Sat, 27 Aug 2022 07:36:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:50:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e47c4fbcde541e50f79b572170ee4870058d76c4
X-Git-Newrev: f336ba8c9beaff0ff12c2050b9fb59f9c9a9c844
X-Patchwork-Hint: ignore
Message-Id: <20220827073608.3EED5879D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysdig: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=f336ba8c9beaff0ff12c2050b9fb59f9c9a9c844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo: SYSDIG_LICENSE_FILE -> SYSDIG_LICENSE_FILES
added by commit ea86757e51cf424566f79896335d31d15b89d0d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysdig/sysdig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 2d57c0043f..e9968d9fde 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -7,7 +7,7 @@
 SYSDIG_VERSION = 0.29.2
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = Apache-2.0
-SYSDIG_LICENSE_FILE = COPYING
+SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CPE_ID_VENDOR = sysdig
 SYSDIG_CONF_OPTS = \
 	-DENABLE_DKMS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
