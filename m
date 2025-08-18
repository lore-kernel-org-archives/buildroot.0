Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13994CA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 11:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B48CD41D96;
	Mon, 18 Aug 2025 11:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6_BYB0EKJn3; Mon, 18 Aug 2025 11:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0BB241D97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0BB241D97;
	Mon, 18 Aug 2025 11:54:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BB54E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 11:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1D2941D97
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 11:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHZXy3dCVpqe for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 11:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=uuidxx@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67E5941D96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E5941D96
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67E5941D96
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 11:54:50 +0000 (UTC)
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wAXRSODFKNozSTvCg--.54900S2; 
 Mon, 18 Aug 2025 19:54:44 +0800 (CST)
From: "uuidxx@163.com" <uuidxx@163.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>
Thread-Topic: [Buildroot] [PATCH v2 1/1] package/lrzsz: fix build with gcc 15
Thread-Index: AQHcEDX564u7N9qd/E2Bit/WAEU0uw==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 18 Aug 2025 11:54:43 +0000
Message-ID: <OSZPR01MB78684A807471544850FF3A6FFD31A@OSZPR01MB7868.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
MIME-Version: 1.0
X-CM-TRANSID: _____wAXRSODFKNozSTvCg--.54900S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF47Zr1DXFykJFyxXr1DWrg_yoW5CrWfpF
 Wqk3s8tw4xtF1fXr9rGr10g3WrKFZrCF47Aw48Gw4ftrsrGa4kta4YyFyYkr13ur97Gw43
 Zrn5Za47u3WUXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDrchUUUUU=
X-Originating-IP: [2603:1046:c0a:20d8::5]
X-CM-SenderInfo: hxxlv5r06rljoofrz/xtbBNQWt22ii-lGPmgACs0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
 MIME-Version; bh=QxmXomnqHH9RHlbcV3gO0wKI79qA57DXpgeBy9tMrbU=;
 b=XriD4Mq5I0CHDontLEOr0FWQ02sm+ph9uulb4cerlaxbrKZuli2Zq7Ts1MO6sU
 WINIH/aryJuS1zWVFGC90sRcGXR22IcREqt5K2AMlRa6sXFfSHnW0XqMaATY/x4b
 vAYmKVVNrbG2+Q3ZiH0b1wfd/RyXDHQmJNvH1feFXjIss=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=XriD4Mq5
Subject: [Buildroot] [PATCH v2 1/1] package/lrzsz: fix build with gcc 15
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

Sorry, I'm not familiar with the buildroot contribution process yet.

The patch in the previous version was incorrect.
This patch will create a patch to fix issues that arise when building with gcc15.

From: https://github.com/UweOhse/lrzsz/pull/8

Signed-off-by: Frank Chung <uuidxx@163.com>
---
 package/lrzsz/0005-fix-build-with-gcc15.patch | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/lrzsz/0005-fix-build-with-gcc15.patch

diff --git a/package/lrzsz/0005-fix-build-with-gcc15.patch b/package/lrzsz/0005-fix-build-with-gcc15.patch
new file mode 100644
index 0000000000..d964a1a31f
--- /dev/null
+++ b/package/lrzsz/0005-fix-build-with-gcc15.patch
@@ -0,0 +1,82 @@
+From a33f1700fb9b2af731b30468267a1693999889b4 Mon Sep 17 00:00:00 2001
+From: Frank Chung <uuidxx@163.com>
+Date: Mon, 18 Aug 2025 14:39:46 +0800
+Subject: [PATCH 2/2] fix build with gcc15
+
+From: https://github.com/UweOhse/lrzsz/pull/8
+
+Signed-off-by: Frank Chung <uuidxx@163.com>
+---
+ lib/error.c        | 2 +-
+ lib/getopt.h       | 2 +-
+ lib/long-options.c | 2 +-
+ lib/long-options.h | 2 +-
+ lib/xstrtol.c      | 2 --
+ 5 files changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/lib/error.c b/lib/error.c
+index 3861578..2a2f1ff 100644
+--- a/lib/error.c
++++ b/lib/error.c
+@@ -74,7 +74,7 @@ extern char *program_name;
+ 
+ # if HAVE_STRERROR
+ #  ifndef strerror		/* On some systems, strerror is a macro */
+-char *strerror ();
++char *strerror (int);
+ #  endif
+ # else
+ static char *
+diff --git a/lib/getopt.h b/lib/getopt.h
+index 4ac33b7..46971cb 100644
+--- a/lib/getopt.h
++++ b/lib/getopt.h
+@@ -101,7 +101,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int, char * const [], const char *);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
+diff --git a/lib/long-options.c b/lib/long-options.c
+index 761c16a..0e7e8c2 100644
+--- a/lib/long-options.c
++++ b/lib/long-options.c
+@@ -46,7 +46,7 @@ parse_long_options (argc, argv,version, usage)
+      int argc;
+      char **argv;
+      void (*version)();
+-     void (*usage)();
++     void (*usage)(int);
+ #endif
+ {
+   int c;
+diff --git a/lib/long-options.h b/lib/long-options.h
+index 14459cd..3fb8fa6 100644
+--- a/lib/long-options.h
++++ b/lib/long-options.h
+@@ -6,5 +6,5 @@
+ #endif
+ 
+ void parse_long_options __P ((int _argc, char **_argv, 
+-							  void (*_version) (void), 
++							  void (*_version) (), 
+ 							  void (*_usage) (int)));
+diff --git a/lib/xstrtol.c b/lib/xstrtol.c
+index d7b4b56..7d0737d 100644
+--- a/lib/xstrtol.c
++++ b/lib/xstrtol.c
+@@ -65,8 +65,6 @@ extern int errno;
+ 	}								\
+       while (0)
+ 
+-__unsigned long int __strtol ();
+-
+ /* FIXME: comment.  */
+ 
+ strtol_error
+-- 
+2.47.2
+
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
