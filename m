Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B118C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:38:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B733A60EE4
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B733A60EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C2214017C;
	Fri, 13 Aug 2021 21:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXKDf2Lsjdfl; Fri, 13 Aug 2021 21:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D7840182;
	Fri, 13 Aug 2021 21:37:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57D6B1BF40F
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 400CC407B7
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMPviMOLHy-b for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 21:37:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23397407B0
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 21:37:49 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.42.73])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ees6mj8VpZx06Ees8mjCki; Fri, 13 Aug 2021 23:37:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628890668; bh=SvGqrKFYwDE65hwZRjdnaxTUAyr3NqE2DlY6Yo0YPa4=;
 h=From:To:Subject:Date:MIME-Version;
 b=bgH8C7WGsQ+QJktMq8duQd8VEgUk/CGwu4VKtXOJWRpwtb/Kqh21ZeO8zEbZiQkYe
 rpZv2m3ju8BVcPGTIrL222V3x4Xz9tXvmMnczjrcuaEt7S0OPqxebLy0+58dWf9ykb
 9dWzEkoMqbI6O+D8qt39CUJRtfos6iQvjs+o+oyR46tXzw5j72Vbuc6Pk6dim89vkQ
 YZjO/nxK1RvpqokxlM9c9GygxGIkqwu+S5wxXINqBTyoFFnNCmGMLZlfi7nbme5a9w
 CS73E7Z1RzfchMPysF98wyLLdmiqt3Ko+nQOR0Sm8W6rGRyGBZNDdGrUIv3aUGv1NI
 jdtJIFNJSDTZQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 23:37:43 +0200
Message-Id: <20210813213745.1555522-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
References: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNS93U62nkrP3PnTOl9oJRxbGXctoYXgxvz1i285yXaDdyXfwS+8uep/jrF8WsyYLoxBpx+cJaFj8XsmPGb0T2keVsdWNG89ZBTvk4gbeaGArV5LKbeV
 2E3LUEH6kNmIU7Sb/T9SwJvuPd3XqhKCiyKmIEYikDksVj6l1XxpyHmi0dxKg2ZDeJAQtXtlbJWCjRhpASsHUzs2ZpfoD30+RFpRPtLC8GpUkgIiluLt+PQj
 LI/BSVNYKbbtxABSntxEtFK/fX6cvb5v1sNP1+y3QTlXNjGbzM+3y7/nvqytuz/6LF9terr9OcNeMpsLF7J7zKzUtFKGWp/BtayT+kNF8apSTNGe9KPIq9iQ
 8gnqlk8ANf5STm0YfFqOtq8kwC0/dA==
Subject: [Buildroot] [PATCH 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_97208
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

lmbench package fails to build for the Microblaze architecture with
optimization enabled with gcc = 11.1.0:
http://autobuild.buildroot.net/results/ae1/ae1e4d61ed367c6cb64442c60d98882cc7985346/

It's been reported upstream by Romain Naour:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208

Cc: Roman Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3888eeafe2..1dae0cb2cc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -163,6 +163,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 	bool
 	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208
+# ICE: in extract_insn, at recog.c:2294 on microblaze.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_97208
+	bool
+	default y if BR2_microblaze
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
 # no longer exists in gcc >= 9.x.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
