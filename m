Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D97CCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D6541980;
	Fri, 12 Jun 2026 16:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOujDFH-LT1T; Fri, 12 Jun 2026 16:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7165141977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781280601;
	bh=vCZ6k15QQqu9wQ90W3c9xSfbfPZ3mzOkM2wMY9wtZdo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OXFnNcpH+ojqnNaNm+Df1Vx2RFpUnVgdWHIp2KE+pSOI+icdZp0RvStwDpYExTnkX
	 p2M2QqqsYiqqoGh0Db6HXJ/WJd4EBzJS6J2WCa8diCDnSyt85QVqi9nKdydIXF2dcJ
	 XCLBHogUIkSSJ/D68BfLQsGHxgT/E0xj5Laims1GV+y4PUpi2D0DGTky+1eoV4eaiI
	 6invIQ3JB1SxSQQ896j25we+bwzwxdvpGnrZgQyVEeAnofwhjWhH9Y2goLowLYLAJt
	 btvZv9AemW4BEoO66Om0d8nKLASyT/pH9A78igOUgwOSByy+noUn5WUAZ6nqMAvflB
	 8N6Pb/b5Ba25A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7165141977;
	Fri, 12 Jun 2026 16:10:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A270F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BACA4005E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyCLo4pkLSt4 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4E2140059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4E2140059
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4E2140059
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:09:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbEf-1wQ3iD2TFT-00CrZB; Fri, 12
 Jun 2026 18:09:54 +0200
Message-ID: <47d12470-1c7c-4e7a-a744-eae64475f3ae@gmx.de>
Date: Fri, 12 Jun 2026 18:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260609180654.825304-1-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260609180654.825304-1-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:uagrarZdvJqfVUi6Hv7vYIFt5yNYWJL+BAyKIlFaYeaIDVmdyKm
 eAX1p7nDcNj+N4E5pYFZCUwdB6ZsPrGUYMhvZ0rBkphD+7vatgA7U8Tm+azf/yma9rZO2t3
 xIv7ZqA8jgW7mKxlTUam38BZaKW0V5L+P/ep8qtw80LuB3X2yw/Lwnf18yuuW8ZlG6DuGU8
 9rnmuIjEbiR8pP5jSJVLg==
UI-OutboundReport: notjunk:1;M01:P0:wy3NAa3ed3w=;7muIeJQCXoGeP5Wa50wCZegL2eu
 DISiBXfQ4cDpw3SK/3kF1jBElWrzIeSNEc6Ku3a8SDO+0LF0TppoXE3lXsmmyhGUsm/0+zNEv
 VpQvzSsAfPSDOlmWdhyZ4UTARanqhN6saqzzw0rRUpaLMBjdZiVj6WGRYyUhPGAUIeoINS3ec
 m/jbEFJwl9tdKNCQVjzVxsYZCJYDcBMYFhofCgOC7Kcskm3AjDDyY5bVlmXSc5AGDp6rra3+Y
 cjE15AdqLEZWjLaKWuxNeSSsjDw4MjlP3AyTTsAcP82aWt9mypfJK6roDHrXSMR7gB+K3rzcX
 7OC4zu2U9V4Hvw9tah2regbz4atIjoODExm0bQXHMA2Rt4zsk1GvIFkQdGxpJi4D+ymRrHUdP
 3r6FMC56VF4haBBEf5/zKDTIr0/yFR0rwNMUWodaihb9bn1hxbqk9Fa5j8fQ7BgJgS/Du1mYn
 7B4MgPysj1WW+uqET9CLEmLlqwoxyoyHOBW4kIXsioZnR/YeQrXe9Crn/5KhKApDUT1WLJEZx
 06TawWvk+/5lD9ZUoIGhbSbZwqyKiRoIutBGEU4NanR1vZtoxWeU9THVk4VRb5pg2MZS8dgnN
 7MXlIcORPbEsguXqeWK+R1b1asOHBBYgvkuViiZYQ9j4ncKcBXtCICNKHPz/mppeEo45RrvW9
 A40G6zUc3ZcqqQzQSW7kohxO1G80RdPPNj9dHQLe4wFKuvn8hjNqqpGDAtW/HjjWnmLCv6rgc
 O1q4X/LO3L3u4nKCjGxtjc/bMgOAFLrvxLunfHWOJh9QTF2wzJtPiOqqAEqDi4kzb54cj7P10
 +bz87D+y1jDFUogkk4keSJw/ycaTPtvfd1rIZCeioHFt3l5GtGYnZM4hZSi1ksfVwg+tKPoiQ
 DJBN9FEzFrm3Bm3wm3+mmxhtsJWzd14rBu+h9i9tg/MBmlnavDqash+Hw6dt+3CedFbxFnVAI
 S4i0t3BKkBeZBfkb3IuV/z1GRCfJwsHf20wudnkE1qeshe9Adx7tGyxansAN0uU4YTMrSKRVV
 P7qcp49oP/5OB4um6Rw1yGi6zMHGrqO4eh3NH2b/rBwzj4yO0phl9yAatZ9DxQUg8vhzqxBg+
 DNdRO0BvVox6kvauZc1CE043UArwt+DduA5D5hpMK5PhHgg5eEiQzsWnhmAdVvN0mxyWlQKFu
 JTwo2WahIgfBdQHHpiqOqLAlxKXJ1MCcvpR89+ND7e3vNaJxvYNM3FrEQpK+npvr24ldLRM67
 9U0zXqEWnTMC/btUeR/44aSV04fYxe1eUY7T4CVNW7qgEFTycTRfJr7jU1xXjmTYzidBsJIA7
 I5jnCeSBkrGcZ1RJK9/AD4n2HIq7q9vjjGsN/XpHbxI9Q9k5uVulLppdqSB2mfZKO6s+x8xfC
 Et/DNMXOKlAlBtk2qUm+ONMKpRwlrvbLpSEMuQB1XiFS+TDDR2U1XICANcFARrMo/nkniwray
 NKrdZoc9yhiuDrxR3WV2+vxia2r/QNC3dvql6YQZ7QJxNi9lrUSZzrFnmVp6MxJ5ShM5p9X8y
 mvyTeRN/ox4ubHP2a1JNGXzt0RTCAebtLMTu2SfnrMonrgXH9upCc7hb3BvnhpEjtaAsrYtKw
 VOLvs9Hr41jU2HXbqS4ugSLElk6NXgScxy87CDNR8AZZlN7aWyPrf7MyeVqGwXJCUcTrlJox0
 9Y7txS/ZUB5XzkZDwOAKGboo+m3r/siCx+vS5p3EDzgfOIIxbmaYTSq5oa+/uIC/Sv2wb1hwq
 AHjIAhrW2VEZ9G0yLL7gFtq12naHnvEjk7RkTJ9LN5kE98hUQcZxwwzcWxXrS9PAr7aZY3SBk
 M+CU+vmdnXM60QsK4JJnaQEG1SDkiU/qiA8btm9I63tAQsYRecmqxtUh0PCoORd5PYq54ztUb
 GOmAUOmyNR9s90e9HCmlRNSQt+lNzsKh0NAO4rRHbJM9sppH24TxhMdvRBm5VE50ZxPL1gg25
 zILpZ5xf/cHIjRa533qC0iLBLvnswjj8Bt433jKJz5g//XIxcoP6FhLfS0Pi7XFoHgPifpBAb
 s0IqkFUq8omMiQXzWPK9dl9u8qcVl4Ln8YPHtcwE8QYkRHTzLlX2b+vNfUioQcDWZhDnERn9L
 t98qHK8IC74P9wcd1bjzgb9ts/EB8KWVNSJ81110v4YO8LqYIqhV9FxHdTfvjBvuWOz+ut5Lt
 b9hXRbneGG72mCVLehg+3CJjrgdhygUUjnMJQLoIg/o0WxDAWoIE1j97t4rj5fomZ9jbaoCrT
 DbL7eYmsqPusXYmzdQE60nD/u6aU+0JW87ZqRrDhqyfak9ObUCvPAHoM7OR+zweru8OPQza5Y
 juGMMoEHhJhI3E+mvRMPfgQG3FWcK9I6H7eGKD3GjRSLHN+LShJxHY1Qc2Jtst1M7qF+uX9vw
 JyNABUy1ar1S4uFfZdeqo7LYMcWDc5wgeH+fjXoqZ+cs4Z7+mR3Lfc5YM+XW9KGuDIp0Cc3dc
 vXuDCSzrfd70ZFpzLGTtxK6fkAh980Koi+sIuUaCIqA13fo0jSVCs8/jbAUdKwGxF0L3mKbgN
 59ZvRX8tW4ei5EOx2Uu/HW9jjRmpB39N7l6Vu7E2GHVKzc5l39U1RKFeFewGkuO0xKZqgA581
 fwLNNcZ7EUa/U+fp7L+VrX56aKG5aPUmCrxjZlgq1939scEMN5gCpq5YGrX+jkWM7XLDps2wZ
 /PGNcfwf6Loz+/JQHmvpJliA0dgAS/6pWqL8mI4bPItCyx0H1UQ36J2RendQvkSHDJqkd+/D1
 /YWHGd1mhzuxafTYr0vLClz7zwBOwXUqYBNoLc71NPVReRKV/SIAq4ie9Z0yWfvdfq71xRkik
 SC1fnVqkW6j7y3Kz4OmdHwsHaUhtzxazZiAyUR8KuBb/V06gB34pCYsAPS4d1oafzEBuNBgpc
 2WFlr4ToBsNxEbt2WK9XrH11PWvPOksPp20yTEQfEAlp2U/n8aYcZQdOZKy/LcLnhW7Fkc2VC
 3UnQnrmeP1GLZsQOKPomwQLYw8hve0M703jy9Onlaw4kSBLty7IzPyCHUOPjqCNTIezBdSo5Y
 toA8aqZs0tueG4kXhP1EVFYGn2H3n+Dgg12Q/q25vAp51nrnKbiHWIWTMhNp+VXckjVbQlmQv
 zH5tBFI2f58k2H2ZiH3N/Rn2GpG+rW+X9YxRpGBwFpFIUc7NrubxHRNX57Jx2f8BIBagQI7rF
 MgS70dfWrk2GdOQBZRX6F/m/FeoFae3cCiv6h2mAhIXK+jIr8w9YmQR2h9sIcxg4WPuuB9CaI
 1PpTN4+O6+mC0T8X2JcK4GzscxO5imysEs4W0ziI7xsg1Lx1figLLBUtzgYeHWbulA9gOU6kC
 eAesBB4BQjEdQzcRL62Y1aAkrzK5Z0AeVKJtGpCwjKfy/5raIEGk/W/GEEIVFjgBexPX3hGf5
 jVqRZbVVbnAEuouClT1Wo3SRdRHq8nQkoJbUrG4fRwFg/ZZeAIQoNXXwR6YMpim52/ryN5Yfn
 CqNURcxxIeoHgqeZNJ4zcKk2j82lgjSYbZqyDPEn3Ol5fSJkTBCv9ubLs0AltWTYaVtuJ/WWE
 3w+1qfNqqz0KEQd9EW/4Ds53CNzizvH+28eHK7kJstPqsaSM11Bc3QgQfwLwNY73iJYWoNANr
 fRx/pzctS/pgcAnPs9ZT6ye1rHiJKaFdPLdgc4YiLk/HnjOsIVXHePiitpdV4aYnXGh8doObO
 nvOpa/aOUofXsmKGmO0kxYgg4Y3AU70jtHZyVQOGFnhFhO19epSEkkfvWG1Jq9sXlPbf5TMOI
 E3yX9OJnJmYpOWrctPgEumYvYri98BUcI/3ZqOsNV6BN5LDvakSxhinTyx+aS5+CqvWrkjUNQ
 ys6dm5J2dTXBwQw0+nidwhXso9RRUdwRWSpyM9E2/HCNToz8Bfw8lxNoijaxWh5k1oCuscziQ
 WCOu8PrTLzF6AdBs3LP8qylEKUI4LbCLjf2ayhr0Ayn7s3W0+6uBS3R5fnck0DbFN7UJmgZT3
 F664GBJL172z5Z1llJintddsj00LLjhg240un1DlDmzpNMrP8x0/x+kVNVd7bSEukYbgj9lVY
 K3fbJdggcOdUDtA/nT5tlHq4mLN+zqozkwCIyQtfki/Bb2f2uCVATSQu4feDcmD9iFZI//RQP
 1QAEJ86PfDSS50cyzxmBghnTL8pPZayub8SCvG3YOMD2Bj0r8vLWbjYOORO7tyYj7u6dJMC+k
 ub1O+T5pIsNpv1uoWXS57mQEw+jVb7zRcaWFLcrmedJP8ovgUlN+nEj1pabpTGioYa9lD/m29
 L3gtcYNen7PEcVHvJkz93F+18qOvnHx6XSfNaf4OBZnhhuAZ37UR+4NIdHXWfu7a+f3kKneyl
 RcBu0kgfYU7Cw2v+atCjZt7FChTjhyLhPOyrFmhqyLQ7Nw1Bynl35e3IKPOQMtteKSPA1M82s
 2rvDsHI+ui2vfQlNlDZ3yuw9O8R5q5qdQWkATt9P7TMo+8R91qv9SPRyy1MFvd888W7Og6Ki/
 1EWiKlZv29divFsVN4NsHUKqCZ052jumGbSex5VBTd1/0YtkfOm+ONa+nrWU1MvkAwq0hlrHo
 uSceEe5cyL3zS8fZP2PGX4Ix9GsGhj28jZQikBSLEY02ouc/w2wR2i8JZfWtbIXwq3c9M5a4k
 4FiyZAGETS79nou9HtvPncK6z+hvMv5nRdCN7H6jJH3CxJsYKF8XQagfGsyPgkCwEESRko++m
 GkEBDri5RJXVyUnUCZlunJtNGlIRNMiHfDzSdNFw6ljzwYQF+pNu+UJA9BnOHEuHuT5sDFkiH
 6v5TisldoRKzagX6dsZb98b8r36Wmhp/Slupwz7WHgADIAdlDOwpPTnsZ1cMJ8LzCraUWFW9t
 kVYseqn+b1Ing69yDJhkPX78ojgC3SGt23Z6xZrOYOVYGPoRogMIKuWkchYDrq7bwo+DGW/+T
 KJIZ7mOLJDOH3AYwnSs7FFgyaSBK0kWmPQDBpAnQwTTazFLtXTvAioANq3TkBNGM7gJkzd/Q7
 BCRqQrcX1j500C2aM5lsUpVtolAZg60FRJ3gQ3LqbUc4RJCeTcM2dSlwHqlpJjqHylYbqVPME
 qdNzj7pIMfgOeD1xXubXUpK8lTPLfJzvYuQO+O0Ez3om5/VBP3YArHHuoDwYTcph941MVpYh7
 zC/aDizp1yMmxsECciKu1udnJNVzBAHiwJjzzI4YkGNeE+139FYTLJY3qf7M6y1rfZl2MhaP4
 aXW35T7fuPe1fYZuI4ZQXQMzZcmXgsSy0cRwniYoXfiQb1h4/VX3d8LoH9cB3A1OR5y+MhWL3
 fMhzM/W+zyB5NCpy/UBgCBLtG1XIF5JHyYfYduX9r3NKcDwfKx1MwhlQ6ES4z9UbB5PcDWzZ7
 VJRvtHT43fdNmx5Q0pDHUp/HD62hw3rOrOtHFlbTlOMGTL6tqrk45ieN8dA1LOSF8P7sOaz+I
 h+RcHr5+zvkWefWTvKDdHh/K/BZYth8tvEX0Y+Tnq34iKkjDq7AsMCyMsA64AaGcmQ9EwvWlZ
 kGKsuy//YZVaWJ+9bcjPOlFjhq/kzGMhuefLSL6Bz6D4NV/+hjYyhLKVVYpGVoDJ5wfzn2Qxm
 ZMPFBOGVTEDDROQniWhRDSek2xOPugr0vFznk4LmA8oZtJRIhoIKiDmJ9rIFqlVUzE5lqWX/v
 W1aABHAeYpfmsw4yWxV6bpPUp7uuTlM2SK+c/Y6C3Gl3HhV4wKKzktn8ksmbg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781280594; x=1781885394; i=fiona.klute@gmx.de;
 bh=X2MbKWHFu1oORxw7de8u4uVzc99DsFLLzgyhnKnUGuY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=E7zo7wdqkhdNPAeYDmtt4uA4Afl3Kl0rrEhu6z/faDn04IWhaEGQvKOuSh3RtAV9
 Vfs8RTB1QVsu/M1Re5aSRif0KvrL5Jif4Csisy/UNWb7Mi4fMiUW8Jccl+Oy4qh38
 D3GZPSbcRRtsvpbnRaQqrv0Rgm+dhkU0z09obVWngys/JX/GvNVA+Uw9o5SEhDz1H
 pblyIIyZCeuteBU0Uz1uC2az4IAtXsKPDEFtAVpkYSPytYO009wYLmMlaZlGggUv0
 qsA5Oc/RJetEUxuOVnrJc0WJUHbfkw2ctwwRc+es066t2KLUIJ8LYzipu2uDxiJqu
 74OuYTEKMermbHZI/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=E7zo7wdq
Subject: Re: [Buildroot] [PATCH v2 1/1] package/dbus: bump to version 1.16.2
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

Am 09.06.26 um 20:06 schrieb James Hilliard:
> Migrate from autotools to meson.
> 
> The COPYING file now points to separate license texts under LICENSES/
> instead of embedding them, so update DBUS_LICENSE_FILES and hashes.
> Expand DBUS_LICENSE for the AFL-2.0 dbus/dbus-arch-deps.h.in header
> and the bundled TCL/pycrypto-origin code used by the library.
> 
> Drop the stale optional xlib_libSM dependency: the meson build only
> checks for x11 for X11 autolaunch support.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to master, thank you. I've made two edits, please see 
ef2c002141e1beda2c648c049c60c5504ae1920e for details:

- include LicenseRef-CMakeScripts and LicenseRef-GAP in DBUS_LICENSE and 
DBUS_LICENSE_FILES (they apply to one file each)
- include link to the primary COPYING split in commit message

And on a personal note: My first commit to master as maintainer! :D

Best regards,
Fiona

> ---
> Changes v1 -> v2:
>    - Enable user-session semantics for systemd init builds so the
>      systemd user service/socket units are installed. Keep it disabled
>      otherwise.
>    - Refer to dbus/dbus-arch-deps.h.in in DBUS_LICENSE instead of the
>      nonexistent dbus-arch-deps.h source file.
> ---
>   package/dbus/dbus.hash |  12 +++--
>   package/dbus/dbus.mk   | 100 +++++++++++++++++++++++++----------------
>   2 files changed, 70 insertions(+), 42 deletions(-)
> 
> diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
> index a06ba50ccd..fae6b796e3 100644
> --- a/package/dbus/dbus.hash
> +++ b/package/dbus/dbus.hash
> @@ -1,7 +1,13 @@
>   # Locally calculated after checking pgp signature
> -# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz.asc
> +# https://dbus.freedesktop.org/releases/dbus/dbus-1.16.2.tar.xz.asc
>   # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
> -sha256  ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f  dbus-1.14.10.tar.xz
> +sha256  0ba2a1a4b16afe7bceb2c07e9ce99a8c2c3508e5dec290dbb643384bd6beb7e2  dbus-1.16.2.tar.xz
>   
>   # Locally calculated
> -sha256  e61807cd1c32ff4e7bd5b4b61dd21997c6dc5642cf19316124fe38d50e1f9fa3  COPYING
> +sha256  150e5d08e1cb5e62b65967d7931acad2c42d98ec1bbb584bebb01921cbc853c2  COPYING
> +sha256  7ecc7db84298adb05d2cf10339c63a5315a1c5c270a68d97d7d40a53b508ccde  LICENSES/AFL-2.0.txt
> +sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
> +sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
> +sha256  2cb8f4f410f0ffc5dcfbadd188e20c859fdbb161e616cf2f3d34dfbf8c740547  LICENSES/LicenseRef-pycrypto-orig.txt
> +sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
> +sha256  36fc2d8a56a2a014ded51e298a7e63635eb4ec62e8bedb99c82b892542ac5e7d  LICENSES/TCL.txt
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index 7b97c7604d..6913b1e211 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -6,11 +6,22 @@
>   
>   # When updating dbus, check if there are changes in session.conf and
>   # system.conf, and update the versions in the dbus-broker package accordingly.
> -DBUS_VERSION = 1.14.10
> +DBUS_VERSION = 1.16.2
>   DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
>   DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
> -DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
> -DBUS_LICENSE_FILES = COPYING
> +DBUS_LICENSE = \
> +	AFL-2.0 or GPL-2.0+ (dbus/dbus-arch-deps.h.in), \
> +	AFL-2.1 or GPL-2.0+ (library, daemon, some tools), \
> +	GPL-2.0+ (some tools), MIT (some files), \
> +	Public Domain (dbus-sha), TCL (dbus-hash)
> +DBUS_LICENSE_FILES = \
> +	COPYING \
> +	LICENSES/AFL-2.0.txt \
> +	LICENSES/AFL-2.1.txt \
> +	LICENSES/GPL-2.0-or-later.txt \
> +	LICENSES/LicenseRef-pycrypto-orig.txt \
> +	LICENSES/MIT.txt \
> +	LICENSES/TCL.txt
>   DBUS_CPE_ID_VENDOR = freedesktop
>   DBUS_INSTALL_STAGING = YES
>   
> @@ -27,56 +38,59 @@ DBUS_DEPENDENCIES = host-pkgconf expat
>   DBUS_SELINUX_MODULES = dbus
>   
>   DBUS_CONF_OPTS = \
> -	--with-dbus-user=dbus \
> -	--disable-tests \
> -	--disable-asserts \
> -	--disable-xml-docs \
> -	--disable-doxygen-docs \
> -	--with-system-socket=/run/dbus/system_bus_socket \
> -	--with-system-pid-file=/run/dbus-daemon.pid \
> -	--with-session-socket-dir=/tmp \
> -	--runstatedir=/run
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -DBUS_CONF_OPTS += LIBS='-pthread'
> -endif
> +	-Dapparmor=disabled \
> +	-Dasserts=false \
> +	-Ddbus_user=dbus \
> +	-Ddoxygen_docs=disabled \
> +	-Dducktype_docs=disabled \
> +	-Dinstalled_tests=false \
> +	-Dintrusive_tests=false \
> +	-Dlaunchd=disabled \
> +	-Dmodular_tests=disabled \
> +	-Dqt_help=disabled \
> +	-Druntime_dir=/run \
> +	-Dsession_socket_dir=/tmp \
> +	-Dsystem_pid_file=/run/dbus-daemon.pid \
> +	-Dsystem_socket=/run/dbus/system_bus_socket \
> +	-Dxml_docs=disabled
>   
>   ifeq ($(BR2_microblaze),y)
>   # microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
> -DBUS_CONF_OPTS += --disable-inotify
> +DBUS_CONF_OPTS += -Dinotify=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> -DBUS_CONF_OPTS += --enable-selinux
> +DBUS_CONF_OPTS += -Dselinux=enabled
>   DBUS_DEPENDENCIES += libselinux
>   else
> -DBUS_CONF_OPTS += --disable-selinux
> +DBUS_CONF_OPTS += -Dselinux=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_AUDIT)$(BR2_PACKAGE_LIBCAP_NG),yy)
> -DBUS_CONF_OPTS += --enable-libaudit
> +DBUS_CONF_OPTS += -Dlibaudit=enabled
>   DBUS_DEPENDENCIES += audit libcap-ng
>   else
> -DBUS_CONF_OPTS += --disable-libaudit
> +DBUS_CONF_OPTS += -Dlibaudit=disabled
>   endif
>   
>   ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> -DBUS_CONF_OPTS += --with-x
> +DBUS_CONF_OPTS += -Dx11_autolaunch=enabled
>   DBUS_DEPENDENCIES += xlib_libX11
> -ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
> -DBUS_DEPENDENCIES += xlib_libSM
> -endif
>   else
> -DBUS_CONF_OPTS += --without-x
> +DBUS_CONF_OPTS += -Dx11_autolaunch=disabled
>   endif
>   
>   ifeq ($(BR2_INIT_SYSTEMD),y)
>   DBUS_CONF_OPTS += \
> -	--enable-systemd \
> -	--with-systemdsystemunitdir=/usr/lib/systemd/system
> +	-Dsystemd=enabled \
> +	-Dsystemd_system_unitdir=/usr/lib/systemd/system \
> +	-Dsystemd_user_unitdir=/usr/lib/systemd/user \
> +	-Duser_session=true
>   DBUS_DEPENDENCIES += systemd
>   else
> -DBUS_CONF_OPTS += --disable-systemd
> +DBUS_CONF_OPTS += \
> +	-Dsystemd=disabled \
> +	-Duser_session=false
>   endif
>   
>   # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
> @@ -122,14 +136,22 @@ endef
>   
>   HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
>   HOST_DBUS_CONF_OPTS = \
> -	--with-dbus-user=dbus \
> -	--disable-tests \
> -	--disable-asserts \
> -	--disable-selinux \
> -	--disable-xml-docs \
> -	--disable-doxygen-docs \
> -	--disable-systemd \
> -	--without-x
> +	-Dapparmor=disabled \
> +	-Dasserts=false \
> +	-Ddbus_user=dbus \
> +	-Ddoxygen_docs=disabled \
> +	-Dducktype_docs=disabled \
> +	-Dinstalled_tests=false \
> +	-Dintrusive_tests=false \
> +	-Dlaunchd=disabled \
> +	-Dlibaudit=disabled \
> +	-Dmodular_tests=disabled \
> +	-Dqt_help=disabled \
> +	-Dselinux=disabled \
> +	-Dsystemd=disabled \
> +	-Duser_session=false \
> +	-Dx11_autolaunch=disabled \
> +	-Dxml_docs=disabled
>   
>   # dbus for the host
>   DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
> @@ -139,5 +161,5 @@ HOST_DBUS_GEN_INTROSPECT = \
>   
>   HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
>   
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +$(eval $(meson-package))
> +$(eval $(host-meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
