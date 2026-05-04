Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82ECCD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 23:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86B3A606BB;
	Mon,  4 May 2026 23:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NheiariqI_m; Mon,  4 May 2026 23:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEAB2606BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777936009;
	bh=7hqzOmwhuKU3oYrXXt6eBwPSS0vxj638JKt2rgD8WK0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIZnaNqXIC7kJT16TiCVo769KpRVCGcy2vYjFKVhRk9ODj8+NMwUS2NugBACg8PP7
	 oUoZ9SDVX89tQPSRUihjeJYkH2bLzWucBo/UiApIGybuH7k4giZWW9K0IM47Jl2DG/
	 yXRwQYcWc1ReDNxgKonf4MgwfL0QWKM2PI+E7L780ZVDiXBMDl0xKjQTzlATXhXC0C
	 bKAnXLX49G8hLWMZowBJJ/t7iqpRSj2P0fJCYyRAgUMIHPMSog6K5YG9UaZrRHnD1G
	 4OIUJ6EF6Jr9KHPSPzBTGLWBwHEb4nYFYVWwOsQtrG9NmFlFeVndRz9VKopgl+YfL2
	 D7wlBCqCOA2Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEAB2606BD;
	Mon,  4 May 2026 23:06:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id BA7D6280
 for <buildroot@buildroot.org>; Mon,  4 May 2026 23:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id A0AA2606BD
 for <buildroot@buildroot.org>; Mon,  4 May 2026 23:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 0FRveDEEVQuw for <buildroot@buildroot.org>;
 Mon,  4 May 2026 23:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=143.55.232.47;
 helo=v547.v5f06b487.use4.send.mailgun.net;
 envelope-from=bounce+4afdde.7f991a-buildroot=buildroot.org@drhouck.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A0A3606BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A0A3606BB
Received: from v547.v5f06b487.use4.send.mailgun.net
 (v547.v5f06b487.use4.send.mailgun.net [143.55.232.47])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id 2A0A3606BB
 for <buildroot@buildroot.org>; Mon,  4 May 2026 23:06:45 +0000 (UTC)
X-Mailgun-Sid: WyI3M2VlNiIsImJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIiwiN2Y5OTFhIl0=
Received: from dhouck-linux (unknown [73.82.189.57]) by
 b7d95edd5822e40fc3b73adddfb8e9baf24e7090ed82aa46e2ec8c730b965dd7 with SMTP id
 69f926848073340fc22d695d; Mon, 04 May 2026 23:06:44 GMT
X-Mailgun-Sending-Ip: 143.55.232.47
From: Daniel Houck <Software@DRHouck.me>
To: buildroot@buildroot.org
Cc: Daniel Houck <Software@DRHouck.me>
Date: Mon,  4 May 2026 19:06:27 -0400
Message-ID: <20260504230627.2963070-1-Software@DRHouck.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503235637.637991-1-Software@DRHouck.me>
References: <20260503235637.637991-1-Software@DRHouck.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed;
 d=drhouck.me; q=dns/txt; s=krs; t=1777936004; x=1777943204; 
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender; 
 bh=YhX0bvDpeeo48MRJfF+0kHCHlrAA/yv7DHOgCvYxsMU=;
 b=eJjTwAaOVFQkrv45hwIFE2CdNW9eF1AKfb6nheiMq8E0rS0WO+ymMD5J5qedEp8rqtTeOnUZwIyaYehmg1FzkmePZhryJiX4NK5SQcNzXcRrqYBmvkK6y1Nsx5yxsvMF9RjwK9efXET8zr037KWw2IBRxiw7or9wUTI6gISY8No=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=DRHouck.me
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=drhouck.me header.i=@drhouck.me header.a=rsa-sha256
 header.s=krs header.b=eJjTwAaO
Subject: [Buildroot] [PATCH v2] package/make: fix build with musl and
 gcc-15.x
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

Patch the parts of Make that use code invalid in C23.  It wasn't
included when compiling with glibc but failed to build with musl.

Fixes #176.  See also https://savannah.gnu.org/bugs/index.php?68302

Signed-off-by: Daniel Houck <Software@DRHouck.me>
---
Changes v1 -> v2:
  - patch make instead of using CFLAGS (suggested by Marcus)

 ...1-fix-compilation-on-musl-with-gcc15.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/make/0001-fix-compilation-on-musl-with-gcc15.patch

diff --git a/package/make/0001-fix-compilation-on-musl-with-gcc15.patch b/package/make/0001-fix-compilation-on-musl-with-gcc15.patch
new file mode 100644
index 0000000000..aa2598df9a
--- /dev/null
+++ b/package/make/0001-fix-compilation-on-musl-with-gcc15.patch
@@ -0,0 +1,61 @@
+From 31bc8976fb7bfdde8b9293e6a4eb2becb29a73bc Mon Sep 17 00:00:00 2001
+From: Bobby Bingham <koorogi@koorogi.info>
+Date: Wed, 2 Jul 2025 18:09:28 -0500
+Subject: [PATCH] fix compilation on musl with gcc15
+
+---
+
+Patch originally from https://codeberg.org/gentoo/gentoo/raw/branch/master/dev-build/make/files/make-4.4.1-c23.patch
+
+ lib/fnmatch.c | 2 +-
+ src/getopt.c  | 2 +-
+ src/getopt.h  | 7 -------
+ 3 files changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/lib/fnmatch.c b/lib/fnmatch.c
+index 01da376..9b54022 100644
+--- a/lib/fnmatch.c
++++ b/lib/fnmatch.c
+@@ -121,7 +121,7 @@ USA.  */
+    whose names are inconsistent.  */
+ 
+ # if !defined _LIBC && !defined getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ # endif
+ 
+ # ifndef errno
+diff --git a/src/getopt.c b/src/getopt.c
+index 7a792de..9b56abe 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -202,7 +202,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ #endif
+ 
+ static char *
+diff --git a/src/getopt.h b/src/getopt.h
+index df18cee..a6cc621 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -96,14 +96,7 @@ struct option
+ #define optional_argument	2
+ 
+ #if defined (__STDC__) && __STDC__
+-#ifdef __GNU_LIBRARY__
+-/* Many other libraries have conflicting prototypes for getopt, with
+-   differences in the consts, in stdlib.h.  To avoid compilation
+-   errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+-#else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
+-#endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
+ extern int getopt_long_only (int argc, char *const *argv,
+-- 
+2.50.0
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
