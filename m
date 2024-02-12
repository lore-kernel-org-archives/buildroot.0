Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55790C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2397A40523;
	Mon, 12 Feb 2024 21:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbTVQm1KiiL1; Mon, 12 Feb 2024 21:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF8840695
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF8840695;
	Mon, 12 Feb 2024 21:56:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9777C1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84C5160A49
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYk_q2cnYxTo for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C096D608D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C096D608D1
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:56:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD88C878D2; Mon, 12 Feb 2024 21:56:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 22:55:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa9893ad8fb94278d7e8b80cd3e795469223faf0
X-Git-Newrev: ed804a9f0c09a151f32be36f63ae4c924b9dc360
X-Patchwork-Hint: ignore
Message-Id: <20240212215607.AD88C878D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: drop ELFUTILS_{C,
 CPP}FLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed804a9f0c09a151f32be36f63ae4c924b9dc360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ELFUTILS_CFLAGS and ELFUTILS_CPPFLAGS are empty since commit
7593aea519dee34cb25715296c1b03f471123ee2 so drop them to avoid setting
incorrect flags

Fixes: 7593aea519dee34cb25715296c1b03f471123ee2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elfutils/elfutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index cb4293b0c3..87b51aa5b5 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -29,10 +29,6 @@ HOST_ELFUTILS_CONF_OPTS = \
 	--without-zstd \
 	--disable-progs
 
-ELFUTILS_CONF_ENV += \
-	CFLAGS="$(ELFUTILS_CFLAGS)" \
-	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
-
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS) \
 	$(TARGET_NLS_LIBS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
