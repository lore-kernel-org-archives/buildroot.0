Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCD6C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:36:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC23661002
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC23661002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90ED440164;
	Wed,  4 Aug 2021 20:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GMj6HrEmsup; Wed,  4 Aug 2021 20:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8955E40298;
	Wed,  4 Aug 2021 20:36:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4011BF9D1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D30060A66
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSskoCaEG8tV for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:36:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C774860A62
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:36:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D73628B76A; Wed,  4 Aug 2021 20:36:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:36:00 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 8b7f90f2f6214afe012ed0317234b096f6c98b9e
X-Git-Newrev: 2855b0cd69f5b35d4ae25fb71387655a409f2f66
X-Patchwork-Hint: ignore
Message-Id: <20210804203610.D73628B76A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mono: needs
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

commit: https://git.buildroot.net/buildroot/commit/?id=2855b0cd69f5b35d4ae25fb71387655a409f2f66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
