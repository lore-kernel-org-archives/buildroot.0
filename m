Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D27CA0EC6
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 10:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61CD41845;
	Mon, 18 Aug 2025 10:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHiV6MzbMnku; Mon, 18 Aug 2025 10:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABB32418D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB32418D4;
	Mon, 18 Aug 2025 10:41:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E228E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 10:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7015E40232
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 10:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MVYD6QUsTLv for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 10:41:43 +0000 (UTC)
X-Greylist: delayed 917 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Aug 2025 10:41:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B267840137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B267840137
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=uuidxx@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp2.osuosl.org (Postfix) with ESMTP id B267840137
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 10:41:42 +0000 (UTC)
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgA3nybJ_6JoVs9mAg--.22158S2;
 Mon, 18 Aug 2025 18:26:19 +0800 (CST)
From: "uuidxx@163.com" <uuidxx@163.com>
To: "romain.naour@smile.fr" <romain.naour@smile.fr>, Thomas Petazzoni via
 buildroot <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/lrzsz: fix build with gcc 15
Thread-Index: AQHcECojT8zlwai5kES/PKPGV1XKqA==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 18 Aug 2025 10:26:16 +0000
Message-ID: <OSZPR01MB7868C20DE2CA3647CA410C9FFD31A@OSZPR01MB7868.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgA3nybJ_6JoVs9mAg--.22158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF45Wr1xuFyxArWrZr45trb_yoW8ZF47pF
 4DCasrKr48t3W8XryDWryvg3WrKFZIkF47Jw4DCw4SqrsrX34qqayYyFyYgrnxuFWUG3y3
 Zr1Fvw17Zr1rXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uh0eLUUUUU=
X-Originating-IP: [2603:1046:c0a:20d8::5]
X-CM-SenderInfo: hxxlv5r06rljoofrz/xtbBNQit22ii-lEqogAAsm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
 MIME-Version; bh=xiEEuV0O/m6Yg9ppMMfAUoUGopsBoNPquJC7ADH/klE=;
 b=XBVpQp386Nva9FC6bUiRWMj2mRsRjoRVxM4JXxPa9wNNTG+UKw1vrW8oKnbNaO
 A8D5/47fwLBK3KDK0x9SRhtYok+aQQYv10fdiqEQa5YgqsIgQxoNyVFfUduLFIzG
 Lu+W5GRwgSqU3EgOLOKYXhKuXIw2w53+3hBc8JHoi8Pec=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=XBVpQp38
Subject: [Buildroot] [PATCH 1/1] package/lrzsz: fix build with gcc 15
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

From: https://github.com/UweOhse/lrzsz/pull/8

Signed-off-by: Frank Chung <uuidxx@163.com>
---
 lib/error.c        | 2 +-
 lib/getopt.h       | 2 +-
 lib/long-options.c | 2 +-
 lib/long-options.h | 2 +-
 lib/xstrtol.c      | 2 --
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/lib/error.c b/lib/error.c
index 3861578..2a2f1ff 100644
--- a/lib/error.c
+++ b/lib/error.c
@@ -74,7 +74,7 @@ extern char *program_name;
 
 # if HAVE_STRERROR
 #  ifndef strerror		/* On some systems, strerror is a macro */
-char *strerror ();
+char *strerror (int);
 #  endif
 # else
 static char *
diff --git a/lib/getopt.h b/lib/getopt.h
index 4ac33b7..46971cb 100644
--- a/lib/getopt.h
+++ b/lib/getopt.h
@@ -101,7 +101,7 @@ struct option
    errors, only prototype getopt for the GNU C library.  */
 extern int getopt (int argc, char *const *argv, const char *shortopts);
 #else /* not __GNU_LIBRARY__ */
-extern int getopt ();
+extern int getopt (int, char * const [], const char *);
 #endif /* __GNU_LIBRARY__ */
 extern int getopt_long (int argc, char *const *argv, const char *shortopts,
 		        const struct option *longopts, int *longind);
diff --git a/lib/long-options.c b/lib/long-options.c
index 761c16a..0e7e8c2 100644
--- a/lib/long-options.c
+++ b/lib/long-options.c
@@ -46,7 +46,7 @@ parse_long_options (argc, argv,version, usage)
      int argc;
      char **argv;
      void (*version)();
-     void (*usage)();
+     void (*usage)(int);
 #endif
 {
   int c;
diff --git a/lib/long-options.h b/lib/long-options.h
index 14459cd..3fb8fa6 100644
--- a/lib/long-options.h
+++ b/lib/long-options.h
@@ -6,5 +6,5 @@
 #endif
 
 void parse_long_options __P ((int _argc, char **_argv, 
-							  void (*_version) (void), 
+							  void (*_version) (), 
 							  void (*_usage) (int)));
diff --git a/lib/xstrtol.c b/lib/xstrtol.c
index d7b4b56..7d0737d 100644
--- a/lib/xstrtol.c
+++ b/lib/xstrtol.c
@@ -65,8 +65,6 @@ extern int errno;
 	}								\
       while (0)
 
-__unsigned long int __strtol ();
-
 /* FIXME: comment.  */
 
 strtol_error
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
