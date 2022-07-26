Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D43DC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DDA440350;
	Tue, 26 Jul 2022 20:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DDA440350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVhidZD3AYbc; Tue, 26 Jul 2022 20:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD4E3408E5;
	Tue, 26 Jul 2022 20:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD4E3408E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4AC21BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEEB08176B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEEB08176B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTxsAS8Unfmv for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16BE181765
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16BE181765
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8994B86028; Tue, 26 Jul 2022 20:41:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:54:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2156c6d216dea9f45cae9374e8f7d475fe2f1f54
X-Git-Newrev: fbb8eb0be2229d21c8e265047a43158e806c8f51
X-Patchwork-Hint: ignore
Message-Id: <20220726204126.8994B86028@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: add pcre2-16 to the host
 variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbb8eb0be2229d21c8e265047a43158e806c8f51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed by qt6base, and it is not worth creating a hidden
host package option for this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pcre2/pcre2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 043f6d866f..06a0afc9b8 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -28,5 +28,8 @@ ifeq ($(BR2_USE_MMU),)
 PCRE2_CONF_OPTS += --disable-pcre2grep-callout
 endif
 
+# needed for qt6base
+HOST_PCRE2_CONF_OPTS = --enable-pcre2-16
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
