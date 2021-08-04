Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B15C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:38:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38FDD61029
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38FDD61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 170C660A96;
	Wed,  4 Aug 2021 20:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtkeqBmnHexT; Wed,  4 Aug 2021 20:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6EB60A66;
	Wed,  4 Aug 2021 20:38:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D01481BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCB8C83C5F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZtRGmrVC-Eq for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:36:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CB1383BC7
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:36:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0FA4E8B782; Wed,  4 Aug 2021 20:36:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:35:54 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ca4a4d4cd703f7d358c969177572a3e16ebbca6b
X-Git-Newrev: e9dc4395e80233037bab60533a3658f1ef3c1eff
X-Patchwork-Hint: ignore
Message-Id: <20210804203623.0FA4E8B782@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mono: needs
 host-python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9dc4395e80233037bab60533a3658f1ef3c1eff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

host-python3 is needed to avoid the following build failure since bump
to version 6.12.0.90 in commit 4be06fa8aa054e59d97866dc5568f4e10762e353
and
https://github.com/mono/mono/commit/0f47ea5d8088ede472650da47bf58e5a0e063ad4:

checking for a Python interpreter with version >= 3.2... none
configure: error: no suitable Python interpreter found

Fixes:
 - http://autobuild.buildroot.org/results/6a185e69fe8e123ba26c26b69091d001656693c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 285eb82395a79d64f0ea79a36f584f61ee35fe57)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/mono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index df3481a498..27f7886224 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -53,7 +53,7 @@ HOST_MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-libraries
 # ensure monolite is used
 HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
 
-HOST_MONO_DEPENDENCIES = host-monolite host-gettext
+HOST_MONO_DEPENDENCIES = host-monolite host-gettext host-python3
 
 define HOST_MONO_SETUP_MONOLITE
 	rm -rf $(@D)/mcs/class/lib/monolite
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
