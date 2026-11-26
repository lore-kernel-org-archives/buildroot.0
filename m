Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F75A606A326
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EX0ohBsG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2D3B4051D;
	Thu, 26 Nov 2026 16:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fB3LU2n9WMfi; Thu, 26 Nov 2026 16:12:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA34840592
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795709568;
	b=Vffq73chfH7bGoVJKCYHNNkmtU6S9nI0sPg6WyzMcWalffKPyqtLtVuBAgpXeUp5f2ZO
	 Pm3V9EYoQSFRX0Wt4FVBmDRcSVV5Ct24m4K1PaqtXvg6QGmstQcXplGSz04UkiTWgA2V3
	 1osS4okKM7QnEUIJixAX2QLvO6LiiawaovkHJETVBlBjhxyAKr3JoeNxEbH8OUK89d4xZ
	 d1CA84XPr41epXtP8BqDQQ+Ob5FUG40cdlTc5+QheOBtO8MUOd9bIdj15MWSeunoHbtVi
	 o0g3c+pMPpp3ymXa3Pyw5FWeRlukx4+IHlc0DZD7zGy+3fAzf8kFFrkVRCzzIcJigUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795709568;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=w28gwqvPpr1hX91quRewnQjR+2LgD22yqQjeZGSBuFE=;
	b=stB3RjntCPAHnhGJ4bz4sh3wNLv3lHFbYWG2J9enEe4jZDTuNAkF88BJmdCa3XGNdP+r
	 2+OgMDKWim31YYTjYZY76h1Z4EwUEj648PQpvED/o1CDDAHM2R39l5CXO/aZBTnFtTA0s
	 ypv3/KfOk6d+IdXKTtI4gw4fMJaASkdYUxcA4nlFM60esl/aHbQSWxR9X0h/0C6kpTQoA
	 cBDWZF86q9ZgtKTx1gLGTtUdf4RvzFDAQLz1qFOVhJUi5rvvfG/U+FZZqSsb3dLI3XV2k
	 YxfA/iJsZlt25edY3bly51+VhcC5xWztUpFcnDkJ4ASwz3oCP3ZQTkw1NWJackNrsHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795709568;
	bh=w28gwqvPpr1hX91quRewnQjR+2LgD22yqQjeZGSBuFE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EX0ohBsGchAgk/TuP5fPFnYQNiKknGZHTUv19Wx8l8V2WE5SkN8AHIYCIgDFmqC8D
	 6Aj2/HD4riHLhw33l4ssqGx2o8mS1/fvwkH8QxMiNHLmEYJUz1mnUHjHTdX3yyWc3o
	 7rXNy5j+REFyAREiCdegMUyA35eRxTA8qjlugpgpAyTP/p+28+sCcrwuBYP68V5+JH
	 n3XnGJcYV3YCCL7v6jyMOU6195aboM3OlaRn2JL7jLZz5WqcsyNUAsw3XnpQIOxxZN
	 5iy58iYWlWkzmK+BLYuHUZ2VuB7BIBYzvkwIJIpYRSR5JMcc9b7hqRVzZth0j5Yq4R
	 TVRom8TTSGbig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA34840592;
	Thu, 26 Nov 2026 16:12:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 549B122B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 16:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45DA240592
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 16:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoxPaks-eBJn for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 16:12:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BDC804051D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDC804051D
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 16:12:44 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795709562; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:G3Ectjnlj1haOGOveZCCmWqNhHRc
 NgkU0cx0Re5koKs6vlrzTNwwD9r9wlR6VKucTTMRCh811hF/fXx0sZAO2ouwjwAbeLw5aOnGQG6
 DxEXocfIUJCoEe0c1BkIcGjnnFix+c9WtpUHiS0cUjuW9CqnJlguFplDhZ1SccU3ntYoyXhr4V/
 nq4LvmDlLrUhQUoO3NnytNJVEtcLM9ybc1cj2Ywk4R4TxZ2Hwmc0w2MpAWrFoIqnQJ9h3s+9w8c
 FdHoowwRLN71+212Awjs6H4MFtJEtMt7v6qOhbCS5oiFsgj89UhWDafMzKrTHwJnE25RNAyr9e8
 IhxWnXeYGKnYmA==;
Message-Instance: m=1; h=sha256: Ruo/W//OVCMlYypSqEsz+Wr14FPlh6K5X7pMjFVxXxE=:
 98jdjEQ4lHFN47wO2Hex88dlO24iqstWCbzl4MB9/80=, sha512:
 y4mMacGQ3iqejMf+ByORqMjlh2U1GJt8DPr04HUBeiOy/9w33Ur14SY/B+A/gUWBTllnglzk/ay91TEV9OAjuQ==:
 SU8X2wx1YjhBajEsRZkcl6ThlrvAYv8k1BZZN2ItCjTp6CP+Vc911YgkcVmquUMzYlwWijL1UZGpFup6nSFzBg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHru-1yLonL48uw-0124sY; Thu, 26
 Nov 2026 17:12:42 +0100
Message-ID: <d5623df9-16aa-415c-a5a4-390c11572512@gmx.de>
Date: Thu, 26 Nov 2026 17:12:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 linux-amarula@amarulasolutions.com
References: <20261029164212.672884-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261029164212.672884-1-dario.binacchi@amarulasolutions.com>
X-Provags-ID: V03:K1:3I4gfHgoOzKEWhK3qMHZRftqTYvFKNbp5H0N9L6rXh+68OSC/7C
 n8vuT5Ss9Rm1geSaGGcHBzv0LY0TTbdQnf5cMPELHuBO5xWxpCi8VkeSyey2rsanU7QnDtN
 959t78EJtT+19ZcuTEv9iNE8C+pegVmUfVj9+kVInslxDFUPFRO36CSabimXuRYaM+vj2jb
 7SdOdtuDzdLYTqEjPO29Q==
UI-OutboundReport: notjunk:1;M01:P0:fYZ723EoXDM=;yffFoK9Fn1M4t1hNwIgQ/6J9KSr
 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
 5QQUZ0AAG3S4=
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: S10udevd: wait for udevd
 before triggering events
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 29.10.26 um 17:42 schrieb Dario Binacchi:
> start-stop-daemon starts udevd in the background and returns before
> udevd listens to kernel events. The coldplug events generated right
> after by "udevadm trigger" may then get lost, so that no module is
> loaded at boot:
> 
>    Starting network: Waiting for interface eth0 to appear............... timeout!
> 
> Wait until udevd answers on its control socket before triggering the
> events.

Not an issue I've seen, but yeah, that timing is random.

> Fixes: 41258a81948fddfa7fc8ac06b69d77fa051b744d ("package/eudev: refactor init script and rename it to S10udevd")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   package/eudev/S10udevd | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/eudev/S10udevd b/package/eudev/S10udevd
> index 8bb8f6eb3a01..6602e92c2c86 100644
> --- a/package/eudev/S10udevd
> +++ b/package/eudev/S10udevd
> @@ -35,6 +35,14 @@ start() {
>   	status=$?
>   	if [ "$status" -eq 0 ]; then
>   		echo "OK"
> +		# start-stop-daemon returns before udevd listens to kernel events:
> +		# wait for it, or the events triggered below may get lost
> +		i=0
> +		while ! udevadm control --start-exec-queue 2>/dev/null; do

What is the purpose of --start-exec-queue here? If you just want to be 
sure udevd is actually up and responding to control messages, wouldn't 
--ping be sufficient?

> +			i=$((i + 1))
> +			[ "$i" -ge 50 ] && break

Not critical because we don't usually run init scripts with "set -e", 
but doing

[ "$i" -lt 50 ] || break

instead would avoid a non-zero return code for this line.

> +			sleep 0.1
> +		done
>   	else
>   		echo "FAIL"
>   	fi

Not caused by the proposed change, but if starting udevd failed 
continuing to call udevadm trigger/settle doesn't really make sense. If 
you add a "return $status" in the FAIL branch the wait can be outside 
the if, which is more readable.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
