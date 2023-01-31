Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FE5C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091D44EC15;
	Mon, 20 Feb 2023 23:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091D44EC15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFVWawzg4k80; Mon, 20 Feb 2023 23:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CFC04EC13;
	Mon, 20 Feb 2023 23:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CFC04EC13
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7181BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D679941792
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D679941792
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPL0l-2e2l2s for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A54E641787
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A54E641787
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C44386495; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 23:35:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dedbc69022ba0beaf259463ac8082c86776f7e88
X-Git-Newrev: 6f692c548904c5ae130f6e17e303ff4ad0b482b5
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.9C44386495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fluent-bit: fix
 -latomic on various platforms
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f692c548904c5ae130f6e17e303ff4ad0b482b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

/home/thomas/br-test-pkg/bootlin-nios2-glibc/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: /tmp/fluent-bit.6F9rEA.ltrans28.ltrans.o: undefined reference to symbol '__atomic_compare_exchange_8@@LIBATOMIC_1.0'
/home/thomas/br-test-pkg/bootlin-nios2-glibc/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: /home/thomas/br-test-pkg/bootlin-nios2-glibc/host/nios2-buildroot-linux-gnu/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/fluent-bit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index f7727834dd..c84042a0fa 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -41,6 +41,12 @@ FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
 
+# Uses __atomic_compare_exchange_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
 		$(TARGET_DIR)/etc/init.d/S99fluent-bit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
