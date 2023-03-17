Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFDFC76195
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D3D64160B;
	Fri, 17 Mar 2023 08:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3D64160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5SxqTn3bYpF; Fri, 17 Mar 2023 08:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA5AB410CB;
	Fri, 17 Mar 2023 08:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA5AB410CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58A9C1BF97F
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 325C9613B3
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 325C9613B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZguoIx8RfxkB for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64E4860F5D
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E4860F5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54BC1874F4; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:18:19 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 160828f4431eafde024aed85a30efd7960513f98
X-Git-Newrev: afb90502dae53b2a4dffd3b0125cf2eda20ce49d
X-Patchwork-Hint: ignore
Message-Id: <20230317083810.54BC1874F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libgcrypt: fix
 Thumb mode workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=afb90502dae53b2a4dffd3b0125cf2eda20ce49d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

/tmp/ccRqWxnA.s:98: Error: instruction not supported in Thumb16 mode -- `adds ip,fp,r0'

Fixes:
 - http://autobuild.buildroot.org/results/4b96f4e41724e5c9c806a6c7df397a58d1ae1b1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit cda8dabfeb8f53b1a7dd1341ad9fc7e37bff516e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index e5fdfcfc8e..e8ffe00d73 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -26,8 +26,8 @@ LIBGCRYPT_CONF_OPTS += --disable-asm
 endif
 
 # Code doesn't build in thumb mode
-ifeq ($(BR2_arm),y)
-LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBGCRYPT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
