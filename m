Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E68C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8C561050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB8C561050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D183825C7;
	Sun, 12 Sep 2021 12:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXSdKSXJ98_d; Sun, 12 Sep 2021 12:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06FDB825BF;
	Sun, 12 Sep 2021 12:43:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC5D61BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F5DA40027
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENg7En3xNSNO for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:43:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDFFF40539
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A3F368A403; Sun, 12 Sep 2021 12:41:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 14:30:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d27c74381c37843592fe851d1953e3de0c1e4290
X-Git-Newrev: 2143c74484e12afd81fd4bc27849a4a1f4bfc2d8
X-Patchwork-Hint: ignore
Message-Id: <20210912124145.A3F368A403@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rwmem: needs wchar
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2143c74484e12afd81fd4bc27849a4a1f4bfc2d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rwmmem needs wchar because of fmt dependency since its addition in
commit 51a282bcb8dfc26d3a27723383c5a1767653a19d

Fixes:
 - http://autobuild.buildroot.org/results/1c06c27d70aae8bdb39ae43fbe74896e536293c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rwmem/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
index 0fd9142e92..cd9a7f78f1 100644
--- a/package/rwmem/Config.in
+++ b/package/rwmem/Config.in
@@ -2,9 +2,14 @@ config BR2_PACKAGE_RWMEM
 	bool "rwmem"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_INIH
 	help
 	  Simple program to read/write from/to any location in memory.
 
 	  https://github.com/tomba/rwmem
+
+comment "rwmem needs a toolchain w/ C++, wchar, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
