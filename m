Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCC7606A326
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IQ9xz8PP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 166C4607D3;
	Mon,  9 Nov 2026 15:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iiBKs8SQDht; Mon,  9 Nov 2026 15:33:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2BE5360703
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794238418;
	b=e8gVNx5tC9jvCBukLy/ngbO+yahgSvLueU6XdMH3SZ6728MEMQ7mycEyTN3N76j/ZNAF
	 aTgJJYNYtOGeLYblfRdEIdDFIP7d+2s4AlEi2Afg1ayCa4eAKu/YV+NtPIQeReWjcxXN2
	 PdflaD+aaAaAzwLKaVybQX/gzoDhUtSPDnh5UtDF/1Eh5jNP5lkM4sB8GUWwmaqPddLfs
	 cQxGbi0B759loYFNp/Fjm6NefJjXntYP3AboRfnW7Q5ruAeQr+/oV571oviIajgcjuuKp
	 gYIHl1oUt4JFDTG/k0jPlg+9zw3j1J9e4oStDWt72fNRw8CLsHWvwXybS1c0MOb8eZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794238418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BUTTAJ7/r39seb8G1+HN4unlXfvML83s1vhBbHMOqO8=;
	b=fPLnN0UKNV/o4/hKCoK8YCA2Q7UgYQleiKW7n4nfl4ad45InRPEpSvPGNS3SVJy9Plal
	 95MiIYZBSY1miHzj6ecp+gIfCsdJ6Rwbe3j1wCg5v1vrw7AjUzvDlsk0PpGj1pFTN7bmJ
	 Smrb1vgsO68OqW47Uud3VJaDdzHgZBxfUKyGt+3VlRK2i3EsPsGGNbUlE81H6llNUqs3j
	 yKqAvckhUAMYZg+SKvIQnJpESHXsw2M06U+ScdNSYsbEHO898k761NkF5MuimbACiWGYG
	 UCEfgnth5XvEX9/ZIZxV/uFvBgo1wkTsbuyUhof1eQbBKg0XiwAmvbA6m5qN19o6MsA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794238418;
	bh=BUTTAJ7/r39seb8G1+HN4unlXfvML83s1vhBbHMOqO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=IQ9xz8PPmjZqm491u4vBYvjJgiIKzK/ahcpy0EjMyq/8EDNneSJFdXPkow8YoIjLD
	 83aYz8KOkpjyLiNG16Upr5AYbnHntkUobzFftCXiCNQJR7RP/fQ6oO1M/sfjcXZvXl
	 V8rxTNCfIDTrTaJ2rjJ9+ARsbIfaHbMHoMcV/D8jIjdcWGidBvpeO9DxkVwScZE6jD
	 01MDQh+JBTqMwDAoiVjlS4AsjLm3URUm8KSuF00608HdoTLVApQVUUr7tfG+N6i/jP
	 ovJRKk+7F6SM0KPS495fJI35VJS07ak1NMBJbclN6Cv0W0t5DM610nGoaM9Xykloqq
	 cFXmZnT2Pw3FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE5360703;
	Mon,  9 Nov 2026 15:33:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B8A4235
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CCF2607C5
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04XA0vsiq4we for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 15:33:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 182C8605E3
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 182C8605E3
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:33:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so10779815e9.2
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 07:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794238411; x=1794843211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0xf79L4oEMIVgulaLPFIXZ0iIwAjypaPqgyrAa2bCV4=;
 b=Hm9X+DbCRj+y6Q/LHKzjEv6ktyj670CR1AFO8GmuIgMmVGy9U9eSYWvPdD00WQE8bK
 jhOGv/MFABwF11xLvSkbbxITSutz/qMWN5F4MvEmFW4NPiRod3J/3VxbRp9KUfAiAtL7
 g19UTbN3VdR29z2POv1cmZD/TBKsgnFmKgNEZA4pkyF3ycZy8nLqmmzsk7nD+QitXDlg
 xEZ0lsOsV2HBBPH79WiyFpqvY1E1j44y9PCTibW41zoxl2gPYuOReXA4rV3QOiGKKHrZ
 N52CYnUpHK8BHOEVEHKDxINxhIt1HxczitEHdsAcxhHiBPTE0yrohnjm1TkwFzVbw0Ku
 5TlA==
X-Gm-Message-State: APuU4Z9vo+3zO3MFy0mSWV7O7aRewebgVmKjjDuegP8/RPcASyMcxwIv
 RkTznbGaOdhHqRfPMAyX+yQZETxSQH4iAWutYFFb8mosKxQfoIXjC80DjS9XlO6e1bS/sOv+83b
 GGROG
X-Gm-Gg: AYBFou2N+9G7flarK57Hi7KHDmubLjA/A+YXSGktH0x6eG2rSPnwAxZULVM0O1Daiyd
 z3ShIGDNVPoVKLQVtZsAWKiw5n9ygX7zM7j8z5m/YrULNTTPqVjnqTFOkSGg2zC+XCay/z6hcS4
 KWQloN93RzM10o5hZyTLueNIpJIjgKRQU3SAF9FSvt3WkLIbkLopHNsk234n8Sr/YwEMehrRRdN
 igLKODVguYmRp5vuK0CN7Loxcu00WUkJpP15tDq3wBc2Hmf0VSr8i+EQt+uWoTrO4QCi+DT7CqY
 ECQbJAwVxFPbad+Z9XO4OSJhJI9y1nPujnaDI8JwDWsXjxM56llAgTtLQz/VwQ5BHIe2K2R+JFR
 LPXQmIwTymeFa/iKqdaumVJiI7YFcqjrEwGffGl5MyGU63Q/KtWUkrYmRifrZjdLn/IQ1dkjorW
 nGoATPDYk7wzpMjopS3aqChrxnNhigJh4i8dx65Y19YXCDoCGZy1TmhRcbqKMjYCAR3NS2p3G8v
 yKs6t0lFCv+zRJV5QfdIrj25asCj8LXWjLgARl1AkX+mOOApp2cUFPwGuS2NbvUxHdtOtW8QKzf
 5+Zwb4J2oudMtYacQwDkuA==
X-Received: by 2002:a05:600c:8b63:b0:4a3:59c7:f226 with SMTP id
 5b1f17b1804b1-4b960d9b007mr78570165e9.6.1794238411336; 
 Mon, 09 Nov 2026 07:33:31 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b795024730sm181601275e9.4.2026.11.09.07.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 07:33:31 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 16:33:29 +0100
Message-ID: <20261109153330.473742-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/2] package/python-sqlparse: backport
 fix for CVE-2026-59894
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following vulnerability:

- CVE-2026-59894:
    sqlparse is a non-validating SQL parser module for Python. Prior to
    0.6.0, sqlparse/filters/output.py fails to escape existing backslashes
    before quotes in sqlparse.format output_format='python' and
    output_format='php' and the corresponding sqlformat -l modes, allowing
    crafted SQL to terminate the generated string and inject Python or PHP
    code when a downstream consumer executes or imports the generated
    source. This issue is fixed in version 0.6.0.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-59894
  - https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-3496-9g83-7v6x
  - https://github.com/andialbrecht/sqlparse/commit/53ff44b53e27cff78259acc1af015506fea60f63

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ape-backslashes-in-output-formatters.patch | 49 +++++++++++++++++++
 package/python-sqlparse/python-sqlparse.mk    |  3 ++
 2 files changed, 52 insertions(+)
 create mode 100644 package/python-sqlparse/0001-Escape-backslashes-in-output-formatters.patch

diff --git a/package/python-sqlparse/0001-Escape-backslashes-in-output-formatters.patch b/package/python-sqlparse/0001-Escape-backslashes-in-output-formatters.patch
new file mode 100644
index 0000000000..c379d32155
--- /dev/null
+++ b/package/python-sqlparse/0001-Escape-backslashes-in-output-formatters.patch
@@ -0,0 +1,49 @@
+From 53ff44b53e27cff78259acc1af015506fea60f63 Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Mon, 29 Jun 2026 08:29:32 +0200
+Subject: [PATCH] Escape backslashes in output formatters.
+
+CVE: CVE-2026-59894
+Upstream: https://github.com/andialbrecht/sqlparse/commit/53ff44b53e27cff78259acc1af015506fea60f63
+[thomas: backport: 
+  - stripped tests and changelog
+]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ sqlparse/filters/output.py | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/sqlparse/filters/output.py b/sqlparse/filters/output.py
+index 253537e..697ebc3 100644
+--- a/sqlparse/filters/output.py
++++ b/sqlparse/filters/output.py
+@@ -61,9 +61,11 @@ class OutputPythonFilter(OutputFilter):
+                     yield sql.Token(T.Whitespace, after_lb)
+                 continue
+ 
+-            # Token has escape chars
+-            elif "'" in token.value:
+-                token.value = token.value.replace("'", "\\'")
++            # Escape backslashes before quotes so a backslash preceding a
++            # quote cannot break out of the generated string literal
++            # (GHSA-3496-9g83-7v6x).
++            else:
++                token.value = token.value.replace('\\', '\\\\').replace("'", "\\'")
+ 
+             # Put the token
+             yield sql.Token(T.Text, token.value)
+@@ -110,9 +112,11 @@ class OutputPHPFilter(OutputFilter):
+                     yield sql.Token(T.Whitespace, after_lb)
+                 continue
+ 
+-            # Token has escape chars
+-            elif '"' in token.value:
+-                token.value = token.value.replace('"', '\\"')
++            # Escape backslashes before quotes so a backslash preceding a
++            # quote cannot break out of the generated string literal
++            # (GHSA-3496-9g83-7v6x).
++            else:
++                token.value = token.value.replace('\\', '\\\\').replace('"', '\\"')
+ 
+             # Put the token
+             yield sql.Token(T.Text, token.value)
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 0140961393..97f0ad389b 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -13,4 +13,7 @@ PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
 PYTHON_SQLPARSE_CPE_ID_VENDOR = sqlparse_project
 PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
 
+# 0001-Escape-backslashes-in-output-formatters.patch
+PYTHON_SQLPARSE_IGNORE_CVES += CVE-2026-59894
+
 $(eval $(python-package))
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
