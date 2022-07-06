Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC4C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A350440C3D;
	Wed,  6 Jul 2022 21:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A350440C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8cA6tHk1uVp; Wed,  6 Jul 2022 21:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC1BA4049A;
	Wed,  6 Jul 2022 21:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC1BA4049A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A41101BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E4044194F
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E4044194F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGDzTlhHXaaA for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:12:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8893D41886
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8893D41886
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A9B3382837; Wed,  6 Jul 2022 20:59:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:11:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 167a15b764c03a86c93afee3fdef763296ebc1b3
X-Git-Newrev: 03920e842bc5f8e7387f76ed7058d5c176fa65f3
X-Patchwork-Hint: ignore
Message-Id: <20220706205902.A9B3382837@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03920e842bc5f8e7387f76ed7058d5c176fa65f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo added by commit 6b79c8fb05bf1ae569d8b8e8c9f6f516e97c9ae0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
