Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F6CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:57:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D6860EBC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68D6860EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E74A66061A;
	Tue,  3 Aug 2021 19:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vi55AUHhhulk; Tue,  3 Aug 2021 19:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4496760726;
	Tue,  3 Aug 2021 19:57:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF2701BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE422404F9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1wjJytCIbTA for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C7A44037E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A2E428B355; Tue,  3 Aug 2021 19:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 21:53:07 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 76a1d3b6e8c1b0aeb1f43022acbcb5eba2cb8ad3
X-Git-Newrev: 75f37e2b646aca8420d2ef35736d6f55f1e5a6ee
X-Patchwork-Hint: ignore
Message-Id: <20210803195719.A2E428B355@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Revert "package/putty:
 Ignore CVE-2021-33500"
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

commit: https://git.buildroot.net/buildroot/commit/?id=75f37e2b646aca8420d2ef35736d6f55f1e5a6ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This reverts commit 01063c4291a7300285ad9ec044b94968dd6c2d09.

With putty now bumped to 0.75, this can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 4876d3818e..1e5a89ea9f 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -11,9 +11,6 @@ PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
 PUTTY_CONF_OPTS = --disable-gtktest
 
-# Windows only, fixed for Windows with 0.75
-PUTTY_IGNORE_CVES += CVE-2021-33500
-
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_CONF_OPTS += --with-gtk=2
 PUTTY_DEPENDENCIES += libgtk2
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
