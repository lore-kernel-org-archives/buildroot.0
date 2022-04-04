Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3FDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A30FE409EE;
	Mon,  4 Apr 2022 20:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HX_d3UmoqgS1; Mon,  4 Apr 2022 20:52:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64F9F40943;
	Mon,  4 Apr 2022 20:52:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A04101BF2A2
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99C3440327
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EyTRCWZS1TFy for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:52:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9EEC400D9
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:52:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id q20so6711561wmq.1
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNUptzF3R4Xph262lATIRMb6aq2nqMkvgcPoDfwGbYo=;
 b=p+oIq1zhbQu9ylMI5r51ofbaOI0objGP8ZVAoDoZlxi4PC3P6qdydlUPjcYKNbptaB
 EiU4hmOxdhecR6XoQN8k8tkPe5FEW285uHWNJAP7D1O0EPf7kH+kUAXpEv5zRSr4QABw
 2lqPyS033q5oyGxUpirKIQSHnCHTkpA1285Dz/5Ozddf2xAXhSKPrzO2+HOvCT1/cwjZ
 9TnaXCTajKoQmJk9g7uDzCaAt3RsujIWbK77UKWrUUaSCBYCNUPAKapde1YMY8bEquMV
 +ZY/oeRDePAIeAbDf6WJOx9h6VHKqJKRK0bpSCvP/C8hR9zOJxTNzQSjqNKEZ9uAYioi
 wgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UNUptzF3R4Xph262lATIRMb6aq2nqMkvgcPoDfwGbYo=;
 b=pqvX60+3cwbBqP2/2MY/NCIoXE0QZbPzrpqXkiQM348fTD+VzDYIGXWeWE7QVnd9Ss
 xj7jMmEk4qAhPWboIKu4T48un0AmxHcPZcw8eQt2xZ1JnruOwj2+eN8TxdWTWh13cLaZ
 Ix+gA4wKPGB8DFPGQBH2dJOqd1XNSv3SawS0s5OLQMt2XUMerlQl4rZPIH34bzLequf9
 qHlGsKixNCLdTY0BmdOMdhxICF0QT9Ybas3IgdqW7Za3x0MpUwKljzhI0SHlw4E88Is4
 ROKJLZsvQsKcbaxRqUIZxieWn5GBvIzIl+sFXKnzJzybAe5dQCCOG0doiATyM+2ceWn+
 8pyA==
X-Gm-Message-State: AOAM531QDw3JCiP2If5ANplB0Rg+A1/eXa7pmSmugrIY+8kz8PEZCSg4
 IIEmZ1BmIj9m1l4uPJzoYWQ+io8ATpw=
X-Google-Smtp-Source: ABdhPJwF05+vz7sucQbmP/7looQvfGKK+mRp5H5viELNiiyYf7jj71e1fxWlpd0KizIjNN6USJf3vw==
X-Received: by 2002:a1c:3587:0:b0:381:50ff:cbd with SMTP id
 c129-20020a1c3587000000b0038150ff0cbdmr782163wma.140.1649105520609; 
 Mon, 04 Apr 2022 13:52:00 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0038cb8b38f9fsm97382wmq.21.2022.04.04.13.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:52:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 22:50:15 +0200
Message-Id: <20220404205015.341053-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/trace-cmd: needs NPTL
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

trace-cmd needs NPTL since bump to version 2.9.1 in commit
0e1231a3c0719269ab3546defe4b1fb0f1f5d7d2 and
https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=08b9d5076455c93c997376c8089ee12b9071785b:

/nvmedata/autobuild/instance-24/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/10.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-24/output-1/build/trace-cmd-2.9.7/lib/trace-cmd/libtracecmd.a(trace-timesync.o): in function `tracecmd_tsync_with_host':
trace-timesync.c:(.text+0x12e1): undefined reference to `pthread_setaffinity_np'

Fixes:
 - http://autobuild.buildroot.org/results/9a88aaf92760b34958ef5b1708de83e46ccdb587

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/trace-cmd/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index 574541c571..2d0accd7ae 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TRACE_CMD
 	bool "trace-cmd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# pthread_setaffinity_np
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
 	help
@@ -13,6 +14,6 @@ config BR2_PACKAGE_TRACE_CMD
 
 	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
 
-comment "trace-cmd needs a toolchain w/ threads, dynamic library"
+comment "trace-cmd needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
