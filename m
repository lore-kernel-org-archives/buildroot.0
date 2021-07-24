Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342F7C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:10:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA43608FB
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEA43608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A134B40196;
	Sat, 24 Jul 2021 20:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id focSG8pRT1jA; Sat, 24 Jul 2021 20:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE81440184;
	Sat, 24 Jul 2021 20:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE64B1BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBFE4834DB
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kIwwVBNghZa8 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18E92834D5
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 60FD687603; Sat, 24 Jul 2021 19:35:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:09:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66671e57c142492e31a1f16e953737b22df32d8c
X-Git-Newrev: 285eb82395a79d64f0ea79a36f584f61ee35fe57
X-Patchwork-Hint: ignore
Message-Id: <20210724193539.60FD687603@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mono: needs host-python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=285eb82395a79d64f0ea79a36f584f61ee35fe57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
