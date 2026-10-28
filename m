Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D5D606A322
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 04:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bvpdH+5K;
	dkim=temperror header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=lukDiUYN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA7660658;
	Wed, 28 Oct 2026 04:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEaQdrkvCqtS; Wed, 28 Oct 2026 04:49:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 28512605E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793162940;
	b=RyeRUtsN5vAWsqLcOvKjCpSc7cKgmbOBcY3vD3zfpg1qXEfrpY5NugYqytocHxy6ImKf
	 PiG/ZfyVcCHiyB/0QvtV15bswHTqJtBE5c95m1YtSkuTSGlM0EkIlfn53a3oay3rgpMWa
	 +8jABsuK+PT46EFDB/clfllNKUi4kuiCwUqEg5v2TJDz4En677g7qTMo40ua89SuAkmwH
	 HhWAuIzb6kk36Mk4+oiidTA0jPDO8kYs6m8qNLD+p3JfShpyMEg35MKV2lHMyMtGJsJm+
	 uZYYg97lUgKFRRq11IXokpof4t4Z82PwboDfpdwJX1AnHVZz/elCKe9OMAerx6H3dTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793162940;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=HIVDmNmTe1AvGwe9Rq9N2bAebn9B0peSXB0Qox17cbQ=;
	b=Afx+ZCS4fRD8DzK5GrxWgNkJzVItmK73ADvbGDCFCfZDfHFMe3xIpEkKQTDNwsA4fbjd
	 9KoHvRDfA0yhdLQfsEUxclHi9vUrjVfk6u2lRc7WpyDcsqk37ee59L52biqnoy4M0z6r5
	 Nvo/M52XaQBveVFUMt5Rkas/BkT81agD5BV9oW0mdHHUTp3PBR6mpg+l7TfnkXhdXw6D+
	 Yg8kF93nmANyRyA2pH3bL1KneXTKCHQ1hyWGDPkJCBSGhRVwlaa6nvO9IKV12ohSxhep0
	 YpmiZdDn+lxqfJY1ujGXblVUtfA3jsd/ZkquvL9Oj9N3uO/yHpjDoufMKPSlFd9d9lQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793162940;
	bh=HIVDmNmTe1AvGwe9Rq9N2bAebn9B0peSXB0Qox17cbQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bvpdH+5KprX/wH/BRjfqmynMCfRLZLTULIGk0texGkWVmqRshJwVpdwNLxIpZDS+7
	 +MBmlLGo9Pvd10Zsl5VJmwvEnN/iuKywGBQIWTBfk1AKYHbaLtg+DOIW1UJLTFurw3
	 T79P92I4otupnFNBJgqoi5Gj+EaEXcWsHGLpowBpPChyMBwUzYlwd2PibfloeeC7/8
	 PPPexoRHtGBc19TrkzGZ/bo5k1hjJYnkHlzHY4YygtkzwsTiLAYbaKjuGatt/pMX1p
	 +wtBtHwpyqukbv+VmwZFZF6DCP+SZHsBtaB/LKaEglrI/xwOqRGSYi5tWMtALMheMT
	 tVJjDRnHOj1eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28512605E5;
	Wed, 28 Oct 2026 04:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1A3ED1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF373400F5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbmpCOz5zKSS for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 04:48:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E9EA54006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793162938;
 b=D0DNfiyVciW2cLsL1Lj7wCA1vQmV1x8lIUZXPC0hWNJto3y0DqhScUjav2DC9SX8GY/A
 psR8hB2WQbM+yfxb5rX46vqsnWy+qimuZif0p+rTi/AVxIv/kfuXI9LynN1xEXF11VaMv
 Hp2riQQddX4OIujvWRaZRBJS7WXL/W+1yHnBtmsYCspPu0HoFkILpHLuDEag0UTNZkaZx
 if8Cr1afpy+Mmbs9wLi8Lr/aMhuxrpQXi6q0UkrT72Nh1GhaVZ8WsI7xDP3iDM2zE0PhD
 u5ZqHGk5hUNYNrEr83MtKbsPIQaAduN3+OEE/dw5p/cqPadijOCI1oPPVHH93X7z2JA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793162938;
 h=Received-SPF:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=fJakCZpvFHhog33VdPd2lQat6W9L5qLY22DzyfeoaDo=;
 b=HA7pdoc6883i/7kTqCj3LArBS/2TlRGPQgJz1DDSujsNAXzguOMSK+dIxRyrPE5O0I+i
 545yh66MOtEZgVi7+cIQgFOc0LqgHm8gFnfF6DKbgvOcGznpiobmoTyrwmmGo/QVfiK/T
 RWoKi8ht3z6AuYqTnOAR1lrD7y97iGe+l1I/XTc0z+TSwJZ9u+0/fc6FfuaysxVWfQQfV
 GdXrC1X6ZwfRTtpzc2FxBYowS3NgLURsazx6igozmf1svdbcURocPKl9/TUt1mAolMlRT
 iS6NTFIv4fya/HHtk4xanAdyggFZa5GE/xS2Qold5K1PdVGNfRrkfTRFnckjTQ8pbAg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=umbiko.net;
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=lukDiUYN; 
 arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=lukDiUYN
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9EA54006F
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1793162931; bh=jFV93F9aW05CJuSCc/bsF4vlV4QbI8eTgqEB62+5BIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lukDiUYNuIJNEY8pFx950i1IIkgCE3XlAGDI/tt/tJQ2cY/FvNom1t71zfd5P+vPh
 38drRKiQp4gRoOygvY1TP7S9+0vcxEae89gKAo+1UE4idfWlr6mezg7KcUOKD+E2Bc
 acZrMxvYvbdLamFVfBVY8O/WcPL4zcL/73pClq+Q=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 7D87FBDE3226;
 Wed, 28 Oct 2026 05:48:51 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 04:48:51 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
In-Reply-To: <auBeTP2NwmLiaDGR@windsurf>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
 <45a821b584840d1cabe6df1dfe083fb8@umbiko.net> <auBeTP2NwmLiaDGR@windsurf>
Message-ID: <ec78e4b982b6b8b0a3ccc04fc9b70ca5@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-27 08:19, Thomas Petazzoni wrote:
> On Tue, Oct 27, 2026 at 04:54:45AM +0000, Andreas Ziegler wrote:
> 
>> Yes, there is still interest in this software, and I sadly mourn the 
>> absence
>> of the don't-delete-host-syslinux patch.
> 
> Not sure to understand this one. Could you clarify? Is Alexander's
> patch dropping some feature that exists today in boot/syslinux/ and
> that is important for you?

The v1 of this patch was a series, which contained one additional patch: 
https://patchwork.buildroot.org/project/buildroot/patch/20260830181907.106154-2-alexander.sverdlin@gmail.com/ 
. This unfortunately did not meet the upstream requirement. This change 
would make a messy (and dangerous) installation of syslinux on the build 
machine obsolete.

> In any case: thanks a lot for raising your interest in syslinux. If
> both of you could add yourself in DEVELOPERS for boot/syslinux/, it
> would be much appreciated.

Last time I did low-level C and assembler programming was during 
university, which is now more than 30 years in the past -- but if it 
helps keeping syslinux active, why not.

Kind regards,
Andreas

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
