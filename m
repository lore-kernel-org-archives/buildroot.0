Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBFCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:25:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AAA260FED
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AAA260FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D756F80CDC;
	Mon, 27 Sep 2021 19:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jjtqdIp_wan; Mon, 27 Sep 2021 19:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3371080C83;
	Mon, 27 Sep 2021 19:25:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7001BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A7F740173
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xaWPrMX1pfJp for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:25:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2FDD40150
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:25:42 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UwFwm0GM9KBZzUwFxmkMF2; Mon, 27 Sep 2021 21:25:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632770741; bh=SYGegj0lfbDr5HFfk2BE14z42lcEf8OIM9lpaQxE1ug=;
 h=From:To:Subject:Date:MIME-Version;
 b=cKANTYZzsBZfwPb0mCLeBM7lopT7xzWGOX8oIXg2EYsZ4o2NcLirRicdM3MFNuMO3
 wz47E3NjdAL+A7PwOudRJxS4dieeIzjUKteeS2rYbnE87Y7ZRXlff/h9NJAMVFOR0/
 Di3OJuXqn+EK3VujZehbtMKezi6AqTSrUFiMFWCCDy47kp0EZ4Rd5R7wJ+1EQ9jUEx
 bu4ei7PFnH0IvNf7KnRCjJY+UWJdH4jwA+x8AOIB5KMH/W+Po4BtRHFdan7RMkbM14
 VAvGtzwVt/pTS4nRP7N8Tx2ZJVcKt0Zif4Jn+OpyK9ECF4OLaLlV8mQiX6rN6a1JGE
 U/hPVmIsUc6tg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 21:25:40 +0200
Message-Id: <20210927192540.1940198-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLMWbO3ep4cjQBe55bDAShvqzhT/1/iVDRbTYII+7gKnWb+8MNzOdhwJb6h0O6UnoZJj6xOpWUb+0Fss2UvhSRdLyytp12UdXnccnAH4HhZMIByB0rhg
 cvl5uByIPIVYHH+BrPoBCrp+SdJX0xXMZefj65Sb0AkmktkkoGlxl7Qz+ZRzZKO8MhK1MSSHx8rezp+fWK6Zg61FFZAo3Xw4mfs+kJxhu3MehBJGVyJ8vVKm
 X11M/lYAbHsIJQkQrlpskm5pzh9VpjrwRhTZziXSlYQ=
Subject: [Buildroot] [PATCH] package/dc3dd: disable on arc
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable dc3dd on arc like we've done for riscv32 because of the size of
time_t:

In file included from getdate.y:40:
verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
  132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
verify.h:138:61: note: in expansion of macro 'verify_true'
  138 | # define verify(R) extern int (* verify_function__ (void)) [verify_true (R)]
      |                                                             ^~~~~~~~~~~
getdate.y:116:1: note: in expansion of macro 'verify'
  116 | verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
      | ^~~~~~

Fixes:
http://autobuild.buildroot.net/results/9e2/9e2a8f0548ecb5ce9539eda007cd886ddea7dc0a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/dc3dd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
index 715451beb7..bd181b7065 100644
--- a/package/dc3dd/Config.in
+++ b/package/dc3dd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DC3DD
 	bool "dc3dd"
 	depends on !BR2_RISCV_32
+	depends on !BR2_arc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
@@ -13,5 +14,6 @@ config BR2_PACKAGE_DC3DD
 
 comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
 	depends on !BR2_RISCV_32
+	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_MUSL
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
