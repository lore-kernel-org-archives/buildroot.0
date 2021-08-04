Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DCEC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:35:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 272EF60E8D
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 272EF60E8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D8F83BCF;
	Wed,  4 Aug 2021 12:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TE7tQmK_TafA; Wed,  4 Aug 2021 12:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B49814B5;
	Wed,  4 Aug 2021 12:35:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12F221BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E2E240431
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0JBOU5n5vkU for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:34:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B20D404C2
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:34:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 644288B4AE; Wed,  4 Aug 2021 12:34:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 14:34:30 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 6ef450a26ef3a046ce7ccc6cecd6243d4914a268
X-Git-Newrev: 36a3064ea4370d877b823bf1f7135583d1d2dfa8
X-Patchwork-Hint: ignore
Message-Id: <20210804123434.644288B4AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/spice: drop
 duplicated opus handling
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=36a3064ea4370d877b823bf1f7135583d1d2dfa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

opus dependency is handled twice since commit
f33f7a4f6407f624edb4b4ffe54cb09e029a49b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 929c977afb212eebdee07ae1333b3aaf0f660021)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice/spice.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index ab35265ab4..5f7bcd9d2f 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -45,11 +45,6 @@ else
 SPICE_CONF_OPTS += --disable-opus
 endif
 
-# no enable/disable, detected using pkg-config
-ifeq ($(BR2_PACKAGE_OPUS),y)
-SPICE_DEPENDENCIES += opus
-endif
-
 # We need to tweak spice.pc because it /forgets/ (for static linking) that
 # it should link against libz and libjpeg. libz is pkg-config-aware, while
 # libjpeg isn't, hence the two-line tweak
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
