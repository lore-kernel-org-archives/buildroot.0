Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E2606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LzyUR4zj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 264224067D;
	Mon, 23 Nov 2026 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7QsQmabwUe1; Mon, 23 Nov 2026 09:17:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5386840675
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795425426;
	b=IlnYdRDeRIyqDPUqxrKvXr8gbTefmacpsqiiIXAHa8MScaVx1TCwKy5yRqENRxs3hOcI
	 eyVgpUGIXoXIC8NYFSC9FwtAojGPuJHgSHsxW4QnusTw2LIqyQJNH3bP5L0o0XnixWohg
	 QTVoCsfRSf7hZt6QXAT96k6ePgDYOGy3KR6mI3FkbWqV8Fa+Cwc83WR78zyXToYqNeCdf
	 xTK/ERX+aROkRwE0PvhK1FhFYP7WrTeOAZrm+MUey5MlhBrJVxQfSFEKXvoWAno8SMhbC
	 7P05tYCHrU6+fwS7PFa1VxvSzm7ql2m3S6VqmJHlGyZ5YGpoMMEFaIS84N8G/1kBDgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795425426;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=p21q55L/FERzzxFhoLCFdroRPpW8nox/iWu4LOmp63A=;
	b=d5FykSApkCH3MnVPyw1MjPWs81wCiaIeV22S17e1LgQ9uYLSbDS1OI4h7ZzgSQ0HbRX6
	 LjlsxzCU6kZNPla1JZuTQaXSbMTm0RmkPfovZJyA/n0JuAqw8rjkJf4VJBPTn0FEfUDzK
	 tWh8nRXkZc41CtH03XPuPWcgTidTKQZ8yOisvoP9ADul717wDprUSwOSes6AcjGicS7tg
	 tt/0eyL51pyLy+7IAFM+d3+Uaf6TUlhxqiNh4eK8ILUffaCsBH3Sw1QD1A8bJMxHo2fNY
	 cWnh+glHhV28B4z1vot5+9e1yJf9Nhqt9D9YWyl4WSMyqYwFHKWbvP7ZCoxtOEJg30Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795425426;
	bh=p21q55L/FERzzxFhoLCFdroRPpW8nox/iWu4LOmp63A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LzyUR4zjwdisMznm9i2X/HmePR448qQGS4mRwrtdwsqQxPwUxhif6cH2/Bs+cjqMr
	 rNbdohkLskvTeFUjRS/4LlBOPEPUbk24v4hIDi+jT/qa8ID9n9E5l5A/x7bIbXQUk1
	 56dV81r96nfNOfrEGiw+roDHAnzkjQkKMoEJDbyCl6clZp8dEqLIpVKFJPngwJPpQD
	 wFhKLIZMqNt9nFHc7Cxg1xp0OJcmkqW/Jd9uXFUxsTncPUpQsCAbpGUA2YJUrKgbfn
	 Mn0mW1baHQcqTXhTs6REg2ojCkAoH0OKl91lceyOE81ljvFvuSYesefGqllOoQSppP
	 HXClPvnfCTDlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5386840675;
	Mon, 23 Nov 2026 09:17:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DEB1260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F97E606F5
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvGk-XcLrj_a for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:17:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95586606B0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95586606B0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:17:03 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795425421; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:EIt03LbjRprbMgAbAuX5pd4puZgk
 o6hUinQHo8opdSyIYRXBfSepw6Ce6tgg1Ir7UV9FBXa4vnMLuuDirgVH+LhxIqpxIShclZA18e8
 wtZaG9m62MOXcyk/xgBvGetG48m/QXzW7FuH0tOJaymlzCzohdC28eeCRvvERkeMr+lP4MuUFQC
 ThltGSBr8lZfS08E68t21SJrcb2ELD3qiGXvyESzd0eH3p01DicTpRAnsx4zeDmOWOKjnY+3ZGS
 NOnKOfEZtkcASXQJAFpj4ZaPj75AYuLK3eq3cLlt9WIGtsomUCVhTAUfg99hGZ2GLQFaojkmAat
 p61XdvBk5KVn9A==;
Message-Instance: m=1; h=sha256: Ka1xICL+UmqolKWso/J6rXlZGoWQGdwAJAFt9hOzdF8=:
 YOIGmbN9BQtEjSUEsOFBOTpu/pz+NCWg1Ax520QsPBI=, sha512:
 5yL1r9VZXDsvgDOLJibipm5NNy35D1RV1rUAaZyg2zSOy03M/h2RNhclG280KaTbPiGuro3I2puLTII4+Nf5hg==:
 5WwujeUTezZaR8JCEIIAwGDXussUKTM2WqTgWML0g6aObDt8vcXUXFp+9SJuZgWO1dhmYPTZCf9HDtzuiqF2wg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1xzmu316E2-00U1Tx; Mon, 23
 Nov 2026 10:17:01 +0100
Message-ID: <7b66a85d-bc5a-47ec-9c55-b805b3c38c45@gmx.de>
Date: Mon, 23 Nov 2026 10:17:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
References: <20261121165114.964464-1-fiona.klute@gmx.de>
 <871p8dqkea.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <871p8dqkea.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:pJBON8F02z7yLIB9lVnZkx/1Rc/PO1OZ2kJoYNenEeKmsYTsWEg
 ukbdn73zEn/OG0a3ZaNbvYw7eshTBdmiWrIsOhFHCQXoG8QcYY1TALTEVZPKIlCE9nsBtbg
 ajz67cwU/x9iZBbF3UirtTuYG92jSVpsU0TfA7piIcCEwOIkAKG3P1Ok8dzMV0e+VgqsKTE
 dBf60lLp6IaVoWswgW4+w==
UI-OutboundReport: notjunk:1;M01:P0:LNcjIVqLtZg=;+UkD7VklO8XHk985iQGg3L0SsVw
 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
 DE+IxFWX0xXn++SKMg==
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix documentation
 URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 22.11.26 um 10:34 schrieb Peter Korsgaard:
>>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:
> 
>   > The official documentation domain is docs.u-boot-project.org, see
>   > upstream commit 7c419d4b578492e9781d4d7e755809c78c2c3661 "global:
>   > Update URL for U-Boot project" [1].
> 
>   > [1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/7c419d4b578492e9781d4d7e755809c78c2c3661
> 
>   > Fixes: 5ada3a14425e5c5b8ecf120924b7014f80fa9ef1 "package/uboot-tools: fix download URL"
> 
>   > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
>   > ---
>   > There was some quarrel over u-boot.org, but I can't find details
>   > publicly. There is a disclaimer on https://u-boot.org/ that it is
>   > *not* the official domain, though.
> 
> I used the URL we had in the boot/uboot/Config.in help text, so I have
> updated it there as well and committed, thanks.
Thanks, I hadn't thought to double-check there.

I did a grep for "u-boot.org" through the tree and found 3 more URLs 
that need to be fixed, patches sent just now. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
