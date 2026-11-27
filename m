Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464C9606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 21:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XFObstSn;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=Ymu10XvP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A0640ABA;
	Fri, 27 Nov 2026 21:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7po-FrpRx7W; Fri, 27 Nov 2026 21:47:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 09EA040AC6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795816062;
	b=lSs8byoB4V0ueV9UoPI5gjQXwB9T9gHqGL9bg9tlqVdA1LbRhL7ZytjRV7TkSNcRMzpa
	 0M2DqmIfuIIugyqBavPult+YdNsgvIpdsZXGWAmpik6V+M6pPugoTeit/2fDuMV1rkm9b
	 VI4xAFZAaS3BYJRWJZpcDjNcdOOaUh9MSGWYwBtFv/xzHhwsZLzf1JX0F+BaWumi2VWwB
	 PN/+w3vzXe5hsqgqpCT1YwA6N4QONfTWTPfUpBrQyGr2nRb2Uzho2kPJBZF4QcUI5Bk/M
	 AFWb8ddO1WViYYBnLWFwdCVShEMr1ya57HNw4DMmSwmqN17DVTyBH919h/XyibD7V9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795816062;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=W0T11POHsx6v42oYRcRj0J2qLxakbcNRGX3Pfja0nLA=;
	b=fV9AE0WZk5xUgJS/mf1kSGr/y82KXPq3RFlXBewgEBIIgRQ28nijjN9Ff8jcGkLg0R1U
	 adPOYyeeKPFtc407QShazT535cZaBzvkUms0UZlnBLYG/AGGeMNvm7f6mwYkRsbHhazy7
	 9ZnH8wnaioKc/o/jnUDa4YY43AqA8uFkvDECFRXkNBvmZwfSA/awUHPLyDaPcm/HmSShN
	 lLkiymJuC3F045IHWrAqPUXL2uF7mG1sxVQIDcSZxqqFSZhD8nocvEb8PyGLpD1IE0p8t
	 5MhwSA1qnsvQbNJ99VMTWnMs4D1HNn/ePD3dnF/nWerW2GLRmkqG9fgudlnJIxcZ7fQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795816062;
	bh=W0T11POHsx6v42oYRcRj0J2qLxakbcNRGX3Pfja0nLA=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XFObstSnK4QervogoL/NmueP00TzBqRFkPEJZXR0Vzf8buEO6u3S0Vru8OCdfNKxe
	 shkXlNn4jA23rQ4pqOvFNRiLad8m1Zc0SNoMr2VCluRCVAcnl0Gnjt6pieyQl/Eqor
	 ttf4gTMS5OoSngIhQ4b0V+8WTWNKmS7dPq/XISspD38AEW/xy4/SJK0TrDSSyLa0GL
	 EPDm52DwofTyadfjjOXPR/cijwGEmAfQSGJ5q/5DkML7PL3JwpTfDXCjQPcUoqjYox
	 6xgksI1I6By8QyX7NVUlopgTh2XKAifTS3yaRpW4iRIWDyz3FYSlz3jZosXAMuMXaC
	 fTgi/J69XOurg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09EA040AC6;
	Fri, 27 Nov 2026 21:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19123472
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 21:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AB33812E5
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 21:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzdDm_yk6YTu for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 21:47:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D2F3C8128F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2F3C8128F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795816055; bh=d/IMpVFxrb08NPIxLtSl+4DGFmB+COBfanMSkckhpmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ymu10XvPGf6oUuv4lLlXW7pHcQjViffapq5iVmk/VwxwM66mJ68MUJ5EQ+UVUZDVG
 3RG/wpboYOwGbWY1jVBR7Hk/wtjwDuv96KGjZosP0OePvtJp9n/4OBH/3L/0CTSYYG
 84zA8+W4Wd1U/pBbIvfqxly4ihulKzhnDY/U7XKSgqMfrNhUfeMbTV7HFNBAataWOD
 EzFhVbnX19LqifpvI5GqPczYfxK/xksTDDB0kHxnH6qPSUUbWiMX/WwhDhilokfxcH
 XYCnS2LsI1KQvG43XTipmGZuOCVYstW3d9aUrTVTxIItFfM1v9HVBtRpZNgwTzVNEZ
 zIuQebHL/rUdA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DA36231E0AEB; Fri, 27 Nov 2026 22:47:34 +0100 (CET)
Date: Fri, 27 Nov 2026 22:47:34 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <awn6dlhtAbfX8QZu@waldemar-brodkorb.de>
References: <20261125114750.611805-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261125114750.611805-1-yegorslists@googlemail.com>
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/chawan: fix build with uClibc-ng
 without fenv.h
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yegor,
Yegor Yefremov wrote,

> The bundled QuickJS includes <fenv.h>, which uClibc-ng only provides
> with UCLIBC_HAS_FENV. Buildroot enables it for hard-float targets only,
> so the build fails with soft-float uClibc-ng toolchains:
> 
>   lib/quickjs/quickjs.c:33:10: fatal error: fenv.h: No such file or directory
> 
> Nothing in quickjs.c uses fenv.h, so add a patch dropping the include.
> 
> This issue has been present since commit 9ec34dc363d7 ("package/chawan:
> new package"), as chawan 0.4.4 already included fenv.h in its bundled
> QuickJS. It therefore affects 2026.11-rc1 and later; no maintenance
> branch is affected.
> 
> Fixes:
> https://autobuild.buildroot.org/results/2d0823849c690c6471249c066f20b9dc8460f25b

They fixed it:
https://git.sr.ht/~bptato/chawan/commit/ddd38c78285fdf87f4dfce693c5f8d0952071394

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
