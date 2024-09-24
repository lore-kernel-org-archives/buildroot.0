Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F2CF9C6F
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 11:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D9181E78;
	Tue, 24 Sep 2024 11:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmhNzD0YLNmS; Tue, 24 Sep 2024 11:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C6481E79
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C6481E79;
	Tue, 24 Sep 2024 11:04:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 070001BF318
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 11:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 027C34023E
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 11:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMnSniFYVMKe for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 11:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.3;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96BE0401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96BE0401B1
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96BE0401B1
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 11:03:55 +0000 (UTC)
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-4 (Coremail) with SMTP id _____wD326CSnPJmIyjpFg--.32577S2;
 Tue, 24 Sep 2024 19:03:49 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 19:03:44 +0800
Message-ID: <20240924110345.34659-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD326CSnPJmIyjpFg--.32577S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4kZFyrKrWDZr1UZr13urg_yoWrXr15pr
 47Gr15Kw4xKF1fXrW3KasrXF13uws7Cr1UJ3srJ34jvryUCa1UA3ykKayUGr9xWr17Aw4U
 Jwn7Jr4Y9ry8taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUSAp8UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hZkXmWX0nxRDgAAs9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Tw0dc
 H3s52hP6i/DHtOCkBFRvfJXBxRva1JaVxaY8Mk=; b=CcyrsSL2lr6Oi2CNTdZhJ
 +Ac75f0CwdsUX3Y4ePifqBYY+y3C7rGlEOz3P00crxVsb0AlkVHLVgzUCiKDBoe4
 Ph9GcmSu6rskqk9TeQIp3uPlKtyrottl7IrRTcHCo9JkLeg7sj0mCEE2exIu9Spb
 vfTGZVbTb8E2UrCW+eaK6g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=CcyrsSL2
Subject: [Buildroot] [PATCH V2] package/io: New package
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
Cc: Andy Yan <andyshrk@gmail.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Andy Yan <andyshrk@gmail.com>

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

Series-version: 2
Series-changes: 2
- Add myself to the DEVELOPERS file
- use git download method
- add hash file
---
 DEVELOPERS           |  3 +++
 package/Config.in    |  1 +
 package/io/Config.in |  7 +++++++
 package/io/io.hash   |  2 ++
 package/io/io.mk     | 21 +++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/io/Config.in
 create mode 100644 package/io/io.hash
 create mode 100644 package/io/io.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b0efabfd5d..d9b73811b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -240,6 +240,9 @@ F:	package/sysdig/
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
 
+N:	Andy Yan <andyshrk@163.com>
+F:	package/io/
+
 N:	Anisse Astier <anisse@astier.eu>
 F:	package/go/
 F:	package/nghttp2/
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
index 0000000000..acf32947cc
--- /dev/null
+++ b/package/io/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_IO
+	bool "Raw memory i/o utility"
+	help
+	  A utility for read/write memory/register,
+	  you shoud make sure CONFIG_DEVMEM is enable in your linux kernel.
+
+	  https://github.com/andyshrk/io.git
diff --git a/package/io/io.hash b/package/io/io.hash
new file mode 100644
index 0000000000..7d45324196
--- /dev/null
+++ b/package/io/io.hash
@@ -0,0 +1,2 @@
+sha256 d3b4d93988adddbc98af8d7014a045dca5b25aaa7cdbc08c29aa70ebdc86e21c  io-a2600e94aec6503fd0f0109ca26a703c4e7e166e-git4.tar.gz
+sha256 5352e426b563eda9252d76be92337b49f7b5cfdd1302a1e8d99389840c0e46be  LICENSE
diff --git a/package/io/io.mk b/package/io/io.mk
new file mode 100644
index 0000000000..7abc6773c0
--- /dev/null
+++ b/package/io/io.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# io
+#
+################################################################################
+
+IO_VERSION = a2600e94aec6503fd0f0109ca26a703c4e7e166e
+IO_SITE = https://github.com/andyshrk/io.git
+IO_SITE_METHOD = git
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
