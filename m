Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7CEC4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 07:23:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C35B60F92
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 07:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C35B60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32D6D400BE;
	Mon,  9 Aug 2021 07:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlnJab1jKSwH; Mon,  9 Aug 2021 07:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F21F8400F2;
	Mon,  9 Aug 2021 07:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 924171BF40D
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 07:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8084D402E7
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 07:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-YUdK4v5d0z for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 07:23:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCC5A402CE
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 07:23:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6EAB68D360; Mon,  9 Aug 2021 07:22:57 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 9 Aug 2021 09:23:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 878fbd5fbf9683be2bb021e857ce119f78e80f94
X-Git-Newrev: dd432a78867f2b88d50b2bcc465bc1c094992c26
X-Patchwork-Hint: ignore
Message-Id: <20210809072257.6EAB68D360@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust-bin: fix
 armv7-unknown-linux-gnueabi
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd432a78867f2b88d50b2bcc465bc1c094992c26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d69d40c029dc7d8199b745eaee759d92b66c5d17 forgot to add hash for
armv7-unknown-linux-gnueabi resulting in the following build failure:

ERROR: No hash found for rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz

Fixes:
 - http://autobuild.buildroot.org/results/443f94bb9ae0addb5130f96fb363ec9651e8af3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 136ff79764..be502465cc 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -31,6 +31,9 @@ sha256 b1f25af230f3b6fd930452024bd0cc9f4599bfb15f09f802cdb756effa516bbf  rust-st
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
 sha256  86549aca1b65188cedf3f1c8fce5af3d7f817450418367049d4bbe8c69ba1da0  rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  7823b95fc3fcd7cc47ba767e2e917c9efbafed2d5ad0b74e7c087600bd72e54f  rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.asc
 sha256 f9a650a3970dbc321e8979dd87ed02fd8f9d03901c3fb1a87724f3c214eb6e57  rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
