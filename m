Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4173606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 15:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pCztzfox
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B3B380F6E;
	Mon,  9 Nov 2026 15:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOiyJH5FQMxe; Mon,  9 Nov 2026 15:33:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6A93280F77
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794238419;
	b=fXSWt8dN158ycYLE3DtP696JBMYW4l+/wVj5OUVWQpyu4LyFdLHu8XhD1zUz2TzY9DLI
	 Pbb/v/opDC6IvX57GRRPE4tiivAP31PCoaqNj0Pwc8mhSPibgEqWRazHJGwFsiefT+GCG
	 hNGpDINoMncI/Rw3EGyjST0vBvGv93YsnPFWWMpSnFUPClBNRI+o6bTdw9Z2QJTp/vEUj
	 UNWkA3uQzZIyGU5V288dC/BurJllqi1z6Mxnef7IulFnobeRmQkrfqj0obNtAXraYCG26
	 WMaXY/eCzvJ+JXpQav/qOd109RchGzCtA53jMzTr1xIIMsglmsWjJfnbxXWfFisCB0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794238419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BPc84aUCmHnrdflyaqrKJh+LRVRQHjrKoRNlmkx/Dao=;
	b=lGGXJ2pZhl4Kce1A2GfRXBifAog9Bw/6w8HiRmwK9Qs6dtj+gn5bA9uFWRwBjUQ5uqS3
	 plaqOWv8yAnI9oJhdK700ng6nFWoee5YLFjrL0M44Wkv7wKaWZAKtlC2R9vCOVDUCf+7m
	 4so4xdoYhe23d38oimvQsphfWzgvB3x4r1T4ZaXaFN8bjWYQjmQPw41mqytOdUuR7W8sA
	 ynZtq7T64cGnercRrBK8lSEfIg9nsVYz+WpLI4PG7PANmkX4lHYGPuqyx5qdW+teR6m7X
	 boeKf1gkGsmKrZreSuNIVEKUz+p8Gw9a3XsIAbUeGlgDoVmbaQRadbEnvu7XXKhfTBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794238419;
	bh=BPc84aUCmHnrdflyaqrKJh+LRVRQHjrKoRNlmkx/Dao=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pCztzfoxq1SJAynrSbb9/cKVf9Nh8FYlXjqkbruk/phq1J9efdhkOp/K69QmVHdE6
	 CQvAHz4bpbFPb42MzXcpm8cBtGyt1RnidfTSdEmjudT1dAHdxGhHn5GbeAX69kXWDk
	 DFO/X0lkmvc2HDA+TwdhtfSzPzd2TD3HdFMlLuuaQqAGUPnMSer4qoOEt5rNESGzpg
	 uwiO6AQ7/wSyQQWuqD4xHTnj33dKjC7b6wQ37d0vxIQ2bi2LK0tiFPQuMVPET53jne
	 nkVDSPlLy+dO5My7kMKKRhv8QjnB+V5uTXe1oROg3Iv/aTCwaukF2YY2dFMngTRMdE
	 Wvdw/OOBi/x9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A93280F77;
	Mon,  9 Nov 2026 15:33:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65B80B6C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57407605E3
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPHnJVvd4Ypa for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 15:33:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1830A60703
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1830A60703
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:33:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso10595645e9.1
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 07:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794238412; x=1794843212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=waljp2xN3m2hQFxcGKcBQr27SYHSrW+50OFCNyMbROw=;
 b=1o7bS1R2qfMpAcad2gPrTheGHZFFoKNIX2Hpph+QZxFGMMMCun/yRwgInDL8NLVg8r
 ScnO2RdWw4cOcH9YmoVKkIoWL4lbn5vtE9uhrqfBwqxrMOcQmERL73Xlcon/uFjO6kvT
 Nuwi/T5CGZQtYR6whTcCO+1NiX4pJUXBV3gLtZIKMbHa/7Qv8vHJktVE1Fns6l06Kknu
 dxDdcJaGBaWHgc5i1IVubHObmWxwqafJI8kZKov/MLOjn5lXIfUSFSWdIMqp2kvIESln
 21Z8IH8BP9mBNk3Rn467R7WXiomVAntKLYenVaekOIFGJC7DwMVD1z5xNf/loqlp5R77
 kDuQ==
X-Gm-Message-State: APuU4Z/9P3rai0QdPJ9SaiPTCJVFJgJw3af3qoFRZUm5cz31mqXgCuFo
 dy/wKzz4WINezCvxMHR+fAzPI51TJykLAA6O8oOr6szWqg0DKZFWnnTNyWOWojsOml5UIJXJsQl
 VXN4+
X-Gm-Gg: AYBFou0dE3u1sQEsRI7fsdJnxh0nMds/VlibiTxWpCO2KxqgOvzDugD9oE6Khxs9L0S
 AyscUriVH47S96jfJpVY+LDRNwDImtv6SV75G2ELUiultSggtXr1SuGuU+ErvD8bvpYFXQQx25c
 4jS/8usnWOG7Sy8DNR3ZGJA9gyA0sWzP5kBo91MoJjYqyPqORuAYieqVfWutJhmxamMd6L7THnB
 a2Zl4QyF7TNyi23LKg6ZIHJ/3DGAKz1fAezfHABJ0xVj5/7eTmtIiQjOOarTtrwOkVGTo5na5tm
 8lVyfIgndOKmULU2JKqywr5IZi7yv2kCsQLdTLl+LY0JIWJ268lV2g04w+XqJvaFjaIUZuW9B+v
 PCXD8wEYX005YKQNHCcF7626bD9lhHaQBBwliKttNPmfBYLAMOc98iD8G6mLU9DpbR5O88gnytH
 UYirUnAq9Ma/shl3TNESVHhrMiPd6EAouFTqk2dEp+AYnahsewcixQMLUJGtIHlJX/xiQYYcRcq
 yx8s+f8zgsY9ufXYawsTVe7n/4JozNaihggz6Eu8tV2VDy6DPA2sdeMHQ28PUcOcp6Kmk5/7QuV
 7Mjz7wL3EzDq+25nmUkrOg==
X-Received: by 2002:a05:600c:3494:b0:4a2:1a:a120 with SMTP id
 5b1f17b1804b1-4b960d9bc41mr88529675e9.6.1794238411839; 
 Mon, 09 Nov 2026 07:33:31 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b795024730sm181601275e9.4.2026.11.09.07.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 07:33:31 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 16:33:30 +0100
Message-ID: <20261109153330.473742-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109153330.473742-1-thomas.perale@mind.be>
References: <20261109153330.473742-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 2/2] package/python-sqlparse: backport
 fix for CVE-2026-112307
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following vulnerability:

- CVE-2026-112307:
    sqlparse through 0.6.0 contains a PHP code injection vulnerability
    that allows attackers to inject PHP expressions by supplying SQL text
    containing unescaped dollar signs. Attackers can embed ${expr} or
    {${expr}} sequences that OutputPHPFilter places in double-quoted
    strings, executing arbitrary PHP code when the generated snippet runs.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-112307
  - https://github.com/advisories/GHSA-457h-p88w-wq8p
  - https://github.com/andialbrecht/sqlparse/pull/937/changes/bb3c50a52dc2f267c786f0d99c27b25519f9331f

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...pe-dollar-signs-in-PHP-output-format.patch | 45 +++++++++++++++++++
 package/python-sqlparse/python-sqlparse.mk    |  3 ++
 2 files changed, 48 insertions(+)
 create mode 100644 package/python-sqlparse/0002-fix-escape-dollar-signs-in-PHP-output-format.patch

diff --git a/package/python-sqlparse/0002-fix-escape-dollar-signs-in-PHP-output-format.patch b/package/python-sqlparse/0002-fix-escape-dollar-signs-in-PHP-output-format.patch
new file mode 100644
index 0000000000..fee0396cde
--- /dev/null
+++ b/package/python-sqlparse/0002-fix-escape-dollar-signs-in-PHP-output-format.patch
@@ -0,0 +1,45 @@
+From bb3c50a52dc2f267c786f0d99c27b25519f9331f Mon Sep 17 00:00:00 2001
+From: cve-zh00 <bastiang@uc.cl>
+Date: Tue, 20 Oct 2026 10:56:23 -0300
+Subject: [PATCH] fix: escape dollar signs in PHP output format
+ (CVE-2026-112307)
+
+PHP interpolates $var, ${expr} and {$expr} inside double-quoted strings,
+so SQL text containing them could inject PHP code into the snippet
+generated by output_format='php'. Escape "$" as "\$" after the existing
+backslash and double-quote escaping.
+
+Adds regression tests for SQL literals, ${expr}/{${expr}} payloads,
+PostgreSQL dollar quoting, quoted identifiers, comments and a preceding
+backslash.
+
+CVE: CVE-2026-112307
+Upstream: https://github.com/andialbrecht/sqlparse/commit/bb3c50a52dc2f267c786f0d99c27b25519f9331f
+[thomas: backport:
+  - stripped tests and changelog
+]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ sqlparse/filters/output.py | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/sqlparse/filters/output.py b/sqlparse/filters/output.py
+index 697ebc3..06015ec 100644
+--- a/sqlparse/filters/output.py
++++ b/sqlparse/filters/output.py
+@@ -114,9 +114,13 @@ class OutputPHPFilter(OutputFilter):
+ 
+             # Escape backslashes before quotes so a backslash preceding a
+             # quote cannot break out of the generated string literal
+-            # (GHSA-3496-9g83-7v6x).
++            # (GHSA-3496-9g83-7v6x). Dollar signs are escaped last because
++            # PHP interpolates $var, ${expr} and {$expr} inside double-quoted
++            # strings (CVE-2026-112307).
+             else:
+-                token.value = token.value.replace('\\', '\\\\').replace('"', '\\"')
++                token.value = (token.value.replace('\\', '\\\\')
++                               .replace('"', '\\"')
++                               .replace('$', '\\$'))
+ 
+             # Put the token
+             yield sql.Token(T.Text, token.value)
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 97f0ad389b..2b30975f82 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -16,4 +16,7 @@ PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
 # 0001-Escape-backslashes-in-output-formatters.patch
 PYTHON_SQLPARSE_IGNORE_CVES += CVE-2026-59894
 
+# 0002-fix-escape-dollar-signs-in-PHP-output-format.patch
+PYTHON_SQLPARSE_IGNORE_CVES += CVE-2026-112307
+
 $(eval $(python-package))
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
