Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA35C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 18:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D3D428BC;
	Wed,  5 Jan 2022 18:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMMTd3am9ZNs; Wed,  5 Jan 2022 18:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69DE7428B9;
	Wed,  5 Jan 2022 18:07:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5D571BF47E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B47D282CF1
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sQ5R3aJRk-Q for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 18:07:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E6BE813B7
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 18:07:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j18so84705604wrd.2
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=egWUUoovIegsB6SkJCZOOrxNKr23x2157JP3ICa5cOM=;
 b=c2swDA7l9MxlAVD1YRaBP/rJLgHx8OGy5d9Gf+/C3i97zp1aW1JGUeFrK1LbtlR2aK
 dujFTooRZ77AwjXZxgN6/IA73GzP5M2bM32xkJiAtgizlNJGQpOjCyqWu/UawpbCI7Ci
 9h7QAWRYQIQwFKtisz1k+2oIEu7Z+87CRYKucDlRh51gKVOJsm55Mv7vgihcNLq61IUo
 fG/f3/ilfm62Ffaa7Omz3tdxiJPS5Knbh+2WpaPKJ2YaT7QICc1FL5xivXjlB7GaaByJ
 wo5ngtz+ZCkd1tF2uCqwuwJvhovabJAAZXdLlIxSdYh3HWmAh/QTSTKnHWxMTU9FLOn7
 NvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=egWUUoovIegsB6SkJCZOOrxNKr23x2157JP3ICa5cOM=;
 b=FICncLdu20EENOlJYPe+E8lrKc82r8GRg/VeJmKiNvIgNKRgS7xq+op1iZDxS+RKo9
 dNipNmKmYJ/K46k9tLfm4OuF2f9Cq61Z4+seM4y98iz1rHxfrCiv3xl+3uMvHXDKRHFm
 3YdNXbi6uDRn20pK+BAl+KcsbNSDgzXGrrSmEhqMppy8ifU7BlgyeQTJyNIyfHHRmROi
 KhKIFypnC8hvTIQIQVUS3t+x3ELAagi0S6QlydvmZzEfWy5UoMIV//dQNdN+DinF6i2g
 vdGL1pZR/vq2QD00ZaotspKg5J6xRIUjNsLJMXKZ+jskXwh9Od+BfhfXdgFVjQOZmqjj
 6HNg==
X-Gm-Message-State: AOAM530scY24hxI/cglS1Gqw/T0FycXTzyUjonJN9mXXwsuuAJefGhHw
 egFA+1DIFP4rzR87ZLqk4NzriMzegwQ=
X-Google-Smtp-Source: ABdhPJxdjNzSqjLd9Q9o22WCW75JZhM1vI2/W2oVY3ApCFymPSOzpg0CEXhLMYNOjpLpQrh2lHQ8nw==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr47719484wri.21.1641406067223; 
 Wed, 05 Jan 2022 10:07:47 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p13sm42659288wrr.37.2022.01.05.10.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:07:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 19:06:45 +0100
Message-Id: <20220105180645.388855-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtorrent: disable execinfo
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

Disable execinfo to avoid the following build failure raised since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: main.o: in function `do_panic(int)':
/home/giuliobenetti/autobuild/run/instance-0/output-1/build/rtorrent-0.9.8/src/main.cc:606: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/10fc9016013931c58238240216c5950b23b56b30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...disable-execinfo-option-to-configure.patch | 34 +++++++++++++++++++
 package/rtorrent/rtorrent.mk                  |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch

diff --git a/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch b/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch
new file mode 100644
index 0000000000..4ff4182b61
--- /dev/null
+++ b/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch
@@ -0,0 +1,34 @@
+From 582e4e40256b43d3e5322168f1e1ed71ca70ab64 Mon Sep 17 00:00:00 2001
+From: rakshasa <sundell.software@gmail.com>
+Date: Wed, 16 Jun 2021 23:29:01 +0900
+Subject: [PATCH] Added '--disable-execinfo' option to configure.
+
+[Retrieved (and backported) from:
+https://github.com/rakshasa/rtorrent/commit/582e4e40256b43d3e5322168f1e1ed71ca70ab64]
+Signed-off-by: Fabrice Fontaine <Fontaine.fabrice@gmail.com>
+---
+ configure.ac | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e3e7d3f1..0f45bc6a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,7 +27,15 @@ TORRENT_WITHOUT_VARIABLE_FDSET
+ 
+ AC_SYS_LARGEFILE
+ 
+-TORRENT_CHECK_EXECINFO
++AC_ARG_ENABLE(execinfo,
++  AC_HELP_STRING([--disable-execinfo], [disable libexecinfo [[default=enable]]]),
++  [
++    if test "$enableval" = "yes"; then
++      TORRENT_CHECK_EXECINFO
++    fi
++  ],[
++    TORRENT_CHECK_EXECINFO
++  ])
+ 
+ TORRENT_ENABLE_ARCH
+ TORRENT_WITH_SYSROOT
+ 
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index bc3afe8064..210b1d34dc 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -9,5 +9,8 @@ RTORRENT_SITE = http://rtorrent.net/downloads
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
 RTORRENT_LICENSE = GPL-2.0
 RTORRENT_LICENSE_FILES = COPYING
+# We're patching configure.ac
+RTORRENT_AUTORECONF = YES
+RTORRENT_CONF_OPTS = --disable-execinfo
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
