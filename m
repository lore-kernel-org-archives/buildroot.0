Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6D5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:02:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9982D6103C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9982D6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF7E80F2D;
	Mon, 25 Oct 2021 19:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LACVmLpb-Uu; Mon, 25 Oct 2021 19:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCDB780F26;
	Mon, 25 Oct 2021 19:02:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 466C61BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35463403D2
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yvys8a32L419 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:02:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65AFB403BA
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D5185887AF; Mon, 25 Oct 2021 18:59:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:51:36 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c495217f73de5e9686164b9b7d23e1d425d94087
X-Git-Newrev: 53bab991863104b77afeb6d0991d7540a74d4af7
X-Patchwork-Hint: ignore
Message-Id: <20211025185904.D5185887AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 support/scripts/pkg-stats: prefers stable version from
 release-monitoring.org
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

commit: https://git.buildroot.net/buildroot/commit/?id=53bab991863104b77afeb6d0991d7540a74d4af7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

For example with libpng: 1.6.37 instead of 1.7.0beta89

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr: coalesce into a single line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f7b0e086053644b29ec29fa775b7f0ffa0ba408a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cc91d13167..d5bd130de3 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -484,7 +484,7 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
                 return False
 
             data = await resp.json()
-            version = data['version'] if 'version' in data else None
+            version = data['stable_versions'][0] if 'stable_versions' in data else data['version'] if 'version' in data else None
             check_package_latest_version_set_status(pkg,
                                                     RM_API_STATUS_FOUND_BY_DISTRO,
                                                     version,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
