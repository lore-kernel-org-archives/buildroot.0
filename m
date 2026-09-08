Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A71C79F99
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 19:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36ED440697;
	Tue,  8 Sep 2026 19:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRt3wKOi4CCg; Tue,  8 Sep 2026 19:03:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B86344068E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788894215;
	b=iRnJI1zS8nsLxBmSXFVFgbxvBlpKl87ENvPiDGNcxnVhS3QQCMx+XLAho7y/KDj4zR8V
	 JfPv6Y6YWA4qoVCoG1IWNxnaHNoFksabclircqp2BjpuL8AYOvL9Trax+2dwVXKK7AJQi
	 sHwD92LNUBZ4QBNG4Ba0IUBKkVPiwcgg63cun/mNuU7JXK/HV4g9neZTWJoN5/SoKxBWO
	 gyNGR2baDequ+UKfN/RSOfkdR4gVeMpSBZTQI6fL2SDwxjg5rrddxxaYM50S2Eb6uqQKn
	 fsSACpk5Plp4RiRFSoo/BROZAhnqcG2BI24udY0gpLMWvokXoQn6uvEfOA6zDopp8xw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788894215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2OqnVfqyC6Dr5KpZ67LBN+TLRD75DlfNmLsCHhYf1xM=;
	b=pSYJhUL2tEc2JWihfHXT37aPgOuR2/Kpcl7OW5uTUrBULKCOBvt3TNG8VlSqdPYU7r2D
	 S97mw0RgpjZVyP6pcLpCHvpaYkYjDlJLHsFzPZtdPi9uOrjFHSYw8YEE68FTD6KkbfLPo
	 VBgGTOogJcFZe2wnGIo806r88A2cbkK1PG/QzK3C2H36d1mDqxVK5zvKXwfMYs6+WOcE3
	 As4TH72IVop9/WbCH3e4qFMT9CO4OMazwmBFQbMJsBx4obI5YBJdV58oav73USfJOVfhv
	 CFUnTE+61NadgBVCt7I/vTJzf5t1dw4BGnfzpJ/TCRrM2dEentyPZcqjC3Q8FprUMdg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788894215;
	bh=2OqnVfqyC6Dr5KpZ67LBN+TLRD75DlfNmLsCHhYf1xM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EX7FHF3VNkB8uujFCofrXg9TGcRjmqqvUx1/X1+CxizXjVC6fqDgOnPdcJfBGrXv2
	 V/6vB2djiKJcTRPtMmuDqJOSDQEZzvV+vOL4p5tD28AQVfGPys/bEhPdnFWjeqFBih
	 BtKmU18yuM3rA7vdQrnAlLO/Pt3b9uTWqKuoz9mwATxEq7ye9oVPCxEVPkBERbDT/P
	 wZNHoXzDMnm+8EaMLmFZ36H+kdMy6DiqaeWn4xKiSokhLyaUFkhzzCurjy+7fImXpL
	 KMK7gXmRYvW80JgDCtUxAHfLGbuBxGgazFjeaTT5YXMKNqioxmQ7pnPksCg69QKPRv
	 Dx2Kn1X26XxaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B86344068E;
	Tue,  8 Sep 2026 19:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDF06268
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE1BD4068E
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ox8zUyv3vTfl for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 19:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 178D040583
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788894209;
 b=XkwicPs0XdQWuBObXB1e0AGFYeIWwmp9uPvDwLtS+JqWnScQqAZi3u6Md+Kra7avCeu0
 /xjm9wkYAQJZpk3Yyct9zG5yU7Mhi21XwXtey2rTGjGx/7tPqkKBqpwbxjeWAN52rB+Bt
 VUj49cqQYPfdjxE6RmYeAvDx5AMQ9koZff3WqcIkd5r4vtWXYp8sXzTC3pl0/gaEtsfS1
 y4C1gf+ZsJrZ9KOe8aCfNImPQYeeWxU7klftNhIe+6kTmY4L2Gw4+3TYaHHJEpmrntszK
 kb0a3F6kpwIOM5xO27QPwc2hDU7/1KZb/7xs8wFGl+IIjUkhAOjRwZ5IX6EFVjCPriA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788894209;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7X3VfDJvT7qc/kJWV1FBGQgX+blGIxuWGR1X5Zst5C8=;
 b=BlgkziKmKLYKAwiKl+MPi09UaXjPBI7igFxTO+OR8q//cLyK0ILcXCrRwYNLdcar97Rd
 17LIt7AzMGOc2c4o5Ty15HxPz6FA+wv/XO6cxRm7TgJSkN4F/Ewax1BohB+VquNt0XBwg
 DFNAgurFKQuEZwpDUzM58ijsZJVBK2Kj6OwJsOvOF4KIPqUqJ/6u094lVCsPITv3UIuLJ
 wF74W5ZYmSA96o7Ngs+Vd+nOK35AF3IbG0jYHO3D9ZYXlNFd1W9WXMA+Fbw6uT4X3EydP
 9HgvEw3tngP8L9iMlLilXnAN15GkzoPfEUZPbg1GRFaldfll/WxPyV7DliTk087PGQw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="Zw/xs2OJ"; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 178D040583
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:03:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5DDCF2003CC;
 Tue,  8 Sep 2026 21:03:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Sep 2026 21:03:19 +0200
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 21:03:19 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260908125457.211667-1-thomas.petazzoni@bootlin.com>
References: <20260908125457.211667-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <c78c97e29a00c77fba83bb137ec8df47@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] tooolchain/toolchain-external: update
 toolchain-external-bootlin to 2026.08
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

On 08/09/2026 14:54, Thomas Petazzoni via buildroot wrote:
> All toolchains have been rebuilt based on Buildroot 2026.08, which
> means:
> 
> * The bleeding-edge toolchains are based on gcc 16.2, binutils 2.46.1,
>   gdb 17.1, kernel headers 6.12, glibc 2.44, musl 1.2.6 or uclibc-ng
>   1.0.59.
> 
> * The stable toolchains are based on gcc 15.3, binutils 2.45.1, gdb
>   16.3, kernel headers 5.10, glibc 2.44, musl 1.2.6 or uclibc-ng 
> 1.0.59.
> 
> The runtime tests related to those toolchains all pass fine:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/2824569690
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
