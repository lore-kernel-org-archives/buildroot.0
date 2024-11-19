Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ABBD6C299
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72FDA42F0C;
	Tue, 19 Nov 2024 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcD5bOVzysUx; Tue, 19 Nov 2024 21:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B72942F0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B72942F0D;
	Tue, 19 Nov 2024 21:09:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88DF6DB3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A40680C82
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NK6rRyladIHF for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 21:09:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60B3B80C78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60B3B80C78
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60B3B80C78
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:09:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 303E4B00573;
 Tue, 19 Nov 2024 22:09:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58700])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Nov 2024 22:09:44 +0100
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 22:09:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <ZzwjtKDhz+TLUe8O@yd-6wlzhs3>
References: <20241118232420.3166108-1-ju.o@free.fr>
 <ZzwjtKDhz+TLUe8O@yd-6wlzhs3>
User-Agent: Webmail Free/1.6.9
Message-ID: <13239546e8dcfc69b1bd5a3e68e3cc8a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732050586;
 bh=XyfSHToF9xYfppQaPHcKquAgPaD/nAengULZrBESt3o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ejZVZct8/sPqbOtvaHf+XvfIEtuFps7yzMt0jbV5xomjOtqE4m4ts8ymLysWVvX8E
 +VUa7SImCqkgyACgQJN9cExXZPyc2Fh/+pEPqogBXjuSENR5C3pr0HytnC7Vvtw6Qp
 uFq4rqhUJviAjNZ8plHxY7RsYb/uGtyuVOGEYPHp+EYwyYUkl9xDzKL6/rcJNT85gV
 ZV4GmoCYVMBJ1ZRLZ3qgFz4UV3S0ROi5RBKRBTbA0FZ59MibwgsvBqAghlAYiRgp+4
 QVceKtxOMq1G+uPQgMDOTtx39eVtSqte+h1S11VnW/LU445JcBGrV4kB3GMw60uBFw
 o3V5/yvzKvN9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ejZVZct8
Subject: Re: [Buildroot] [PATCH 1/1] package/skopeo: select
 BR2_PACKAGE_HOST_GO
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 19/11/2024 06:35, yann.morin@orange.com wrote:
> Julien, All,
> 
> On 2024-11-19 00:24 +0100, Julien Olivain spake thusly:
>> host-skopeo fail to build, using the commands:
>> 
>>     echo BR2_PACKAGE_HOST_SKOPEO=y >.config
>>     make olddefconfig
>>     make host-skopeo
>> 
>> This commit fixes the issue by selecting BR2_PACKAGE_HOST_GO
>> in the Config.in file.
>> 
>> Fixes:
>> 
>>     make: *** No rule to make target 'host-', needed by 
>> '/buildroot/output/build/host-go-1.23.2/.stamp_configured'.  Stop.
> 
> For host-skopeo, that indeed fixes the issue, but there is still the
> case that prompt-less host package written in go are still broken in 
> the
> same way.
> 
> I have already sent a related patch to fix that issue:
>     
> https://patchwork.ozlabs.org/project/buildroot/patch/cf517426f7868af6c3e80e5016ac23759bf75290.1726556733.git.yann.morin@orange.com/
> 
> Of course, I did not notice the issue your patch is fixing, because I
> had that patch of mine above already applied, sorry for the mess...

Thanks for the clarification, I'll have a look to this other fix.

>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> This select was missing in my initila host-skopeo submission,m because
> it was made before 7b2a164b7460 (package/go/go-bin: new host-go
> provider) was applied, when it was not needed to select the host-go
> package.
> 
> Reviewed-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks for the review!

> Regards,
> Yann E. MORIN.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
