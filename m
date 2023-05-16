Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088B5C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82F0841172;
	Tue, 16 May 2023 12:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82F0841172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiwtLwUKIeDA; Tue, 16 May 2023 12:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A485040C14;
	Tue, 16 May 2023 12:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A485040C14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2271BF2F2
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 12:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4575081F6D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 12:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4575081F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MrxVzL7u1XbD for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 12:50:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71D6281F64
 for <buildroot@buildroot.org>; Tue, 16 May 2023 12:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71D6281F64
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 605F286774; Tue, 16 May 2023 12:50:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 14:40:49 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 18ea458338358731d3e4b9fb833e70ee1a363003
X-Git-Newrev: 7ce01f03f24477d8cb5a1d2ff3f7f1876608e06a
X-Patchwork-Hint: ignore
Message-Id: <20230516125021.605F286774@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/edid-decode:
 change download from git URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ce01f03f24477d8cb5a1d2ff3f7f1876608e06a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- change download from git URL to https (and SITE_METHOD git)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9507e5a4b495716aa8e91211691f62223b883276)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/edid-decode/edid-decode.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 7e463c02b1..f2fcde6e34 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 EDID_DECODE_VERSION = 188950472c19492547e298b27f9da0d72cf826df
-EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
+EDID_DECODE_SITE = https://git.linuxtv.org/edid-decode.git
+EDID_DECODE_SITE_METHOD = git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
