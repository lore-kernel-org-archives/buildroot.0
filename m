Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F37AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:40:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEEFD61462
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEEFD61462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84FDD83F35;
	Wed, 29 Sep 2021 19:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEbXRU6YB1sr; Wed, 29 Sep 2021 19:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E883F83F31;
	Wed, 29 Sep 2021 19:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93FDA1BF388
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8419D83F34
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPSlTqIqsoCx for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:40:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8D1783F31
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4D9FA8D5F3; Wed, 29 Sep 2021 19:38:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 21:34:22 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d9e45a837e5be0ef2b173f0dda0e6dbe4080a22c
X-Git-Newrev: 6e8d26419a4deeb421a08f1a71e0c931797a1138
X-Patchwork-Hint: ignore
Message-Id: <20210929193813.4D9FA8D5F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/botan: fix boost
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e8d26419a4deeb421a08f1a71e0c931797a1138
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

only build --with-boost when both required modules (filesystem and system) are
also selected.

Fixes:
http://autobuild.buildroot.net/results/4fbf2a63f9ddfbc540ce7dabd10964b311477c06

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5572b2e53157db2958be2c52f4e7c2a1b0408d78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 802dab9e30..aa0bb9b261 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -53,7 +53,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 BOTAN_CONF_OPTS += --without-os-feature=getauxval
 endif
 
-ifeq ($(BR2_PACKAGE_BOOST),y)
+ifeq ($(BR2_PACKAGE_BOOST_FILESYSTEM)$(BR2_PACKAGE_BOOST_SYSTEM),yy)
 BOTAN_DEPENDENCIES += boost
 BOTAN_CONF_OPTS += --with-boost
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
