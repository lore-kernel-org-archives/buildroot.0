Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40BBC88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 11:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE55C80E17;
	Wed, 16 Sep 2026 11:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hoJAAq9T51H; Wed, 16 Sep 2026 11:09:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B7AC980DF6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789556970;
	b=myA8cH90Zh7+LQiF8uydemO6u4Pz6NN6w9+0QxTZMN60hpFHP9B/o/NrRpaIz7ynJNu0
	 mmVfZB+bLj6s6tHg1Skzb4rEcS2k4275VHgjLIF1cxyfgbwIo0FlRkmbZO1a8lWpP4USE
	 TQ6RExrPb6h169RataoUxwwc3ZQde07o87Tw2OZaHN3TUTgVOktr9QyAGWvKz9OwjYb17
	 rCjLktuqPklq3xwrJGw1RZOmIL1R5/wpRKunJSpxjUtQOCs7FgOd9Ghpu3+/1fKnI1SAs
	 R7QXZAdtowYZqHrJmZtns6UxOAnNW7O/5RtIiVx02iO/rFvFHiYZTQ9TpO/+HlK1r7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789556970;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=epxUJn5Rgu1nx9GZBtjd8x5HsC95RtebXnN9vVRp+VU=;
	b=p+0CT8xweMH4De2Al4szFMCAd+e9tSlxqUlwXL7BxURnJXBCKLmmkk2A+PWWpT06E+wu
	 GJXh2b9dwcptck9r5ft89spFphjMaK9oHgYNghutO7kwjnI3V75zVjfxBHAq9MN111cES
	 2FFaRh+gx24sfQIgCv0TP62nvpj96uk/yOmNTrFGZJGn8pxntVkKSBFsExZbOC/GLQ5lK
	 FbguCTrGSuAM0plydlCf4S1vQa17S23oHCePpZr8bFXmVD+zC8fG0QYbFzphDahnEigFJ
	 iRvJFzFyk0QFj7SOHOT4mbpQGdf1J4raisAp53n+GmuY3kjqIN0HMF97S0MPsJ6YGlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789556970;
	bh=epxUJn5Rgu1nx9GZBtjd8x5HsC95RtebXnN9vVRp+VU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=rhEGCjBoVAYzATiLSHxADy8EygO+pfQ8aUqsX+n3QlTjNak2QeR580/hBjPaf36VL
	 LO5okSa1qX7Ssur6T/kIPceqtnrYob8dl0eg10LUQU0/u/2vXj797a0mZ3vvW5qCW4
	 y3nsQhbIH/1zTnVgdbpAFQU5NJU33ozMmNZ8Hk7JyOeUQFdi1NElWB6HtPg2MOPF7a
	 To4mGUN3OVofwjoIUEZJmdUCzYmx5no3fHTCAuT0Q4+LtS4RjZx5nJ8DhOSTtaHkhW
	 b6iOVeYt+ErRendFfN/f/U+T48D8Q61hRTdVwxdFMIkqj0nRELtZl8alcPP4rySwAw
	 Di6I5NhYirPLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7AC980DF6;
	Wed, 16 Sep 2026 11:09:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C83D224
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42AFA607FD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bMXkMuWqw50 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 11:09:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E096E607EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789556968;
 b=FN5ZzPCcocnfBsthXm4mEX50KomBekrz1Jo6ZIhyryyA3NU4LTmSbqzC8RHEAIt1qY2a
 VJzP9R1mIUSvVw3H2GeGL3LG3VdgaDfiIOlQKWHkv7HKIg5m9JggY9eHX0BQgVVBvD5FB
 /kleOqmPwIN4Xf82ewwpTpeCN+4QxZjUuNiz/e7Y81Tquzum/UFp7Nh3l3et2ky0ZRkDj
 K2Xf5EItKbNE7PvvPUl6O8P1aI+n8UyAGt2AHsGUN0O1UO9+Q7lTR3SqcEhSQao9aWWam
 fOczyy5Wes0QISTerMh9Cx1a29+6L8CBeF43a4jlY1rJtg1f96BOXK454JRRlyBl6Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789556968;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=IU8FiuV0LQAVcPD4ODvUD8MhJ8LmniA7WBuqrGbwYF0=;
 b=clghsk99VHnCMPIITZ6Gtju8OG3OMzoDjOCpiRUeg9ZHawolKN4k6R+zj0XoK1Qywwkp
 PULvoW90qprx6FOCUE72v1OyfAXq0aUTMDHyZFXyXxPXASNBNstg+3QVlAbdYF5LIFH+/
 Zjk603nYXkz7vSE4IL1JTlKUYcVb/tYr+jrKbEA27eAmq6XEeX3J8Gk6NGbrGzGHAJh0K
 c5O6STAjkh+0b6Cxe5q/yk8euV0wrXSWrEUxHC9cV8FfEANJYkZ5HZKo3As/5Nc5QHhcI
 ISaoF5E+z2jQSja60ISVLbM7zHETFPLtFJPW/jiVSODyDZ/G73Z12L8IzsCDlQW77IA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hUKF+1xh; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E096E607EF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdefJ-1wY0rV3wuX-00hVOA; Wed, 16
 Sep 2026 13:09:25 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 13:09:12 +0200
Message-ID: <20260916110912.265693-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916110912.265693-1-fiona.klute@gmx.de>
References: <20260916110912.265693-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:R2fobzZuOnKk/MOlqL3Su+IVDGGw5ajrljdRyp9rxmprRenIf94
 4C6/TzC6JG5Xn/E2NGAe97le9qKIDbZqYF66k8R/UXCydsOomNGF456nP4kuBMrLtaWU/Lb
 rFfunA759PBbY10/Een7oESz0GnivDpDnZ7YoJbODMUry0c244KfNjqtqQmYYr1Jwb1aaaF
 zXYOocn8I1xRRy56IEcng==
UI-OutboundReport: notjunk:1;M01:P0:NLbnLUvDmnc=;8rZ0yyNHCJR9EUVYwepRM0yGTmL
 QwewfCiUW6umQ4TvjIsWOnOFPdTMS2TtoKMiXUIUOzBKxHdtGZfLV4k8MhAvgcrsIJtTUnTWY
 Ia7aeTA5hf5IUVwiLgQeQ7qKC5d8hOIgRKzs2wvsCIkKt7+/gxqy+Hlk29ILU2rdsG3QGRYmf
 tzcC6G7A+exzqnRHno2GtBQ6GND/YQnvXdzF5ye5g0SPfbrgMoZnVPJCUgYc7kiVWuZcOWcp7
 DKRmXPgqD2kqlpO9GGT7+Q5BSFZE2AoK1Q9oKIu3mKEQOExmV7acG+QvzeUESsmA5z0aVlQoq
 OZi1tqwsPLIxithpxNjvhGU+RIksEkY4YvNJbf0o0YaiNr2d9QSM+5f4Kbm5AqbVSPbhU6Dv2
 UUXy9Yi08M8w54oAhPsDq7CA0JvHY3frlTGKMtc7pQm0RhH5YUzUiSOTghQKQ8qUbXjetdJAe
 kTAXX2s+IN/GqBTFEnVEgKda0rAS7WZ4mJ2ndTYafYYkwfmw66R3ijlUWGyt5S5vKZTYf1czX
 Kc3c3EyG3aD57DQoljwY3tk2iCizOrDdRWpUMG7X1OIDzaOjSQdJk770LTHHoKXhkUmRa9Avs
 XptTu2poHckkH9No5R954nzukB/te6dqcgRiYZkM0qAukdAPTFVLFbWAVDWkTzqX+YHJjx3mO
 /d8fK91puUkyNYmn/iu+nLHILaH8ksVyzqgJEbSE6SaxVLufr1H3AVVwJLNoFTX905XRHvTEZ
 bzLBN8G0ciyYbSTN6Fd8NCNKeaSy2491fta3o/NSQhf8I/1DMfhmvUVvyLCSabZuTFX+M5NdB
 OzlGVrAjbDY2SYDaBHlUiggA1sGKDQsHwV2l0QycvhXwpJvxqvMAauz4uj7afSXCD3NyiCD4e
 eYXmtuNF3Dwxhobs7Dx4H/7DhR0OWIr2li2vL6OXG0/afGOCRIVD/VyAZOw6R8CtpRbiFcVY4
 dcwOCFSWdiwEC3P0uELVv3hWVNMFaZySzzMv8w8uwTDbN8cUsjS9lS0/cQO/BCxRS3FX2pl3B
 mbj6L/Yelm4amKMDH2bGnVa0qeB+rt3zcZa2HqGg6YCXCdIxwiG49zr9VcKh08f7h4bQnZ7Uf
 FhsRHpiYCKpjewhAD+NzYJ1EqvtDZFTorksuZ5E1XPG+A0BvSIxBNFzyQHgdXI1tJpEG/rzT+
 QfRAJeDE2WJn/dO2mfIN6F+Q5H/6a5wjZUYjeRY9l+3nW7S9PmeetwPZuRFxVnPbiqGnnpDgK
 ZHgylxuqWl0SSyC2lnBr5dSJsusTGCO2luBTu+TC5A54T3rumpGhL1a9wtcVgPLNc/oBzrvgg
 4qprNhvhtquaxuJnzBu4hHxPhYfPs/zVWAShPOc3T4VodbboK9Nkz7Rz6M7EKB1Y0AaV4MOrb
 75vnqPh1dyAg5o+/Snh1STkF4T46YOaDa2q/Tb2NlcvDNhPY75S0KIO0T8gkwmYH5SSTzYGb8
 MCyC1pe7l+QdQk+2fJXsUA5qHhQo1hAFBQr5JTrc0aaqC3ohp8s1/VLFOdiWFRk0U20GV5wDr
 ockVGrjnvgvEV0dE4FXnR3aTy4UqLUZhGG1InZxeCAOD50+r66HMl5SuFTuTV1L3kUXFjAikx
 xRLdOOlQ5SB7KJyWeAgwdhKUKOaRl2T0VqhNbgIHwjZBBDhpXqvtaT627C6Ps+eeSJRl+J4kC
 WSidJ8r1lhVSgVMdDkWf4uvNgYw3ijUZECJFGQVj+i9NBZ8pPxSWahc/k3GrDItsPPidu2/aY
 N8c0PrF+SG5pM3w8yI5mBiAaPYBUDDnnG1U+BHg4zHrw0RV/vRKHTOKq2PTjySHo21Q/OVO7d
 1+k6kcY3drab7wSyRLkGHzdxPB1g6x0ZC391y4EftFUM9ZaKHOOoas6ANTw9JVJWlgf1Bw3Nr
 wS2X8rYXYI4RfOPguDO4r3eSOI5XVgrtyOzzKh5DSktGGBEz5JiGw0JxFWuQ2vhRbgO7OIFF2
 AvzcsqNSYoD5ivLklxyP7ur5l2zo97tP1KEREIunN6v40wLG+3bjq42i4HM0GyK5PpE3IjC3X
 9XRlqLJ0a8WE1OYDHnusJMrxMeQOrshur88fzdF3Pvp/WurhSpjcQk2yQ7pLk8lSpz/zvjbol
 ub193KJVT0Kj+hxwhsJbYi2NKD5ZLCChuh2/+owT2qqvVGFgy2Y2na2/bUgeoOPDf7p3lOAvg
 O2cNxqvCukdcaSDqt2jEG/dK+6NEYHu5/KbDzYs/MZ8ZrbC3HLrskCVC2xS298wgcUkmlxc/7
 D/sHVkWlWWmljB867BkDfM2neJUdiry0pm+s7g/uJ0zdbHr1OAGY7ys96LoEXsKHXcJ6jRB1W
 DYs06esdpdAsLOVBx+4gxyvvaG/UNJxJXcFZChzs2/decNR0+ZdDfLF1Vqw+Wmj4apIOZBOQZ
 /EZU0pBVVuJhR3VKzzIcdnAdgM81giX9uZvBA90bThYESgjUincgv3jy2aM/P3DY1KvebqNU/
 vryDtY/fYLGbs5Oxe8tUR/ETRCBfggsLo8ww9H+elMRTlGlH2P14IEd9A6EWSulu/NcUQShPe
 WcMY4LiY6a5wiMiQGUB9Me3FdjisTVq8yegvfmRj6EMsFWGYTH2UMSl1UoBYvZTvlImtFEwyI
 oeYbTBTFi5uIgupG6NsclYS1nqBfj2LQsVHCl2c1iVhrDVGkg7XgbjfehydEAZzDhXNYghyj3
 QXNyda4HPtFQl7oydRrarmr9weXaF/h7wPvNewLKZgO2HjBGiYaqxK5h6NJQMSOkc5/49hxhn
 znqq8kHGthLMKkOaiQOrh4cH7CoY08PcaJKgEUMPdB/Gotoi1CIrpdh5YaY9lwUQvf5vdebfU
 HFDHAWZKt+PcNEWd4FedacDTW3yJPC5NGNmhb16HYWPyxFytDrINsb5PTYBqHTaNDAY64WJEF
 X9thd8cLPYhR1u+qgfM+qxDxwSwkWfR0ECcpwjdD0p+ODRwpt3smrNmPIUBgb5C8zFEZuj42/
 CRkcKyHqsLtyZMVSMR7nVQnHoAVeEr56fSMlyJ7znGebS5yY61IHUL97uVOrBJhOQvLYcVuRw
 gIdV1HbKPAoMRu4brhfWKV26hULNe2yfVUut+6UieKpMpVcPYpePLDhYmGb08NRoQdnRz6x0j
 ou2eZi0fstclQco2otsNYMUU13kbTsvqIKH3n/lIdSenGrbAakV5MREhLmc8imOWnWinl4y/q
 RD7AGKXFSmChPPixDxiL8tDZquaUX5kRtnzgbzNmcqdhcSjmVSK/y5J2w6FvpoxMbGtrHG1Q2
 nFXOdxfpYBxbmvDd96O3xiUnOBVo9Of6fpoTOfeipVwtASoGvKkWMhDH+Ow4bv/2yjkyNJo29
 P5OmC/uOvKOXelBuMKtRm79lb8aC5eUHpGw7s2L+8I5ELqg4hFXZWI5iVXjfhP3xhLdp96qMk
 apXjDAuqSj/z6grUOoB/UDhpej3slWAe52CHrPK8c+Ki2IqhQr5pC3sZVg7xVF2xIg4iYdpO5
 rPgca+VVbaoqrua3ItqDRGuJEFIo0lxpne1j1wnr+NdyYUFP9ugVeiibYe4k4yAz9d4PW0zK1
 O1vnPQj/+kYPrVWuzEY9jgeLjHAWf50vt3XUvDJ5fYJy7WOM4wjEHBJQsm+RsiuJxKmcGT0lu
 54u6W3QtjME3A/9BDbWblq/lMysT26D2pGCGoFRc2a3clHrO7ynAcuSx5pJ8u/uugh8qtvQOc
 wBx3VLmKD2GUAhKpRyrS1v15xsY6Hz7Ym+Q9T2GhH6IEwDEzZmm2lOpmMmHxIRjZ8y0ZSaQt5
 LfbUvvJevEhp5X74CAO2zHLcmtgkmgS4yA264O4KXsCIR+l35glMRPEctZz+LDOOrBptuPDgG
 WqAMj2pVLwePZLhwQbdHh6nKufzxGNad3DRgv3gjmbX8Ct++LNM5WsOTbrAFn5UsAjlpp9Rto
 5WQKY8s4VbFHpsEx5GA5W1idDHrMkAO7yYskY+sl4FXDMChS/uCisc4svyYLmPpXwzWmVFXbw
 jaPKcY5Uiug0XVNHe9/QK19aU8WE+xqrtrOaB29681aCfmQjxJodsb7VLGeMxBD9plJJbXcpL
 M29JTknh0lHW8jQC6BS1NDyqfF8On0/Myew2lR01hxBVOYe4HsICLoFRHIPtHcECVpdlGlsVq
 Zx8E102qG1L7ScJXD1hE8xxxQXqz69pvi62A/6CgV4KHtIfXpC/bYYrFQ6fxlmFFcaGrCr/uJ
 AtjoMNEJQP0N6W4+M8UQ1XaMOskUai6hK883Vt8ntvRzWV/uBD3XozkIhKhzBFZ9eVTTXeQII
 GHn3rCQ+wEAG6K2z24+Gq0pTqL/8Hz6znQRaHuUABHn1+CvNCOYZYZVXNIx7Ad+JXkL3x8NNK
 CMnAU3p2jp+FTZy0b9p+PM3xLBdXRYeWJWAipIqZ+uBqB887mz4na0tCUEdwMUEvWeFXWftE7
 0aZc8+4F09vVowSokHO/1eUCU5a3u0I8/RXuPlERzlrG2OaSiAoWuifuYPOC0Tna7PFBn4+b3
 LjRkH3TRiRqYkThM59NLCux/QH+sX0KW8KgoL6pZJUDBIQSopZYKEXJk4oFCusfpEBLXrN0aJ
 zFmAbrJE0e03zw5iZlJCiL+ycEwrTVw5eY4GIHO+AwOMhDxd4gns9TWT5MZkTmd9UrFLb17Dp
 ZRAt3eyeffgoceCjCVTrB3swSu/v+P41jezTZkvUl+RCGfL/18rzDmIjXIJWs/f5IbAf9eFZU
 g0AcvMEVzfjZLmvnZlv/A+zRM7Oql39BAULrBvTez1mXmAyJ+2gGf8RqDVSiRhs0hAROMeHD7
 LeHagc+V55Enet3h/S4Vq7t/K7QGhbqw2R1wwYU/0R0xYB7hlX7Y7pX6Q2NPE44+X94MRuRKz
 4gO6fAEcG+d3sEdllgGnlBeAjUbp3gOuAj7M9mkrx61NBG+DwG1v0HTyJiH2SPYCCBGeUobDq
 VdIFFYkhelFraZx8hXbeZOnl0hyde/2e5lT9Z9TJfC+FJKj16nigAr09U9uLYPMscZj1muPK4
 sea4hbHaY/72jTwz+q1ZoKM6jOp2qU1vqDta6KEg+jpalFFt3HzhoLIODaPiGpoogmA6Lzk6L
 sgBbKzbI8BoHQcFgsKLzetV0f/36CZYt26cfiI4aOH7jVHcSe7nZeroe7ClQ8ZmWujrepbUJt
 818My9MU8dyYVDV+ed7iVBqMYQhJh1YjsyDm+iZSJXfS41J9rK1yCuZE/eB2ubDKhDkoAcAGs
 lgtGX6mzkPAfKzBiInkoow8tzoZFhUzFC+FaHZ69FDrnuy94UNI3qOsYIdAxu52oujeyKswwH
 aK0dmA2/SEVHaWrc6sq/P3+g7KQG+eBGtAYPnGHaEvjXWt4wy7l7y3MQjfZx4Nifcfs9wRNQF
 gtuAfHYpmbzzjoy04ZZWzxkCbtFacmZlC1pb8IAB6HGUFvQgsAc9DoZDhC/MKHq/mX4H8Siai
 Lug5P9bEbKK8oqWWCJOrRzqxebgetICstCDRwrrFmteTbNMMcWCApgNiTg4c08FKZwzqczHBH
 aLD/dlQnVOs14GA2g5NwVDThu83YNxR5qAc5frrNMMBHXzItBbWqHLRWRJWMJ0kFG1jRKnqo6
 j/gsTUnT45jlsF5Ag4Pqb+5DsDaZD/H6NjOMbyHe/fdFlLhSPIAkLvBrTxmwHTkjoNTCodcMU
 QTMNC9JpDHEaBcHOd0D07trGHVLT9ezhV6vLP1378mu1UkOOpBv0NzKpT5sU5+FMD53Kq5qEV
 IUY1s7S8U0u9EtXmE7PO2XveBJgQdEd7S3Y+xd4BKnSp7oLQOQp11Y+6Yuatwkv6vfbaAcBZU
 D7ZJs5wQDMLY8K9vBvOcoGT1+iNszrUZRVrYoZUzpsh7Zvav+bq1UALZLEBLAQvkW8CpWg+Xi
 PkPVIhyVStQdguCUnT5FwT8h5ws8ul1juhSP30fqMo1uYzC4mB9nBAylIivW/1eo7BnBd77O+
 J4nn73mI1HdorMpra8Nk21LfJ7qKoLUFl07WF5Pu4apnx+bAd5N7vpn6J+u8wUSe88L38XeLs
 D4oz9+W8c63E1oJqSHcYMLb0EwqYgWzmwop1AsDKyC/ByKatLY50stvOqiugwXNDEI6A1wX5e
 J+bp6q+sfvqZe31mj3zeCYRZ+/VsWKH+6Xjqc1RoEffLDCJ+mGGjbwxS8wYNggnstGdRiEBG4
 f8dnW517uAWtnfKtzWxS+cU9zyCkqHOAPZ4CZ9RUmoaSZZd10vSZnOU9Ycap4260SCHp+uKAT
 rxTy+ZC5Me0oLfpcrycYVCXBqILa637vJ1EHCqUxjp1Hj5//K2LsAZwY5JNWAbY9pYDnOvyaq
 bkg5cB4rDiw/92TOC8vwQlsvxQIeLJQ6iEXwLBixGRM9QzIBqQrU/W3JOr6+4sLGoaLbZ3Yhl
 92DkRzcIo6GV7Cg9vOheiZyaOOWJyZs/BmINHiHN7AbzM3I2rkqTO7aznkq/lhzfgd/3lFopp
 CYjP6Rh7JSmPh4qsNB8BHmHyPOt+FyTqdce2ZjkqyAtWYzI=
Subject: [Buildroot] [PATCH v2 3/3]
 support/testing/tests/fs/test_squashfs.py: add test with dm-verity
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
Cc: "Fiona Klute \(othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

This test uses the option added in the previous commits to build a
disk image with squashfs root and matching verity tree, and boots from
it. Building a kernel is necessary to get the required device-mapper
and squashfs support.

The test also serves to demonstrate usage of a verity image, more
complex setup may use an initramfs instead of dm-mod.create.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* use BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS to set hash
  algorithm and check if the value was used
* update kernel to 6.18.52

 support/testing/tests/fs/test_squashfs.py     | 90 +++++++++++++++++++
 .../fs/test_squashfs/genimage-verity.cfg      | 14 +++
 .../fs/test_squashfs/linux-verity.fragment    |  8 ++
 3 files changed, 112 insertions(+)
 create mode 100644 support/testing/tests/fs/test_squashfs/genimage-verity.cfg
 create mode 100644 support/testing/tests/fs/test_squashfs/linux-verity.fragment

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 0ceb4cab58..62ae8d6c7c 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -1,4 +1,5 @@
 import os
+import re
 
 import infra.basetest
 
@@ -55,3 +56,92 @@ class TestSquashfsMaxBlocksize(TestSquashfs):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     expected_blocksize_in_bytes = 1024*1024
+
+
+class TestSquashfsVerity(infra.basetest.BRTest):
+    kernel_fragment = \
+        infra.filepath("tests/fs/test_squashfs/linux-verity.fragment")
+    genimage_config = \
+        infra.filepath("tests/fs/test_squashfs/genimage-verity.cfg")
+    hash_algo = "sha384"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.52"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
+        BR2_TARGET_ROOTFS_SQUASHFS_VERITY=y
+        BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS="--hash {hash_algo}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c {genimage_config}"
+        BR2_PACKAGE_CRYPTSETUP=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self) -> None:
+        img = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        hash_img = f"{img}.verity"
+        root_hash_file = f"{hash_img}.root-hash"
+        verify_cmd = [
+            "host/sbin/veritysetup", "verify",
+            "--root-hash-file", root_hash_file, img, hash_img
+        ]
+        infra.run_cmd_on_host(self.builddir, verify_cmd)
+
+        dump_cmd = ["host/sbin/veritysetup", "dump", hash_img]
+        out = infra.run_cmd_on_host(self.builddir, dump_cmd)
+        params = dict()
+        for line in out.splitlines():
+            m = re.match(r"^(.*):\s+(\S+)", line)
+            if m is None:
+                continue
+            params[m.group(1)] = m.group(2)
+
+        data_block_size = int(params["Data block size"])
+        data_blocks = int(params["Data blocks"])
+        sector_size = 512  # default
+        data_sectors = data_blocks * data_block_size // sector_size
+        hash_algorithm = params["Hash algorithm"]
+        hash_start_block = 1  # skip header
+        hash_block_size = int(params["Hash block size"])
+        salt = params["Salt"]
+        with open(root_hash_file) as fh:
+            root_hash = fh.read()
+
+        # check if setting --hash in
+        # BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS worked
+        self.assertEqual(hash_algorithm, self.hash_algo)
+
+        disk_img = os.path.join(self.builddir, "images", "disk.img")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=[
+                "console=ttyAMA0",
+                "root=/dev/dm-0",
+                "rootfstype=squashfs",
+                f'dm-mod.create="verity,,,ro,0 {data_sectors} verity 1 '
+                f'/dev/vda1 /dev/vda2 {data_block_size} {hash_block_size} '
+                f'{data_blocks} {hash_start_block} {hash_algorithm} '
+                f'{root_hash} {salt}"',
+            ],
+            options=[
+                "-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                "-drive", f"file={disk_img},if=virtio,format=raw",
+            ])
+        self.emulator.login()
+
+        self.assertRunOk("mount | grep '/dev/root on / type squashfs'")
+        out, ret = self.emulator.run("dmsetup info verity", 5)
+        self.assertEqual(ret, 0)
+        state = next(filter(lambda s: s.startswith("State:"), out))
+        self.assertRegex(state, r"^State:\s+ACTIVE \(READ-ONLY\)$")
diff --git a/support/testing/tests/fs/test_squashfs/genimage-verity.cfg b/support/testing/tests/fs/test_squashfs/genimage-verity.cfg
new file mode 100644
index 0000000000..13761dca8e
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs/genimage-verity.cfg
@@ -0,0 +1,14 @@
+image disk.img {
+	hdimage {
+	}
+
+	partition root {
+		partition-type = 0x83
+		image = "rootfs.squashfs"
+	}
+
+	partition verity {
+		partition-type = 0x83
+		image = "rootfs.squashfs.verity"
+	}
+}
diff --git a/support/testing/tests/fs/test_squashfs/linux-verity.fragment b/support/testing/tests/fs/test_squashfs/linux-verity.fragment
new file mode 100644
index 0000000000..a559a51ee2
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs/linux-verity.fragment
@@ -0,0 +1,8 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_VERITY=y
+CONFIG_DM_INIT=y
+CONFIG_CRYPTO_SHA512=y
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZO=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
