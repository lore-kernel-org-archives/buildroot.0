Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE70606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Cagyxtxi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B0A80E0C;
	Sun,  1 Nov 2026 15:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQzpXN1LSt1K; Sun,  1 Nov 2026 15:06:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9320B80E07
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793545581;
	b=Ak13V4C2t51f+el8VSRRe5fssl+/E22Jz2vg+BHUSawAQVbiQ3DMzLqGfYiyIwSXiwhc
	 UK/nUXIuluC83wPeHT7ZtB5CoQW+N/1XzkatWJGMtZn5czSv7vsXjAHZW2m+VVKyIATj9
	 qeYPCwlfpiEDEs9skvqC25QdxNrkz7onLSp2rUedRKz/G/eSN/42PRCGV3pMwZzX27QlD
	 /gK/dz/gsnGEEPpsl+S+uZwmqWS4D8aXN3P6phUftnnt31BPAh11hwJTzE2J/yoTbEU1E
	 eI78Wq8SAUfLMQegBXHtRUEHazKdrOA+e84P/K/NVoqM/PSt1omUJ5HvIoo6kM2bbVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793545581;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=sqOEE1AwYjUHlzMTR0qup4oex9tSJI4hftlQ8w2qDAc=;
	b=qaUFf00gUvbDWqdXpqRNQziFTWf1giHjJ81rjYWzTJ7w9imPHWwjWCAXiC2uRin4RvGA
	 wP0cknTgIlToC+TNxFBTSzwNLDPOGwHyT8r9AEcfyTWudxtYh+s8lh5EEe1hONtBs3voi
	 SgnV5jA28u4r8r6ABjdkrW3LVJh84/9bPqbFgGvz/YVPt1fOgzuLbDvGjSdlq3NhkKuwP
	 XcEH3If+AcyttDG83pc58q0SDtTUYO9k/fBqewkSbpu0EBjRF9mH7xsC/TZrvi41JfpxZ
	 /04UPnNiPxbCESrMt7szc+jc127yfjYjYZ3TrD2SOUic0/6/IEo2QCggokp09QaBbwQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793545581;
	bh=sqOEE1AwYjUHlzMTR0qup4oex9tSJI4hftlQ8w2qDAc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cagyxtxi4xP1pQ4jgU9WEUw1+y9HJ3IOtatvG9NHmwrhTFip3mxHyzt/ehqanp8Th
	 TiHXq6nSbyTH7yv79X7BhSz6v4c7BivwgzFOh2Xb3HF/cpttSEifItcMf7w+hWFCDH
	 p+DRlHvsGI+Fk8ZXhQe2YueLpVwyu6y3tFAnpfT094rcOcR/xuRWWcXSbfiQU2y5mW
	 NMCt1T88fuAt7opz6TJ/WVT+XjpUNRSmciSu4pcYev6WfC8K7gLFgcnDiR2HbivNWj
	 JQYFNIuh1M0kL1DTGBszGPQDEd8wWdwHKj6UKv1nZ09l39oSrFrBZ619fhWAtZmYX1
	 x419jGpyPP+Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9320B80E07;
	Sun,  1 Nov 2026 15:06:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB890380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C04F480E07
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4i8xednr4Yaw for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:06:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C563980E01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793545579;
 b=NLEnVMPslVcSRRdwp3myHH8nOy03gvjfqTYF0uOzLpCeqVGazV849bmNpaELextVr5B7
 fBr8gYCRq+wJftNjeJ300MQq+epgyTdm5LShyGkuGlYqPsMK5abOYBuXpN7aOf8iEEmfZ
 so6CyOOW6M3Xo5TCaJd7uE3ob/P/dudGnfZioBmQlxQLn/SrHd6I3TqQrYfH/XyD48pC7
 W06SQXl0IOcQQ8uxYWw+VTLZtqIGjpOzdcqXTEzLUdLkzzfwLXcp0EMud8DEacRo87cVp
 +iJRLXHfYLotE8feGtuN8lTylGHA6mxhnxAF1AD8DJaUzj/Yxwa2Hkaz3uiN0YE8//A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793545579;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=rMBWqMO/kuREKc8/3OV3FEkQiSeCd2LKkTQpXiXH4jU=;
 b=NjRzbJPwcJ5iAzfNlREOq7wvv+Qu32U/nJ1usE/DkgSUNproW7WTcbvu3FAouxeYsScG
 Pz1fcODjiJ9A32WxbNqSB+lciV86xNIRuw/EFnnDPl5bL7aGbvM0Z/YaojOGDwd/W0Flg
 3cArti4/ojfL9ScSJagg7zCmKToFPnHoDbNWY5ipxPGOfnvQN+qjf3JfSUX+AWAigWO87
 coodyU9fymQx/zp/HEba3ZiQfJhWjVyF+y5t4bgkgKw3fbKU1xaUXcrDXSxKoy5AZNR7C
 tCShKcNIeG1bPKy2W1z1p1dKoJutYjJzCb8EXQKVRXJhf+51wDpZ7U0etTNYzbZt+Tw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ka0DubbE; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C563980E01
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:06:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D458360134;
 Sun,  1 Nov 2026 16:06:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 16:06:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 16:06:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20261031201918.2850153-5-james.hilliard1@gmail.com>
References: <20261031201918.2850153-5-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <da517037c81fb77dfb8136809e76cffa@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-platformdirs: security bump
 to version 4.14.2
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 21:19, James Hilliard wrote:
> Fix unsafe Unix runtime-directory selection and multipath 
> site-directory
> injection:
> https://github.com/tox-dev/platformdirs/security/advisories/GHSA-2gh9-8m4r-2xwh
> https://github.com/tox-dev/platformdirs/security/advisories/GHSA-jmm4-8x35-q6fq
> https://github.com/tox-dev/platformdirs/security/advisories/GHSA-9w45-w2cj-r5hx
> https://github.com/tox-dev/platformdirs/security/advisories/GHSA-5pjc-393q-rwmf
> 
> Add the host-python-hatch-fancy-pypi-readme build dependency for
> both the target and host variants.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
