Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DA7CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65940615CE;
	Fri,  8 May 2026 10:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsP4usVJD5g6; Fri,  8 May 2026 10:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 109FA60EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778236724;
	bh=/7KPqnV/b+cGyKrj57g5GrQezK7CTre1MOGO/Rdus2g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L9GYZ8KVUP8P93BjeatmxlkFaA4AkhG/i69zNvY8F5ClKvzkhh0gtCzgwEeuvHN0c
	 +6CPyDUBiRbjapP+RTb6NMwMKzObUujR/JN3JHwjhJeb/hN8NncLA7EqxOil0voRNA
	 8F5H0K4DEQKbx1G5GtdzaRPXWYvLsUbhmI+WFuk1cq4b4Vo1rNYrdcZm8hEzQm1UTI
	 bxexTBh0isUj5NDO+0ZJAJgIOpPXPxmTLT86JvRWmw+9gfyNwRo5GnWykJiX/D61Sj
	 2HpPkg3FHSTCeFbgwg5BY+fggPhxE5Akh8mJwUTak8/W33j7YJs2OIiqZRydUcwZ8l
	 UJtsLeE2OU5HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 109FA60EC0;
	Fri,  8 May 2026 10:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B94AD317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B683A40A9E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Us3HIqLLrD0S for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:38:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F351440574
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F351440574
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F351440574
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:38:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CF88D78035E;
 Fri,  8 May 2026 12:38:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 May 2026 12:38:37 +0200
MIME-Version: 1.0
Date: Fri, 08 May 2026 12:38:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?C=C3=A9dric_Ch=C3=A9pied?=
 <cedric.chepied@gmail.com>
In-Reply-To: <20260508050318.13573-1-bernd@kuhls.net>
References: <20260508050318.13573-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <3cbf000624d819e0a3c86714d9a5ac7e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778236720;
 bh=XQiTBQ64lgwvoW4cAtXrEoag6dTlZdMt3pQWp2zYhdQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gkaBGBGGFlw+ud9YphNgaNRerwW2mBGZqc1vgrpJWEqyYzvRfsfQKcYFWLWvIRJoI
 DpAjDO19qsgcbluqQ3u+vzNl5tal3tJo3wgbGmkiCC9XFOz5sJbmLgKz00S78i921z
 SzQbLgKTlysPxZe88c1jZ2GHh7td/W16SaxwW1RCkYB3tQMCYtGM+RFxvR4e+7cNIk
 1V12ZzxrthW7zub8gKvAC14b3DoOdLReyn2wBVCtPHKWEsP6NP5pALAmsb6JbGvPYb
 Oi2oWQi8moXirWhXtP36W3pue3wZBV1HDV/+ZkdmM4KPobNhjkFN/6nAffYG6VXbmj
 JFASMZ5p2Og9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gkaBGBGG
Subject: Re: [Buildroot] [PATCH 1/1] package/znc: bump version to 1.10.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/05/2026 07:03, Bernd Kuhls wrote:
> https://github.com/znc/znc/blob/znc-1.10.2/ChangeLog.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
