Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949A2C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:42:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5122F60F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5122F60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0374053F;
	Tue,  3 Aug 2021 21:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfvUVHcJU44q; Tue,  3 Aug 2021 21:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A5CD403CC;
	Tue,  3 Aug 2021 21:42:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46DE11BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0762040552
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZDeGvXrQcw3 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6511C4044D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AD07D843F5; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 23:04:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7cee1f6eecc5d36921fa99d69ef4bbe007549bac
X-Git-Newrev: 1c3e0f95bcaa3fe3a787abac4401c5a4c2860ef6
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.AD07D843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mimic: fix static
 build with gcc 10
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1c3e0f95bcaa3fe3a787abac4401c5a4c2860ef6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
 - http://autobuild.buildroot.org/results/bee20bbfa4fa64ed8704bfb9586d5a3148f39fdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-linking-on-gcc-10.2.0-or-newer.patch  | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch b/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch
new file mode 100644
index 0000000000..ea02bf587e
--- /dev/null
+++ b/package/mimic/0001-Fix-linking-on-gcc-10.2.0-or-newer.patch
@@ -0,0 +1,27 @@
+From 77b36eaeb2c38eba571b8db7e9bb0fd507774e6d Mon Sep 17 00:00:00 2001
+From: Kris Gesling <kris.gesling@mycroft.ai>
+Date: Tue, 11 May 2021 09:15:22 +0930
+Subject: [PATCH] Fix linking on gcc 10.2.0 or newer
+
+Co-authored-by: MichaelSabal <michaelsabal@users.noreply.github.com>
+
+[Retrieved from:
+https://github.com/MycroftAI/mimic1/commit/77b36eaeb2c38eba571b8db7e9bb0fd507774e6d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lang/cmu_indic_lang/cmu_indic_lang.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lang/cmu_indic_lang/cmu_indic_lang.h b/lang/cmu_indic_lang/cmu_indic_lang.h
+index 75ee46c..83e2afa 100644
+--- a/lang/cmu_indic_lang/cmu_indic_lang.h
++++ b/lang/cmu_indic_lang/cmu_indic_lang.h
+@@ -51,7 +51,7 @@ void cmu_indic_lang_init(cst_voice *v);
+ extern const cst_phoneset cmu_indic_phoneset;
+ extern const cst_cart cmu_indic_phrasing_cart; 
+ 
+-const cst_regex * const cst_rx_not_indic;
++extern const cst_regex * const cst_rx_not_indic;
+ 
+ #ifdef __cplusplus
+ } /* extern "C" */
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
