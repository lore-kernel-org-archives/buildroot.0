Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6224AC83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1284640232;
	Sat, 26 Aug 2023 18:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1284640232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puvCaxxaimz1; Sat, 26 Aug 2023 18:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C82440A68;
	Sat, 26 Aug 2023 18:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C82440A68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1091BF867
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EDF540A65
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EDF540A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4c9bxs2wY88 for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:49:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 621AF409DB
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 621AF409DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A2EB86418; Sat, 26 Aug 2023 18:49:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:24:39 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 2ed983f7cec80577ca083209a7b099f207cd0660
X-Git-Newrev: 7f1d37ef7bfaf82d3345febc8016b52b9eb55b6e
X-Patchwork-Hint: ignore
Message-Id: <20230826184906.4A2EB86418@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/pipewire: drop
 consecutive empty lines
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f1d37ef7bfaf82d3345febc8016b52b9eb55b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:

package/pipewire/pipewire.mk:184: consecutive empty lines

https://gitlab.com/buildroot.org/buildroot/-/jobs/4682253962/raw

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 157089d34d06712b67f42b083bcfb16a9bdee1f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/pipewire.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d6bd2434bf..f71979db22 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -181,7 +181,6 @@ else
 PIPEWIRE_CONF_OPTS += -Dlibusb=disabled
 endif
 
-
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 PIPEWIRE_CONF_OPTS += -Dpw-cat=enabled -Dsndfile=enabled
 PIPEWIRE_DEPENDENCIES += libsndfile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
