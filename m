Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4B4E78482
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 170E7820FC;
	Sun,  1 Oct 2023 18:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 170E7820FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pt95wwH9veAp; Sun,  1 Oct 2023 18:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 685228210B;
	Sun,  1 Oct 2023 18:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 685228210B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90C5C1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0210E60C0C
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0210E60C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2VoY_fGrM1Q for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDD2760BEB
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD2760BEB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE93983E75; Sun,  1 Oct 2023 18:46:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 20:30:25 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 38e3f0213f14518cb63008260d5c5598cbed5af7
X-Git-Newrev: e6bdfad8d30e9e87737af71b630a1537df66f452
X-Patchwork-Hint: ignore
Message-Id: <20231001184642.CE93983E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/stress-ng: drop
 LDFLAGS_EXTRA
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6bdfad8d30e9e87737af71b630a1537df66f452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Drop LDFLAGS_EXTRA to fix the following build failure raised since
commit 42f25180233df459cd2bfbc5b9ebf8b95c6b60cb:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld: stress-crypt.o: in function `$L17':
stress-crypt.c:(.text+0x2dc): undefined reference to `crypt_r'

Fixes:
 - http://autobuild.buildroot.org/results/0c1d2ef59b88ebb3ae10bf8cb986280b4c1283eb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5e97bc1f05d6925b71e7871c74f1ccf9b5a2d58b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index a7b57459f1..24ec4cb515 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -21,7 +21,7 @@ STRESS_NG_DEPENDENCIES += keyutils
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-STRESS_NG_MAKE_FLAGS += LDFLAGS_EXTRA=-latomic
+STRESS_NG_MAKE_FLAGS += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
 endif
 
 define STRESS_NG_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
