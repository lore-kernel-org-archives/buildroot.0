Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D02C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AEA241B3B;
	Fri, 22 Jul 2022 08:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AEA241B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyMXYFFrUdRv; Fri, 22 Jul 2022 08:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0745141916;
	Fri, 22 Jul 2022 08:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0745141916
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7BC71BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B1684803
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B1684803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUbzR8XQTlLO for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:36:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 181C181DCB
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 181C181DCB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DEBA98414E; Fri, 22 Jul 2022 08:22:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:35:05 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: eae44eff3d1cbe22f3b53e09b4d9c518114007e6
X-Git-Newrev: 7a05e351179c5706c6926c2f8bcaa5a397a5d15c
X-Patchwork-Hint: ignore
Message-Id: <20220722082236.DEBA98414E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libgpgme: fix
 LIBGPGME_CPE_ID_PRODUCT
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a05e351179c5706c6926c2f8bcaa5a397a5d15c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix typo added by commit 6b79c8fb05bf1ae569d8b8e8c9f6f516e97c9ae0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 03920e842bc5f8e7387f76ed7058d5c176fa65f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpgme/libgpgme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index f61e9fe41a..b42a1a363a 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -10,7 +10,7 @@ LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_CPE_ID_VENDOR = gnupg
-LIBGPGME_CPE_ID_PRODUCT = gpgpme
+LIBGPGME_CPE_ID_PRODUCT = gpgme
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_CONFIG_SCRIPTS = gpgme-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
