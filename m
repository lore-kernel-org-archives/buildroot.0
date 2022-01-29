Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B429FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 18:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21C07400F1;
	Sat, 29 Jan 2022 18:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrV547qx8iS1; Sat, 29 Jan 2022 18:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BBF640125;
	Sat, 29 Jan 2022 18:34:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48A621BF3EB
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 18:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 371A9403C8
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 18:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cdO3mVQ1mZw for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 18:34:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id 807F440386
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 18:34:29 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id DsYNn9YL8iF0aDsYNnhEhl; Sat, 29 Jan 2022 19:34:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643481267; bh=QBOvd4OqZIjNex2bf6mIHuKF04wzA32jU9bSvRN7gMU=;
 h=From:To:Subject:Date:MIME-Version;
 b=lLH6IAccjbNLb3sS9IbaDHsjFW8XirgIjKCwOfUUkYc2wfhAJcepOeYYxwwva240S
 MOwk5VN0i5mKVHKDL7nyevlUlWk4xyQt+AyTIbJdtwASljGIMoHNQZ0nFLsMwrJ1Pb
 9zj22edG2j2s/Oyc+AcXOEJPzka32w/P80T+dc7D+yYnXYTXWkSoDenRlg7JwQQ6cG
 y/hqBPj+hGhZ+nTXuEjz90RjH0LMD5CNxSNehAEL1ISdURM5P1XK2r3jSj7HOhtn19
 lAVn0JS3TVqGLl69flr5n20p8QKU12K7yN62NeuBYoA3jOK0wKMSc1bJba1S9WRoOq
 iyq3VulIuRyYw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 19:34:26 +0100
Message-Id: <20220129183426.152177-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLBKd1BBC34YB3G5BM12vqK3T1MLTDOkiyrnbVN4ROAIFlBNpGpO9ND1uaGhujQVFeYhxg077y4SIzEvzU1nV4BNrQdVo+6ztConX92fNmWM9N/rUvcU
 cdhjl/faH6pizFub5jloxLMDo5wfH59MyZowWY4553jOI1RXidKHzhRVaaB6wNLcHsAE0rUSX+sjIXDBtrwD7fRf80x2+hUNDnbZVU+BM327r1qrvDz+7UYu
 OIBCLkr385X9EZ961VxjbwKMPBWoc4SgFPeUHWF9AeM5q+qx38toesGzovWtrOQQ
Subject: [Buildroot] [PATCH] package/apitrace: fix build failure on m68k
 architecture
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

apitrace uses very big switch statements, which causes the build to fail
on m68k, because the offsets there are only 16-bit.

We fix that by using -mlong-jump-table-offsets on m68k, to use 32-bit
offsets for switch statements. That flag is available on gcc version >= 7
but apitrace package already depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7, so
we can use it with no problem.

Fixes:
http://autobuild.buildroot.net/results/7306bf05962fec30fbe98b1eb8ee09b3162b8080/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/apitrace/apitrace.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index 3656a5722b..c47562233b 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -38,6 +38,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 APITRACE_CXXFLAGS += -O0
 endif
 
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+APITRACE_CXXFLAGS += -mlong-jump-table-offsets
+endif
+
 APITRACE_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(APITRACE_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(APITRACE_CXXFLAGS)"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
