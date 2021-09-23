Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A1DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B09F6124D
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B09F6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 687E3841E3;
	Thu, 23 Sep 2021 20:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mc5sVxs5iI9K; Thu, 23 Sep 2021 20:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E410841D6;
	Thu, 23 Sep 2021 20:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F30E1BF3EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C097841D6
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISKohGx13gap for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4761C841C9
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BB1468CAA4; Thu, 23 Sep 2021 20:13:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 21:40:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db7d78614098fcab204a00bc767ec509ae633ca6
X-Git-Newrev: fe1eb2a0b3549d80cfe9fe23a870c1c8661acf57
X-Patchwork-Hint: ignore
Message-Id: <20210923201359.BB1468CAA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstd: needs gst-debug
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe1eb2a0b3549d80cfe9fe23a870c1c8661acf57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gstd needs gst-debug since its addition in commit
02ea01ea22e94ef353a638bf16f62f6e3ed1208e:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-gnu/10.2.0/../../../../riscv64-buildroot-linux-gnu/bin/ld: gstd/libgstd-core.so.0.13.0.p/gstd_pipeline.c.o: in function `gstd_pipeline_get_property':
gstd_pipeline.c:(.text+0x5d8): undefined reference to `gst_debug_bin_to_dot_data'

Fixes:
 - http://autobuild.buildroot.org/results/2f4de1b229df47d9bfd5a2576fd59da2ad45aeb6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gstd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
index 14cda7c45f..f36d25f11f 100644
--- a/package/gstreamer1/gstd/Config.in
+++ b/package/gstreamer1/gstd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GSTD
 	depends on BR2_USE_WCHAR # libglib2 -> gettext, libsoup
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libsoup
 	depends on BR2_USE_MMU # libdaemon, libglib2
+	select BR2_PACKAGE_GSTREAMER1_GST_DEBUG # gst_debug_bin_to_dot_data
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDAEMON
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
