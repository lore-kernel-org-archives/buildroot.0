Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8869606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gZ72/ezE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4823480EED;
	Mon, 16 Nov 2026 14:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0D-fpsKYhoP; Mon, 16 Nov 2026 14:31:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5819D80E75
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839500;
	b=KnsjGuZDJHkNPpANEMZ9IiCvYXKMvNQM++Y88gKa/CxO8dfjU1zoiXAekJJS8/6flqOr
	 A/axnB1N8f6xZ0NzVoHtkJW6hXs9jy7WLn03yHRxsSWsdoAnD58MT6EzfRXrDuLBFqsXd
	 8OFQc49kuPYaHxwF7RKOGuMKbS3omZMLgAWyJ7h/L5i8pWfPDZc4zchKY+gsZmgyg7i8y
	 ux8rSpg5vGQrupve2EWxqfhkKvFtFT6dxl/NFjPdnKde/MV/cOvwxSyZV45ZVkj7Va7tD
	 59Hr43Mn0xSuGJm8hi0XQ1vUsneBu49v8V+ayH85F0kMR0YxuM6nHcXlqRXV5faPzAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839500;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QSJnAWAwFpMGNGxdLfUo3hVQUPLkDz0JU4HHCh0PVqg=;
	b=iYB2F1s3LTCSmfisAdjFVFmy073uHATeP3LVDUSHdFl/BtirPenPAAvq5A9utAmpr0eo
	 STCHEGQNZDs0uAstO0k1StGkYCPHyZTqIwqhWYRksqbaANBkd43sAktFh/QOWBWVDB1ml
	 foSuQtoPErjDwJV0bTHx32W0mxX7Qcp+LTyEQ4ocr6UIpYgZSAZgyGWMtHrrNDgQ5G7Dy
	 jVtDLGkTPdj0iCjLxkshPMArpg2RGIFospGts4Gj1hMwT3mfxOpf6uyvGZ/CyfiBVL6lj
	 PcFEKGeb34xtbHJvXFji74uY3YRmoRQxoLZeJVVJrt9s859V6FpClo6sYITgVqpsKtA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839500;
	bh=QSJnAWAwFpMGNGxdLfUo3hVQUPLkDz0JU4HHCh0PVqg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=gZ72/ezESG1pqoma5ofsKjnmxcmm9NYL4M16hp5v7bj7SEOTXaZDVvUy8Iumj1nt3
	 DwbbiaMKnUcporCajCYE8mbauCad6v8A61lqCUHcN0pxS/oP6ZoRBRr7etlDZ9iG70
	 zT35PbCtA2bpWdJaXQbvEhDxl07Ji8xkK2j4NesEto+f6rrIGfODhuo6FUXuVgdUHX
	 2HKrf4L79Q2yJai4Evb3597eIZ+oUKdU0H9p7shfDJefH8mYzQzlufxXdwLZAux2SX
	 L8BBk8ElTc1WfQ1rOymPIdQvcdVVmZ3k5UiE3iuyZHl1RCvOvHnHXD+7PJPpLdWT/C
	 bF/V/cZbTS16g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5819D80E75;
	Mon, 16 Nov 2026 14:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A004260
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1C9607B5
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wF3UXkCqNc-d for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:31:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2875160794
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2875160794
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:31:36 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6b7ddb99db4so2472682a12.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 06:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794839495; x=1795444295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FGctrOI92KenyL67YDEI8vMqMYAE5eD0+sWozcAYF9I=;
 b=JnivQtdl/p5QBz2sTlrKcFpwRk+Z5uc2haCydR3Wh7tz0TSHkVlfwTWcriqb06gyVo
 0uyXwM5bwPH+57R76bJUxbunFXu/mABEVbxmILo7SfFXbKvbglIC6Tkl7axCj7fIeDPF
 fI7GDdg4RZAJ+hCdjlrUpsTYpG7MNddFVWoqQ7ZFE8xFpnacGUsnhipIV4jt1nXVKJOu
 upqeUhxMUFhEpjVuWGWFnP78ogqLL+dNRpdvy7C+ito+8JRhf1jAAqjpkAV+QewgefdF
 n13jLVGgGVhhL51aDXrr3/e1SA9DeNIXMoK4IyYGMPjz3bXTec4vVkXlSvfxUeoDnYDO
 tjmw==
X-Gm-Message-State: APuU4Z+h+DPfYfXTSNMbGXp3MJWpmAK3EPdTUcrTiEWimmnDLkrpGqmK
 b1/uzYblnWntEC8OyPnjgOnHSmAsDTuZSE11JUnxhHLVJxjlP3tPEdnWpSXCsrN3Q0AAGwhQudE
 yzSNt
X-Gm-Gg: AYBFou3v93mdglKXAmolD9+lhjeKM/ycgeDDHlAzRWmzD8xljlCnrmQjXl4PcViF/Oa
 Mi7XeQ+n/mD+gSSUVJ+udfLAH5dPfXzbheJjJJPdVVjXOiK1k1brZ7CWjFvO/25BhZk9+M8KSoB
 6UGi6YdyGVamiOgqAKbFIjfkILfEIn1i3ykFpySa2fQd/mETh1Uu438XRKNj2/8+ypkO+mkmHPK
 pmyp+6CEk5O5e6ESdkv6gFnRFEWsugCleYJFG52z9HiSjSdrh46HDtp1jdkPBS4seFmKKUY34IP
 se9Eej1FaCOzumuoLlPPsJDyX6j+nrhuBHfgaM0DbgIizxA64WQVphzGNWvW77NSz6pJxt2mTRO
 rMSUWMhvF319yA8QrnQBVYpnRxK8P1N6PMcyPtbO2bXwxjISyrpOL6hrUUqYYZzvrBl2+8k7Ar/
 30TLgZFH1yyya38ALZ9tPa/mrS1rE/03MompxAohkD5FfU5BNMCtf8i266APC+sM5yiIXcNsaJL
 DSkq6YY8TIiROk2hqZhJE/32nyjiA75mt7AUKiAw2JV+/UeyIk+X2l2zv2Ij1qsdZEMHO09hlZ3
 cHcCKTHtL2wsUrxZU1DQWw==
X-Received: by 2002:a05:6402:2383:b0:6b5:8579:540a with SMTP id
 4fb4d7f45d1cf-6b7c0c147c9mr5918598a12.30.1794839494557; 
 Mon, 16 Nov 2026 06:31:34 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d03b10fsm25288139f8f.1.2026.11.16.06.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 06:31:33 -0800 (PST)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 16 Nov 2026 15:31:31 +0100
Message-ID: <20261116143131.967376-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump to
 v17.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See the release note:
 - https://www.postgresql.org/about/news/postgresql-187-1712-1616-1520-1425-and-19-rc-2-released-3442/
 - https://www.postgresql.org/docs/release/17.12/

Fixes the following CVEs:

CVE-2026-6460: Type confusion after ALTER ... SET DATA TYPE executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-6467: Extension script schema mishandling executes arbitrary SQL (CVSS v3.1: 7.2)
CVE-2026-14661: dblink and subscriptions can append to arbitrary files (CVSS v3.1: 8.1)
CVE-2026-16237: INSERT ... ON CONFLICT can read or modify rows despite auto-updatable view WHERE condition (CVSS v3.1: 5.4)
CVE-2026-16240: pg_basebackup can use backup manifest content as a format string (CVSS v3.1: 3.7)
CVE-2026-18447: Output parameter type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116303: Foreign key and JSON conversions bypass EXECUTE privilege on cast functions (CVSS v3.1: 3.1)
CVE-2026-116304: Parallel RECORD typmod use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116306: Composite-type change during field assignment executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116307: plperl prepared-query use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116308: dict_int reads beyond zero-length tokens (CVSS v3.1: 4.3)
CVE-2026-116309: plperl blessed-reference type confusion may execute arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116310: COPY error context uses freed field storage (CVSS v3.1: 4.3)
CVE-2026-116311: DROP OWNED can remove restrictive row security policies from non-owned tables (CVSS v3.1: 5.4)
CVE-2026-116312: MERGE can place the wrong row in a trigger transition table (CVSS v3.1: 5.4)
CVE-2026-116313: vacuumdb --missing-stats-only lets a database owner execute code as the vacuumdb user (CVSS v3.1: 7.2)
CVE-2026-116314: pg_restore executes arbitrary code due to missing non-plain archive validation (CVSS v3.1: 8.8)
CVE-2026-116315: tsvector_delete() heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116316: Security-restricted operations can create types in pg_temp, which later queries of the session find (CVSS v3.1: 8.8)
CVE-2026-116317: ts_rank_cd() heap buffer overflow may execute arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116318: pg_dump not-null constraint name allows SQL injection (CVSS v3.1: 8.8)
CVE-2026-116319: plperl reentrant return_next() use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116320: plperl array and hash conversion use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116321: Unterminated name value discloses server memory (CVSS v3.1: 4.3)
CVE-2026-116322: Pre-authentication cancel request can leak a spinlock (CVSS v3.1: 5.3)
CVE-2026-116323: pltcl reentrant result conversion use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116325: reindexdb index name quoting allows SQL injection (CVSS v3.1: 8)
CVE-2026-116326: plperl tied-object exceptions follow stale sigjmp_buf (CVSS v3.1: 8.8)
CVE-2026-116327: security_barrier analysis can expose hidden values through indirect expressions (CVSS v3.1: 4.3)
CVE-2026-116328: Generation memory context integer wraparound executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116329: Statistics import type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116330: pg_dump tar restore.sql fails to block psql command injection (CVSS v3.1: 8.8)
CVE-2026-116331: Min/max aggregate type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116332: Portal setup use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116333: Parallel B-tree array scan reads beyond array bounds (CVSS v3.1: 6.5)
CVE-2026-116335: Commutator or negator result-type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-116336: REINDEX CONCURRENTLY does not block DROP INDEX during index functions (CVSS v3.1: 8.8)
CVE-2026-120139: Tuple-size integer wraparound executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120141: Materialized set-returning function type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120142: Dropped-column type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120143: Transition-table cursor use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120144: Type-cache invalidation gap executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120145: Logical replication can write to subscriber system catalogs, executing arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120146: REASSIGN OWNED bypasses role SET and CREATEDB checks (CVSS v3.1: 4.3)
CVE-2026-120147: dblink reentrant disconnect use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120148: Extended-statistics pseudo-type confusion executes arbitrary code (CVSS v3.1: 8.1)
CVE-2026-120149: FDW batch-insert mismatch executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120150: Expanded-record domain-check use-after-free executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120151: plpgsql record-field type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-120152: pg_show_all_settings() use-after-free discloses memory (CVSS v3.1: 4.3)
CVE-2026-120153: Extension-script substitutions allow SQL injection through object names (CVSS v3.1: 7.2)
CVE-2026-120154: INSERT ... ON CONFLICT can read rows despite row security policies (CVSS v3.1: 4.3)

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index ca0d350708..984f9b9a86 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.11/postgresql-17.11.tar.bz2.sha256
-sha256  dd27f2b3c59e73ed14aa3324901242bf69a032a6347805f274e6260322d42979  postgresql-17.11.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.12/postgresql-17.12.tar.bz2.sha256
+sha256  9cf136a703d8ee2f83465c43be4e9e8e7930c82b0bfba13be7e2537be769ac55  postgresql-17.12.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index d7fad7c5a1..0d0b287ebf 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.11
+POSTGRESQL_VERSION = 17.12
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
