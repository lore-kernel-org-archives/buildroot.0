Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D75606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A1241939;
	Wed, 21 Oct 2026 18:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzjZD5wP9dgY; Wed, 21 Oct 2026 18:46:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 219ED42DA9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608342;
	b=jnMr9H6v+kR5q6f4wukNpuXbN+vjfCy7RBgDnKjq9MyKMttTjdFYob7wdxrmXaqmBseD
	 W3Q9s6UkEkBMQY7HIHy4CGiR59mNgcuuNCIT/HTzZIHi+PhkvMMgz9GXvY373uZuhp+g3
	 NaNrhYx0BebLsr0ZAwb+RMUuBdBnchOnaZ1CYlGET97w2LdK68kwk0WTenHw5yIp1BUzY
	 stYdvNkSbT3yN046tkUl0GJuaLE+EUoxvlQ9MLv4gX1Yw64N8OR4hfJ6MZF/LpkmhrarG
	 gQIU1RQ3ORSpZJ+nZx78UDsm06/ADPfFk2SWUqx7kP6dQsTLGzicJgbxFfGupDev25w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608342;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:Mime-Version:
	 User-Agent:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l8Rn0o48Sz2r6oF4S1LVzlI01i10WlXFDFqycMRoRDc=;
	b=VTxW3qa8R84OcoKH0ncGLxcBUDnSGRalVHTjRSvrwqPfOYCZEzuq+2upCRSmLf5A2+cT
	 zdAEgjMVVjCD9n83tI3CUIFOCb0BljsMkx5GZYpWuW1UhFQTxdqRKVkhs7xqN1yuZk1UV
	 YOpi8fdblorcEzKMETJRWsLg3+V8HOl6B5/5FR47VTS9m16AA6mYrFm3aiYrZm1ivT1nk
	 2ZDeGYjVEcsWyPoA6flDsrCFruk6Ekq7VVmUymnktP9yJGUiW9vBb3QW+odJvfcZaQcff
	 dIt3xk3yQCy9QJO0KTTRFS0fjaXtHkJbvXZUNhCyvUh2PtSISV0ndvu8P95z2NePxGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608342;
	bh=l8Rn0o48Sz2r6oF4S1LVzlI01i10WlXFDFqycMRoRDc=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SBJMMKvmTauopG8vRENk0tI3QAxYpkxERkA9mmBwfM16IiMSHuS0y4bK17KCEwwYE
	 fs49fPY1o5KWHJ7x2BV26D8GIbrwixKZyt3YWDVCVDc0LsQlqg6F6O+ZDfefhi43gG
	 BketQAaQH3a/FuMtACFvL8QGcSRm8R4cBe+9Nslkl37hlqaknydtL8khWUEHnzNwGD
	 7JQ6LGJ3yto1eTWtss7thrVA4qqDfBdHaN6etz6iB9qUcaHAEX5fJHWUzIkG5AILDk
	 LNMCFIEpdxKo8qDhcRX3+djMmN+wcjxBQMnCNaiAef/BCLLsbe5cEhpqCD165vh7Tv
	 jkD5DqFKYYg2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 219ED42DA9;
	Wed, 21 Oct 2026 18:45:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F48295C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16C4583148
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7eE6RUF8MGM for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:45:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 11CF083118
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=116.202.254.214
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608310;
 b=T0aNibKiVSdTrL7Z21ukq64sJ6aBQE+Ww7GjK6HHEQEs3eq4oy/9ywPOejl5t+5IuBTg
 Y/sqBhsEcNG27SNXUZ0cXnqant6pS5EM9HzmV7jhI8ODrC4DXFtx/4GV2AWTNTvOH4hJz
 XKwa8lHyy/REpYw3ocEh2/h2po/K5BbTVJPpyeK9ntruf5wTe6sPccofgUlgFSeJ4tOay
 kWaMDyQiA8dpy7npsKyTzvRryahOw68tiwYfBy44N232WUSef+OPl9QD8JYMnrJqWlSSa
 t+WK4SWLpzT8AZMphhe+/w5CBPiuyw3F4LCCaEIxSsM8vdLwh/Lj7dDTMJJhiVFeaaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608310;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:Mime-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent;
 bh=xi4+a6lhEOFxxrY+1LlpverIGR/qZzFipl6smJ2F+TU=;
 b=bfFREFMNcU1TqIhoQdMP9q86F++9Z45e0V3zq+tGf8jGTa+6zLhndti/LQVawX2xXYfG
 A4zF4L3FDpfXfIgnKFe2Mvj5R0gbyqIlzRAj3+wezqXgpjCAa4kiHf4Ukv7zKXC24kmVX
 +Bj1jDOPa2StiWJ+hW49mtRieENjOE8QVc7XowkE2M2d72CwzYd3Sqn1Fr5Te3wGDvEJC
 r0vpZmpr36EJh5qGue0zsw/1PVZg0iNyUt21TgaccWrF0q3qanZsn+NrJbDE0yWnaMEFv
 NuwSvoh4y6ISvo9zeZrI0bdYVPdH4PBSKN7/T7jekz36lnjHvBbCmJ+KitXMBR4ELMQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=fail header.from=kuhls.net;
 arc=none smtp.remote-ip=116.202.254.214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11CF083118
 for <buildroot@uclibc.org>; Wed, 21 Oct 2026 18:45:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1xJbJD-0004c6-Cz
 for buildroot@uclibc.org; Wed, 21 Oct 2026 20:45:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 21 Oct 2026 20:44:40 +0200
Message-ID: <pan$6936a$687fd6e$84951d2$e03b7210@ID-313208.user.individual.net>
References: <20260408085531.1641831-1-bernd@kuhls.net>
 <atflnDYRbmMr3lGV__17721.7428617709$1792533999$gmane$org@windsurf>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH 1/1] package/libplacebo: bump version to
 7.360.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Wed, 21 Oct 2026 00:06:00 +0200 schrieb Thomas Petazzoni via buildroot:

> I am not 100% sure it is due to this bump, but there are build failures
> of placebo:
> 
>   https://autobuild.buildroot.net/?reason=libplacebo%

Hi Thomas,

the build error only occurs when xxhash was built before libplacebo, these 
patches address/fix the problem:
https://patchwork.buildroot.org/project/buildroot/list/?series=1382

And I saw you just fixed the .pc problem already:
https://patchwork.buildroot.org/project/buildroot/patch/
20261021183533.2649298-1-thomas.petazzoni@bootlin.com/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
