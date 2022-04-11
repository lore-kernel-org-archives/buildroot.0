Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1BEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 21:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E0E460E8F;
	Mon, 11 Apr 2022 21:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NbA5G14MyZGd; Mon, 11 Apr 2022 21:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BE9360E43;
	Mon, 11 Apr 2022 21:21:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC8F31BF30D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA23660E43
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4BjBQN5wlKA for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 21:21:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C705960B37
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 21:21:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 h126-20020a1c2184000000b0038eb17fb7d6so380815wmh.2
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 14:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6F+byBoSGY9m+SUu/jqzF7pXMY8hkyxY0NOn3Z6ZVW8=;
 b=F0SvH+EXIxTBBDqMVl3B38IDtdQz4/vD9d0+QMQA25qNi1K3SrQa+ch0lZrGa0ZYfh
 tooOVezZE89GuHHlkHZQX9oa7q+JHp4/7L+dePcr5RvJQiGt4zo3CgZeEHmLv7VtQdVz
 348u6omwjxDv3VPJDFkQlpYnJeul0+s+6TMbXnAAK2GCUn1AgeOIPrGm9iyQjObMaEGr
 k02w4JIIkcKmi0NAYlQ4jvCP6jbI1o08GizpTm5aKl9PU4lEeobch0QexLtunReroDnj
 H2IOXiqx+eG42mG8yzKtxvq2NSNahbAwBEZE5nglt3EKIwr6zfng6orkvwND6gsEEHIz
 lxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6F+byBoSGY9m+SUu/jqzF7pXMY8hkyxY0NOn3Z6ZVW8=;
 b=qQz+zj+3PhfHyWg6Cu8eie6leA4OiVsaFnUduPfrAKlujM0SrA6o8rhdPBxVUerSqF
 yCGFFNoa0N4I4D+GYSU5d7CIAjx08ifQyso6b6CefTXPohjL+Rqm0pwxreq3UWDxfTeV
 0/hWkxE7JbSImISKJMWiuvDGhRLKV2gPspwQZ+J9gDTDioFDo8CEczUIDRgJ+E+lq8bl
 OXuEKT/EQOHMhbozJOkGbKmT6ATZvcKzawIV2h/LfTN6nkGZSyRhIStFVchNHjxPrbU4
 dIb+BRHnB7aExTHHyqvBZxn+M4saWEfaUOFQ2W5NrfxQVFg9Lef/sTj1za1cr4V2ItwW
 v6tg==
X-Gm-Message-State: AOAM531pn+XFAlsqZYw4oMJJMhGrTmfzUVUWpTURxpFkJH6zWF6WWp25
 NpKn0QOgQG9cE/AJuYsVtqiXZuaFong=
X-Google-Smtp-Source: ABdhPJxKyqhUOvBNVKit/sC3NaAPir0zE4rTZELyZ13j3MwZr0f2N0hFDCpelRQnDPFfdgpmXm084Q==
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr938484wmb.199.1649712114550; 
 Mon, 11 Apr 2022 14:21:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d5987000000b00207891050d4sm11687252wri.46.2022.04.11.14.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:21:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 23:19:56 +0200
Message-Id: <20220411211956.257449-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rsync: fix static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure when using an external zlib:

/home/autobuild/autobuild/instance-11/output-1/host/bin/i686-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0  -static -DHAVE_CONFIG_H -Wall -W -Wno-unused-parameter -static -o rsync flist.o rsync.o generator.o receiver.o cleanup.o sender.o exclude.o util.o util2.o main.o checksum.o match.o syscall.o log.o backup.o delete.o options.o io.o compat.o hlink.o token.o uidlist.o socket.o hashtable.o usage.o fileio.o batch.o clientname.o chmod.o acls.o xattrs.o progress.o pipe.o   params.o loadparm.o clientserver.o access.o connection.o authenticate.o lib/wildmatch.o lib/compat.o lib/snprintf.o lib/mdfour.o lib/md5.o lib/permstring.o lib/pool_alloc.o lib/sysacls.o lib/sysxattrs.o    -lz -lpopt -liconv
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-uclibc/9.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-11/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libz.a(deflate.c.o): in function `read_buf':
deflate.c:(.text+0xb93): multiple definition of `read_buf'; io.o:io.c:(.text+0x2bf4): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/488453197da880dda8f47b71ff302192bcbb6679

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...g-with-a-zlib-with-external-read_buf.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch

diff --git a/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
new file mode 100644
index 0000000000..0af090732c
--- /dev/null
+++ b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
@@ -0,0 +1,27 @@
+From 60dd42be603a79cd57cec076fe1680e9037be774 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Mon, 11 Apr 2022 08:29:54 -0700
+Subject: [PATCH] Handle linking with a zlib with external read_buf.
+
+[Retrieved from:
+https://github.com/WayneD/rsync/commit/60dd42be603a79cd57cec076fe1680e9037be774]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ rsync.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/rsync.h b/rsync.h
+index 4b30570b..e5aacd25 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -1172,6 +1172,10 @@ struct name_num_obj {
+ 	struct name_num_item list[10]; /* we'll get a compile error/warning if this is ever too small */
+ };
+ 
++#ifdef EXTERNAL_ZLIB
++#define read_buf read_buf_
++#endif
++
+ #ifndef __cplusplus
+ #include "proto.h"
+ #endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
