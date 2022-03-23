Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD03941917;
	Wed, 23 Mar 2022 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skcQkjE0ayaP; Wed, 23 Mar 2022 21:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE45A41919;
	Wed, 23 Mar 2022 21:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 998BC1BF489
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 967B841919
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uc9N3Np2s3jQ for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6EBF41917
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 05CF684F5C; Wed, 23 Mar 2022 21:31:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:01:51 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: cce793940a09ce0ff0924c2e550734537cbc7173
X-Git-Newrev: 5d78ea86f92ccfd6859acc2aff8147f624894405
X-Patchwork-Hint: ignore
Message-Id: <20220323213117.05CF684F5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libodb: add host
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d78ea86f92ccfd6859acc2aff8147f624894405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
