Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030C8C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B122A40534;
	Sat, 26 Aug 2023 18:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B122A40534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6A7k7N-Q0zP; Sat, 26 Aug 2023 18:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF5D5408AF;
	Sat, 26 Aug 2023 18:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF5D5408AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8815E1BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0271409FC
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0271409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_HKnKNOcJUz for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C8841488
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C8841488
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A84AE863F7; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:24:43 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b7c0e5fb01b198760dc989638fe18eb8e63f2e54
X-Git-Newrev: b8d73a338e7c5eb078482732dd162301eac59b10
X-Patchwork-Hint: ignore
Message-Id: <20230826184802.A84AE863F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pipewire: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8d73a338e7c5eb078482732dd162301eac59b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
