Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4E606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 05:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JDwSayo3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F5D60838;
	Tue, 17 Nov 2026 05:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDAqlYXeLO6H; Tue, 17 Nov 2026 05:58:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0E3D6082A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794895084;
	b=FCpvMJDQ1ZFlxNRRgVSLAOH9/L43lZ6P3pA6qYGDg5a7Dk6jjuLo/OeyUb1Qnz5HuG3K
	 I9Lz324sjeRrZeTQSJJW3eiUPGcxZ4Fb8CJidJ3nQCgGOWOsdP2kq6Glrfs4Q0io3ORdi
	 B8OEe47Qrj5zZH/2fohQHvPXpY/V1q04rVt4zs9+aaXPb6h8qJLAJ4FoB8vyiLkT2iUDo
	 pW6m40KpDpYVFWUn7ktREdvzbcw5bSKo2HNIItDDaIUHObtnFUNZC9j3JZYCpFHIhGEZH
	 9/T5Z75fZL8sfmBrG0wTBIG3vDTg5N4M43kjDeohn5GM/LYsVAuPFQ3JSyf1c4DC4MA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794895084;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Mailru-Src:X-7564579A:
	 X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras:X-Mailru-Src:X-7564579A:X-77F55803:X-7FA49CB5:
	 X-87b9d050:X-D57D3AED:X-Mailru-MI:X-Mras:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=ldgh2C0vmlaSeWlBBn6PZwxQY23sEke6c729Vglf+XQ=;
	b=I4LplV31HZKzMhEscoxF3QlBB6pglJOTJqGAYUaFMg7ybBHmnTR3A5gGzRIUTLQGEsyS
	 P7k2Wcj0IxmcxMBEWfu66/IhWMgAsTvXKYq7hWWawpUrdI0aLYRAcgj4iT6dA9aY76asu
	 I/fdYRyZ3/TxbMotkhqmeuGuT/zOOVwb3M+kbgC+3uZF7LEGF6Edrz27qx53RHYOZE+Gy
	 7mpdjbcwnCWxsP7FNHXwkCZWPVjXxDKwpuogGfVavKWo2bXczrR0b+8DyAI6OtY0m5xXc
	 sqd1PK/cduCXF73esfIooPfo/mYh8zph0LXiCQbqAKaQS2A6qHbXI8+sJbZj9tZb/1Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794895084;
	bh=ldgh2C0vmlaSeWlBBn6PZwxQY23sEke6c729Vglf+XQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JDwSayo3T5JRCqyJp6YEWyAzIvlF/h5ZIhUMbakgHgmOk/gOQcdXWC45sy0b7Xv/X
	 3z8x6PLmTiP9VnTUjmYEkWRevxzaNw6GCFvUQ4HOmBnPbKelrcOf7icaI4013xwznI
	 lM1u6/RpDkbBycMZgT/W+5ydH9zKznvlwRdnSGXDyQty7UilneEYfmscviFSTOfD5P
	 yY9nsFIhR1Mcse243GLmM91D5rtU6C+fYP2X+Rq+felkqF/Q3FaE4p3/3shuSypCtO
	 VBjJbNvGIDP5PX3VYoM2uZmhTYU15RJd3s4uvFvPPCCqUI3F793tpWhdqKByt5gFEi
	 iM2lHpJIS+RrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E3D6082A;
	Tue, 17 Nov 2026 05:58:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8250A0E
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 05:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A90FC81005
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 05:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Say-Og25bKIr for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 05:58:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4B7CB80FFF
X-Greylist: delayed 928 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Nov 2026 05:58:00 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.241;
 helo=send146.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send146.i.mail.ru (send146.i.mail.ru [89.221.237.241])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B7CB80FFF
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 05:57:59 +0000 (UTC)
Received: from [10.113.186.125] (port=40278 helo=send127.i.mail.ru)
 by exim-fallback-598bbf9c5f-dznmf with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1xTBxs-000000008sN-2gFW
 for buildroot@buildroot.org; Tue, 17 Nov 2026 08:42:44 +0300
Received: by exim-smtp-canary-30-775d6dcd67-fxwrf with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1xTBxX-00000000GPV-3AK7; Tue, 17 Nov 2026 08:42:28 +0300
Message-ID: <d626b118-81be-4479-815a-b8623a58649a@inbox.ru>
Date: Tue, 17 Nov 2026 08:42:22 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20261116143131.967376-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20261116143131.967376-1-thomas.perale@mind.be>
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F934A8CA1FA66AEEE957C24005F09838FA182A05F53808504069F1AD28881B863B3DE06ABAFEAF670532F080263BA77955BD79BE4D28CB5DDE5D748730268862CC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70043D879A87EF1BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375660E512E38EA290F4F6B55D5B51BF085F90291D9695F050071A268DB7ECDA0823D8EEF46B7454FC60B9742502CCDD46D0D1D471462564A2E19F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0F04B652EEC242312D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6300D3B61E77C8D3B089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A52E12428FBFEF3E4F5002B1117B3ED696D10D1618E2BF6E8FC66B2B37046EC955823CB91A9FED034534781492E4B8EEAD17AEC49845D0B908
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65976D0B6C0E750DFF83856B3F13FFA6D4FC6356E8BA493D30CBD05EB9263A3510E366C640E1FCF69ACB8341EE9D5BE9A0AD25B164D12EAF9D268F8789B0607817B0028CE83434FDF116536EB022892E5344C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWBJ0OX8yjqTmAP+qXqN/L60=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B3135CC8E268B5DB07AA8646B879C1AA702748C84F3C134CE0E190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B48F971C29D06D6C0B63F371A87C510BCD73230397E01E985B049FFFDB7839CE9EA5A8AFC1688272340208C24107EF965C233498734F11566D35C11B662E25AB79F7712EBD1454BB8D
X-7FA49CB5: 0D63561A33F958A598EA56D5753730D95002B1117B3ED696C1166EFD2FBF98C5BB5A64B5EE0D2EE302ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpLaIlvAR6h4id02YH9mgeCTAyYoNlVO8ax/MHrXmaNx+Osv3GQm4AiU=
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

16.11.2026 17:31, Thomas Perale wrote:
> See the release note:
>   - https://www.postgresql.org/about/news/postgresql-187-1712-1616-1520-1425-and-19-rc-2-released-3442/
>   - https://www.postgresql.org/docs/release/17.12/
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

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
