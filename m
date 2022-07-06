Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CBFD4031F;
	Wed,  6 Jul 2022 21:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CBFD4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0l3wpbMyMrk; Wed,  6 Jul 2022 21:28:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07500402C4;
	Wed,  6 Jul 2022 21:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07500402C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3A861BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB0984031F
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB0984031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2Nw7qdaiaNd for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:28:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3ED8402AF
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3ED8402AF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EE70182BC8; Wed,  6 Jul 2022 21:15:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:22:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d972d4f0391a896d3dc4744698431049b6120ce
X-Git-Newrev: 5ef445e84f8ad45e08c603f1334e8e9550f8e3e0
X-Patchwork-Hint: ignore
Message-Id: <20220706211542.EE70182BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsamplerate: use --{dis,
 en}able-alsa
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ef445e84f8ad45e08c603f1334e8e9550f8e3e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5b679d7806767206f2c7bd7ff69b412bebb504f8 forgot to set
--{dis,en}able-alsa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
