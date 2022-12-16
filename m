Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440FBC4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D155041B83;
	Fri, 16 Dec 2022 14:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D155041B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxiQDtAP-EMG; Fri, 16 Dec 2022 14:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C7541B76;
	Fri, 16 Dec 2022 14:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C7541B76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C48071BF2A9
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0A39404CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0A39404CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yox0aN8ZI-D5 for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D05C7403C6
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05C7403C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF14A86774; Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 15:16:43 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 30e9d1c7f6630f5c24ca17d00dfd6bf0669532d3
X-Git-Newrev: 137a8dbee0599cb1bd7c9d7bf596f0e8bac7d9bd
X-Patchwork-Hint: ignore
Message-Id: <20221216142239.BF14A86774@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/botan: fix mips64
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=137a8dbee0599cb1bd7c9d7bf596f0e8bac7d9bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable cc-tests to avoid the following build failure on mips64:

  ERROR: Configured target is mips64 but compiler probe indicates mips32

Fixes:
 - http://autobuild.buildroot.org/results/c44f44f36686268479563afd879db588e15ede7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fb9a422eba604cbdcd78826a6d520146c4fffad2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index c95e97dcc3..f56eebbb29 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -16,6 +16,7 @@ BOTAN_INSTALL_STAGING = YES
 BOTAN_DEPENDENCIES = host-python3
 BOTAN_CONF_OPTS = \
 	--cpu=$(BR2_ARCH) \
+	--disable-cc-tests \
 	--os=linux \
 	--cc=gcc \
 	--cc-bin="$(TARGET_CXX)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
