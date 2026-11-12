Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E857606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OJye+BoP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C45981702;
	Thu, 12 Nov 2026 20:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gg8xMaKlsh5H; Thu, 12 Nov 2026 20:14:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 28C08816FD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794514480;
	b=dfuz0Img/5nhPJKXPXpAtyxoZGuQAXmHg6k/Lda4hPAy824zSdRI7FVdR9+3OlKGes9W
	 sRJAB7E8glyfzCOzduadYd9v5FYoq1QXcKpjd5+sdsSt1993xdx2nBAUB+l5pPjUoN8XU
	 HyxsYIo3FCAjLjOPoOg5a96KJ+y5R/HNb9J7jh9+Dt7YnYp0o8CRACLEqzK3cKrnvVptq
	 brUKMLiwSusllYP8OZlMHGs/joLo1TW6kxXRs8VcD0lWOKOjNsKP2mUY+nKG3u3cQ8Mmf
	 nUH3tLly0Ns4lUPsxVg4k4lMej0/kbc0FzspbrtXr34rQxi37DVUkKs2kncl0LYfQfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794514480;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=g6slERQQBw6VfOoqFgCEQoSnHnkCb+i1ruShcx8Kp2U=;
	b=MkhoHqi8plHCOR+HM0P580XFeXA8rNKTbvdObeun29EFGLRLKceWRD4hQ34fF06qjV/U
	 HUaiocyNGjfCVIxmmPfeZUwyZnbiccc8eWT+n4wUnvfSWR58V2wBadtdq/6d/SAvFF03h
	 NNUTM7dbw+ZUVQaJgs0NIdvroANNUV4yso5hnz/5GAJfFdn1uK6bsnbmjhzMPWGhZqDNV
	 gCJ9n8U+A+z7mZ8Z5IgZpEbG2ZZIVD/zy2LHSgBI8+AZaBeOTQrLNXLVYhv6qvERc4jv3
	 6dbuElCtotQnSHTvjzQjL0BXzsKnhDqQzH1VnKoVe6piJkwoOdh6QJd7N+wj9r2ff1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794514480;
	bh=g6slERQQBw6VfOoqFgCEQoSnHnkCb+i1ruShcx8Kp2U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OJye+BoPhllEcUh3i+ANK2YvfUpkqcQjL8G49l5WrKpOP9hEpIF+z09fI0Oh9vCrM
	 JbkRGfG30eSbESkNlv2BQ8gnO+wyOGjTIyGKOVgEC28ElAlkXCj58wY8YGmgxqIQmg
	 CTKW3mdC/apBa7bAtCl7SfBda3iKorwb6wHOuh1b3Q5Bq+XvTpLqH4g6XD5YQbdO90
	 62/INvybBzEKlmnUXU8VDjmMw7pEMfJ95tSxif7fOZL5b+dC+DjLcCPtmiGoUcwiN2
	 EePN1ohKjmgxv4n/pyzrQSvXTvWhd+GwCJbwh1HxJ5OIVcbM4Y0qD/fMoWkIeZYUlN
	 rhlUGEGOICRmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C08816FD;
	Thu, 12 Nov 2026 20:14:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3A64F46
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94EF74009B
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTVKgujLpluj for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 20:14:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A783140082
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A783140082
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:14:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A3E1B5FFB1;
 Thu, 12 Nov 2026 21:14:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Thu, 12 Nov 2026 21:14:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 21:14:31 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20261112191526.102111-1-bernd@kuhls.net>
References: <20261112191526.102111-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <c690f4f04885ba350e31542144284f8b@free.fr>
X-Sender: ju.o@free.fr
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 20:15, Bernd Kuhls wrote:
> https://www.postgresql.org/about/news/postgresql-187-1712-1616-1520-1425-and-19-rc-2-released-3442/
> 
> Fixes the following CVEs
> 
> CVE-2026-6460: Type confusion after ALTER ... SET DATA TYPE executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-6467: Extension script schema mishandling executes arbitrary 
> SQL (CVSS v3.1: 7.2)
> CVE-2026-14661: dblink and subscriptions can append to arbitrary files 
> (CVSS v3.1: 8.1)
> CVE-2026-16237: INSERT ... ON CONFLICT can read or modify rows despite 
> auto-updatable view WHERE condition (CVSS v3.1: 5.4)
> CVE-2026-16240: pg_basebackup can use backup manifest content as a 
> format string (CVSS v3.1: 3.7)
> CVE-2026-18447: Output parameter type confusion executes arbitrary code 
> (CVSS v3.1: 8.8)
> CVE-2026-116303: Foreign key and JSON conversions bypass EXECUTE 
> privilege on cast functions (CVSS v3.1: 3.1)
> CVE-2026-116304: Parallel RECORD typmod use-after-free executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116306: Composite-type change during field assignment executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116307: plperl prepared-query use-after-free executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116308: dict_int reads beyond zero-length tokens (CVSS v3.1: 
> 4.3)
> CVE-2026-116309: plperl blessed-reference type confusion may execute 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116310: COPY error context uses freed field storage (CVSS 
> v3.1: 4.3)
> CVE-2026-116311: DROP OWNED can remove restrictive row security 
> policies from non-owned tables (CVSS v3.1: 5.4)
> CVE-2026-116312: MERGE can place the wrong row in a trigger transition 
> table (CVSS v3.1: 5.4)
> CVE-2026-116313: vacuumdb --missing-stats-only lets a database owner 
> execute code as the vacuumdb user (CVSS v3.1: 7.2)
> CVE-2026-116314: pg_restore executes arbitrary code due to missing 
> non-plain archive validation (CVSS v3.1: 8.8)
> CVE-2026-116315: tsvector_delete() heap buffer overflow executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116316: Security-restricted operations can create types in 
> pg_temp, which later queries of the session find (CVSS v3.1: 8.8)
> CVE-2026-116317: ts_rank_cd() heap buffer overflow may execute 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116318: pg_dump not-null constraint name allows SQL injection 
> (CVSS v3.1: 8.8)
> CVE-2026-116319: plperl reentrant return_next() use-after-free executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116320: plperl array and hash conversion use-after-free 
> executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116321: Unterminated name value discloses server memory (CVSS 
> v3.1: 4.3)
> CVE-2026-116322: Pre-authentication cancel request can leak a spinlock 
> (CVSS v3.1: 5.3)
> CVE-2026-116323: pltcl reentrant result conversion use-after-free 
> executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116325: reindexdb index name quoting allows SQL injection 
> (CVSS v3.1: 8)
> CVE-2026-116326: plperl tied-object exceptions follow stale sigjmp_buf 
> (CVSS v3.1: 8.8)
> CVE-2026-116327: security_barrier analysis can expose hidden values 
> through indirect expressions (CVSS v3.1: 4.3)
> CVE-2026-116328: Generation memory context integer wraparound executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116329: Statistics import type confusion executes arbitrary 
> code (CVSS v3.1: 8.8)
> CVE-2026-116330: pg_dump tar restore.sql fails to block psql command 
> injection (CVSS v3.1: 8.8)
> CVE-2026-116331: Min/max aggregate type confusion executes arbitrary 
> code (CVSS v3.1: 8.8)
> CVE-2026-116332: Portal setup use-after-free executes arbitrary code 
> (CVSS v3.1: 8.8)
> CVE-2026-116333: Parallel B-tree array scan reads beyond array bounds 
> (CVSS v3.1: 6.5)
> CVE-2026-116335: Commutator or negator result-type confusion executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-116336: REINDEX CONCURRENTLY does not block DROP INDEX during 
> index functions (CVSS v3.1: 8.8)
> CVE-2026-120139: Tuple-size integer wraparound executes arbitrary code 
> (CVSS v3.1: 8.8)
> CVE-2026-120141: Materialized set-returning function type confusion 
> executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120142: Dropped-column type confusion executes arbitrary code 
> (CVSS v3.1: 8.8)
> CVE-2026-120143: Transition-table cursor use-after-free executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120144: Type-cache invalidation gap executes arbitrary code 
> (CVSS v3.1: 8.8)
> CVE-2026-120145: Logical replication can write to subscriber system 
> catalogs, executing arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120146: REASSIGN OWNED bypasses role SET and CREATEDB checks 
> (CVSS v3.1: 4.3)
> CVE-2026-120147: dblink reentrant disconnect use-after-free executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120148: Extended-statistics pseudo-type confusion executes 
> arbitrary code (CVSS v3.1: 8.1)
> CVE-2026-120149: FDW batch-insert mismatch executes arbitrary code 
> (CVSS v3.1: 8.8)
> CVE-2026-120150: Expanded-record domain-check use-after-free executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-120151: plpgsql record-field type confusion executes arbitrary 
> code (CVSS v3.1: 8.8)
> CVE-2026-120152: pg_show_all_settings() use-after-free discloses memory 
> (CVSS v3.1: 4.3)
> CVE-2026-120153: Extension-script substitutions allow SQL injection 
> through object names (CVSS v3.1: 7.2)
> CVE-2026-120154: INSERT ... ON CONFLICT can read rows despite row 
> security policies (CVSS v3.1: 4.3)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
