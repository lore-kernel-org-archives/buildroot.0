Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB81BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:36:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D5160F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0D5160F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D64E6006A;
	Wed,  4 Aug 2021 12:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1yITPVe1uYb; Wed,  4 Aug 2021 12:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0FAF605EB;
	Wed,  4 Aug 2021 12:36:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 158001BF9D1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EF3B40535
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAK6gRRkVPhe for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:34:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E95F404F4
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:34:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3B6D18B4E5; Wed,  4 Aug 2021 12:34:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 14:34:24 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 49281d10e3fd6d9b812436d9fef4eb51adbd3d81
X-Git-Newrev: da13f7e99f20ceb0ff0446823b30147b3b099d83
X-Patchwork-Hint: ignore
Message-Id: <20210804123439.3B6D18B4E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/spice: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=da13f7e99f20ceb0ff0446823b30147b3b099d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
