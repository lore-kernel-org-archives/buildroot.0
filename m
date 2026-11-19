Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5E1606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 21:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CVVFj36K;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NCKa/WN7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE148144E;
	Thu, 19 Nov 2026 21:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrDlkUdlhn8X; Thu, 19 Nov 2026 21:50:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E4E88144F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795125012;
	b=NPAzpHv1dcB1qqATij5Ej8lOvBq0CfuvDDvRpSnZrKW4wdEtRXddhQ8K0jgVkpSkzgzh
	 2cNcmMdxbyKzwSaUCHEj17naWD0CW+LBCmSIQtnKCznzi8/2q5wupXUCS7Vzy2nfMvfCe
	 kO9uE4Mf7IqCxbDQE3ZthUpctumKR5dY0E8ue45wGOQKOVBy7Iy/fYvcUL8YKIn4K7OtC
	 dLOJQqR8ZQ84MmKjs5S2t5v6V4DjF769JuXR16Wf5M/z9rumXrizLASBXz2iU4ane/gpC
	 T6FaAqYO1Nrj5ibt5dZOQYVaqoS2gkx4ltWOybMIUQ7K66R44vsa2cPK/DH9d1tCvkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795125012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bkVT6327vsR+3I65286qTevqgYZp4ZkYj9R1kX1UdEw=;
	b=mFVN5ZAPfOJVkYdBUA8DPC/3bMuZmTt1bqAr8DwRm62659MCkcII1jWEooz1KR+TQMTj
	 xoXJE7phjibK2TunTD6ilgH7HmYhwX8g3VxVnm1HQK9/BjfTsd01xhEeZ8EMmWLWvFpuX
	 6pW5wFzEj8KpFNga6E+1ywjIdm0iFSXVRaGi8wto3ykhwR4LfNmrHreEDmvEXtHe32/+A
	 nodIUjor+mJ9CZK5oNeo2IHuCFk3opTI4uAC62aOQZBffyfqmZlISdDnURbTye0o+oA+w
	 HidFkdgaUIlcAzup/xm8trTLUIrdjyzSGhS9zLhg2XbBI4IG4GTvYB0L/A9PpeAI4hQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795125012;
	bh=bkVT6327vsR+3I65286qTevqgYZp4ZkYj9R1kX1UdEw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CVVFj36K20+Zdmc9i7mhDF+VuV5iuGx7df3FEf1A5QjQfs2ohjkfZIOnRSDrPgC0P
	 Xil1JnerDeYm7yFdKN19dEceZY1TbXL8E6IFWWXBXK3CwGRWhWrEZbAiyGnHBcHCDP
	 AUKeuo7J4N0d8mCRk/eUC4LuR9/ZgXt57AIJwP8nmwNaXvq5aU7WsVXed4jom5MskN
	 qghsvDlCN1Q+jFbx9dcRqSl/u8/QqqlERZhq/2O/ukdMZOKa76tzArMRwupzE9ugM4
	 MXIPd5EVfVkXBkNBpmjw5RR8slPGhDH7edY8Cg2AtAPzEmBYPXKfX8b3k8ku6rBy3q
	 XmKZ6XAJN8nAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E4E88144F;
	Thu, 19 Nov 2026 21:50:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5034E1C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3649F40A63
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpsQEtJTcsWo for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 21:50:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A099740A62
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=NCKa/WN7
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A099740A62
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 21:50:08 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b8b20b2538so280161a12.3
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1795125007; x=1795729807; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bBpmkW3+IYdaZbaJDVxwo2ufQfRiiqScybsNVnMUWEc=;
 b=NCKa/WN7BWRxH2Lj212EiojrJqJ9EJs7OUTT7elWmsGe1/uJG4zTYcVEfIADWH5X8k
 Lm7IfZ8pd3KBQDQcDwf8MVlGDHopidzHKhcJokN4uz9Rw6lrjH6yUBxsXPn1FeezDVCR
 4bgPa9YRzhnEAw2lbhA+O48zfDKX4kyPVaZ4053orS19CNEhhtlIykIVTDDHq8sRHJsU
 AjnjyEW92dS+XuQGkQLrkKBSr69K1AkWiTTSPgHHHCZiqUUxkRkc0JgcWOjA4dRZILuf
 2nspcHkrYyZNwJ15bp0fwVTOfgc7D5rfiy068rzFwhbQDk6mx39TSkwueVRVHqBzWoot
 O5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795125007; x=1795729807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bBpmkW3+IYdaZbaJDVxwo2ufQfRiiqScybsNVnMUWEc=;
 b=QzZ3pt3MYZhh9+nqzHTTcxxX+WD9zh+gCFeJ9QgjHmBwJ3mlaG5F5QnJRZvt/JWD01
 gWFsAExKRskgUOIM8FoBHDY8NtVYrgeepsIncn2B+bI7YqM5v7esJUhE0uzqN35eBwUh
 yBg5JwRatWHMaZN0DAfkFhydmbe0TEi/uFP1cj+D2R0AxMlKO/C67riTmpuC65xzBstC
 K30+G9LHAkdL63hh8MJxOau8uDGm4W43HDqhs7oTK6RpKnhD0v5AsNuakrWCoF8BOsAW
 37LCdNQnrn3PRXZx6kGYJV6oH7OX990a3mQ5oxHzitiHjohY8Vr1FiI8BVsovnECwAVK
 CWrw==
X-Gm-Message-State: APuU4Z/ofpVm4VrTOQwc2GR99KInZ4ihCYZ7zwnuiq6KpCFC9NhVZh6r
 NQVkzVDcPZZc/L73kPFaggkdigfRHOstvrgicpNg7lCyxuVjltlTLFHj7zgLRA==
X-Gm-Gg: AYBFou1R24sqGxFdMwb1FOulfTFdwXAbZEIKqWFyUdprFv/N+YsP5Ks2LG6eQA4zLjD
 2AAeuUKzXzFuZB6a5N+RD3KVGTRLKMDF3yqV4ojqmjaVyH21Jaz24NFn/jAh2+IyOkx3EjHvZUx
 7DOBHCT4K3poWCdUXITnZ+owesLZCjIwtgBneDJRjMH/VlbanVmRxKv4wveq8YF98vy+8qOZL7c
 lj9oBkiini21u8ExxmE8tHPmWeAl03FRNr17SI+89drErYclGt7Ak1/ZWHf4bqEOVnU7Oy1DgLM
 L7/udGz7akdYL6ssyrkW/bVKPb3zcrsPPPNXvvKnIE0QhjtYLjT5SIjAHKU566twTFneXNa9sA9
 +yQBKhgiIaAcsYaSeVf6VABXRMei3YyPsP56C/aZJrcGzz/ot0whhhf3f/Cw/SuiP82o9V9HqaC
 o0yvHnl5zSCe8SlK6/dujknIYsB4MtTN1qfrg6P+nG5ab5ezzdRtOYXBmilCzQwlEY255lbmTL2
 G2twEhWsw0IRwJ91jUQzpQ3dhqM1WAXXZV7nEfv/Kzpbm51bZ3DbX9APMq+N9IDL887LinE/1fv
 LVJwI0ZBuGuT9oRldzHa3uyiieMiIiuwWbXtuNI0dTZifw+jCHgtxxB9nABAz1+r7WRx7WPfH3n
 +QlrNjK+1
X-Received: by 2002:a05:6402:321d:b0:6b1:e097:559f with SMTP id
 4fb4d7f45d1cf-6ba37e81120mr509041a12.18.1795125006788; 
 Thu, 19 Nov 2026 13:50:06 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ba37108c8esm331951a12.31.2026.11.19.13.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 13:50:05 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 22:50:05 +0100
Message-Id: <20261119215005.2674763-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/shellinabox: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Olivier Singla <olivier.singla@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

shellinabox is dead upstream: its last release, 2.20, dates from 2016
and its last commit from January 2019. It only keeps building in
Buildroot thanks to local fixes, and as a web server exposing a
terminal, it is not something to keep shipping unmaintained.

Remove the package, as suggested by Peter [1], and add a legacy option
for it.

[1] https://patchwork.buildroot.org/project/buildroot/patch/20261119103103.2602430-1-yegorslists@googlemail.com/

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  3 --
 package/Config.in                             |  1 -
 ...e-disable-always-building-statically.patch | 26 ----------
 ...9-fix-for-broken-multipart-form-data.patch | 28 -----------
 ...ck-for-utmp.h-even-with-disable-utmp.patch | 49 -------------------
 package/shellinabox/Config.in                 | 18 -------
 package/shellinabox/shellinabox.hash          |  4 --
 package/shellinabox/shellinabox.mk            | 33 -------------
 10 files changed, 7 insertions(+), 163 deletions(-)
 delete mode 100644 package/shellinabox/0001-Makefile-disable-always-building-statically.patch
 delete mode 100644 package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
 delete mode 100644 package/shellinabox/0003-configure.ac-check-for-utmp.h-even-with-disable-utmp.patch
 delete mode 100644 package/shellinabox/Config.in
 delete mode 100644 package/shellinabox/shellinabox.hash
 delete mode 100644 package/shellinabox/shellinabox.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 5cd8e20bce..9b38521760 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -797,7 +797,6 @@ package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
 package/setserial/0001-build-system-fix.patch lib_patch.Upstream
 package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
-package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
 package/skeleton-init-systemd/fakeroot_tmpfiles.sh Shellcheck
 package/slang/0001-slsh-libs.patch lib_patch.Upstream
 package/smcroute/S41smcroute NotExecutable lib_sysv.Indent lib_sysv.Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index 8efc476888..aab7a95cc3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_SHELLINABOX
+	bool "shellinabox has been removed"
+	select BR2_LEGACY
+	help
+	  shellinabox is no longer maintained upstream (last release
+	  in 2016, last commit in 2019) and has been removed.
+
 config BR2_PACKAGE_PRBOOM
 	bool "prboom has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..edea0e3803 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2665,9 +2665,6 @@ F:	package/poppler/
 F:	package/qpdf/
 F:	package/openjpeg/
 
-N:	Olivier Singla <olivier.singla@gmail.com>
-F:	package/shellinabox/
-
 N:	Parnell Springmeyer <parnell@digitalmentat.com>
 F:	package/scrypt/
 
diff --git a/package/Config.in b/package/Config.in
index 49659b007e..b448f4525e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2647,7 +2647,6 @@ endif
 	source "package/ser2net/Config.in"
 	source "package/shadowsocks-libev/Config.in"
 	source "package/shairport-sync/Config.in"
-	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/sngrep/Config.in"
 	source "package/snmpclitools/Config.in"
diff --git a/package/shellinabox/0001-Makefile-disable-always-building-statically.patch b/package/shellinabox/0001-Makefile-disable-always-building-statically.patch
deleted file mode 100644
index 2f2097e099..0000000000
--- a/package/shellinabox/0001-Makefile-disable-always-building-statically.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c060e6f06a81ffa400266a6d0bfc58511265a16f Mon Sep 17 00:00:00 2001
-From: Olivier Singla <olivier.singla@gmail.com>
-Date: Thu, 4 Aug 2016 21:23:41 +0200
-Subject: [PATCH] Makefile: disable always building statically
-
-Signed-off-by: Olivier Singla <olivier.singla@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7b8e7ab..5c4c71e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -126,7 +126,7 @@ BUILT_SOURCES        = shellinabox/beep.h                                     \
- 
- shellinaboxd_LDADD   = liblogging.la                                          \
-                        libhttp.la
--shellinaboxd_LDFLAGS = -static
-+shellinaboxd_LDFLAGS =
- ## Added this for compatibility with older versions of autoconf/automake
- docdir               = ${datadir}/doc/${PACKAGE}
- 
--- 
-2.7.4
-
diff --git a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
deleted file mode 100644
index 5067833056..0000000000
--- a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 7f47efe1717c381f86566fabe0b1ced8cb98fe8f Mon Sep 17 00:00:00 2001
-From: irsl <irsl@users.noreply.github.com>
-Date: Fri, 26 Oct 2018 11:51:15 +0200
-Subject: [PATCH] fix for broken multipart/form-data
-
-Malformed multipart/form-data payload results in infinite loop and thus denial of service
-
-CVE: CVE-2018-16789
-Upstream: https://github.com/shellinabox/shellinabox/pull/446
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libhttp/url.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libhttp/url.c b/libhttp/url.c
-index ed29475..4177871 100644
---- a/libhttp/url.c
-+++ b/libhttp/url.c
-@@ -312,6 +312,9 @@ static void urlParsePostBody(struct URL *url,
-               }
-             }
-           }
-+        } else {
-+           warn("[http] broken multipart/form-data!");
-+           break;
-         }
-       }
-       if (lastPart) {
diff --git a/package/shellinabox/0003-configure.ac-check-for-utmp.h-even-with-disable-utmp.patch b/package/shellinabox/0003-configure.ac-check-for-utmp.h-even-with-disable-utmp.patch
deleted file mode 100644
index 49012817e9..0000000000
--- a/package/shellinabox/0003-configure.ac-check-for-utmp.h-even-with-disable-utmp.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Thu, 19 Nov 2026 10:43:49 +0100
-Subject: [PATCH] configure.ac: check for utmp.h even with --disable-utmp
-
-On Linux, login_tty() is declared in utmp.h. With --disable-utmp,
-which is required with musl, utmp.h is not checked for and thus not
-included, while login_tty() is still found and used by launcher.c. With
-GCC 14 and later, this breaks the build:
-
-  shellinabox/launcher.c:899:5: error: implicit declaration of function 'login_tty' [-Wimplicit-function-declaration]
-
-HAVE_UTMP_H only controls the inclusion of utmp.h, the login records
-depend on HAVE_UTMPX_H. So check for utmp.h unconditionally.
-
-Upstream: dead (last commit in 2019)
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- configure.ac | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 05ab1bb..234ce32 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -34,6 +34,11 @@ dnl Check for header files that do not exist on all platforms
- AC_CHECK_HEADERS([libutil.h pthread.h pty.h strings.h syslog.h sys/prctl.h \
-                   sys/uio.h util.h])
- 
-+dnl On Linux, login_tty() is declared in utmp.h, so check for it even when
-+dnl utmp support is disabled. HAVE_UTMP_H only controls the inclusion of the
-+dnl header, the login records themselves depend on HAVE_UTMPX_H.
-+AC_CHECK_HEADERS([utmp.h])
-+
- dnl Most systems require linking against libutil.so in order to get login_tty()
- AC_CHECK_FUNCS(login_tty, [],
-                [AC_CHECK_LIB(util, login_tty,
-@@ -147,7 +152,7 @@ AC_ARG_ENABLE(utmp,
-                                            be disabled.])
- 
- if test "x$enable_utmp" != xno; then
--  AC_CHECK_HEADERS([utmp.h utmpx.h])
-+  AC_CHECK_HEADERS([utmpx.h])
- 
-   dnl Even if utmpx.h exists, not all systems have support for updwtmpx()
-   AC_TRY_LINK([#include <utmp.h>],
--- 
-2.34.1
-
diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
deleted file mode 100644
index 63a298dcae..0000000000
--- a/package/shellinabox/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_PACKAGE_SHELLINABOX
-	bool "shellinabox"
-	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
-	help
-	  Shell In A Box implements a web server that can export
-	  arbitrary command line tools to a web based terminal
-	  emulator. This emulator is accessible to any JavaScript and
-	  CSS enabled web browser and does not require any additional
-	  browser plugins.
-
-	  https://github.com/shellinabox/shellinabox
-
-comment "shellinabox needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
deleted file mode 100644
index 6bbaf73c16..0000000000
--- a/package/shellinabox/shellinabox.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  27a5ec6c3439f87aee238c47cc56e7357a6249e5ca9ed0f044f0057ef389d81e  shellinabox-2.20.tar.gz
-sha256  04ef60ab9b83cde6f0862ea18474454477efb34c52ebce1f8d8260a398a39362  COPYING
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL-2
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
deleted file mode 100644
index 725b8d9c52..0000000000
--- a/package/shellinabox/shellinabox.mk
+++ /dev/null
@@ -1,33 +0,0 @@
-################################################################################
-#
-# shellinabox
-#
-################################################################################
-
-SHELLINABOX_VERSION = 2.20
-SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,v$(SHELLINABOX_VERSION))
-SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
-SHELLINABOX_LICENSE_FILES = COPYING GPL-2
-SHELLINABOX_CPE_ID_VALID = YES
-
-# 0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
-SHELLINABOX_IGNORE_CVES += CVE-2018-16789
-
-# Fetching from Github, and patching Makefile.am, so we need to autoreconf
-SHELLINABOX_AUTORECONF = YES
-
-# The OpenSSL support is supposed to be optional, but in practice,
-# with OpenSSL disabled, it fails to build. See
-# https://github.com/shellinabox/shellinabox/issues/385.
-SHELLINABOX_DEPENDENCIES = zlib openssl
-SHELLINABOX_CONF_OPTS = \
-	--disable-runtime-loading \
-	--enable-ssl
-
-# musl's implementation of utmpx is a dummy one, and some aspects of
-# it cause build failures in shellinabox
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-SHELLINABOX_CONF_OPTS += --disable-utmp
-endif
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
