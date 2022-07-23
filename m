Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C63BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 097A540B1A;
	Sat, 23 Jul 2022 14:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 097A540B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teZh2at1SnZQ; Sat, 23 Jul 2022 14:35:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00615408F3;
	Sat, 23 Jul 2022 14:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00615408F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C54B1BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07A5A848A3
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A5A848A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8x20yalze3a for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:34:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CAD8841B9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CAD8841B9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 46DB9844CB; Sat, 23 Jul 2022 14:20:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:32:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c844e05de5306cae8fa85516401c6fe85b4c08d6
X-Git-Newrev: d787cc724eca010fe463d3827d922cb278e52aeb
X-Patchwork-Hint: ignore
Message-Id: <20220723142025.46DB9844CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libsamplerate:
 use --{dis, en}able-alsa
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

commit: https://git.buildroot.net/buildroot/commit/?id=d787cc724eca010fe463d3827d922cb278e52aeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 5b679d7806767206f2c7bd7ff69b412bebb504f8 forgot to set
--{dis,en}able-alsa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5ef445e84f8ad45e08c603f1334e8e9550f8e3e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsamplerate/libsamplerate.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 146d57d15e..9d6b6a5ca5 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -15,6 +15,9 @@ LIBSAMPLERATE_CPE_ID_VENDOR = libsamplerate_project
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBSAMPLERATE_DEPENDENCIES += alsa-lib
+LIBSAMPLERATE_CONF_OPTS += --enable-alsa
+else
+LIBSAMPLERATE_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
