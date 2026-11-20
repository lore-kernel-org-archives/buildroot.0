Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58751606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h/nEdLvV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 390AE60E49;
	Fri, 20 Nov 2026 10:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iks2_Q5RtR-0; Fri, 20 Nov 2026 10:01:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 38DDE60E43
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168906;
	b=hMO6wEtdF4sQWYk+SmjARFHwoUXt1Jd4i2K35jxT9h+KK6cGWk8pm5X4O2MZOmiQ61Ts
	 Xe8pOQr83KpnYUQMnJ1Xvms2NYr+c+ACCkm+ftPyNdG06asyiUeeTLTZaJs/qohAQun4q
	 NuU6mb1tUakb+OZquGCsTIWXq0eGQiV87MjW31Vi+PXJVFRL9TOGQ7gqEB7aRlYaIm843
	 8A0VkdCzSuf6LpR9KJTVykphNcW1P0ZBmWZjOh69QE+gAGMrD1u4EDYhDEeK96Ej0Tj0y
	 3S0eCO3WmlF3B95GmnMTPxW6TQRQwNzlspIWFCDtRJcw204wyyPRBODCvoiOFHH+9vA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168906;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lc0BPKjevniZisvwBzU+s0uYOOxOpTa7xHkKVohA5EU=;
	b=HlhXaxEh/gAD3sS/1PzOZZrR3mo3LEtca+nmW6cz1yyaZ8jYLk9rGn+d93t6Npx1dlmf
	 nG4r7NMpHXgxigL736ckXh2HnhkDBW3CWCttkUBzKRZjUxmzo9dvwYgzmOED+QF2XuE6L
	 jrCFYZN71IoU/QJ+ETom6AWrNCSEdCS6K7HEC0nmC37Y9a9qZ/wQiuRJRqkUoVCyF1qIX
	 my8KSQ0Dg5SsidtVjiZ2nSecflw+LVKFY45aQhoTlIgp5853okIu4Ua5HqCuz6Mfr5ZWG
	 QUhQzyonsBnmfBKUCQ1MDHaj1ARAAj0W9Rc+9ol8SZRBtXp4nLCEVoMMgkE4fcOwXHw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168906;
	bh=lc0BPKjevniZisvwBzU+s0uYOOxOpTa7xHkKVohA5EU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h/nEdLvV/YzB4KiWdIEp1dA7/9vNf8uW5wMj58D9Z6MupAn1bmJmPmNkhxnYCYtEx
	 V1scLs7QppIrdhe2vAxVxD7WFybHBl/7rjEGn7DCwTcemvLgKftxP3ou/1C8xJqdZ5
	 QEOhHQfjeunRZF2DBlQBk9pxOhjbf3AOgX2Fw+vdzOM3yJAlVXzHxftPQTlZto8BU+
	 bM8jPSGeXC5nch88ZylMGHTgz/ILyQPt4/aCtwg3HFEW/ov39ZHCV6GpOTwbwJmCGo
	 kgwv/Sq8cqyNpXhheH12lCR3i/OUj2IWXQKva8XzBY/aU6Tt+yro5Wv7WkZecMPL0a
	 oCArLvw35AL1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38DDE60E43;
	Fri, 20 Nov 2026 10:01:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C7C3E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E0BE4016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2c-EuLB4yC60 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E2BFB400D6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2BFB400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6b8a1f59d5eso826196a12.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168902; x=1795773702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xz2rwR8ZK9/mzOrQXKOu8FvzrjCoQ78Fa2aDwLBHdeQ=;
 b=GU3K1eHVLi20B8QYdITDIJqmwYsAzowA5kQCOSycG7sl9lNke4b/fNzrw974TsIdGU
 1eWzer+6weZk7edrzKpYpngCXdLuOcdR37uF3JZZHIrcjsuEB69Vy+1bVEoLFuN29QUW
 IH+6mWQGL9W8LHfAHPR01bYRsVHlIfIQn3kEtgXyz2X5QOJhsXhqYVRz/6o5GjXMnT2I
 pt05Us8FN1GhQLf+9ze4I9wBgE0IWkVaU/s9KzB7SwjCSIhkHLXD753DUUx3Q/0L9xZm
 pyQZHdh+uurMYNbCxSFDvWd/hhVefJyRhkqwYNRUuIG4Ep3uFsxfAEhSgwqiwDG14Clo
 fu/Q==
X-Gm-Message-State: APuU4Z81MvhCRLxmaWfqd7rqrElZdN+lJ1ReUxg57aNsBYV34eJvzOgb
 jr7HFUN3wMKhwQD+tXUoUic7LDL6Ot3c9BYo4O65wBpschVo1yLfPDqXigj1X02i9NMu+7PULoa
 mUNXsUt5qRw==
X-Gm-Gg: AZFdTZfTU9iPdblZd3EzAwBqbVR1W49JrlHL3TBMhU+J/aQoWaqgISGYaw4YEiXa0WT
 Br/osxUYHefKDBuzOJOGz3WRfJ/c0ZHW8X1q0sGCfyyOwsKDKX5kPWEcy4pYR+gGs1un8mbzTaD
 /+tpLfDcj0MpjfPZjDp2XEU96s7t7Zi4ThdBR8DUyTj380X2Vp1ZzVgNhs0bIgrDrsrlfdKZFEa
 GFoV+Yiga/pQN1gGNozNa5L56ydbtLlaVy2W4YTqfCdLnfkMovSxI/z907r6gebP/kumWLXx2Xm
 kQRVMs+0Fi3Fc6g0MsD8Gq4gYvRgYMilpWDfHof1lo+77ZIBorfnM42ahdkm2g76MTpi+DRy2v2
 0uc8MNb2rfVvJYATxriIKtBrsFMhUZxGr+nJh5kkEdHQfdD1xTV6a/QaM2SjXV5JzoJgVS0lYap
 IF5M9W2oxgTPUN9NvZIQE9mPtXZsTkXTXFyKGzl1kWlxRuUAbkpo8SirOTuKFdvxJ9MpYXUdHFe
 4eUixjSz1EqOPf/ep4dNxVABp5CdwiSwRKO9yITJ5erlnynooglrKwlyc8BN4VN1hBzl2I8Nx5I
 G7YskXwcXbaGYSQp7zrTnSnXQziLNw==
X-Received: by 2002:a05:6000:4b1e:b0:4a9:760f:1832 with SMTP id
 ffacd0b85a97d-4abb46bc41fmr4476698f8f.45.1795168886489; 
 Fri, 20 Nov 2026 02:01:26 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4abbd84e661sm3599867f8f.18.2026.11.20.02.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:26 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:01:23 +0100
Message-ID: <20261120100125.542985-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116143131.967376-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump
 to v17.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> See the release note:
>  - https://www.postgresql.org/about/news/postgresql-187-1712-1616-1520-1425-and-19-rc-2-released-3442/
>  - https://www.postgresql.org/docs/release/17.12/
> 
> Fixes the following CVEs:
> 
> CVE-2026-6460: Type confusion after ALTER ... SET DATA TYPE executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-6467: Extension script schema mishandling executes arbitrary SQL (CVSS v3.1: 7.2)
> CVE-2026-14661: dblink and subscriptions can append to arbitrary files (CVSS v3.1: 8.1)
> CVE-2026-16237: INSERT ... ON CONFLICT can read or modify rows despite auto-updatable view WHERE condition (CVSS v3.1: 5.4)
> CVE-2026-16240: pg_basebackup can use backup manifest content as a format string (CVSS v3.1: 3.7)
> CVE-2026-18447: Output parameter type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116303: Foreign key and JSON conversions bypass EXECUTE privilege on cast functions (CVSS v3.1: 3.1)
> CVE-2026-116304: Parallel RECORD typmod use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116306: Composite-type change during field assignment executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116307: plperl prepared-query use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116308: dict_int reads beyond zero-length tokens (CVSS v3.1: 4.3)
> CVE-2026-116309: plperl blessed-reference type confusion may execute arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116310: COPY error context uses freed field storage (CVSS v3.1: 4.3)
> CVE-2026-116311: DROP OWNED can remove restrictive row security policies from non-owned tables (CVSS v3.1: 5.4)
> CVE-2026-116312: MERGE can place the wrong row in a trigger transition table (CVSS v3.1: 5.4)
> CVE-2026-116313: vacuumdb --missing-stats-only lets a database owner execute code as the vacuumdb user (CVSS v3.1: 7.2)
> CVE-2026-116314: pg_restore executes arbitrary code due to missing non-plain archive validation (CVSS v3.1: 8.8)
> CVE-2026-116315: tsvector_delete() heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116316: Security-restricted operations can create types in pg_temp, which later queries of the session find (CVSS v3.1: 8.8)
> CVE-2026-116317: ts_rank_cd() heap buffer overflow may execute arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116318: pg_dump not-null constraint name allows SQL injection (CVSS v3.1: 8.8)
> CVE-2026-116319: plperl reentrant return_next() use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116320: plperl array and hash conversion use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116321: Unterminated name value discloses server memory (CVSS v3.1: 4.3)
> CVE-2026-116322: Pre-authentication cancel request can leak a spinlock (CVSS v3.1: 5.3)
> CVE-2026-116323: pltcl reentrant result conversion use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116325: reindexdb index name quoting allows SQL injection (CVSS v3.1: 8)
> CVE-2026-116326: plperl tied-object exceptions follow stale sigjmp_buf (CVSS v3.1: 8.8)
> CVE-2026-116327: security_barrier analysis can expose hidden values through indirect expressions (CVSS v3.1: 4.3)
> CVE-2026-116328: Generation memory context integer wraparound executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116329: Statistics import type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116330: pg_dump tar restore.sql fails to block psql command injection (CVSS v3.1: 8.8)
> CVE-2026-116331: Min/max aggregate type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116332: Portal setup use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116333: Parallel B-tree array scan reads beyond array bounds (CVSS v3.1: 6.5)
> CVE-2026-116335: Commutator or negator result-type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116336: REINDEX CONCURRENTLY does not block DROP INDEX during index functions (CVSS v3.1: 8.8)
> CVE-2026-120139: Tuple-size integer wraparound executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120141: Materialized set-returning function type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120142: Dropped-column type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120143: Transition-table cursor use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120144: Type-cache invalidation gap executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120145: Logical replication can write to subscriber system catalogs, executing arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120146: REASSIGN OWNED bypasses role SET and CREATEDB checks (CVSS v3.1: 4.3)
> CVE-2026-120147: dblink reentrant disconnect use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120148: Extended-statistics pseudo-type confusion executes arbitrary code (CVSS v3.1: 8.1)
> CVE-2026-120149: FDW batch-insert mismatch executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120150: Expanded-record domain-check use-after-free executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120151: plpgsql record-field type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120152: pg_show_all_settings() use-after-free discloses memory (CVSS v3.1: 4.3)
> CVE-2026-120153: Extension-script substitutions allow SQL injection through object names (CVSS v3.1: 7.2)
> CVE-2026-120154: INSERT ... ON CONFLICT can read rows despite row security policies (CVSS v3.1: 4.3)
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to 2025.02.x. Thanks

> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index ca0d350708..984f9b9a86 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v17.11/postgresql-17.11.tar.bz2.sha256
> -sha256  dd27f2b3c59e73ed14aa3324901242bf69a032a6347805f274e6260322d42979  postgresql-17.11.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v17.12/postgresql-17.12.tar.bz2.sha256
> +sha256  9cf136a703d8ee2f83465c43be4e9e8e7930c82b0bfba13be7e2537be769ac55  postgresql-17.12.tar.bz2
>  # License file, Locally calculated
>  sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index d7fad7c5a1..0d0b287ebf 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 17.11
> +POSTGRESQL_VERSION = 17.12
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
