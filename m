Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D6FC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F4194606D6;
	Sun,  4 Jan 2026 14:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cc2GOoWUrsEx; Sun,  4 Jan 2026 14:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17A6E606F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767535753;
	bh=xZqEv56tvJ40OY8s1nGFEmAL42c8sT7erereihexkOY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=keKbGRlbjHDQYAVJ+MtznqLlbB9GrqmBZPLYDB/zmdbZ0fmcU1eEJaRi203J4DcPL
	 7vvDk4hP1KFG82e70OnLWqOu5Xqj0Nh20nF0j8WdZ1zW0eqCEvUKeqpeSssarcJYJt
	 cX7OaPoKLx8xzd+g9fia0LvAWBYOLrOPOre7+vvpLnUb2iVPIxjY+yUztNmaqZ97Td
	 I3ENN2cUYuDHvxLlcqBRR714wK2yi7QuJdlZnULbLe6Lpc0uuntby73/NPixb96pqf
	 pwWr9K5f0KczfDN1DK6+EAUe+2IbpcjOvMeSNg3qP8xTDERCfxeU9JISNf119LR7Ld
	 82xiVDv7uxWYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A6E606F0;
	Sun,  4 Jan 2026 14:09:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2D03229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88DFE80E10
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRWyqKy6sTT2 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8442180C9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8442180C9B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8442180C9B
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:09:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.67]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdif-1vi7Qy411J-00GMNq; Sun, 04
 Jan 2026 15:09:06 +0100
Message-ID: <0a3f4ab9-ac23-448f-ba65-48b86de0ad07@gmx.de>
Date: Sun, 4 Jan 2026 15:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260103175533.1988160-1-james.hilliard1@gmail.com>
 <20260103175533.1988160-2-james.hilliard1@gmail.com>
 <b3c41b0569fbf6ab18e32200371b2928@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <b3c41b0569fbf6ab18e32200371b2928@free.fr>
X-Provags-ID: V03:K1:5hNWK6WuqagcZI8h3tv4FGHwNxjkJTTwhY0G/ttSP0ETZTHObRt
 hTeY6MOJlEzlp5CQGw4Iu2vrErJfoOiBraUPKLD65+K+WqLlnyzTkXcmLH5073EJNH7omSN
 qJZlQcKAk8DrM99qSlRYfLL9MkKWYLanNKxOqZxm14fIWBaszfsPa/zm7gpQjnoFLVHMoii
 arhWag/Ghxl2ZygRmueAQ==
UI-OutboundReport: notjunk:1;M01:P0:xUFQVCf+Sh8=;jw4kePMdyIIT0EJmDO/9mdR25yv
 mzdOTbiN5meyrAKOGloKnaYJYYiw235qekEMWd6koC1Lg9eT+UcfX1ylfUnaVg9ncKH3Rjgsh
 8LlAoIYLNKDwO4PXTubup82b3fE8WPeWv7at6A4KOrYjIwH7vbCuyLZPTYfEAkCsggh5te9+a
 NCbdyShqpgxH5rVac4i3TMsBd1XHR7nS5b1mbIqGy2CzVlR/3cPvAzTbZ6mIGOyxBynnBrqe5
 r9sGBvbFs3GkTT+aWg9QcG3NrYpnAIBkbAlweTgOiTczn5p4kYImHB/fvCDebOXz+LqiFYFkw
 2oAonBq8SNPuEOFv+l7NUx6C1dx39QzBT4eCUO/ZowVnnoKajYWg/MQxoytaHmv/hp2F4+vGO
 TJx6rs97WaVUEXuZkdlHF8Np5OOmtyjY6xzG1CKFZxxgeeICFz+Ci3XFPpGI+2CGJxjK84/5A
 pLyUvsQGJGSpUGECaVuFNfwvsCcnVxxHVqNiO801DsbaPOvBeCFHM4aUDe1kCw4r0xrkkUflZ
 spslyhLTW7WiXagUmcgu3tqP1B3v7GAmhJQbPj6girLdXy6l24Znqa46C6txrdXC9oBG68az3
 htoMBKu/7vIsreJyaFTuijOQeyy7BLBHPv2hQs4TP8WTKj6pfGVnYrRJEm4HilJlrJekhqHhx
 /yihSn0wTRHyTtA+YVDrIPsRBLB5nj0KxcbHM4Wu7wlJNZ5IDz174K7147DVT0d4ZhLND6aOQ
 CfchHVt8wOZuh744ixEe7VnbvmD0TT2Kcs31W6ydBS56Y/fh6hIXtZis/MCFS5XVoxnNKuhsT
 Fc/NBxvUZQ8Pf4FbImt7p/c78oV0cZF91EwCmPQ/8THeT4c5YlhBiYfzIzXio7k0fysc/BfVT
 Hv25zAqTFtCh0IhT1w7J8DUr6ZVpLbG4q8/aXohzEsoa9R9Sh47YE47B/hynRZdqroprwRvcU
 KJlVTef3ZBxXkajvi0FfVsW1Hh8gUWhEcpgKQp4GOLT1UStMVWYA9L3Y5J99hhV7v82eOK1W6
 vpzxX7AkeS+ASzzGAm6J9oECA0FbJcjU/Uu8zmX6fSEia9rlWkAFzWWegBqxvVo+LxSwFeSmt
 VBrmwxZDkaISePuQ+cU5xZxCs1pmpsErQhT3MzY3ANtEbIrWGDgvhs6y0eobSvH8uWMUelDuA
 feagT5UUDpqbxt6tTd69z+6wrvSykVBaNLZXqLV2cZwcgVxRHb1LlLmg3khMOZhZowBoi7DPb
 oX8qzpwd9/0h+yED5bNiL5zskw+hUN5EqYv1K7Vf2ILoQNaudZ2Bvw5CQIX+JpY/MFLGG/QiC
 mfvAbJMOZw12H2IH2oczE5IyCwST7CeitADUlWznAM4Kpu8ltZp1LSbDzJ6vmy3HzzgVJHTHk
 cWDPsrQt3lTZvEkdMUoblw5SJtWjVFTt5oNsn/XvYUvghSR2n90GQYQkNKCgpu1JoBPFtBily
 5jO60fZhTbdntEgMndNH7vnvfRgl1g62g/u3y9WyJeaUUl2co3uh6/ZUZFF17YeTbMVJ5DOxv
 k3RVYNxvfvuFJqH+mhMMkIqkG2tEBdwvicNEc8wC5qMMMMPElGeqIHUu+F5sgwrfmAqedYz40
 DAhBkGRG6pnAzNYttyvs6/qMvwi2nctIur8VeOMaQAzcB69m2r8T0zvhtUU/BJ6GYbeDEn2w2
 EUasZ5lkoDTtBold4QpamL3qzVm79Ox2Xpw8mkHmOs6Gyny+dm2SGakCcVjfp+nP4SpElxvgv
 7ypnPxANoWrIb54WFm4p0yE3y3T74fRO5z5Z3xj556yUfcYMcp+W5nWru4TZahOkBbTNcyiug
 vy45PHbqC97dogqbQ55BmcFWyO2mJQpePtugvHctzoMHwRb/hajyFC9lYGvFLSxPlxAiau+Pm
 XevQQG87wpmBlN2st+23v0Ua1SCHhWym1U84yb7s3iLQvcj9buU8SHxaYEdP+L0IMBRqTSW3r
 Lk+LWwQYWF32E21ea7haAfL0MiVVCzz/nDesbx5WHwlvxiNZPjhgiUY6DlK/dBxj9CrXoVFWy
 rFCMGw8h3E7YIZ1aQaL99gjTPQnB6O8IKUSQSO1mMmweSRDtWY8AsLAAsesXc1PhcyLfoYYCN
 k38uoXN1pLXqqnke1IyzbWlKoh+gIodZjMrMtOrpj2mS4V7LKEmhA2VUqTeTi7v7phYz6hoFW
 Xa0vO1pMsZdfTXzUCzXEQpn7S+diNRzGJcvpf4+EOHjsCqFMzSP5Dy45Hv0vhowVSg2zcJyQx
 mZgO0BD0woYbHLV24NX1NoFeyqPuThSCQ7uF5aYurq7sN0qds0urCwI3SwmdG2uwFtmU61Zmd
 CI6aXPxIwNAjXU6/FVqahhmlnkITRj3WPtWHej9dYiZ1SsJRQvXPTGZn/wAuuoZ8bhxrU5Sis
 vmlB+doXG+SfAxJQzFeCjwNg7mjy2Pxuh+Mr293KQKC9Gp3XbeaiEw0Xgpixe7EiMQq7fPeL8
 bKH19DsxAZg/UwsbHi1XYX3660hfetk581aQl+WahV/J9XG9oBLETCu3dCP8RJleM1HClmOTK
 N0CjO7qetoCrdb6nFa2bAIT4UcPHdH+oM8T7Rq3RBxiC2t11S1a+U60ei6lqtpkTgOrtP7rni
 tIrP4dckYey/ACTue9Su/FpXgD7oZAeaV8AOBGs4Uz7JhyBrcTnda2qYhrWCIy/uEP+4ZJD+p
 STDl1GN3zzijQqfznTcr93OONXKA7feXszgNEvRgVUvaYx2ShqFUKlcwZD+PYp2bv25WLNcCD
 kJX7fvuuXHKfLhdDwKKp5HiPj1Kgs1hcUccOlv6Tnw9RVWELfAwcCzu8bJuT5ddhpathFSMsT
 jCGUnL5AouZ0/EDHLsDhQqhBgyNTihduxp44xajECYv6LIciLkYULPr9+TlaS5BwKYNJmR1u0
 xdfoh/qQNA5oOwrCXTtWXru2dP5ZvKv/pqi3Nef3o+8A0cNH2oe6BijHJwr7QRmjFZSE72xuO
 nMR1G9etncdJOWo5flmZExPldRFgIEcw972YTQY1eK1FBFkAsIrBZ/N+j0bbqYPbkJLRFFdTt
 a5o6y4KrzIMbOxCatmArpQ971sUn654j0DdktXErbCdT5MCHFIDB1wPLxPdRFvO950suSV1K8
 BQru7TJHF5m/yV2IxHiDKeRpO9V4xNqiTIS7JP2rVVnMOKNrHnH2dlb/G73WlpHjbEWmIFi6Q
 gWIfzJfWhu20+bdkak0mLdLKEdJaHOO3BzuSrRluvQoAp/hhrHmdYWByWwqNlV1z12Q92xrfc
 YPL5HtuEZo17VqS3Tm1Zh5wUZnvSFSoF6vowS7Y5y5ZL4OKgF8CYomYOlaK76sg8gecZ3Ex6q
 OKl8b7E/gTWOluBzBuRZ+dWmbdDNlFN1uC7snQ/SbPQgjGmzA7LRwQwtatZQ3gScIdzE24Ubs
 c5PJy+qZEZ8VtEpeVmU3RQDSKmUc/5AAsl2O3g+uQVuLoGfaAu2c7cySwtwxlZyzZ13ZMDil1
 FNrF8hIQdOk/2utN3z+vVLy6pg9SCFxyO03FTBdN3b6p3nlVfe2nfTpa26fvwyN6dZf8wru5f
 xjWDhdlz6PZlNvS0e+Wk4KhGclUG0fQkXe21G+iL8OzX/YLk1nOZovUXY3dU+EE7Y2X31CT4J
 MJge8OUmaAk+MZGKcbPCSEpvhu3OHqYUKPHi4vREcEiRVyMBI67yVKVsoOuFCCFbH4u0rsITH
 LMzuvm6IDuDfmBdqBTdAr4tm01FnhPHolCuN0MqBlDVW42qxDwXzO4SrJUkOrBt9bf/TgjUvm
 o/Fh3ZQi/I7VHD9FLbmVHdR57lyP6rU98VUAEih+ZcdpGLpm+jUdzpMQb6hXQQ6fHPcgPlTxo
 BDWpcLj5B32l+98zedkeUILAD8VsoUGZrynkltz2cAKz6DAztt13ZBCRw9e1Yzp31X4ktyLhe
 BWvrmyJeAaP/N/a/AnxnMqLZzXs/qMDUrTj2jm+oYeqZU1/JtnUG32n5O8M7WTrlRrwtsYK53
 L0CENePxgi8He8B8rLAds2Cg5HMQupVhnkCxuUj1lAZyljnuJlBXqFRVxIhuQD7SXvulcVf/8
 xksaPjK8wiHhfzILZfRm1c7EMpm66gUDtRMZ4BY7aSssoKzWutooDfhVuathap08Eks4gWnyj
 8iCdyGEmgtcPWkiiDEYQDYfDS/4z2iigO2WBQdJsG6W2h6YNOk+QSNt1SsKJwpkwDg9NyY/mA
 aJnrb4lhFOi21Q+Rz7FWQe+bC+Ijuo1tciWHovBQvgEAdMt7A3Ocj9D5oEzl4DV9+q9BpGwr8
 cz+Ysv16G53zi4yBEIlhlMcZMHTnc/8PBdwvuwq67nNl76S4d3YOD8u5vSll3ja2nAcAu3W1i
 TgRcLf4Lsg7RHedEKM6np8iRmIj+IyCdN1wYtxobXt+H1iqTMsUiKcCN3EkXu2NRxjerDABfF
 Ys0fIoTYP5uTM+7M1t3nLzAs8mePwXA229TcoP3jX1YeqvY0HaLZHBysG/+jAJ6Bstn/IP2HY
 bIvIl6pDE4evBlDUdJKeLDGBU+L6+WvTnclj4FiGGe7Btvnp77azcZa4NLW54L6TeItl1H8Hw
 KgxhkLi64Uu94hDOqm+/krnvTXm0o1dHWoyN8khZhBf3Zu4hMojqk9ngEswmn3A96ITY+3hNC
 9W2NHWj7RvoHh1yuSVf8gdQUF32g/KL2XR4P8nOMxQeHV2wjYb3ggWfAmMExR5ePlNYU3lVbJ
 +aw+9SHjbcIQNp03WpChlrmvoyGwJ2ye4J60FHIJzd8lKu1fYML+XwsaqjX/wn/7NSX9Wcb7x
 Owc8CQBGV8LzDUZ4MFqvDkPX5Hu6SZf3qCP0Ua+XhO0Rf6VZ6koxrJ2mgUiz8jBJ+WDGdMYPu
 g3ZwEJKI0hyCjjsWiFcIajran+IFhhxcZPj0OT+ZtjMXKZO1lsk2G6LBactEPHrU3yKv4Bop0
 FZXdZK8BI5KHM3uMscSnSpM1a1I7RZ3t9dkLGf/YSASmv2wrQ91db19BwfcXVxp68dSN9tsAo
 cOmedDq9MEbh0oduFphyL2RA/YkzxJWvIJ5YjFDviTwEyO8u0izp03r65fv3NjC0qRb/Z8hgs
 wdEqhN8Poaw8OcXjJxaJTI7efGzTbegDtuHOkJrdJKEhANhbj09LO6HDf1sRK+20Zjm1W1iD/
 xgutEs34g7sVCB2xnXKxY+or0OEclIJv6WFnhBwXB7qAZCyUjzLELO/najLxJsev5aFEcIT9n
 g7QjXrHVe94Ru98BIPqB7kNBWZRRq/iLiWdrb2aWguhKWIF5R9IdA7OYh36dA0ETn/DYL4u8W
 6aX5Bd7xZMARayESL3gF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767535746; x=1768140546; i=fiona.klute@gmx.de;
 bh=Grnh+vfl/EK9Wm9V6dgbz0DiZoDxJ8mmgozokz8uMQo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AamevEo9wl4UDJpvfCkTy4QG0mIISg6qpRXSyCu+kEBjMmew1W2EHki0SnO7CjWR
 +/V8XmGmt/hDUxcCaR/SW41UWfL512Hipub3HdEcw5TqmvPtuh+Llu3EmfiTr5VpJ
 AHUdWrltykDw3RDQldeu3/CA8F1IKDDm6QDdanhkQ3BMeNRyLr7SBiVwxAYHvkoNh
 dCYGk1fPZOzjO8jnIun7fw+zrNtYFKC2xSbn2kNk+rloboYmeRCJaYoSIXmDgGFaU
 atp5C1YBIkYtokgZs538UG9/oVo7E/B0CK7XSID0f+5QhCcrgmeVXxYdFrOO/RtF6
 SQvhJNKQLzHIsbYDaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AamevEo9
Subject: Re: [Buildroot] [PATCH 2/2] package/python-textual: bump to version
 7.0.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDQuMDEuMjYgdW0gMTE6NTYgc2NocmllYiBKdWxpZW4gT2xpdmFpbjoKPiBIaSBKYW1lcywK
PiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiAwMy8wMS8yMDI2IDE4OjU1LCBKYW1l
cyBIaWxsaWFyZCB3cm90ZToKPj4gQWRkIG5ldyBweXRob24tbWRpdC1weS1wbHVnaW5zIHJ1bnRp
bWUgZGVwZW5kZW5jeS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4+IC0tLQo+IFsuLi5dCj4+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbi10ZXh0dWFsL3B5dGhvbi10ZXh0dWFsLm1rIGIvcGFja2FnZS8gCj4+IHB5dGhv
bi10ZXh0dWFsL3B5dGhvbi10ZXh0dWFsLm1rCj4+IGluZGV4IDQ5Y2NjYzI5OWQuLjc3MTg3YjMx
MDIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXRleHR1YWwvcHl0aG9uLXRleHR1YWwu
bWsKPj4gKysrIGIvcGFja2FnZS9weXRob24tdGV4dHVhbC9weXRob24tdGV4dHVhbC5tawo+PiBA
QCAtNCw5ICs0LDkgQEAKPj4gwqAjCj4+Cj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+Cj4+
IC1QWVRIT05fVEVYVFVBTF9WRVJTSU9OID0gNS4zLjAKPj4gK1BZVEhPTl9URVhUVUFMX1ZFUlNJ
T04gPSA3LjAuMAo+IAo+IFdoaWxlIHRlc3RpbmcgYXQgcnVudGltZSB3aXRoIHRoZSBjb21tYW5k
ICJweXRob24gLW0gdGV4dHVhbCIsCj4gdGhlIGV4ZWN1dGlvbiBmYWlscyB3aXRoIHRoZSBlcnJv
cjoKPiAKPiBGaWxlICIvdXNyL2xpYi9weXRob24zLjEzL3NpdGUtcGFja2FnZXMvdGV4dHVhbC9f
X2luaXRfXy5weSIsIGxpbmUgMTksIAo+IGluIDxtb2R1bGU+Cj4gRmlsZSAiL3Vzci9saWIvcHl0
aG9uMy4xMy9zaXRlLXBhY2thZ2VzL3RleHR1YWwvX29uLnB5IiwgbGluZSA1LCBpbiAKPiA8bW9k
dWxlPgo+IEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTMvc2l0ZS1wYWNrYWdlcy90ZXh0dWFsL2Nz
cy9tb2RlbC5weSIsIGxpbmUgMTAsIAo+IGluIDxtb2R1bGU+Cj4gRmlsZSAiL3Vzci9saWIvcHl0
aG9uMy4xMy9zaXRlLXBhY2thZ2VzL3RleHR1YWwvY3NzLyAKPiBfaGVscF9yZW5kZXJhYmxlcy5w
eSIsIGxpbmUgNiwgaW4gPG1vZHVsZT4KPiBGaWxlICIvdXNyL2xpYi9weXRob24zLjEzL3NpdGUt
cGFja2FnZXMvcmljaC9jb25zb2xlLnB5IiwgbGluZSA1LCBpbiAKPiA8bW9kdWxlPgo+IE1vZHVs
ZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAnemxpYicKPiAKPiBUaGVyZSBpcyBwb3Nz
aWJseSBhIG1pc3NpbmcgcHl0aG9uIHpsaWIgZGVwZW5kZW5jeSBzb21ld2hlcmUgKG1heWJlIGlu
IAo+IHB5dGhvbi1yaWNoPykuCj4gCj4gQ291bGQgeW91IGhhdmUgYSBsb29rLCBwbGVhc2U/Cllv
dSdyZSByaWdodCwgaXQgaXMgaW4gcHl0aG9uLXJpY2g6Cmh0dHBzOi8vZ2l0aHViLmNvbS9UZXh0
dWFsaXplL3JpY2gvYmxvYi92MTQuMS4wL3JpY2gvY29uc29sZS5weSNMNQoKSSBndWVzcyBpdCBk
aWRuJ3Qgc2hvdyB1cCBpbiB0aGUgZXhpc3RpbmcgcHl0aG9uLW1lbXJheSBydW50aW1lIHRlc3Qg
CmJlY2F1c2UgcHl0aG9uLW1lbXJheSBzZWxlY3RzIEJSMl9QQUNLQUdFX1BZVEhPTjNfWkxJQiwg
c28gaW4gdGhlIHRlc3QgCml0J3MgcHJlc2VudCBlaXRoZXIgd2F5LgoKSSBhbHNvIGZvdW5kIHB5
dGhvbi1tZW1yYXkgcmVxdWlyZXMgYSB0b29sY2hhaW4gd2l0aCBDKyssIHdoaWNoIGxpa2V3aXNl
IApkaWRuJ3Qgc2hvdyBpbiB0aGUgdGVzdCBiZWNhdXNlIHRoZSBCb290bGluIHRvb2xjaGFpbiBw
cm92aWRlcyBpdCAKYXV0b21hdGljYWxseSAoYW5kIGluIG15IGJ1aWxkcyBJIGhhZCBvbmx5IHVz
ZWQgcHl0aG9uLW1lbXJheSB3aXRoIEMrKyAKZW5hYmxlZCBmb3Igb3RoZXIgcmVhc29ucykuCgpS
dW5uaW5nIGEgYnVpbGQgcmlnaHQgbm93LCBpZiBpdCBwYXNzZXMgSSdsbCBzZW5kIHRoZSB0d28g
cGF0Y2hlcy4KCkJlc3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
