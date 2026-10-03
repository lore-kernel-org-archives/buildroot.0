Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90388CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BE4260ECB;
	Sat,  3 Oct 2026 10:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_pV_LFNDHWa; Sat,  3 Oct 2026 10:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2486F60664
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022113;
	b=j/X+V8vab0E9zp8UKc4szpvDNPOXPtNN4gs6V2eOi5aAiWRHeNEVZl3zVaH58cJLALP3
	 Qw+yy1nSZfPoHre4s8cxc9diYy8JvOkKb89RmfmKrYz7IIO9R/BwR51GU4ojc4h1UHn6X
	 gSUoP3tLcQLhbeA7/uItHb199vCWnrc8ItGqWvLne5nqGubXxThw7SAsY4ktrLq+q/5eD
	 4gcah8OCAuV0coBO4OVGq6kjbCKu3Geud6H0fG5D+ybEEGtkaig+QDRWS32GQtaiW4iQY
	 2pmdNAwO4ZX88moVyT7dycTGXWcxE98tJ1y7kaj0C00jazLrxiP/Mbw9mt6qgtAissA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vgze0R8kYkcKzRBiFfI3r8iQZ3k4+WzpkdcJoJoGvMQ=;
	b=tarnOsK85qmB2N48Ejpm4vGyGVN9MiNC+RDAuB6y8H/IbFJHf8/csCCBfxvyAfOlqCyJ
	 h/H9UjAtQH38QuJgtTLaXkSkh4SjjPaSxEmCCBPc3iV7S1qhbn3Q89DMpiRzzwWKIBvDP
	 APffiV9lP3hu59fuxp5M9eoKOAf+OnrIT91QsJ5/V52muEQ+ScBsN0xZxfVSOR307B1vd
	 RatYotGY7S3oviIOJJ4i+gzbLVu9Rj3JLDPFxR+BAeQDrq4SfmJNE9MncFoNDDWj+1Vgp
	 t/zmz3dMWASuRi/6yGBLySt0nUB/MKKh3zImycyXt4y6wQOvjNFEd3fnidqodGXL7+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022113;
	bh=Vgze0R8kYkcKzRBiFfI3r8iQZ3k4+WzpkdcJoJoGvMQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L9XZGFIKFf57zQKQAfz4cwJMRiiy9DrFUDKQaXTDbd3Xz9cCyLLYYah5R6QZ7hJwK
	 bv+/APDcnjJg+5gvfK0xGa3oH4q/D95tEXVVpAozuKE2EXJ/SFL6p66TBFskMAOw4S
	 Mk2ADMDc7Kv+DQ5vAYo/d084BrVXVIBJo1+Mx5gor/5+meUqxkaxdEQQg4l13g6ITQ
	 pzOBvxMGxlSvskJ94kkfqKc2qgBBqBvmgaAzrI826FXPEdBR5ITsVCKlYRJVo1O/No
	 sYNoqVUDbsGk/5L/54cDj4KKJbTfAVJY7ithXWaG9Oov8Up6ZFPzH9LyYT+hDLF39G
	 IlyPsPu2wQCBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2486F60664;
	Sat,  3 Oct 2026 10:08:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17694335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1F79400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PJ-ry6iW5dw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E82B44007C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022111;
 b=FZoCIDX9PtiJScobY5bbQAcntKllD5HWZAuOHVBP5JYaTeXJ3MDY6gKV7eZJjRLm+JJi
 4axxwZ/pACMjwUEWTO4JLpPJH0eXK/aUQ9ro7eCYYvppif58ZTYyF4L7f7fyGdQqPRPvI
 7e2eVZGcX2rzZiFmYK46LICy5DM+EITnPjjxpc105E+0Hs1u16yv7HDEilnGStVMGp8dj
 6UfOpQvNe5Yj/lB3Zpszu6P0WFPF7HyKcSrlp4YJ5kT9KFVTTsdxWodI1gfRValnFHpKa
 YJtaT3RslWWjw02jckyFMZhiYh7uWurvcgbpwtWDC3T3bhUZHQGuUMxgmYquWGuK9wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022111;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=MuHg9JqyYOQ8FsUq67AmGiPHjY93QWWswQELi167/gw=;
 b=Yuz1DdAx+4gpegByx8IsNT2SZq68hxfSvCd3Zs+LU+sSxrPykDuwPuu9QM8e+0HOa+x9
 dFb4Yzed47okANyhqlHZcvLDYbh9ne1vSLGFLh4BylEnWx6Agmty9Vr3TwvuC+eJtBABX
 JXvxSEQyJ8Q+rFTW2uSKHFcNl5HismiLdPrVSf2lF55/Bnm8eetyFulf29ZFT1OwtRRF7
 7JdMon92yw0J9cPhwvnXD5Sh2wvg44FCnOJ3NsBFU8ZEwrDavZP3NdZixzBKQPKiLu9jl
 0Ad627XsX1cHz8HMyXai99VaulBzltBysbk6jVt6jq7908yHH5Phzt8qeBHfiQ0tZfw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BolBl+QE; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E82B44007C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7BC484E4112C;
 Sat,  3 Oct 2026 10:08:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 50595604FF;
 Sat,  3 Oct 2026 10:08:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7387D103281F4; 
 Sat,  3 Oct 2026 12:08:27 +0200 (CEST)
Date: Sat, 3 Oct 2026 12:08:26 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asDUFkR8Iu5gBsk3@windsurf>
References: <20261003084453.545653-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.20.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 02:43:46AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/sqlalchemy/alembic/commit/9400ec85a13a9330509e67445b939d79662cc6cb
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
