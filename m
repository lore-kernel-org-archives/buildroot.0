Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A14606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OpqrVjHM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9808A60714;
	Mon, 19 Oct 2026 19:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33ASgVL_S-ao; Mon, 19 Oct 2026 19:43:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B304A606F2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792439009;
	b=VVtI64+OjiaTMzQk3ob3joo7dr9xwk3lvPgjtwowFPyfTaK8na1MxSvSH+QOHB315ZS8
	 kSrhPKHoH/xhproK8qQN8OiCBleqCnY9f00mOyWdyqoJ0UzvwKgYcTSIeyntL4Pu1QDHB
	 LbqiJp0JzwVKUW5zGoVuoq9o+SHIh/1ymilOPk4kXiwuGKcU6o4+y0zZhmPi7s8JhPeCf
	 QLY4R367HK/VsVXXqu8BrEffZLCZqCCEl9q0tc3U6/1apQ4ED8Yb7zjcdcnw25LUXJABH
	 X0Ac83u4UhevBPdT2KTLmepe6DwtmLuk3dg2UEjUwCd8YQjNffKWPHSEFIoy8wnI7Dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792439009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8JfXS5GlbqnW+KBOaDDN4iqfWQo6tNJKtAuk98TIDzI=;
	b=QN23HC3G39Jrp6HvmlIeiyZfXYtOMImhpAV5eVjuspm1eQfSLQL6QNCLZOt/xx0c6js6
	 pKlZ3Yf7Alcwi419nkLd2oJN73tjoTd/BE6e9q5Svlb2iLLdtZoVY7dH/i1ZZZt1LubX6
	 X/jZ7L1rG3QPCUelZwfpNuvtVNCAQ4Z5XST3rDWuMuyLLg0t4gH5Zj9yff20RzZnofhJE
	 87Pm0majFsFWl0RLV3IXdZ70xcPQZTvQyllI5Op00Cv6ClnFYqfQBAJtRSE0w3Vld1+xT
	 sTs72KpJgO63ZxLe7eoNte2uSazFr65qfhwnXgsgee+Dcm2dgv15E3WzIrInsPLGVHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792439009;
	bh=8JfXS5GlbqnW+KBOaDDN4iqfWQo6tNJKtAuk98TIDzI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OpqrVjHMy6OfUqYLqHAiCMzha44PF6/tD3E7Vao7gYH8hHyiaSJ+c35tVdVLIimIt
	 G0O7MbEOG9h+NS10q38/AvXk1e93V+XscMHn58ZhVx+D6YkEZ4aXQkxxGOLYyeTJ+U
	 H/9tCW2r15wsCS1XqN5O/YeXOMYF2mVxf5E+45gLG/SXNeYErN6J0Iap59tSom3n7d
	 UFN9jEkChMSo3ladJKpX0bulCLC3+ll+w8SH0b6qcLwp/ugqpAf9q+wPjp5+m/07aY
	 eOFWyh5vZqD07R2/P/U2mHd5bzUvKaH/BPDWsF3QmlaR+BmSBR2AFsZUAZ80LdPpQS
	 f3NPXakYNY4uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B304A606F2;
	Mon, 19 Oct 2026 19:43:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9A6212F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A80E6400B0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mI0-R-B-wn7 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:43:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D25404008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792439008;
 b=I04BjEpZktOOXDm6R81kxNLLmGFI73c62k1tmi+xsB/qk5hXtdtl6BFQ6MmRRaXDY32Y
 IyRZYB7wVbIp7Gsb6kmdBWW9PCqnUA88YVb61rQnGV9PKntUJ6XOdii9OnxrX6qvBOZnR
 NppKQo6PleUSkQiS3SngX650hic/pt/xbFhcUb0azwKeknIPLkTifMeG71U5ucT0VqaHl
 heeP7frsDr6nvoGbGyb5p836FlLUnJ2Z+IhEbIdMoTpEP9j3omsCXdUfPtHd7UXZJLPQl
 Idb7y6uX8MmELJaNeTAqnaXJ9fqGQ/TcBJ4GYpKTeX6wMRQ96Q//HJMWNImW/hhWLZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792439008;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=DI8aLRzoLXjGL1nelS6KHPB4EfNgSYD/BhyZHDBFXGA=;
 b=lmFIGDhyWGOy97HBO3Bn+6IEfRL73sUz2T3kUZkN/Tf3nXGZPQaTScQJUjeOc65Rn4js
 +T2iLzAs45Xk6o+ZZ3ICRqLV5cCXheyorEaPIYgSeOKe+fLlQajS4qWMZ13rY/g4dpIKH
 TRZi3zaw6kEIJAnOdF45vweIlVWPGQJFFtnTo0NM7hawdp04Ccw6zQ3uQ/uuJePSYukHt
 dqIqLtR3CuqVsQL1zDXEsC/VHE5wadCfFoPUx3+rTDTGS2+WIxXOwzok/joOsBGxmpnre
 ll3fxsqVl0u2707T8JVbg37GrvsJPG+ibYjL8rGEOYwbh+smkjba+2FaAX+9VzTXaBw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZrACGbwt; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D25404008C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:43:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0272719F59C;
 Mon, 19 Oct 2026 21:43:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 19 Oct 2026 21:43:23 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 21:43:23 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261019193044.900785-1-thomas.petazzoni@bootlin.com>
References: <20261019193044.900785-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <17fc1fc21204534acf5b9a6b3cdb7649@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] utils/genrandconfig: add missing newline
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/2026 21:30, Thomas Petazzoni via buildroot wrote:
> The line:
> 
>   configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
> 
> would fail with:
> 
> Traceback (most recent call last):
>   File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 
> 650, in <module>
>     ret = asyncio.run(gen_config(args))
>   File "/usr/lib64/python3.14/asyncio/runners.py", line 205, in run
>     return runner.run(main)
>            ~~~~~~~~~~^^^^^^
>   File "/usr/lib64/python3.14/asyncio/runners.py", line 128, in run
>     return self._loop.run_until_complete(task)
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^
>   File "/usr/lib64/python3.14/asyncio/base_events.py", line 720, in 
> run_until_complete
>     return future.result()
>            ~~~~~~~~~~~~~^^
>   File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 
> 556, in gen_config
>     if await fixup_config(sysinfo, configfile):
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 
> 255, in fixup_config
>     configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ValueError: list.remove(x): x not in list
> 
> because all configlines end with a newline, so this needs to be fixed
> to:
> 
>   configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')
> 
> Fixes: b07d21ab984d10cbabeb186fbd47d446e027c03b ("utils/genrandconfig: 
> handle BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
