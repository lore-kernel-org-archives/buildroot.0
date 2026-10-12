Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77995CA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 19:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29372404E8;
	Mon, 12 Oct 2026 19:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOP8scrCR-J2; Mon, 12 Oct 2026 19:19:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 17B74404E0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791832777;
	b=nAtb8CX8IQrU4QuDtSYCIE415V2fDLpVWav1JhzZehsKR+Z7OhkByU3gUFbYZRrBgv79
	 fRQt0Ta4vuNNxxEMrx9cKrgeNTsvTHcqucaZrXNm02nEIlPBzaMQD9aIGB6TInAuzIhEd
	 iumA6bVAAhIHnoMkTTSkb6SOFHWZHFbpphgDeDi1NhW84jY9T1ZUjY8p5EebYEXWzcw6S
	 Qy+NXZa+x+eTk25TUlpreq45KSe8R3NKWNxJNKLSY8QvxVj+ze3/Q33uszOGTVOF9y+Z2
	 nBGQo17IA+ZvWbs6NKLpv4DbUJ6PXMpLlVt9vVX5OF0X/CRXM7FaONaUjeMsJiOFK3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791832777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=JEkm3dPoLeseiwu63wDzqH8dNKsYqFug+OZnsSC/p40=;
	b=MC98vmF8IR5ccIvAlA9RVd83vDSoD3W54ZPj7Swtu+5o+9xq5LqL7cfeCFc7W+CyFq0i
	 us6hz4qCfktMoP3zEJO1MMyBKC7vF2hYANYikfS0ovCHGhNcVGhQ9Ws5P8TRyrHkvd+w5
	 jM60e//Zs8ShzpplLryZDY6lBOof7f1mZGn7uq0uVg9nAfDhJDFs1qGWEI2HfQx0C+cSO
	 w9vugygk9W2wORNfMihEoqOyhKTNq+rshlB0cwfB//AxmUExJ0C3g8O/13G/jD3KVgYd7
	 v520jIc8O5Q7BeNbTRdgX+hhQpuBDebJWniffRCwyEwt9pCYv8F465P6zsJRVIX0JJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791832777;
	bh=JEkm3dPoLeseiwu63wDzqH8dNKsYqFug+OZnsSC/p40=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XO5vaueRexjvrKWdSNRNci2yWlG/nJQE3CM1nlN48SF9zvo4UAFyHhSVYsiDzR712
	 j4xOLPuwitpBasOu6f5kY8NZmKPigMKjbw/HuZ0u2S9AmR4VNsNR+08AtAs3YWnwGp
	 RXJyGoWsZjKcfgQGL2eQMsQlE0NqjF8C58EAC76FpffdnVzPzkZXN/ObFNg/03sQ+P
	 G7g+WrsxlFxXnCWnLSbo8uc/IZdd1khq4toFGR1GEG+PZj7qHAJLoQUjfraIiuaJrX
	 2jGOYLX2ygD7QRIdMdmDdyHXWaU2ybdpGcVdOUU4mto6iv0wJ34TMjRyiHd9flNrII
	 xB3ApjTI1aGwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B74404E0;
	Mon, 12 Oct 2026 19:19:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D53052A8
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 19:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB39760680
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 19:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HS7NBGxNphoI for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 19:19:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E55A360667
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791832774;
 b=JmRiEP46bA+wCWIUUk9sZGWXYh4uXGl4CPfxPYUkuCelLVeQVaryfRQzwo0GaZTrjpoW
 pat22RLowta4l5nsUaf/DD8cVoiC2aclgljs9Ym35wzHj0Pr0yA2ZAYp9PN4NjqMPsHIa
 YaOD8qfi1XEbUpGrzckGygT/ZU+/nf6H68e1VlBRUFe7qItiWfrcrDLSH4cfWkgp7SYjN
 TzR1MB3hwE4/wUx8/9DwEzk2zH0DjorwGQhzjaQH4st8y6QVOv3x8oAXh6UGhduGRGUH9
 bFWdoYQz6rwkBLfBk49az7yp5PFuOsrrChwoxTa9U9sLXIhFyb4ShDHJV0DhSRc+nvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791832774;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Nj5qM+anWcdnNd/kqq0v49XRbbJ76nXbAeTMljJmZ8g=;
 b=NNCZabOE3EHjxNlmq7OiE3tKK7Bw2nKfmtB5D5AZetFeZFF34xYrkk+2tyB5cfdiy3JF
 /52dV/4lyjxbkiIHy0wVcr6xoLXvkZ5YGfD1Co7AAB0joTm1hDd+uLFxErbvysM3bHCoX
 1GUn+doLzsfcnqGFBqZb1ISk0KPBrp89Gz2WD9MaSWi5JHjrzdPYZV/USFpKF6i8V54nG
 YnVKUQxXyHp6l+qucDogsmc5jrmLzcSYdVyc7iNkbX680PTZ8Ic5C/J/b0EsYZJcsCtS5
 rfGn47Sd8gQyoB1b2zJHJS8Z7pEiRcN6HK2JS1WMAz+2noNsz3bdTp8NBIJqn8G84tw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MC2juceB; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E55A360667
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 19:19:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvcG-1xBxqG2Srw-00RQ8h; Mon, 12
 Oct 2026 21:19:24 +0200
Message-ID: <423a0c0b-a9e8-4ab2-909f-60fa4f0e030d@gmx.de>
Date: Mon, 12 Oct 2026 21:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>,
 Arnout Vandecappelle <arnout@rnout.be>
References: <baaef26b-36cb-4c0f-8b90-32fca12548f5@gmx.de>
 <20261012183436.83398-1-thomas.perale@mind.be>
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
In-Reply-To: <20261012183436.83398-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:XG4cseW4lL4RncphiIXEOEyW7n28Yh1x6fOLxEiafQBvts8B5nL
 vfovNEslR0Wiv+xT6PwoSuR6TSoUTlxSTmb9h1+te/y016B6CgPY8fluYmTa7IexpGxe0zu
 MyJaYdnYpwPVLn6OKqPqRBBJnBv6dQPDqGnlprTJJ488c2Cgr3lfivHxVLEZ0ybBely0OF8
 c+282TfGgx9C78uNCoRNg==
UI-OutboundReport: notjunk:1;M01:P0:ReOWO4pCER4=;9FAwlK7BghTbx4UBrgtR4Ku/pFk
 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
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 12.10.26 um 20:34 schrieb Thomas Perale:
> Hi,
> 
> In reply of:
>> Hi Thomas!
>>
>> Am 12.10.26 um 17:41 schrieb Thomas Perale:
>>> I'm thinking again about potential solutions since the issue we brought
>>> upstream remained silent :-( [1]
>>
>> Yeah, I checked that too before sending this series. :-(
>>
>>> Do you have a slack account to give it another try there maybe ? (I don't have
>>> one sorry)
>>
>> No, I don't. I guess we could poke that discussion again?
>>
>>> I think the actual proper solution to this is the following. Given an external
>>> named "br-external" that has the package "foo" and a "buildroot" config that
>>> has the "busybox" package enabled:
>>>> ```json
>>> {
>>>     "bomFormat": "CycloneDX",
>>>     "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
>>>     "specVersion": "1.6",
>>>     "metadata": {
>>>       "component": {
>>>         "bom-ref": "project-name",
>>>         "type": "firmware",
>>>         "name": "project-name",
>>>         "version": "project-version",
>>>         "components: [
>>>          {
>>>            "bom-ref": "buildroot",
>>>            "name": "buildroot",
>>>            "version": "2026.08-891-ge17cfc9b3b",
>>>            "type": "firmware"
>>>          }, {
>>>            "bom-ref": "buildroot:br-external",
>>>            "name": "br-external",
>>>            "version": "...",
>>>            "type": "firmware"
>>>          }
>>>         ]
>>>       },
>>>     },
>>
>> Moving the Buildroot repository/version info from metadata.component to an element of metadata.component.components makes sense, if we want to leave metadata.component fields for people to provide info about whatever they are building using Buildroot. Then we'd need to provide some way to supply that info. But in any case I think that's independent of external tree info. :-)
>>
> 
> Yes we can discuss that part later. Because I have multiple option I need to
> lay down to think which one makes more sense.

I think it's a separate topic: metadata.component.components is clearly 
the right place for external tree info, whether we want to move the 
Buildroot info into there, too, can be decided independently.

>>>     "components": [
>>>       {
>>>         "type": "library",
>>>         "bom-ref": "busybox",
>>>         "name": "busybox",
>>>         "version": "1.37.0",
>>>         ...
>>>       },
>>>       {
>>>         "type": "library",
>>>         "bom-ref": "br-external:foo",
>>>         "name": "foo",
>>>         "version": "...",
>>>         ...
>>>       },
>>>     ],
>>>     "dependencies": [
>>>       {
>>>         "ref": "buildroot",
>>>         "dependsOn": [
>>>           "busybox"
>>>           "buildroot:br-external",
>>>         ]
>>>       },
>>>       {
>>>         "ref": "buildroot:br-external",
>>>         "dependsOn": [
>>>           "br-external:foo"
>>>         ]
>>>       }
>>>     ]
>>> }
>>> ```
>>>> The metadata section declare the project and its core component (buildroot +
>>> externals), as its already the case with your patch. And then the dependencies
>>> express what are stored in which externals, as its already the case for buildroot.
>>>> I actually think that solution makes a lot of sense, even though it's not
>>> obvious by just looking at a component to understand where it comes from.
>>> But as we discussed previously nothing seems to fit that requirement in the
>>> component definition yet...
>>>> Again I wish I could give you a definite answer on how to handle this,
>>> what do you think about this solution ?
> 
>> I think dependencies are the wrong approach. I guess you can see an external
>> tree as a dependency of the overall build, but recording packages provided by
>> an external tree as its dependencies doesn't make sense: the external tree
>> *provides* the packages, it does not require them. It's about origin of
>> components (packages), not dependency between components. If I define a new
>> package in my external tree and it later gets merged into Buildroot package
>> dependencies don't change, only the origin of that package.
> 
> I understand your point but the same logic apply for the 'buildroot' meta-component
> it also provides a number of packages but in the current implementation all packages
> Buildroot provides are registered as dependencies.
> How I understand it is: "to have a full buildroot build the entire list of packages
> listed as dependency is first required".

For the "buildroot" component it makes sense if you squint a little, in 
the sense that it represents the overall build (like "world" in the make 
dependencies). For an external tree that just provides extra packages 
etc. it doesn't.

> I used DependencyTrack to kinda validate this behaviour. They have a tree style viz
> of your project. To have it work properly with all the packages available under it
> you need to add this dependsOn to all the packages similarly to what I described in
> my previous email:
> 
> https://pic.infini.fr/IkWJ9c5X/M9EqMt6b.png
> 
> I think this is the kind of view we would want to achieve to show the hierarchy
> of the project with externals ?

That's a nice visualization, but at most tangentially related to what I 
want to achieve. Which is to record for each package that comes from an 
external tree a) that that's the case and b) which tree that is (plus 
the details about that tree, by reference). That information is only 
implied in the dependencies in your proposal (so, not obvious at all), 
when it needs to be explicit.

If that dependency view is useful for you maybe we could do both, but I 
still think using the external tree as a sort of meta-package in 
dependencies is counter-intuitive, and I don't like introducing a messy 
data structure only because it's convenient for visualization.

>> I'm also wary of encoding that origin information in bom-ref, as your
>> proposal does for packages. Bom-ref is supposed to be an opaque identifier.
>> Nothing against making it human-readable instead of a UUID or other random
>> string, but we should not use it to encode information that should be
>> machine-readable.
> 
> Yes here I just used as a way to improve the readability but I don't think
> using an uuid changes the logic of the proposal.

No, it doesn't. But with that proposal the bom-ref would be the only 
field in the package component which includes any hint that the package 
is from an external tree, which is why I assumed that was your goal. I 
guess it wasn't, but my point still stands (same as above): the origin 
needs to be explicit, not implied. ;-)

The short version of my overall point is: Package origin needs to be 
explicit, there is no suitable field for the purpose, so property is the 
best available option (short of a new CycloneDX version).

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
