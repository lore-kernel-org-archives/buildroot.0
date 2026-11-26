Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32B606A32A
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V0hd4BzF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B7A409F4;
	Thu, 26 Nov 2026 22:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7D90R4kZpE0; Thu, 26 Nov 2026 22:34:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2F8CD409F7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795732448;
	b=IORyW7cbqAkbmohegYzy5C9mp/QkKZ/r5Zhe2RkrbD4sfZTS78enxDbxyNa09Nqepqdf
	 2WwVvP8lF75F2NmpJAr3Jjh/AnR5Xsb4nhEQ0pkALbZ+krZS/qgGDfLcmWsfWz2rA4Bxg
	 CKx+qVRoHGhtxNRptivpj4OGQDlPaa4o+Bq66phy5siVmMGpIj8QqxiJGtleJMDr1xCyi
	 XbHLVijyKftnqQ/Z5jlyuf5hB7OPR3zyL8cGWs1y4N1SprsyYjt6xSNiRWPd5/eki2lyU
	 iJko/vIkCOWS7eAD8h1WcGeRH+tJg7TBLNuQqYkAO4KbdKiAzq3DQ7FKY1bycPRrR/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795732448;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=cXjEwHK4gGYLKltsfmXNlK0Z8hkdz8lOONqMMdUkp1E=;
	b=NlSbXaredkpFDDFkrdKox1lJ8AKWbF4bR3mrLtcq/4rT/ySUGYhTjYY9/hqFdt0MsJ/n
	 DdoZp7KwPOmjRr86veQJR/hs2ZUbfSwsjm2rtEOhy7mqaxTWOQ8ONxqFML51a0GdDtli/
	 ydqeiOCIX1orZLQcdpLmEksCzxyDgQ4Wtilcq8xm+VTiuFcxGQWumd5AbnqscMkbvDLY8
	 K8IrJwG7lSNBpObs/z1kiK95JIvuZa/3kn6y/GnS1ym8e2U018npxQfRmvoGZBrOJoIww
	 DlgX6UQPM3tPmK78g4PX6HhejOXTmuuMEVtJhOCrHQducAsRcco+ZB2FObJ2WjyC5JQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795732448;
	bh=cXjEwHK4gGYLKltsfmXNlK0Z8hkdz8lOONqMMdUkp1E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V0hd4BzFE+Tkwo0W4IEWU9Kt9IY1V6Nsf7FozJRl1/5ozeZJcL9qCmzWMF5IuJXCV
	 D8kLP9AiOkBQswpIjTVLGXTLB9Ml6kKwPKj7+M9sx4trI/EEFcfFrg4D5vDIDdt+wv
	 vOEigkQAdYuyW+uTo9FU/MomCgzxMYQHj32nMfjR2Z7nyZOrPNdh7Enkz33IRVGGUj
	 e0OLG4gKN+SCBoTaXcExWYuo4PqpwZopfRQ9+VP6vXiGz/PEiCYBJPJtnfypuv3Uh0
	 2fVDllKSQyE90jatyKKyA72WD2qdFSTQkvBGClHz0Ihl46LOobROeC7oE5ojOHn/gD
	 KsQhXXx907UtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8CD409F7;
	Thu, 26 Nov 2026 22:34:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34318266
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3155F60686
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tztE1X1v-MOd for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:34:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C89E605B5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C89E605B5
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:34:04 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795732442; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:ZxxwBCVkiWyAdHyfjpxdNmC7+Nko
 cCSOQ09boSu16Uia3MjD7fzhMbWura7YLzimjDwu3/Va01wPYly2HMJ6jN9HF3A/xYCvVJgtJed
 s32nI9tXPFnJvdHfvoanFv6yBS6dJYQ4thLHMLluDzrVwGwuCv7CM4V8Zxv5AKLfgsBuWzMk41L
 SpRyIorMMrAIEoY1mNe0lRhyUfOicUp8KXXOeMWCw2sE+qvD0RXYF/1MhWTnUZgV8cGdbL+AT9O
 ESEiKN2sEUrycOab5iPsjgvRY0ByPMUZ0UTkeO3n2egPo6m6vfHpG2PLMzD913OSBEH+eplEpKJ
 PEvbR464vnDClQ==;
Message-Instance: m=1; h=sha256: 2rYZHwf/s5SFSO5jMGoRnzyuj+foa/ax1yUX5GXk1/A=:
 u6VBTZcjYy6Bxfpnuxl5N4PCwidYFW/7ZlYPznXSDKc=, sha512:
 neMCxNYdODk/tLyL1prSSk5vl4hD1Z9O2ZvgkoEVK4uStX+RNLq1917NN44uERRPkIxrobkpo+9HwIgsxXAArQ==:
 L3lCap8VN2xISP6jbYnNatEwa3kY+4hshyaScNdFnlZsPfVOvzbvkcdfiKBxPSAQfl/4CrmlT/3qSqcN7QNJGA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzBj-1xoeOf2Enx-00XT9b; Thu, 26
 Nov 2026 23:34:00 +0100
Message-ID: <6369ee1f-10c0-4b36-a500-5aeeab3df75b@gmx.de>
Date: Thu, 26 Nov 2026 23:33:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 linux-amarula@amarulasolutions.com
References: <20261126192612.1598984-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261126192612.1598984-1-dario.binacchi@amarulasolutions.com>
X-Provags-ID: V03:K1:SfIQAsoxEsrcDXq9usU+OEkDe0Ixq4uQOmidogzoBF3x5EMca49
 u4mkQpdFICGvyNlo27Kpx5PCccgJB3mlT4qxdAQLXrAAQm5iDtNYouERxzG5/uQcmoufiAh
 /z1idosQCd7xydhlXHXF+BK5eRtq+miv/w/w9kHwX/gaqgZ8CRCBpBqj60Een1jk1gLsdwy
 B1TdS6r87DUk92E5XCYzw==
UI-OutboundReport: notjunk:1;M01:P0:k/AU0RDB6rA=;f68m01U1wiyZ5p5/NrTTD3YDiH8
 OxQO4rba7PCA0+MfVM3+OBYehydIK68olCXqgOUrAFTmXA/cBIe0BIkV5l+UIgvud4ugzPxex
 JkIVb9R27PKrams80+S/23AU3s6T5HyZEC6Y0CUuNkpfDRTD2cbE0osMH+TEWpaQFgWt9JyVU
 CFw1kO2KTNu5nAQN+ubVfBojuZnon8tzIAiwrYcwpMo47aX4I1WVu1vz7yXUaDr2JSQysOAdi
 LdfNaF2zIgAyMd1sxgTaZVmElAv0SfiJiE1cD66JpG/CXOwmujHGenCYPch7FX+FoO6fTOm68
 p1omKKHi5YyuLZYG6ljzw9o3aRQhuPdK+mOgfZ7BdFVwsPq+2EILQx7y0hWymS7/CcQYQi8s/
 N1CNU+vE/Q0tRUWzgZe32zz7RZ81GhJdKuw5DmUQDYb4nR8gPrZQaCMUTQyAnQdIfZidfGR9x
 7prBw+hjeV32Hb83g29Iee4j5L2TapNH4b8uLf/KHQm3T0nrXZ1pToyMQPSxnrZ5Q80c0c845
 rEWn3fUNYihl1o41RZ5toLQs/g7RZsN7PX18xCorJAu9gFg2k+0+fljdBXZcMICIVDsBQJ1Lm
 Nfw1l1CIpBwX3Qe/mZNHsIEgkp2bB7ytsMt2Zk9BXzW0jdSq7jYZVC/fP5fhMXiRHjKauXLjX
 xs5NUxgqhAYT6u6sRy07pXTZF+oqGZx4A/Q9LTFPSwLNjaKmr7ycwqRK9nye222LlvgOxO0YD
 MZZbogOMh1d8vYqcQM5OBME8NAX3+ddWvK8UM/ri17oVLVL61i4ytz5fGZ9thThMi5Oz7L5AR
 voUdw5h3w3XkhV7PhN0DNPeHb9vYlbzvbeyRrsm0FSpY7FBqI5xrFPPM0E2mxBM+gVOQLNp98
 JONpaO8r5b2Rmq//X7/uPnM6P+UxAYyO6p1NEzlElJisJRG4qKus6gyirjAQiUJhd4kALwlC6
 wDCBF0/mhgNVnBmZXgE8cn/zGYI0HI4FYO//Nfr26/cKFb8b/NhLgedtdVTIuPaIMjq51Smc6
 0F2dnbpuwilvkY4keiOD6qC1KW0pnftIUYGgR4y2D8EqwWzkUgLIgCn7rDl+lo9ei02IJN+FS
 Oyav+es4asdf4VHmplBj3wFF1UbXcBrVZHrKhCBsomPfnyjK3DQBkzdW/SFRIvU2CpLrcdRSZ
 dhrn/9wJ3r+KQovMw/MqWcNaQxdhJKdzL3cSWKuyq/OJPSJjGV7ta6G8EDPKcS5qyVSipK0cD
 +Cz4F5kbbEwnJCzMXlJsxSdYKZzseIof5obdK3aHV/+drqt2zpD8cMdH4OnfwzsYgulGX/19Q
 Fj9g9MJwrwCmcwAO/kxuuqJvFumbMqXaIAfYyy50hCa4GujO5xvtnQLFHSekcxOCL3fesQFFX
 I5gNCI6ttkfndUMDaby9ZdJbOe8s1hMvcg+mkMsKM59bYKq6kKUPmNvvx7J4sc6swZt8LsS8y
 VTPIV4OkCb0Sw9R/5fDKiavoHOC63Y7GXJpg7o3H46X1G8XrJBhVGsr4jEqHLTvwVHR0wdvDH
 xsSqyGHx4KG0Jl/fH3C9psv6cUw/XmMDG7FwjuCk2I0kc6bSAcVeZnsah/JcyoVLa9JNpwgEs
 Y/Qri6D88Tvt3txAltih/ImtQvkkmIVkG7/o3NrWagKWSwXPTRmkURx9/g8cg0GDplo8rzYdR
 hPIdcrQnrQWiJ3o28w22QE6fEIWrgjCRE7lcVPDZCCiEF+ahrZxuVnIxPWfJ5R84lXjYABuky
 JA607F/uMT5Kqd8kLQNsdD/VJUK5GV/XxyMFbPLgj8PWeul9703axqkG4qbGr8XNt0csP2Ri4
 PbSndRI86BY0BVSz7wFMphRvRdAkFEYjCyaV5Ggm8Ef1YFdyOhij0qKYhnHXwCS+qkZTY54UO
 kPElxCWvyESbN4Ew54JSU+qvYZjMLPRWNYgwNX1rmkMB2nfrsCcW+rKz8hSN0nf+v9QSfj1Vh
 mLoLuSLTRG0/S0cgZ/McN1bRav+LuHz2Q3chHX8EoJzANBsmWhgdvD3Phv53tKZIT3T9ztlDV
 6yz5IKiyjc6gIArfA5UFk+0R7EZItsJ9RaXyJOjqRgpP/OSDEEq94TvoycBgTwbf8ZJv/KXls
 SuyAPPTtsuXZjNPSzlbO9X/Rm4GpfS6QYMRWNPgs/MDvt1QMFXlz+Zhxue89XJCCdQ+fDk1lW
 rOYoZ+8P9cH3OI0ceGUuaPVbdK0I6f7DUB6r1pG23OPxFs4NLU+nEVzkolzDkJq1VPo1l/sL9
 1HzAdEH6nuDTq7UEWUN2eqtgdjgy30fM8RT4bBU+3El2vVyLvO1EUMXhztheDYomAIoWwRLXH
 SREG3Yt1INIuJRh8FOOEpvlM00Huo/rt5cIShy2+d8cu/3OAeiwYu8e18gfUVRnkTq/ELuLPS
 iV2P7pVgSVL0DU6WX/96GTvzl1ab+piCLkWOpFQBZvQiDvUdFVZ5H6UGkJucxFeEuEYbbWyaN
 juIoQAr9DrvGdjJ/6TplmHe9KG1VNo0NJhWNbyWv599SnaLu6KIMy1r1Fz8qau6ofjd89TylS
 Gvtc/EZ9Zl9ShDD4hFY3hYFAJU0ocH+0B+D++Gvu8LNXefEdJ6nzof9xTkvk13PEC6fx05llO
 PaYBWso99Lm+OSg8YbBuxicC2YgJue/AqF/dwNsIVcbh+RK78YxWF5WBHLInd1SyfJwj34aSg
 Dbbcp4GrNcyQ5txaTdaARe4gsNfKk12DVJmiHuhgCKHcBTQHfpapRhdVbTh59RBfjWmJrM32r
 3BTMzood8PTWkcsQu1ZNqjYCmotu7CRKB5cr6A91CDmQLGGHqCbf9GJ52CfgdmAUoBm1qnTWF
 335Yd4mJyo6H2s3yBCJIaF2mz04dqcAPZ0fWNKeeTZ5Ym4AytKFsx5Bb6P06gthzUsZZ/GaxY
 6krFJwadbdM+ahfo2yCLEP6ykYXL9f3x69oeDdCmjC59oXawB6ysFO7531wyfwLXEivZ4yFiX
 9SdbXQA2/LfKqj/7Z5phFIiS/cG7LF1hObsXyRkwI7S6nTLo433cIe3cT6wL8v4Ra2JAuCSwT
 hLtxD2MsTRRPcSfbYnnSlIHC31bVrDpsF1L5Z9Lb29dsKPx8DGAoTmRYPEnvV2B2ZlLzPTcl5
 SOJoKmRvp9a1i6AUU95aedJTiKyA3pv1bOP69KdGjNV6KwwOUulXhkdPNJw5XSnwma8MgWOuV
 9PLD5gGtU4721RwS9ivGnkx3SsAEvgKaA5J/5KMpQ34Sds1+ras6ZVSuH98cw0lOrEV9BTw9/
 r/KshOw7N1FI8QFxljkCq6GR1L0QRBqpczhn9VZ0RP7KaIcrqcw5HIqaP9ESeGSvdArFALDoV
 uMvUeNmjQNqcicqzHqBylOyVI++wYGFc7tA+oFP5vFmPerDXanTsWerObDD6FDd82Cvyc2548
 CDAubbiVfBFtCgnaIF2HYMt98tZuzAeuWeijTNbKdAcdO+4LMvkdbP7tQVTHJr0+LL8Rrxjn1
 XQ5438RTJh2CYnsUK/b7TiRb1GKySfHntw6x8QTrB7o8DKTeqWni9p45ltQCPNfgOH/vNsM18
 o+j1gQNQNibAknoCWHucz8Mr0jsSVnQ2B64/yu2VIBZJIIbi3IP1/cXVC+ZTND0G+p+tYO4Mj
 PT4gd5WxPva1rvTYvLkk43pOTX8PeJBEy5wygsmgDxulHsj8x1FKdb2k21tj4+o0eBkBhKlNh
 yWfOcLt8oTlB6Z2C+jIgh9qS7gUmygGL2fpz6PxQjvoF51JOVwd7XRf7VCQVG0Jq5xxPr4SiC
 wVrRTE6mZuvsV3YFfmILAlE5zQMCZbYn1IVzH+YM/d3g6ooUO4DRG5B8qVQoZR4khjFdJnFJH
 bsQlsG8BM2J4WCGaV8JrVbo+sTTqixIG3rZbzS2uLEB7Se65bTU7/yAjNuzehinK5P7l2nEj3
 GOWmRfSux44VAbmMz0IX+ZhhP9F7n9naLGNkV7Ah9o7hnTJ3/Nx91WyLZtS70/O6cZ2XMlN5O
 FiiN34ryk9tkOHKs2MTKC0LLZo+7voNtzsC83/cVMTXwhPSQYh39ZjiHfih+Q5GFs3qNViKd1
 GfCvL+Hta+Xn71oqvAqTjTiR9a/5x5z3tY3ws1wC2VMny88TxP8t4sdiO2fqYytl1lgcsJqhy
 CpPm2OCpy0Gm6agj74/m0DIznnOvoWaZ2Kh1FtyGFA2UWct2A3fHruFs1xYNbnn7/Xhv5RKuX
 X6xqNCHxbhn8TaIJXjtgnqOLSMK6Vz0lSbV4BQz2+VfoZeAx28dMo09fJkiK8kAMcUd66SavC
 3M9IjRGp4nb4AXHUrho+FXMqXs2c7dBCm36DGC6H4wk5/+cWzCyM6UVAmb0ysFXxdM2ghPKwv
 BkWZRaGB/RR3GFtdE7pIS2H9GXYQH3+F90Xxd4ZYnuPk2pSiAJdnDCSE4ALKuL1PJwpeEuj5l
 xniDC8WzgwxbocCCy1Y371OoqKlbqJ45OU89LNfIHkBK8Axz7R6Dqmx6DPO73k52uoeljyNYL
 cT9eL3f/jF5E6lS9d0dfpe5TmK3eOUFuS+Z72wJBR4AtopxNxCQrE9rmOEqdI/3PxgfWnkRSr
 8Vl4fFLCx+6rAtqNVB1ynHAwWNAC0d8UzX00+5ssSgu97R5UBOJHO4l/dcNGreD5uSgalEgju
 J5FGeNgc5UPhwPMCBjBdBS4DNQALAzNuQLZ4Br+11mZCSpCv2WGfIHW6BgY7xqiOmUDs2IHr+
 YdfFhgV4DkIcSMXr+VVrdrRpHOXkWF46RH9pcUp4n3ikRAzwhrFR51Kqm6kdKn8ZRVz77cjyJ
 BMTiOKf3HTzm/1yyBQOhWCJIfS0pUdsgtxVfFSfatHAfFKchMM0ehmq4juUneWbeslkdF469o
 NAmYXcliQw+/Y8kJe0c6K57IE1O3KAXovInCWO4lJHpTXf2FSUV1T/sTckCzHTb8iawHqcv77
 Vf7eBxuUv5Y1wTO56Pbobvz4a9vubT+59NkQ0CgyE//+mj58q0so9LoF8ldxj3lUtkz5WWY2W
 xMesUf+yUamb/9h6IXONjWz7Y6ctqgZr+qCKEVVNmIG7Xj5dxc4Q0WPW7QnN01YfPlAY2qzpm
 8V842gPgEljSNbOSZqpt7D65+B/U8QswFxjEA4aUcm23ULmwOSgArrjEP5+dnraybaCGXCpnr
 ramyCR7Ip7xgdmbjyVpT/tFSxVoM4gQ18iDf7hzmNYvqGM66C5PwSpKMuCjEzhAvEDBSbgL+N
 wB8eZJ0Twcr1b8GeL6Qx+CJ0BmlPM1s3W4cGrpPeYmVWqklP1001GzY4+eKDTJNY3sKYFe36o
 vu4UWpwbpPhRJpy2psRZIj6Yl7aRG+kL2oD3Oeq6t+gdinyKXzasb5dv//09Qvi4+d3ZyGjDC
 wrb1Cjd5sx/S2a4uvhDoD1TjIs8iV1hMd3TnaRfJm8Z0McetSkyAC/k03WOp0WzVRCRGyEOcy
 d4ZmNQeAOsJMBB7VcFhB2MS0FhC8U6dwnFH9lORkA3wcUR/+Jhr37eBLbqLrEujAU3xlq13zg
 5HHS8f8yWMP/HTdlYzSzkt6zi5h2lWDOZufOEstdKTNlwIM1u8ATQw36InJSy+w+5bH7+C9ya
 Ksp3PVDDGUAmppUbvwvXuRLqPXYLEw32L2Ak5/ZxwX1a5N3yHshy3YDxRFfrFVvdCGKB8R3K5
 fNd/R2pEFyw8lFxgq69TALBF1NjzShjLvjvB0VDFzJfP62vGvWI+1jYL0R6ob2EWqQQh9glyl
 3c3guUoW/fgg+1XVMZs7y1botsm5OiKTBuBs24WwPSetWVhZ8KLAV2+klrxYP4smPzjlC+Lx2
 vW6M5RaOHMxP+vwQ+EoOcL82QN6SSjqcE16UqmNU8hMRuReIwKNP06ZeOAEaj8H7s00w/SFhV
 IzhskaCSu4j2Ar60hKI4S1d5uiIT9oLlw9JCYwr8/OTOnSkDWM6bmsHACCOY5ppqIj9I0GMUr
 W+fZAGD/TaMk8VSxCfaq1CNR5KtNuq+wzDzmnf3jIiD3a/SGoiYabncqJcAf9rdiDXuSaJIMQ
 edlkfKMveHCQNkC0yukpcuJmY88kdB3pvca36torwTlD01FNrti9zoV/S0FfDkRH/iXjYUz4K
 VETt2mlx7jIQSaFUSqN1FXD5aFDlRB525p6Hq1OovGtyyrc7Rxlr2bk+LqQ0VS05UCWkZEgEa
 Gl1LwvKZMhNR93OGpR4TRiOf5obR9uzwF/xIK6ziwxFki1qWra9tJmRoS2kEEoaEogTM+TNCp
 VONkUzLcyHXstYOGVd8QjVWVNdKLBTKfEwj6NREQOxadIJeA3+1NOAwt73l34yBKuTdVSQ+Kd
 3hfJXg4QFfFNXUdO0fdjwAAOKBztUrBuOBClEf7b25I9RdLc/xiHTbwF5rkdGWhMiUv+tFUdE
 TvpuEuaS8YbEYeiI54bBrMkLryPpYw9KL6zhj7VacGNW5p0bUhScASRq/XCL1jVw+ERMyzoga
 hJ+sE/ksmRMzPIigygWUTYtjcA+bWVh7hqljnvCte7EgBjG80b4iy/q8ua+Hep4agIb3WT5CW
 h9YNZXd3AeWamPp2QjCpcGsZm6rSeSKsYRZdfi3QCznU4tALPNtGg4oaFhaNCsiXP+nv6Mv2H
 eIHirC8aLAAmdA8QARHtn2f+KAm6lW9qi5249bpAA33wLGktAoXPOSVJ/R7e0x5a1BeHv+MvT
 CTIb7Q32h2uKyzpe9BGCMod3eQe6tFMSv/geqpcrRm6V8n5aDfxuvEDCvKw4kxNlhR0jGUzr/
 yQ5KYZyl4ZolKcd8XiuB+NgLwjsbNniFRMOUZAe5wOF/G5CrRVA8sd1gA9RwMBshaRDHjAtJB
 cny8L+JbriRCLuFF4VQPhi6mqEWb5amUxksboyK6mvJocr5QXIqssjpTb8TWpOzgcvJndq/ko
 0N/Xg2v5TmbcTPTdpEXm3gsWhCoXF7zmWZgq1Sd2mtFUJTohDj+9a7SWxbpAW1szXVO3jTktJ
 mX5F3M1/oYcnb5Fk6duSzyAPfLSceNVHb2L2dR2+3mv6Rl5t2IpGnFMlCaV6ThYF/4MZbRGbs
 meKwy482D1RpuzUFqQsooXgkKjivZPmK1TWDDhJBjCTbWEiUSpErftawO9oz6O7a3+sDmhbFt
 JiS/Qp+n/CxMgYbxk3B0DyRZIddCnjt1Ra/W7olyegdb+DG9RSY3eGGMmcHKaOw/Eyb8j7HY8
 lDDTz5PuRK1oNAl0nWpMW8Jc2lnzqNRHFu8N0kErmca1uu1t0GA+PenJBV+YVbmJEkgQPzO4+
 VU/7SFVFx75IR2I4yL8hh/mlwL4S+mMXIIgzZvMKbC60x46xZiK6z0+1nzeBgaoRR+Qxp2EHa
 Nx+dCpzkxxHy7XsOmG9FWx4gmyShoJFapFVaiEmq0ZZzKpwPhCIdfD4FyPzetGA1Mu8=
Subject: Re: [Buildroot] [PATCH v2] package/eudev: S10udevd: wait for udevd
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 26.11.26 um 20:26 schrieb Dario Binacchi:
> start-stop-daemon starts udevd in the background and returns before
> udevd listens to kernel events. The coldplug events generated right
> after by "udevadm trigger" may then get lost, so that no module is
> loaded at boot.
> 
>    Starting network: Waiting for interface eth0 to appear............... timeout!
> 
> Wait until udevd answers on its control socket before triggering the
> events. The udevadm control command of eudev has no --ping option, so
> use --start-exec-queue, which has no effect on a daemon whose queue is
> already running.
> 
> While at it, return right away when udevd fails to start, as there is
> no point in triggering events then.
> 
> Fixes: 41258a81948fddfa7fc8ac06b69d77fa051b744d ("package/eudev: refactor init script and rename it to S10udevd")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thank you!

> ---
> Changes in v2:
> - Return right away when udevd fails to start and move the wait loop
>    out of the if statement.
> - Use '[ "$i" -lt 50 ] || break' to leave the loop.
> - Explain in the commit message why --start-exec-queue is used.
> 
> v1: https://lore.kernel.org/buildroot/20261029164212.672884-1-dario.binacchi@amarulasolutions.com
> 
>   package/eudev/S10udevd | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/package/eudev/S10udevd b/package/eudev/S10udevd
> index 8bb8f6eb3a01..8eb764f65215 100644
> --- a/package/eudev/S10udevd
> +++ b/package/eudev/S10udevd
> @@ -37,7 +37,16 @@ start() {
>   		echo "OK"
>   	else
>   		echo "FAIL"
> +		return "$status"
>   	fi
> +	# start-stop-daemon returns before udevd listens to kernel events.
> +	# Wait for it, or the events triggered below may get lost.
> +	i=0
> +	while ! udevadm control --start-exec-queue 2>/dev/null; do
> +		i=$((i + 1))
> +		[ "$i" -lt 50 ] || break
> +		sleep 0.1
> +	done
>   	udevadm trigger --type=subsystems --action=add
>   	udevadm trigger --type=devices --action=add
>   	udevadm settle --timeout=$SETTLE_TIMEOUT || echo "udevadm settle failed"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
