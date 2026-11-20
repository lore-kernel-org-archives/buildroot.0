Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED005606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iR/fGc5l
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD4E560E3A;
	Fri, 20 Nov 2026 09:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m62_6v8TIYhu; Fri, 20 Nov 2026 09:59:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA5D760E3E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168795;
	b=YLN3x/7cSKbqyO6rDnHz22NOmR6HTrKO3hu+Vxac22I7OOz3nuT0MvK+UGXk3JpQv2s7
	 MTAK7lW/YYZJ9DTeyAA0VDwYvA1MYA/xlpB7FHB/0wU6QnDaXdOj9y17ms7ihBVpBhIPr
	 UM9N0/i760ERWN9AwncqJ1LhORAQbDh2gRw52yFAn9AJ07hNNGb1roxoq4didW9z2OgLM
	 VFVxrnzm7Ps3J9ZEpiz63FNKeIiqZgf2VBBFZ+14aI4XlWXfYjkYVTcSvV44arzcAeNp8
	 37K1fWlaPPQoggc8f3v75HZdrfWinsbYxjm38lnjrC2+reTyAKisCKArFEcooCCA7kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168795;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bWATB7EEulOU7jFjzUM8rL/iWTnd5b+/QKbpQPqUg5w=;
	b=q3vDp/U+uwg5pwSpMG9iTLiXqmCee6/k8iV8kLETC5TLtjdwcixylJLLcXJB2KEq1xCM
	 EWR9/X1KNz2EUtj/xC3RbPikLcL09V8rUNE/rjovAKMuqvs2dA5cbtE6XRhB8gCu5W8kl
	 KuPufxrVTdoZmTwHpcZLH4p0j6vnRQPitpDSNgrPgNdu7nSPqaIMssqO/ggyOjF8D8Ehm
	 HAJyIxG/HtqqvuccGXBohvMSgUu5qKCByrblLaXd6uMVhplHbf6esoHADXe3Ruiz76aWv
	 cK1uWCojNby4+NmrIZZQ/LAiXmu3Kh9ldsdwI2WvHWd0hscSBiC2/Pj04XqT7rDc/Zw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168795;
	bh=bWATB7EEulOU7jFjzUM8rL/iWTnd5b+/QKbpQPqUg5w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iR/fGc5l9bkrZ3blJ2Hl7PKg9IRAfHXFG6bCLiMwk03bR+swweOjVPtWwrPTX/9UY
	 yyjD+f1Rp2hrgoEPPgPXMPeIM0+qI8CkM7MLEhdbWN8uoVdva6BhP1cgvKHvDBdeFe
	 LEhuyCUHqtqM7mua2AxmrqtEV+PrsER01uyxM4BxldDec5tJSuU8yHMVqZ52w1yvP7
	 UYlMThY50ckrUYym+f53eTZqRT6VOGTh9U8X1OQ934x0mSAqYOicb09Rj+p1mhIr5F
	 A9Bl+ThekmaDuR2I2ZAjH14pTCfLfNRjZ2FoWNxEPkfhZLHYQGbyzIUxaemUiPHxcy
	 FBRYFoGGiIdYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA5D760E3E;
	Fri, 20 Nov 2026 09:59:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6949CE22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B3554020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j65go9njMTKo for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 00C954016D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00C954016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-490d59c3edaso430653f8f.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168789; x=1795773589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y3P+8zCs4tCg4h4tY1FyAhxm45ddSkpb8H9FRORg80c=;
 b=LnZJPY0LLPulAzXYKubJDYrKWY5KDinhhEsgibM7hnftkVzrNmorOKe1UCyIu8FnfK
 pzkKYg31P7aMMe9q0K45jvVTdY7sHJlEUHEznvXjVmeGY2nsb9INdDCtueB4vJ09E6xB
 W0MWROQN9jkdEGi04txd3ezdaB1sNiQobNKNW7xSxYX+mybcM896NVgKFXWVfE/ybzBX
 Vb++YBrF1YpA/0bFHEjzTb3Vp45PsQJ0f8R1P/V/0skl4AqKzfK91vk7ZwoOATfYUeLq
 8XeDz7wjWcaDPDp9hGx+RWNmOePSPCyqxfaOR0k77BOltjDNl70rqyRyJdU/6gSRmskV
 473Q==
X-Gm-Message-State: APuU4Z8Sixts+uIb1Gg1nDgGjb0bgRLYEx5HYDnZEqxXTxtNkR40QfY/
 MbGvG3FI3xpR39p8JXHllFCOg0AdaFcM+qgYnGWlson30QtyMOGXKUg7njWCQWFA4O3f3WJt6xL
 +vFIbceTVAg==
X-Gm-Gg: AZFdTZd/JOx6kaJvKtF7r5Ye564Gvd1l/dm96jzPymy/EW0MBDpP0R0D099abt1yVgD
 k6/s80axiAD4omyc3w74LtMeZiyfUcsKWViXaEB09XTd6hF2F8AhQ4ihk97mIbJDtrH6jjxwJI+
 tArPuqhHoB/7fPpWj+aIcUsTyL7hiOaIdCT2gbVw3xY80GynTBrg4sFCYPMjdxeA1D/2hsRbaEh
 64gu4F4JVpFAec+g808TdwMGnIgK1nKl38c4elKNLRHts2qN594I+zMTePg9xjSCflnVTiQKK97
 e2p54SVsVg505qfSPssn6wophRqIxyE/d4F38bfhazLbOCAl0lC7LnNvt6/04yApVjKoCctXBGC
 1oVCYR1mP55iFHBHSrdXBCFnlsrYTtnG1CH8/YME/If3csysFf3RJiICCHQSU7S/cXdIAdGORIB
 CEXRxvzHFz6IJpSJyyK0ZPaN5TMjXzLvR+BVcjtgeTTVaqXK7FBMqWJD+QSg2iXSQoq2rH6I/Fi
 sL9+vwWqn8VZKOyR/7CIXP7DHFftKHEe5yFkfwlvQRoF7d1oZkP3jdpe6K1slXnUTrjI2XaRHO+
 3dP3cbO4Ya/9jRkj1mDpFp2+ymZhLnZLv5v40Ffupadq
X-Received: by 2002:a05:6000:2903:b0:491:c392:1f31 with SMTP id
 ffacd0b85a97d-4aa5ab788d1mr9833458f8f.28.1795168789265; 
 Fri, 20 Nov 2026 01:59:49 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b10b5f6sm4256367f8f.34.2026.11.20.01.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:48 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:43 +0100
Message-ID: <20261120095948.540632-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112191526.102111-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 18.7
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://www.postgresql.org/about/news/postgresql-187-1712-1616-1520-1425-and-19-rc-2-released-3442/
> 
> Fixes the following CVEs
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/6d2523ed837dece47b9eb0a45cbc1d06b4490833
> 
> with the exception of an ICE for target
> bootlin-m68k-68040-uclibc/build/postgresql-18.7/.stamp_built:
> https://gitlab.com/bkuhls/buildroot/-/jobs/17975591859
> 
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index da6c37b519..ab03e344c7 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v18.6/postgresql-18.6.tar.bz2.sha256
> -sha256  555610c24d53e4316da5b7d3fc25c279d96856d5e0e23ee308c328c5fa881d9f  postgresql-18.6.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v18.7/postgresql-18.7.tar.bz2.sha256
> +sha256  441dfae4280cae3e0425e5f876f80559fb0731c140f1aae22b3e5a54d0411bfd  postgresql-18.7.tar.bz2
>  # License file, Locally calculated
>  sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index d852dc0e1e..772322afd7 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 18.6
> +POSTGRESQL_VERSION = 18.7
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
