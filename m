Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EEAC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 09:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3407E80DBC;
	Tue, 22 Sep 2026 09:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dw_DTHOmdXEt; Tue, 22 Sep 2026 09:49:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9ED5480D84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790070562;
	b=UyS018RZpYHJGVP/MCd9hZdDG2AFccFdvZqyiWEocUwLVVQ6itjrINnKDQJqbNao2CXj
	 1GnlXw8/OcVbTwKr/5uc9cc2vJ2z3TSJjaHbexzhYMHlRCagNqeQ7fcYs2nNaKkbkecSU
	 b0rk7EdrzHSrHiycBDu0EvTcQiFLH1IUM2cO+kYSuz7zYLE4jzeis7VQSA4nqxDy0b9Rz
	 uusEPHZ6qoIAkBgzxfAx/oml2EQDI4Ct3BwM5y0lpWh3g/taQhodXj//KNVD9bB1gN38l
	 n+EHcVUQWhLMUhFewO9ugzyfqKMOlTK1Osipl+U/R6+0zxO0Wgr5nhbDschB3e1kYaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790070562;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=KB9FyZz9jiBnYZ5CAtZVyOtRKJ63DYPV9or+9RE7PKg=;
	b=MrVmgat2SFOrpcXjLf4J720SEGzh0P+8Gct8F/DEyS4fjDPvdOKbQo6xKYcOZ7FOYfGb
	 lfPGiBhsHt9ZPLbhdTNHdvHpxxgFtOGlxklpNrzlSJafsq9QZo1Qvx8x7rGStvVTSJsue
	 vn70oyWQ5d5NUum4AbxgvXfIJCe4Vu/3jBABj6sWyphzSK/Ef2S2JqVOlAAMWXUgPsJQO
	 O8XfWqH38CnR2kKXI9gWKLC7WtReX+KnXGVaYDuevYsDzjD2B3v0p8slN2ZhIhhGJPxKJ
	 DRKBGBqvQVb0jHdTEVHq1H0hR0HfEUNfr8PE1Rqj0c+iqDmrItggXk677J+FRzbY7tg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790070562;
	bh=KB9FyZz9jiBnYZ5CAtZVyOtRKJ63DYPV9or+9RE7PKg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WJiujiH6h1ZchH8clTQX+Eis6H9Gzj9PdYhNyoO7ck2KEwqlLKAYwKAIhjrPxd7dx
	 gJbK8Tj9Jwk324S3AdN7c4DJ1Lg6Ll4LR1dWt7ogE4onCBWEwbJFat51RShEAV24W+
	 pUwRnKSQkwQs0MlCv3euCMx4XudcpvkMOMJhC7TZJdtzhA/cpUVX2xICWcNf3DuuN/
	 +bNnkHlz+RRbY+8E7kCtRrMANqr9lHweQ95PWzQU3CPy63x9H4u4OZUf3e4DngJqlt
	 yz7cerKYje3o7FNRIZ2KU3We+CJpRQjEshcHEdTpySgQFS9SGQ1845Zeyi+aA6lLeS
	 ioEheYCZxfdIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ED5480D84;
	Tue, 22 Sep 2026 09:49:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 116053A9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBED9400F9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xfm_6TtH3P7n for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 09:49:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F0E1C400F6
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=62.149.156.87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790070558;
 b=GWujZkZcer9XWr0DFB72lxqt1neUqrLiEg41/NdMuDQjOSrZP9BvYOwhNfhpIu/Gqasm
 m3G8AI/1mar9o46TL5f9PjzZ0snkaFEdOGtjsFTkAxRUIdhn2TIfOYrVFuw5Qeeph38qb
 DPI3o225nJlvF5cm07yL+ILfUnye/5mNyYIxG7ti9dWRBdtet0VbmorF/vd427Co8/bYP
 KGyTeN5S9GKip1iLMMvY11fP6Oq+Cx3ik/UlEM2TdySMDx41XhAm1JK6xHR7C2Dqm3giF
 H9Y3STxQuaPkJviJcXtrdJPx7DaP3v9GseSiLx89m6/UghpllZHkhAJMjrZH002suog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790070558;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=moo0Y62pqcs3ZBHH3cmRfW/m7S0przbCGd+dAySxObs=;
 b=M+XxwwDJG9jDngF1Hl6Ffao/W8SvQV2jZ0Wmtx0yjc89K2QQEAO1GtQB5Pd0CTAwb40e
 iCgn8g2eSgeyR3tRqrCY0FyugqVDn4yEzC4klVd+x6+Ge15LDVQd22/yEmkez8/cnqaQT
 DV201D7/8GwRypyJntbqA5mOVw0CIaTKWIfMMbyocH/b6UYZbCNwkh6wwTN/CCYV4bXlZ
 RKYKqU1j5v073wFaoHGINVDtvOxhIAiFZXrjSvMOEasu98yRmDFzhGz1MFg6zpZojEGAP
 7g3vCvLLsroAhn0XCXgELDsJzFCcEGrRtuNZbD+hnO5X+HRejtDJHZGSmxqrm6El5Rg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=dwM0ylEd; 
 arc=none smtp.remote-ip=62.149.156.87
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dwM0ylEd
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0E1C400F6
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:49:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8x7hx61yeWYQI8x7ix7Nup; Tue, 22 Sep 2026 11:49:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1790070554; bh=DgCzv4vVtu0BQ8tNYMdWMWWTv25dLdDKMeKTrgrfoqs=;
 h=From:To:Subject:Date:MIME-Version;
 b=dwM0ylEd6tfcqaSQ1JBP7tnkhWpBPbl2ffu/9KXj+37LezlUSaGHPIfbCR52TZ+S3
 +m/DLDcIfi8bv1boEV5fixhIo6usrzrXrK045kh5ujvpFShLlKUZiPQWunRuZkDDGE
 K0IelScUeLoqLqWporwDkk5G7ORGebZEk74scuPV2vKAhMsyamuwUJIcMJKw/7LyJQ
 z8E8K0jnGjvqQ7Z5Zc5bD6Kc+Ex3C3XCbxp0g4c1o/fhQCOPVPnU7QH2oEAoTPKjbB
 2EjsFywybdsltIgXlI3PR2lesTFAGor39fzXzyoNn/NSH96HABwf7hRyJ3fa6bWOsI
 6xztEQ190oA1w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 22 Sep 2026 11:49:13 +0200
Message-ID: <20260922094913.3261554-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK/bzoH9ZQFBovWi7pKaCNTXW0MGGwdCzXopsfmgjc/QNaya3YpaoIUTh40pJpMxu0Velq+slOTR0DE0IbbOPnU/hDL3W5cmG7ehdecRUhxv2fTPv/bN
 FtV5QdUdYI2VYN8mAq8Nfc0CpSlcn9NkCs5ziMyg8rc8f+KcL1aWosOOijqzn/pWpq8LnDgVw0lS5SwXIHK6du6BNLg6+BCFkFMmWfAvifmJbPN53cd1xWks
 R7QW2LPRrkflWUtRq3R0/3Q+iy95SCfek+WcEr+KoD4LUqZ7Icx/gnbvXSvw6qcUKTv+QREAhaAEM4311NQQvQ==
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 3.3.1
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

Remove patches upstreamed in this release.

Release announce:
https://lore.kernel.org/linux-nfs/5717a803-805c-409f-a9cc-d0c33a365570@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-leak-in-sm_mon_1_svc-when-existing-.patch | 40 -----------------
 ...tport-fix-missing-stddef.h-inclusion.patch | 33 --------------
 ...fs-link-failure-with-disable-nfsdctl.patch | 39 ----------------
 ...ort-Fix-switch-case-on-old-compilers.patch | 44 -------------------
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  4 +-
 6 files changed, 4 insertions(+), 160 deletions(-)
 delete mode 100644 package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
 delete mode 100644 package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
 delete mode 100644 package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
 delete mode 100644 package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch

diff --git a/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch b/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
deleted file mode 100644
index d3a5bf991f..0000000000
--- a/package/nfs-utils/0001-statd-fix-memory-leak-in-sm_mon_1_svc-when-existing-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From cf80edaeb9b120b7a533e0d3aea2f05cfcab85ae Mon Sep 17 00:00:00 2001
-From: xuchenchen <xuchenchen@kylinos.cn>
-Date: Sat, 15 Aug 2026 13:58:16 -0400
-Subject: [PATCH] statd: fix memory leak in sm_mon_1_svc() when existing host
- re-monitors
-
-When an already-monitored host sends a new SM_MON request with a
-different priv cookie, the code sets existing=1 and reuses the
-existing notify_list entry. However, clnt->dns_name is overwritten
-with the newly allocated dnsname without freeing the old value,
-causing a memory leak.
-
-Since statd is a long-running daemon, repeated SM_MON requests with
-changing cookies will accumulate leaked strings.
-
-Fix by freeing the old dns_name before overwriting it.
-
-Signed-off-by: xuchenchen <xuchenchen@kylinos.cn>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cf80edaeb9b120b7a533e0d3aea2f05cfcab85ae
----
- utils/statd/monitor.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/utils/statd/monitor.c b/utils/statd/monitor.c
-index c76589ca..76ef16f1 100644
---- a/utils/statd/monitor.c
-+++ b/utils/statd/monitor.c
-@@ -187,6 +187,8 @@ sm_mon_1_svc(struct mon *argp, struct svc_req *rqstp)
- 	NL_MY_VERS(clnt) = id->my_vers;
- 	NL_MY_PROC(clnt) = id->my_proc;
- 	memcpy(NL_PRIV(clnt), argp->priv, SM_PRIV_SIZE);
-+	if (existing)
-+		free(clnt->dns_name);
- 	clnt->dns_name = dnsname;
- 
- 	/*
--- 
-2.53.0
-
diff --git a/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch b/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
deleted file mode 100644
index a85390cdec..0000000000
--- a/package/nfs-utils/0002-getport-fix-missing-stddef.h-inclusion.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From cec8eeb69dc65eb91e0cb23ebff23530d9397425 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Sat, 15 Aug 2026 14:00:36 -0400
-Subject: [PATCH] getport: fix missing stddef.h inclusion
-
-getport.c uses offsetof() but does not include <stddef.h>. On glibc
-this works because offsetof is pulled in transitively, but on musl it
-is not available without the explicit include, causing:
-
-  getport.c:459:41: error: implicit declaration of function 'offsetof'
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cec8eeb69dc65eb91e0cb23ebff23530d9397425
----
- support/nfs/getport.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/nfs/getport.c b/support/nfs/getport.c
-index 608e185b..6bd2f713 100644
---- a/support/nfs/getport.c
-+++ b/support/nfs/getport.c
-@@ -27,6 +27,7 @@
- #endif
- 
- #include <sys/types.h>
-+#include <stddef.h>
- #include <sys/time.h>
- #include <unistd.h>
- #include <fcntl.h>
--- 
-2.53.0
-
diff --git a/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch b/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
deleted file mode 100644
index f1668c5b97..0000000000
--- a/package/nfs-utils/0003-exportfs-link-failure-with-disable-nfsdctl.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 67ed1bdb1af1c70a5fd3b377a997401b7676b827 Mon Sep 17 00:00:00 2001
-From: jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Sat, 15 Aug 2026 14:20:03 -0400
-Subject: [PATCH] exportfs: link failure with --disable-nfsdctl
-
-Building nfs-utils 2.9.2 with --disable-nfsdctl fails to link
-exportfs. This is a regression from 2.9.1.
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=67ed1bdb1af1c70a5fd3b377a997401b7676b827
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ea19715..2ce1e129 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -256,8 +256,6 @@ PKG_CHECK_MODULES(LIBNL3, libnl-3.0 >= 3.1)
- PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >= 3.1)
- 
- AC_CHECK_HEADERS(linux/nfsd_netlink.h)
--AC_DEFINE([HAVE_NFSD_NETLINK], 1,
--	  [Define to 1 if nfsd generic netlink support is available])
- 
- # ensure the system netlink headers have the latest features
- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
-@@ -279,6 +277,8 @@ AC_ARG_ENABLE(nfsdctl,
- 	enable_nfsdctl="yes")
- 	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" = "yes" ])
- 	if test "$enable_nfsdctl" = yes; then
-+		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
-+	  		[Define to 1 if nfsd generic netlink support is available])
- 		PKG_CHECK_MODULES(LIBREADLINE, readline)
- 	fi
- 
--- 
-2.53.0
-
diff --git a/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch b/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch
deleted file mode 100644
index 692bc8bd3b..0000000000
--- a/package/nfs-utils/0004-getport-Fix-switch-case-on-old-compilers.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7b886f3502977040461a8b31f5948a128f7069e2 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Thu, 20 Aug 2026 01:03:10 +0200
-Subject: [FTBFS,PATCH,nfs-utils 1/1] getport: Fix switch case on old compilers
-Cc: Steve Dickson <SteveD@RedHat.com>,
-    Giulio Benetti <giulio.benetti@benettiengineering.com>,
-    Julien Olivain <ju.o@free.fr>
-
-Buildroot distro compiles with fairly old compilers, which defaults to
-old C11 standard (some of still used compilers don't even have newer
-standard than C11). Workaround code which requires C23 with using { }.
-
-This fixes error:
-
-    getport.c:460:3: error: a label can only be part of a statement and a declaration is not a statement
-       size_t path_len = len - offsetof(struct sockaddr_un, sun_path);
-       ^~~~~~
-
-Fixes: 1a6dcd74 ("Removed warnings in nfs_sockaddr2universal()")
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream: https://lore.kernel.org/linux-nfs/20260819232049.438643-1-petr.vorel@gmail.com/
----
- support/nfs/getport.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/support/nfs/getport.c b/support/nfs/getport.c
-index 6bd2f713..18ea0777 100644
---- a/support/nfs/getport.c
-+++ b/support/nfs/getport.c
-@@ -456,9 +456,10 @@ char *nfs_sockaddr2universal(const struct sockaddr *sap)
- 	int len = sizeof(struct sockaddr);
- 
- 	switch (sap->sa_family) {
--	case AF_LOCAL:
-+	case AF_LOCAL: {
- 		size_t path_len = len - offsetof(struct sockaddr_un, sun_path);
- 		return strndup(sun->sun_path, path_len);
-+	}
- 	case AF_INET:
- 		if (inet_ntop(AF_INET, (const void *)&sin->sin_addr.s_addr,
- 					buf, (socklen_t)sizeof(buf)) == NULL)
--- 
-2.53.0
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 93f8e463a1..1353a1a39d 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.2/sha256sums.asc
-sha256  e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed86c9d3dc4097e8c  nfs-utils-2.9.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/3.1.1/sha256sums.asc
+sha256  7dbc05eb8b32828b322872b759a62cb3979cb4118f344dd8616813d1390e84e0  nfs-utils-3.1.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 6e0fb1a04c..3959b90cc2 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.9.2
+NFS_UTILS_VERSION = 3.1.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
-NFS_UTILS_LICENSE = GPL-2.0+
+NFS_UTILS_LICENSE = GPL-2.0+q
 NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libnl libtirpc sqlite util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
