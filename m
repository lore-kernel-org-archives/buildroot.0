Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6A7C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB80E41482;
	Sat, 13 Jul 2024 14:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkb_mf7Oaxx4; Sat, 13 Jul 2024 14:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E88B40B4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E88B40B4F;
	Sat, 13 Jul 2024 14:12:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 920AD1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E0DB6061A
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwxUyvhhGMDP for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0CCD606A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0CCD606A7
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A689186490; Sat, 13 Jul 2024 14:11:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:11:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf8085cb6dcb1145d1381c75bada03c6302951f8
X-Git-Newrev: c2df2ee019779fcb2edd192de2a58ca3c1e689e6
X-Patchwork-Hint: ignore
Message-Id: <20240713141159.A689186490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: enable host-variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2df2ee019779fcb2edd192de2a58ca3c1e689e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgpg-error is needed by libassuan and libgpgme, the latter
being needed for skopeo (to come in a followup patch).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpg-error/libgpg-error.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 9f60b7bc84..9245e76531 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -26,4 +26,10 @@ else
 LIBGPG_ERROR_CONF_OPTS += --disable-threads
 endif
 
+HOST_LIBGPG_ERROR_CONF_OPTS = \
+	--enable-threads \
+	--enable-install-gpg-error-config \
+	--disable-tests
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
