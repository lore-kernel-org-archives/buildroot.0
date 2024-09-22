Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FEECF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28E240219;
	Sun, 22 Sep 2024 09:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rS_3-rq0B6H; Sun, 22 Sep 2024 09:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9815740234
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9815740234;
	Sun, 22 Sep 2024 09:22:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5E41BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CB47812E3
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6eezYPeQl8i for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.5;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9F47812AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9F47812AF
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9F47812AF
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:22:26 +0000 (UTC)
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g2-0 (Coremail) with SMTP id _____wD3n7hC3u9mIgxkFQ--.10503S2;
 Sun, 22 Sep 2024 17:07:17 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 17:07:04 +0800
Message-ID: <20240922090713.20744-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3n7hC3u9mIgxkFQ--.10503S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4kZFyrKrWDZr1UCFWDCFg_yoW5XF47pr
 4xGr15Gw4xKF1fJrWagasrXF13Wws7Cr4UJ3srJr1jvryUC3WUA3yktayUC347Gry7Aw4U
 AF18Gr45ur1UtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUaXH_UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQhiXmVODDzBNAAAsz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=XFZP6
 Cz3NqXKTSC/RLSdP5cEdZytv6L+qjztOOFD9ac=; b=IlpzX+ee9ogonJS8UnFoZ
 uNvVr8V6FsiBcINe4HirzNHpbOHGldb88nHeCiZQKeoYs510YVzrQEOCHvG3tB4/
 OBDifXn7fCVOwRUYY4Vu1ZFqGNq05ME7xn2zPhWkoWut/VJZBfoDWdwUen4CZWPV
 zow95hoQnjlZH7Ln2Gwt8c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=IlpzX+ee
Subject: [Buildroot] [PATCH] package/io: New package
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
Cc: Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A utility to access memory/register via physicas address:

Raw memory i/o utility

io -v -1|2|4 -r|w [-l <len>] [-f <file>] <addr> [<value>]

    -v         Verbose, asks for confirmation
    -1|2|4     Sets memory access size in bytes (default byte)
    -l <len>   Length in bytes of area to access (defaults to
               one access, or whole file length)
    -r|w       Read from or Write to memory (default read)
    -f <file>  File to write on memory read, or
               to read on memory write
    <addr>     The memory address to access
    <val>      The value to write (implies -w)

Examples:
    io 0x1000                  Reads one byte from 0x1000
    io 0x1000 0x12             Writes 0x12 to location 0x1000
    io -2 -l 8 0x1000          Reads 8 words from 0x1000
    io -r -f dmp -l 100 200    Reads 100 bytes from addr 200 to file
    io -w -f img 0x10000       Writes the whole of file to memory

Note access size (-1|2|4) does not apply to file based accesses.

Signed-off-by: Andy Yan <andyshrk@163.com>
---
 package/Config.in    |  1 +
 package/io/Config.in |  6 ++++++
 package/io/io.mk     | 20 ++++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/io/Config.in
 create mode 100644 package/io/io.mk

diff --git a/package/Config.in b/package/Config.in
index 4eccf77dd3..99856ff23b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2361,6 +2361,7 @@ menu "Miscellaneous"
 	source "package/gr-osmosdr/Config.in"
 	source "package/gsettings-desktop-schemas/Config.in"
 	source "package/haveged/Config.in"
+	source "package/io/Config.in"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
 	source "package/netdata/Config.in"
diff --git a/package/io/Config.in b/package/io/Config.in
new file mode 100644
index 0000000000..ba2cc2fc4f
--- /dev/null
+++ b/package/io/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_IO
+	bool "Raw memory i/o utility"
+	help
+	  A utility for read/write memory/register
+
+	  https://github.com/andyshrk/io.git
diff --git a/package/io/io.mk b/package/io/io.mk
new file mode 100644
index 0000000000..7454f25b22
--- /dev/null
+++ b/package/io/io.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# io
+#
+################################################################################
+
+IO_VERSION = master
+IO_SITE = $(call github,andyshrk,io,$(IO_VERSION))
+IO_LICENSE = GPL-2.0+
+IO_LICENSE_FILES = COPYING.GPL
+
+define IO_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/io.c -o $(@D)/io
+endef
+
+define IO_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/io $(TARGET_DIR)/usr/bin/io
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
