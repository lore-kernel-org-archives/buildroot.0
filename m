Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8017AC36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 17:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA19F84729;
	Wed, 26 Mar 2025 17:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUO_EBTwUJZP; Wed, 26 Mar 2025 17:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0742284703
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0742284703;
	Wed, 26 Mar 2025 17:08:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 606D1C0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 17:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4717C606C0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 17:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tO6K9ZefRLJ0 for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 17:08:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.3;
 helo=m16.mail.163.com; envelope-from=uuidxx@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3711360631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3711360631
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3711360631
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 17:08:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnD+uaNORnd8OACA--.784S2;
 Thu, 27 Mar 2025 01:08:43 +0800 (CST)
From: Frank Chung <uuidxx@163.com>
To: buildroot@buildroot.org
Cc: Frank Chung <uuidxx@163.com>
Date: Thu, 27 Mar 2025 01:08:14 +0800
Message-ID: <20250326170814.2393-1-uuidxx@163.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDnD+uaNORnd8OACA--.784S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry3XFy5tFyUuF48Cr1Utrb_yoWDZrgEvr
 yfKrnYyw4rZ347XFy8JFyfA343Cw45WF15tF4vga1vga18Za1kZ395uFyIqr15WFZFqry7
 ZF4rJw1Ivr9IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREasj5UUUUU==
X-Originating-IP: [121.32.196.226]
X-CM-SenderInfo: hxxlv5r06rljoofrz/xtbBaRUc22fkLsB-RAAAst
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=BQp2R
 BedpzYJEwGIEFXaiq29doPPz2ZHtq3h2KySAas=; b=IJJhAdQv8zxltk9Ss4TTy
 uKaSkwTWGDsc8MxOk5QB82qh5n7s0PivQXZcKiSd1E+Xeuc40yLiR0GOcHE75Qav
 25aad4ofNKjtH1tsCSDQ0kZQCGveQ1xWho60FtbbktOELMjlp7v7v90VnXt4kRjj
 /Go4L6YFZ7dcwFvkXXg+Vo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=IJJhAdQv
Subject: [Buildroot] [PATCH 1/1] package/lrzsz: fix patch compatibility with
 musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The macro "__GNU_LIBRARY__" was introduced in "[PATCH] lib/long-options.c:
include stdlib.h". However, musl does not have this macro, which makes it
impossible to find the relevant header file when compiling with GCC 14.x.

Signed-off-by: Frank Chung <uuidxx@163.com>
---
 package/lrzsz/lrzsz.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 12d52b8ebd..114585b5ca 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -13,6 +13,11 @@ LRZSZ_CPE_ID_VALID = YES
 LRZSZ_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LRZSZ_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+# Make the code believe we are using a C library compatible with glibc
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LRZSZ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D__GNU_LIBRARY__"
+endif
+
 define LRZSZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
 	$(INSTALL) -m 0755 -D $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
