Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76030606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UjZwIsSe
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51CC340844;
	Tue, 17 Nov 2026 23:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thieO6dU4Qj4; Tue, 17 Nov 2026 23:13:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1F1234073F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794957181;
	b=VzcpvsRtEo1C77cIYIYuaN636cpByFsB3uzE+FmaWiCrg8vUDXCi6CsSytgw+Pb26g9F
	 CIpqXpbYzagb7dRhJPfFa0bxpVggJwmwJJ4uuRdVDiLUitDPN/GxRltpazKyr7fHonsL5
	 IRDOUVNCOyWlEFcL3MhM+lnatl9feJBTb0dQMsmWKxm3u7dUMql8pCczuoruFfNWcuntI
	 Zg+C5zyYchAtRrcBes+ddFmIYKLj8HnkDvdAzNPIKLxJAeE2gSSm7+bYow2ZTYleXoyNQ
	 f7eDIx8Y7NcylrUp4Cul0z6x4Lx8K8cQ6GHa4XN0UCdy4hXwz+R7xi/867oOTd40I/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794957181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=OEqFnAqYR1utmqqQjOhIXAlTHSxEQOJ1wa4/9tU6Uj8=;
	b=m0IF7dIWutE4CnV7u1u+usqoWlMdj9FY/8f9tMYFIz8rYOXkrlXvrl6d5VfJBMZnIgWv
	 PNy0ycwBUh7IRM4gIeWF9QDGF06R5bMXlGc/1aVjdCJ00EVPE+5V5UDtd4bTynQWw1Ouh
	 vTpyr8cB9oyIL9RIopFrmxOC73cQOSTkl9ijWMs8UYyLJqSedw4r7+oezhKoF/Ks/78r2
	 0ft8TEkA4kiVnrewJPnY3Uero/yeVo5cB+8dnugw7Z6Qr4wvH/EmR2PsOquIacNvSjfSL
	 LpFE3W25PHV4yebv3H3Svul9LGUoanyqflAxBqink6fQ0lnQdwkfIRM5O2NtWAm/lng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794957181;
	bh=OEqFnAqYR1utmqqQjOhIXAlTHSxEQOJ1wa4/9tU6Uj8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UjZwIsSet3PUImNJMq6aYeg8illYhmIn8FwP13e7m6O0Wkt6ADr0FYXtuoHVJRnAx
	 rUGGxD4xcEJB2e8Ed8x36J3BDDjSztkqgLW1+tRbuTJT+NfScR0G54ZaFiarmVXFnC
	 dUvk1hxUfUSZ47eg5K45veuijH5DbIybB5jVR6D2JHP4/x0t8n4vXb/U5dFvJhKhym
	 PJ4KbK66KXaegw+AqEziPaXa4J2CNrmJXP+TMqaR/2UtsbjiLqjuKav8gU/0pyRNny
	 n6O1TVGyZEy1zCqfy9iOs1XeIDxMNERMgIOCeQa938pSJatJ5NRVBojA2kWhJ69EO+
	 Nn1hcopY5CcTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F1234073F;
	Tue, 17 Nov 2026 23:13:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 766F3A0E
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 23:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CECF40079
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 23:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJF_Xb-01j9N for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 23:12:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BD5064005F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD5064005F
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 23:12:56 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794957174; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:KHiNhICNIE0cvmr8uXGDSIy8l0Ex
 LqNm3GeG260GKGs47dmlmvBPve/8ykn9DhNWWqq6hPXg/I6bX04EMsNt7CLP/T2xNG2qIUpRDS/
 dKF1BrUpXL60/hAjL6sJ3mjW+UjNcZhufuueZnIGSv/aOnRjrxM6z8j7sOL2ON8LtldJ4mfY38f
 EuBkvjdUX42oQwgKMEE48h5IvqDLugWqNp31p9VMVLalfDQDmqcsHesTd12oJYry84+6pH+1YDp
 UaG9nFlpQADBVXp9H7zN2wGkf2TPjoOE0XYYPNdQ8a5dxutN/OnaVhOeayonu8ywcBc839wU0TR
 jcd9NYKDETvDZw==;
Message-Instance: m=1; h=sha256: 1A6r7D1WqcSPT/mygh5p6wCtGYVpfyDeHfCRmaMGR0U=:
 v4fqC5vciay5QscaZnauMxyjG6HXjBttPZO1hxAOaBU=, sha512:
 irOyrQhaejAPPSxrDw6g43WW/UIExHWlV1jwHaJMrL+1iFD4w/OWlqpsqOu0lGZy2fOJSvirpLP164o7prpFvQ==:
 ipJTEkVSKJpbDxQCCLCu0tzG+6JJfML+H9fzkyBjy1K0pQz0BqJIIcMVhUS0kGuAQWiAMaw4zB6j2uWPa34HRA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N33Ib-1wQeLo44GT-00vNbK; Wed, 18
 Nov 2026 00:12:54 +0100
Message-ID: <297afb50-9c08-4c40-a4e1-fe8a541ff19b@gmx.de>
Date: Wed, 18 Nov 2026 00:12:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20261117165244.2866822-1-ps.report@gmx.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261117165244.2866822-1-ps.report@gmx.net>
X-Provags-ID: V03:K1:6Y0e55jD2Gdqk5UzovbnHi/EfAyM4Lr7+QG5/nhzCeKw/8lgTP9
 3h4Xl+aNaRFMfLOPiM0DxXsRUwmU9/fyQ09ysooAARXWS6w7Wk2d5SB1Dvg9M0QMRe+tgIF
 g/70NK/htCjjFcrQD6M5qvxVYwyJ/aMQzQwvn1T27K59ZpHUWxajGcZ400CR/Y6q79kjFGl
 SnSXjQTFs6ubsPKQql9TA==
UI-OutboundReport: notjunk:1;M01:P0:4MPWJaajtLE=;iTHV2oz9RSBv6n9xYWpIKsZrO3q
 htScXUeKZvrYTqDKrhk5ZYGxVfF5QDN9hLcOk7C+QxQF6Hp3dxq0jjOtBrXOP/GEljU50euFe
 2xdZ9NmtC8IpVC8mIqDm/oBzFvtAa0pNnBlARmBnnYZzmYgsQSHW32t7NdvTGhHJTAM6M7yyv
 bkqQD+CURvDXnPHS5+d7QPzLDvPGSRlO+xs9WasVT6bH/6LRkfDvaet3LPe72KS1gOn96rtht
 0yn90r2++730VfiEzYx0mp+TZe6ZTHMA1jjthExe02cfQ7ufX8CUkOAg42cBVSd43roSWHsVW
 HRoDAX2zvSyjB+Re/Bzpl2tpCTbih5mgLRa9vJfHeBIsHtgGvoJ6ypvu67/+4GGGz+qY3XV0N
 OtJfsVjYP4Sv37dX3alcOMyWJUlfqUnggjiyEX3RbvnOJmQ1pjNPj5zM1qQkCk/bFqVCM8DC7
 kvFWzYKfzKcMe6Vj5RmyjX5PoMfB5ef6EFUz05BOVHL1VWi08L8AzlgYhJjvxaYezc70gwtvW
 JDgrJwQjpdeQebozoBReqfDcMU3I8wxGYz8Xqm2goUr1dafsy3yiWTKxumLS1VzB7M8fZwwQz
 go3li10pTMPsf/A2HIkaolI/eFDN184m7A/CHIb72F6mbKlprrNIJ/WNVSgc9VSSur8JcvlX1
 mnAEfNPfIw5/5VkyYhMZRpLRXiRrFSD0YS5Wf9wzJkiIKxKMPT+Z6Xu7nfluBHOHe9vZYWjIU
 DAOagKd+h87U/zxhr19Q93QaoUg78V0iaylg1ZNbSYTrbpm5SsuQZ1yuVqkODZnOOfReqJ1N9
 tOMBYQs+brtCvVcdwgOo6R4ktf9Olz7uDzR7zMODoB0OQT2D6j+ARk90jW6K9CSrGhJlBH7N0
 8g80w/7w4e7nWF3pxe/QdVh3qYHxY3fnPJxr092qZ4QI8S6sTeU9jx5Y4uynp9nabUhkBNOWj
 tZ5MfGrQb5U+jH1Cn3vJtX7SK5C7NhzudLLMrxrUokoupipPmJqOwG5FzjkQWSnlsHFHYpwpL
 sdW5JiPVonC+bRqhpauoXMWUmLfc6BF5aoB7RxmBI6602tJzUQ9BJApv2kg69ZjgSuUlUWjLv
 MEa9c63Xq2szvFN3YBB6nZ/7pchzNz2jr08Ue03h09XNv9xAVGib0LlSX3fZeBrHRdq8Bo/y3
 je3YDFovbWFTfTeDENcD8F+vXEwjfg8WSkKWvLwU3p5/gOrM2y1oqYu30OlhzyKmu+t4rb/GS
 BqM1RJk9ovcYv8ueRKgdD7NRtKJbt8tnmAonvWi4qkeFgSpoW2uWDxUHRXU9mBhR+w6XP/Xzp
 zYYK8hqodseHEdmBYmMIW4W33g02yOpdvOhnVQh9Lqai18/YXbFPacheIj23aKTqUQI6crcDW
 aMocVbygVrB9qt8HBH4ZJGT/j0xkRxJzLhBHdTwpLTJfC1zHx0uv6mjETLLTczmloTfgsLZB3
 hhLqC5kCgq4I8cGBG9A6x5aV4az8R+CtLN/x92etZS1qapk9UY7/F4taeFhqiokAQ7YSjLfMp
 gvBUnXlQG2xGF23ICBdvE8sPcBQT8T83F38v7JfGkvRtyItGlG7YBxGoDNwtJXxRibMcsr9zq
 diuFOmQQrey1a0DVDq63qLyCO8JKZFy7oxKUEHI5OHoJlgx8RJ0B2Nj5CXEKy54S5Yn25m4RJ
 wyvDMJFfvfZ5SyFRJpaAOKHDfSbLSY+0f16jdCWP5+XZSthwtO86ZG61UtQHvGfRNbDR/nz24
 9K/J7DdreZgSRVmDOpdsoytPnlIcKrZsP6lOjgwH/cIVd0txNo0Ck7crAbZckGG3mngh6sUmc
 rfLlTcEGl41425jGDi+AiY2Xua57YF4f0E0EeDS5J3l5EVpkuJWph7st2woqUQNcDS1+ZuCKJ
 ES0qP8yx6K5IsS19fHFu0Zz0EgMnDlMzdnvJ7S+Vzk2LFWBICfU3ka/8U/p2t3RT6nqtwX/AA
 k4OIqYifqxNZQQINm/wireDMeHZx3KzkS6upofNjR5cEuOgZzANAHkd/SwGDWGHG+MyAe3i9N
 aNk0hoUfJMr3L5MeW82Glbb56JUUCRavmXF69U7BKaTE4uIXrG16Xyo0xDp3UUSIKNigVG9SE
 PRDgfT7GCBayR72L+bSdNzz0BdaI3Iq8osjIh3Eh0WwnNDgsO2PqiptuXjrnL7nFc7+ZjYiEX
 iBWwOLdhOiuwN/o8Yu8wTwsaXXYc6FMFa8ygbVlkP4NJSzfyFsc6puwEL89AQ/72R5c1vU9N2
 asAzFOj2F6kajyngE9tgsEhlLbc8cy7vYv2U+MBG1cbZDJcdE78gi4LKarVJbNkNBGlsQtPw4
 cnYWgD/gNzGoBnlA5GbaXtL2hgNbz1HL2bgnIyFdHqm4VbvKH6QtxFFyxGwMaibMLXBeNtugH
 pAEdSZksI/RIiy9pxBfbtsrzg9CO4/DmYKJCntb+22LMqsmIWqk8QHbyj1BbjYV8BUFAQ2BJ4
 c9BNwbrIIpNNuJZFYBJcGXcX1Q4SYXZNLeVGiFPC8B54NxcC6GH32gIOdtL/4Hz6lt15cCWw8
 rm3l7PIyTM5gPwfZnoXJ1CoTw5zFpqocTsajwVilyQr/7rkUGUha7KDfZ+rVXQwzm6KsvTIGL
 AZrJo8SY19d0nCXdP2zlP64mDUTBAMeSOL9nDvvXi0dHUczaI+xSLQxd1COnWJFC/Y8l0Mq0i
 uIenh/hGlCCqzTAbNjJIP0wEAQciMdv/EQP/ttCI+htkqYF5lFisDQ9jENKNr35Fcfeejd5Ki
 0aQ67OJewI0cRnd0FWAWXznLfLVA36/tqLPOqjj6ydYIIaFRp6BHhvWKkZn/npmYzhWjuNLrM
 XGBTDqTo4W1McJ9P8Yl2f4sGD7zPBactjxuWyAVdXoXDrodZZULmIs6S8JdL4l5OaEkKUoBc9
 h2GxiC6RWvDZcZ0WDPkkqBo7nFN2DtmLKiBLtuITPjb9OpWc3uL8goc0btIT51zyQaFGtJmay
 RzBPy/KbVIbs7ul/FMvcFEYbPjibfLEwfVwRPgeSAQta5NAU9IU8GEJM3IinWK3wJA6MNXdpR
 3eZC+qhKClKlJTLl4uDcvYgp4l+EgUTXYxazlFmXsUZkuNqyxKmwO6VJSVQfRISYJEQgW4Hlk
 qfKj+TEdylwXE64ZfCGfhg7AlOUJEMpS6hQR5DYjMAq5AmHQxxdYZXwyR2VdVpRm3ywufmeAX
 zH4UiGivAK0wfffaTnezbFtyafanJA798S4p7dvIqMkICBFCzHKpCUZ3AOoknnZ6JyMPnqq05
 ywBqWPN7wEiH5inX/JGdAuVYQw24nGbAfgVapDGOyiLZHXznqlUlHbsH+kWuhji4v7NkPmKTw
 Aa2a3RESzhZp4URWEus/RSKnWMe1+DmsTbQGI1XnakmW05v2FPdEYWdZUNqwU4thxPLe7n5NP
 Xlp+YQEDMuecsbk6cZ9z4iMbToq1DyU5vFnh9ozArTkXxrfCW3y4mPZ9EoBhQDnqjaxtmIm4h
 fSyP+5cPzJPYLRmLLMQGnWASx6bHjdGarwpYlnnLPMvdmdETPhoQWZ+ZnoZK2c7Xa2ll3yhmV
 a0bUy/y1f4VEYkGozuQgKC6VbBOxT6nuxsPckOd71q4zC2GT5E/RGOfVqB1GuXs5gZ52AAtsZ
 /dawCDElPG0FBsVjTpBEsV9CQi01ZT1rp6SdLLZK9Aq1M1MN63b+tmG0htEfguCs/N8pui2oD
 Itn8TPNMSLRXhXYKMY+1Di4yxB9xFrEpNwiRHNsOYx5SyJMTLhtgzKWsEO+NPWVezav3jE2yY
 mu1+1kUrfmOrIEo1Z28bwoH08bm9SjLdnI05pBTKXP5JhTXlmj+ZXnSPRIT1aylG3VGjA3wka
 Z2/ZmrIVQlMjXI990jJV59LiQ+ZpIEjR51CLapEbu3o+mHxbTYSBafPGdV0NZkvZIZzTVdMTh
 qhWNEIFJYL+2BJExBaSM1xBB+lQbKdNs6Ty6AutGNH4F57D0W2kvDNX9IjMoZKEutKmjM8bG4
 ylALQQrqdf4fTcyrGXvSRJ3YjU+wILguuJPob53/3x2QuIIhhhu7D0DYLHA4J+0RLpnKdAH1O
 JV7e2rK03aWQM73hRIsqepwa+dvxRlw3kmsQYSDNIOP5Xd+oGl6GdS3uN4REOiwfI9xCbemIS
 O0YtG/Bw1ToNoIowenLm8g2TdYt99ffhdAd8tQpTcFMuNJ+4ka4oj2Vx41g18yd8JBv4y8leV
 S4A3GK7xEo+bKuQyXyjLp+71bVkU3AsP7bJmPotpwnjwnICv1v/EBzh9vErnnPfF0K5FhXbcY
 mHRIilPA/AdDBt1zTrsNKyB4hY0c13urH9YH07Hf7a8k7TnYggzpPc43Twmv8wzVzRZm8u8jQ
 s47CE6BaeioQXmuNuKXEpzfeYSfhwaIZhy7HfMMxvrsmBIOKFXk/Z0ZOUdIGcHcjgfv1AfYeM
 4YsiBrXPj/MnRneA1izzBdN0EulMNu4GQzrC0uB7bUBy/DU8vjJtlxuy0McP2tQj8OadBHQdQ
 W8/YQV2xQ9Ld9dH8BjRJncahVN06Dc9irBub4S4+oBIIsypSnY4XY3kBNUWEsVZMevxk+KKQ3
 WPFaIwvmzfta8lkOzSfeddn9mV3VS+3fCk2eJOIcndo0bFwLMUAUbsZGH1Kc+wrxf18NDusA2
 pMJXoGOPovsykWC0t8KUuXm+bgJzeybqImxuFKQrgj0uX+0mnAG6b9TlsHYQ0RZSrrD1OAXhx
 QgbP+kNnMlJUPiWDCHo6VSFpYBat0BzcRDPLV/9F3B4DzkzaIPcdZmJ9GteRWQXaZ/1CJfVWD
 EJlViludrdPj5wkm3Gc3zV5iXflyIMCx2DxL/+kGMQyt7OrGkix8UwvVY6Xzf60eTicDGgK4h
 gHYhihLy1T5sGOD672V+ZBsfzt2rG2/MMDB9kcbZ46Gj1ZinqmOgdKRTDfgq5F6SE04xnkK96
 FuVDacHXKeSGLduF249rMXiXjmF667YV0evG9z6SVwTEhvDEcOxlHLZVkOJ1F3rA80W4G3A2K
 Rdev5VsiH8yRe6NiUn4512k6goncIorC8Hh15u9k6K1SAkM+gPaQxvwyz4RKItBDtuDWKqCEz
 Fv3FGc5u8wvqcJZ3xbUxnAuIH/P77XEjtcKcSev7L5mTt5genaLXYryOAOiKsA6/vEPYcu8YB
 V8/itSX56K7G+xhkVUuR5XDtzALGvzyGexSx+IccKNau61LwPd/FEDGtJysUrxAxOmXZ0FesV
 a7Kx3o1LxefDBPYfJIXQbms3pEfSvzXEqGhng3HNcFIz6KVHu/x3nSyUTeozmrtN3P0X6ejDt
 uU3ufgqWug8tXAoW9x6gq38CyQ6KY+ghptjfkI8klJYoNNiMZK8RYiqrS6hX5jnglcvY2Q91q
 mYa0OD6HCAl6H+H/N443JwquBdyhdIGpYfZvW47L8C1Cr6k9o5TwCA7GcTvn0ANoT26Pww3Uy
 KSZ4b2tXTZLHo/Qb62jj5QmrVwSdGvSPlBXHf6advr+YniFD2Wq5gtCTb4khbS9MG7cT5cExi
 gqMrTo1AQffG6jx1qhA3KVnMMw0rwdEyzEmxzJLbOo5F8jfBErUT/svJCKJGaDoUJ43RlUEmI
 9Rs8D2N6rg7KmRA4a/q1+F+xljVK56eYMUuVHcpJm/dJJaMghFCpL90RgBY9FPfWHG8R1sgr6
 wgRy2qMPOoi/JsxSF0RKasbmDR0jJK0T3PDUt/MyQVnJraCKN3DfwuFM/1zi3pLc7WTuyDi2q
 v/mFmb+1f9SCaioV4sV+PcGrV7qlhxFDanG5B0MoYyTXphflDKSFYiweRjYNtQ4BkPk4flakO
 pqcOk7PJbjK9vszsxCyhq+hCrt7zwlMNcaQmCUH0e7Vnk0UGSew8QVP7Lyim5kQ6gqGQ73Pgn
 07JMJRYwTdX5QU/pxoaU8YU52XTlgXeLbnKhczatWP8ZPRvVWqAVbW+RLov8mkP7DFCNTTqoR
 qkIegpEpgjKHf8PsYYWaIqr9Qdl5VZwwvkNTTJlzAyWtfsKYi95UV1/6OWXtc9sWI4HFRrz4R
 KuYDuxWRUUMLjYlXICwrc/cZTpEk7+Bq6X6Wlq/VE4qObGyJ57HwQydVIkQ1TCJvAXpKzZV2H
 1GOXJaVp2KkISujvhw8ctko/rVDtwGJyIKyIoFAxEdVNK0jZ5vY/2JigDno1TFpr5qz/jn0Go
 Pd5G2C41htBHRrYODgkNeak0ytiK/N7n/5vlSzPs81EpyrId4RHEQ+Oi6JFiJ0FUeI0x5ycLk
 ue8Un3qk+SoZ93sxKDgM5gSO05tqwBJhLNKsT/wNOY4CLYK7qJ0Tw9vdFh9QAwK7DmfxZZNMe
 7hvJZjxqPmbtmmofEkk17GurkWAmMN81PTL+qm0GaOAjM5aKjCPUy6btYIY2tzAm2Uw3pIUnp
 wY+okaG3idIAMjxsjoa2gFkdkTd//gxzUhTjt7I/iDueDBohOHF+HCDwPff0GWf28ZVeMHvGo
 +6kNJaUDyA1hvIWcuqCJgqeCTDy4SdWwVaFXivjCZhzJR95HU/76YAzrj8TlZYNpzFMVavgTb
 7ygexr6297QDDlkYmmhCdrjeHN+bWej3tGa7BCwNEnyiqcJK+gtjvJdHjnNnm+W2nGhCN/+lA
 JhK4lhWgGw2fklzuDvdXvSwzy3QLjSFAidDSYrRpnaRvKq5NBEYZ0pyfiKErbX2bXnTqLXrb4
 Zm+lfbxaoDp8GKihR+zVoddOIgotNNdF8VbO8woTYbpXBvLwjRCQKI7VAmzZxEeluB3YP4lJ3
 F+DX5Q3em92vHn/upLxHtU6mekkDOjA+46eJp/z0mQHLVLNl1nJM2gEC9GJnWxHKsNUh2dBOC
 +TEqS3kCSC6T2lUGXxtm6A+28GYAXmECxY0SP/CF8PnALQWsly8FjotbmzUdY/1FA1dVWVPmd
 sZg4vIOhmY7rglZs6adp7gibSYDG+kmD+CU/xYKo5bS3NuyEiQSW1v85L2bsI3oab0Z0ZYOrk
 lI0fLVEKYaBD0fQTOgW/dmSFrDtpNW5Eu+OD6iwY4ARh0DBV255UkI1WG0X67uYLaj3TGPi5d
 yw11P7T9BFI6xxYPlDEQSs4hw3214XMBIsa8rlb6BpC9f1b+TtU78Ta2BXxgVQW6mCL/ofp4S
 HQpj1UG57g3LlPguKlTryKCgkHAYsmRUAPFZjaIY+SpnlvC58aUYix0sSpibLTfOAaVAg80AY
 UVZy+6i0bFre+w717PPnhZZyZtxSesoh0X25t52hpDSUTmNhRHQTB1UBW/ULyRpvpGMlZWUXR
 Cp79Y449JWjmnGd2ozUl5tsiN+JMCO/Z8T/wORruI1tsIqmI/baiZhHAuHf3JrtNyTp6M6ggX
 3VqXy/YxmoyxnUM8UBwJzPizU0/SoisQxDTaIX+QiLKRLKxUioCCh80wMm3aFIolMOXgZOgqJ
 lfjxo3qUmdzUTQzxlEuB/u1qqupJrJJq7HOVxLiE+cd3cDY8jqNNv1xqOD7+2vFdDpNPjEuPh
 Ag5kWb6XElgJkUgKZQkyzW1KlhyC6gtuuEIHQ+JUMZxErPP0DaBIqYuT8Iq2oM42Wsxii95SP
 UmczmVu9cJY3OW5xQCwM1fkTjiCfYa7Jz+ON+JyVbEuOeFfF5482LttCu6cpV7PbuyuPogMtF
 iw9SjHGY8Nq7qYO8ZR9Pkx13tmuL72a+UqEbHOQKDIbfMT1E4fP8
Subject: Re: [Buildroot] [PATCH v2] package/eudev: bump version to 3.3.0
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
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 17.11.26 um 17:52 schrieb Peter Seiderer:
> - bump version to 3.3.0 (for details see [1] and [2])
> - disable new/optional systemd-hwdb (not needed on target/host)
> - add '--enable-tpm2' for target and '--disable-tpm2' for host compile
> - add new group 'clock' to common udev package ([3], [4])
> 
> [1] https://github.com/eudev-project/eudev/releases/tag/v3.3.0
> [2] https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md
> [3] https://github.com/eudev-project/eudev/commit/bce05987bfea5cda8060f59159becb7de7353a46
> [4] https://github.com/eudev-project/eudev/commit/82956a47e9191f4c1d8a8ceacaeaf1a9d7581847
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - disable systemd-hwdb
>   - add '--enable-tpm2' for target and '--disable-tpm2' for host compile
>     (as suggested by Fiona Klute)
>   - add new group 'clock' to common udev package
>     (as suggested by Fiona Klute)
> 
> Notes:
>   - This version bump increases the target install size from 11.8 MB to
>     14.0 MB (according to graph-size). See following (uncomplete) list of
>     installed file size values:
> 
>     eudev-3.2.15                        eudev-3.3.0
> 
>     /lib/libudev.so.1.6.4  199K         /lib/libudev.so.1.7.15  339K
>     /sbin/udevd            435K         /sbin/udevd             927K
>     /usr/bin/udevadm       459K         /usr/bin/udevadm        979K
>     /lib/udev/scsi_id      139K         /lib/udev/scsi_id       275K
>     /lib/udev/cdrom_id     139K         /lib/udev/cdrom_id      271K
> ---
>   package/eudev/eudev.hash |  2 +-
>   package/eudev/eudev.mk   | 10 +++++++---
>   package/udev/udev.mk     |  1 +
>   3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
> index 0e24957621..58aa19b695 100644
> --- a/package/eudev/eudev.hash
> +++ b/package/eudev/eudev.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
> +sha256  8fba6e4f49ea4b1938828a3c2e7cc48874816c68621386e527076b6477f5d6ef  eudev-3.3.0.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 0deb0e53c6..94634f4405 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EUDEV_VERSION = 3.2.15
> +EUDEV_VERSION = 3.3.0
>   EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
>   EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
>   EUDEV_LICENSE_FILES = COPYING
> @@ -14,7 +14,9 @@ EUDEV_CONF_OPTS = \
>   	--disable-manpages \
>   	--libexecdir=/lib \
>   	--enable-kmod \
> -	--enable-blkid
> +	--enable-blkid \
> +	--disable-systemd-hwdb \
> +	--enable-tpm2

I'm surprised there don't seem to be any dependencies, but it seems 
correct. If it doesn't add much size I don't think we need a separate 
option. :-)

>   # eudev requires only the util-linux libraries at build time
>   EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
> @@ -79,7 +81,9 @@ HOST_EUDEV_CONF_OPTS = \
>   	--disable-manpages \
>   	--disable-rule-generator \
>   	--disable-selinux \
> -	--enable-hwdb
> +	--enable-hwdb \
> +	--disable-systemd-hwdb \
> +	--disable-tpm2
>   
>   define HOST_EUDEV_INSTALL_CMDS
>   	$(INSTALL) -D -m 0755 $(@D)/src/udev/udevadm \
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index 3518e874a5..507c1b8022 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -6,6 +6,7 @@
>   
>   # Required by default rules
>   define UDEV_USERS
> +	- - clock -1 * - - - RTC/PTP device group
>   	- - input -1 * - - - Input device group
>   	- - kvm -1 * - - - kvm nodes
>   	- - render -1 * - - - DRI rendering nodes

That's not quite what I meant: Currently the clock group is defined by 
package/systemd (see SYSTEMD_USERS in package/systemd/systemd.mk) for 
systemd-udevd. Now eudev needs it, too. So it should be *moved* to the 
shared UDEV_USERS definition, to avoid duplicating the definition 
between package/eudev and package/systemd. Having it in both udev and 
systemd would lead to a duplicate definition when using systemd as udev 
provider.

So one patch that adds "clock" to UDEV_USERS (as above) and removes it 
from SYSTEMD_USERS, and then the eudev update in a second patch.

Could you change that, please?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
