Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22F1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A023847A7;
	Wed, 23 Mar 2022 21:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1G0DX-Xng_g; Wed, 23 Mar 2022 21:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2F8847A6;
	Wed, 23 Mar 2022 21:41:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7705B1BF489
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 664008475F
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ho1RPfzuiFEM for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9FF584759
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D0FCE85644; Wed, 23 Mar 2022 21:31:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:01:00 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: aadba596b9c258f46b2c0e2ef5f1456d35364d1a
X-Git-Newrev: c4cf10bedd4d7efea98c4c926978aaa924d9c081
X-Patchwork-Hint: ignore
Message-Id: <20220323213124.D0FCE85644@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libodb: add host
 variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4cf10bedd4d7efea98c4c926978aaa924d9c081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7b9c81cc4eefd0972b91abced472e2bce8b53fa2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libodb/libodb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libodb/libodb.mk b/package/libodb/libodb.mk
index 11ca9de866..b25e8ac501 100644
--- a/package/libodb/libodb.mk
+++ b/package/libodb/libodb.mk
@@ -12,5 +12,7 @@ LIBODB_INSTALL_STAGING = YES
 LIBODB_LICENSE = GPL-2.0
 LIBODB_LICENSE_FILES = LICENSE
 LIBODB_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+HOST_LIBODB_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
