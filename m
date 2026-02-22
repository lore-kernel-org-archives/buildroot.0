Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE190C6369F
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 13:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B51C82470;
	Sun, 22 Feb 2026 13:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09T6B1s0dmIP; Sun, 22 Feb 2026 13:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8734082D75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771768063;
	bh=QkeL+/SyF0aDKqUYhAI1RWL5m414p8jI4QaImqHMUf4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TEHPJAxSDD9vaqQyNnYKgqVgVl16+8A2oBPNlyrKa8Orv33Bgkw6L/z4Y99qf4Hiw
	 p+iKWKigiNALAswkY0yO5DIMs40nRtC1hoZp3FsmgNOZh15JG3kImmT6vvRVqjbRJl
	 S4Cd4+KS7bJCBh6G6F5pUHsCXjt+are8gmobTQnd3hbS3roXCI3pKfWCcgURc3F18f
	 fdwISZO8nVx2dLQnFfq6RXNoYktGVDkMVDXElvNPP5DZCzs+zmw6v2bXcxn/AsTKNc
	 67pdDciGvKEp59urfdmZ7L18+8UWs5q3/7IMTPfVGszCf7LAdYlStMZ5voxlPh+1O4
	 NxtM9487iEmNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8734082D75;
	Sun, 22 Feb 2026 13:47:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AC001CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 13:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302B6401D0
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 13:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lOpsez07cvs for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 13:47:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.14;
 helo=send175.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F13174002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F13174002D
Received: from send175.i.mail.ru (send175.i.mail.ru [95.163.59.14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F13174002D
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 13:47:38 +0000 (UTC)
Received: by exim-smtp-64fd7cf497-cts56 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vu9o6-00000000Imx-1NPA; Sun, 22 Feb 2026 16:47:34 +0300
Message-ID: <f02d7d01-8ca5-425e-8622-58c5918a07c2@inbox.ru>
Date: Sun, 22 Feb 2026 16:47:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20260222102635.117276-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260222102635.117276-1-thomas.perale@mind.be>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9A6EFB945BF0DEAB20C57477E9E50D0CC2E0C2AAF4DEBC0CB182A05F5380850405EEE003F5588C1FC3DE06ABAFEAF67051CFD935B473586470E82FBAF0A4C89DC63644CC1B0E3E507
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DB84ED444C624799EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB5533756661FFF5F607F4A272E8FC82BCA0D6946EC4F94B94965D8743EF7DA0EF845532A78EEF46B7454FC60B9742502CCDD46D0DED96AA85C75E140D117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC07CB022245CAE856389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC84B6F6234D9065C97F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE33AC447995A7AD182BEBFE083D3B9BA73A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7354E672349037D5FA5C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A569E5E339DFEAB8405002B1117B3ED696916DF14A4E824744B48B7A7F94616420823CB91A9FED034534781492E4B8EEAD2739D626790C8313BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659308F9777ACEBCAD49F0A58BF2383AA7DE105C1E043A69666FF79E88A035930D3FE188DC9FB58A144B8341EE9D5BE9A0AE59DBFA3CAAD64ECD87D95E30C7256EDC9A01DD7DF93A3826536EB022892E5344C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVReXxXgcs1IGt/i23qFOypE=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD24C74A255D55DF8A8DF91BCF87FCFC1F4EF3C48074E7B755E90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=WqRtutPPQbxGQFn6MZvBfoYFJMUysAw/en0rmEIk8k8=; t=1771768060; x=1771858060; 
 b=WgMen7pYZ8vufawLzIkl1YWOOV3PDX9cOnIGkigHYvR2q3yDEdCEmML1sL9eixqHF92bd3HEPiJ
 7ZbIxlkiM7cmjdjZGdbSkD+/b4YtlKocpRUQL4/kI+AxRa5XjgkPexJ3uSZzLvjrx8uHeuFMIcb+/
 d1/u8up3i71wXIb/4HmExUsqQN6fb+8UHO9PVfcuVuMQV+QdCX4FSxpfMLe+jcjSPjr7iiqPhYYfh
 SKIHarqfenb7D4JctUbs5fjBvlUCu1wGbTk35NZwG5kdQEpdNIjZbIPL+YoEe5NrI2VFuuuHNrvMl
 Z8hCLbEjSZ7GXBXkN1TqvXr7ksTtjXEDpVnw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=WgMen7pY
X-Mailman-Original-Authentication-Results: exim-smtp-64fd7cf497-cts56;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/postgresql: security bump to v17.8
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

22.02.2026 13:26, Thomas Perale wrote:
> For more information about the release, see:
>    - https://www.postgresql.org/docs/17/release-17-8.html
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-2003:
>      Improper validation of type "oidvector" in PostgreSQL allows a
>      database user to disclose a few bytes of server memory.  We have not
>      ruled out viability of attacks that arrange for presence of
>      confidential information in disclosed bytes, but they seem unlikely.
>      Versions before PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are
>      affected.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2026-2003
> 
> - CVE-2026-2004:
>      Missing validation of type of input in PostgreSQL intarray extension
>      selectivity estimator function allows an object creator to execute
>      arbitrary code as the operating system user running the database.
>      Versions before PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are
>      affected.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2026-2004
> 
> - CVE-2026-2005:
>      Heap buffer overflow in PostgreSQL pgcrypto allows a ciphertext
>      provider to execute arbitrary code as the operating system user
>      running the database.  Versions before PostgreSQL 18.2, 17.8, 16.12,
>      15.16, and 14.21 are affected.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2026-2005
> 
> - CVE-2026-2006:
>      Missing validation of multibyte character length in PostgreSQL text
>      manipulation allows a database user to issue crafted queries that
>      achieve a buffer overrun.  That suffices to execute arbitrary code as
>      the operating system user running the database.  Versions before
>      PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are affected.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2026-2006
> 
> COPYRIGHT year updated in [1].
> 
> [1] https://github.com/postgres/postgres/commit/625e4495bf58733f1dac24e363b12e6f95d7e92d
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
