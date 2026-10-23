Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DE2606A31F
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 23:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rYJQqsVl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCF860A3D;
	Fri, 23 Oct 2026 23:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNAFxDib1LQD; Fri, 23 Oct 2026 23:54:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2957860A5A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792799677;
	b=NLWe24vqLXSAahTlzX0dGO7P9l5FZ3wcPeKI0G4SmvYp5FtjsR45pCwOncqMv6Vb9cXJ
	 tm8KB97/1c6i2quDW1e5BQPbW68r8DLUdnxemT7Z4FU3sAjo/Aj2L9JXjjnIMkPQ/+K4q
	 KNcwB1Z2dsp0rx2CY0+1wo0XjbTq9rGkVVVYkYDZOz4uEsqjO+tsrCPvkJLoYb1mL+Vml
	 LDqvHKmDqYAHlifMtHK1otN76fzX6LiW/HSP7bLUF4O/LRx6/xFuDL1JnEmDedmlvjcm4
	 SHRN8rKbT6i1NLdgmJEx2TUbfkE/eY5qJFQUZrskNTXzgY+flG8ea3Xtp8JA/7dUm6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792799677;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:Cc:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=L3Sr+nkRH722A7i1TvmBV21Cyuz+dpnDxWXC6D2QbZE=;
	b=cMQBKgAVk5nECpH41J+FyWvKPUWEW4uiOwVEMcnzhwmYrJOUZ2rp9tEPHOP/33kx3+MU
	 a5q9bMneuemRdF/XZCWWvhPqvuFDF+dVcgj7NRloml+6CvTpu1eYSbL0lkOf2+fxwRkIi
	 IBdq08ora0mImLk+76GHtx1ZrqswttO0+0xjHd0SzGX87O3x6MEri2p9Udqjkg6THcBSh
	 TiFPf3I9N4nmd+9syQsBbL6/KCZy6fpDfzKf6zifrSug07zJV1F9dmIY+T8cjMvKLUmng
	 zzY4aLLr51oGMZp3jrBgQk75svlJwWz/ivKqJrfEjZA3y+T2km7nUv8X07C9txLtYVw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792799677;
	bh=L3Sr+nkRH722A7i1TvmBV21Cyuz+dpnDxWXC6D2QbZE=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rYJQqsVl6maCvLPB8zHZuoMJG1gYEyMIGfhirJiTYhAil0eVAu7seAcOkkvjzZ9Zf
	 4+N1bdl1qAlWovGymiI+4lQZR7WlLzpdf7+MtKHaQR6u0Pd6rXMQAB6Ct8R3n9FaKq
	 zTgtV1yaGC8HC/MDINGUcCQRHM0Hq28/klGMAqG4NI9gvVOpaDbe21FxNNTXu9h3FK
	 9rhMwuBK7cAw0qaYd272gp5PgBb9SISVvMTfMlohA5b/zxMIpJ2YaL1162QrlHCho9
	 6335fDZcWdf1GJWQB/PLLVFVYwVSvyWGEZYT9QseDzPXLNNiMx8vV9ItFGL6E32WD6
	 FSZC63qKk3yQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2957860A5A;
	Fri, 23 Oct 2026 23:54:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E11B6371
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6A6760A5A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28SXhc-6Y88a for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 23:54:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1E73A60A3D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792799674;
 b=EeYTttzVbYiWfqiurAoV/ZmJC7IFURosSRuaEB79W1MhSrxDlxydiZbDWBCUMQ5x2xx6
 9UI0HEb09XMo2gXXpyGI3a9/f0D5dhvp+qTph4VAi/j+8J5uBtSjIJ8HhV18Kua/k96lz
 mvuhSV9y3e6mId7HjIo6qirCthrDEUU2cDFqh3F1qFT7QTQD9LDe6KJr8aukT42yuHWSm
 QWkchmzZAnXKwuvJNaHpusHmuyHryWi81rdKcRLoPvZ3Ifd/IEQzigxFZbb/Zdg4bMplU
 piVKLmI/27ftpcOAUsV5kLihd5oF9eaF7Tf5o+1Y1lp8A2Z8ug7iR+Al2MNbyakM2XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792799674;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=uufFcJwyr59CJyPKLbC/cw7AQ73IxRWHWCfg+heQQPE=;
 b=F2Jq9w3GcN2ruO83Z9cItSgciI1ETfwlgy7ldefR/6ddErXp/O2gGO7aB+/j3OmB0QDB
 fpHoAOZ7o0sQWAK5HBjN09tf/iPDrN3ZOWeFieFNM+MfFpHuYVVMeH+TE3H1ETYTurtcT
 qxSCPrFdvrXmlnhS8upImsgQKpCHaMhe4aZ11qmCNKORS8iZUn4X620O6QeVZ1xZ1fOlm
 ALTAo8Y2jesp8+AMFcE1Q/oUJMz703KMhuy9QMeQ4o769r58IF9+P6o4JGWZrN//ZdaEM
 c9nbR98YNXc//IBsThUf1oJqReG6EQOdAhz8b4SOsX1BETsisO8X5fD21E5JgBAkpUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jOBIR8Np; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E73A60A3D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:54:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHG8m-1xOkfG0Hzc-003xNo; Sat, 24
 Oct 2026 01:54:30 +0200
Message-ID: <74d91b36-1f40-462e-a03e-bdcb12955583@gmx.de>
Date: Sat, 24 Oct 2026 01:54:29 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261023181818.920329-8-james.hilliard1@gmail.com>
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
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261023181818.920329-8-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:fCENxWLIzRPdHsO5w4d960b1g3pQgwvQR0l+Ciim83kW0NyhDlO
 nuN+VNRzgR1INliMJ2MJaNP9oJNwofrExKQX1tXgutpaaH1krksOcgVlT4hG3dEMP0JXdId
 awqEVuJ3UPx1rGhwj3GjIXbzyqF2WOOl2RZZ+dzZebWE3dp0xktLcxLZMd2MLFxyGaySshV
 975vTL5E4nt8JfvhaA/zg==
UI-OutboundReport: notjunk:1;M01:P0:HjN1WN1Ngts=;4KwPtq0vChg68cDw6oHJwi+YfBW
 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
 IpuNjWsHSAiM=
Subject: Re: [Buildroot] [PATCH] package/python-certifi: bump to version
 2026.10.23
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

Am 23.10.26 um 20:17 schrieb James Hilliard:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thank you. This should've been marked as a security 
patch because it removes two more eMudhra CAs. I've fixed that and also 
rewrote the commit message to describe the rather odd upstream release 
history.

Best regards,
Fiona

> ---
>   package/python-certifi/python-certifi.hash | 4 ++--
>   package/python-certifi/python-certifi.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index a583c17bae..96b977a4e4 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
> -sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
> +md5  9380cf82be7f2a74885ca68665b4b12b  certifi-2026.10.23.tar.gz
> +sha256  a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd  certifi-2026.10.23.tar.gz
>   # Locally computed sha256 checksums
>   sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index bdfb8ed12a..38fa5c8f22 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CERTIFI_VERSION = 2026.10.19
> +PYTHON_CERTIFI_VERSION = 2026.10.23
>   PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/fd/11/b524cbd9bbdaca58608e4cf4053fd463417549e1959fa8d3aa18319f9555
>   PYTHON_CERTIFI_SETUP_TYPE = setuptools
>   PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>   PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
