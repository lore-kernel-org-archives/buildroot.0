Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0C2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9571740876;
	Mon, 28 Mar 2022 19:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jf6VgdLqxKLM; Mon, 28 Mar 2022 19:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39A1410BA;
	Mon, 28 Mar 2022 19:58:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCF51BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D5B040AA5
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eW2kPxngwB4V for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CF8140184
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4E54185F40; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 20:54:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5eefab2d4e211adb51d261700b4022e76c60c20
X-Git-Newrev: 92e436b73df21ff9347c53c25fd33d8fd48a9d43
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.4E54185F40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opus: enable custom modes
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

commit: https://git.buildroot.net/buildroot/commit/?id=92e436b73df21ff9347c53c25fd33d8fd48a9d43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable custom modes to avoid the following build failure with jack2
raised since commit 618a23100fe5ff54b90ada1a8f23453f6c5a77dc:

Checking for header opus/opus_custom.h   : not found
The above check failed, but the checkee is required for --opus.

It should be noted that before this commit, opus was silently disabled

Fixes:
 - http://autobuild.buildroot.org/results/b1c050ccd6152c43a6da5f5d2174c3cc0dc2ff3e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opus/opus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 3fb2d5d65f..4f816df477 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -17,6 +17,7 @@ OPUS_CFLAGS += -O0
 endif
 
 OPUS_CONF_ENV = CFLAGS="$(OPUS_CFLAGS)"
+OPUS_CONF_OPTS = --enable-custom-modes
 
 ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
