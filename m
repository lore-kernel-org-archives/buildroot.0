Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D92E9A03B
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 22:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63B368029D;
	Tue, 17 Feb 2026 22:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0G5HvB48lPWz; Tue, 17 Feb 2026 22:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E9B880787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771369142;
	bh=57/mNLWC9pS2SWMhj2/GbAHbnEkwNUXde5ZOqyHYUXI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Ude+fG+NM0ZgnusOR3i+Ch8kPPnamq+0AAsDKwWBqYbeZfD5K40Ev6ocUlvJLr5jq
	 gqf9Fr6Mf7LNu8J8LMJFQq8OhtomrEr3kN2cxY+HmNKu+s1S/p2t7/4m4ogtRPGjPM
	 6bbEBtwmL+ZLUAcveQLT8teIvK+csfVvI7C2rrNFS2MYnnEeBwpfrxQM23cp0F8zoN
	 ERfYBOrzop8yDGfCOoXbSEqacjGdVu8z45WMMu2XCx+jp7WG2t2mdgPPFZgvOX7/BF
	 HbK1CqQktYNmxuCXhuJKSnZEN0H9c/AvKD0DyvaKBaHOqDBNNNDUPMg0VriRQxSlLb
	 +VCRqqDY/4wgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9B880787;
	Tue, 17 Feb 2026 22:59:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F151206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 22:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 103224020F
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 22:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PCRw_Z4FR9o for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 22:59:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D889A401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D889A401F6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D889A401F6
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 22:58:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.105.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY6Cb-1wFkbS1SGr-00YKRc; Tue, 17
 Feb 2026 23:58:55 +0100
Message-ID: <ac527999-9a6c-43dd-be56-bb5962612216@gmx.de>
Date: Tue, 17 Feb 2026 23:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20260216103714.802444-1-buildroot@bubu1.eu>
 <20260216103714.802444-2-buildroot@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260216103714.802444-2-buildroot@bubu1.eu>
X-Provags-ID: V03:K1:bMfCe29/j29qMgOhSVMY6KkqTKz5E/RggURwYVqolEDo546NiKe
 1jYOoQwKFqO9UB4/y3//gB2FNvTHESgKcpXpWwI4vuR7bfOetfeUzjrMQ403Wq3mcxt+ubO
 NIoj/Uvw94WoHDa7YC6ltEIexhUNaqI+FRKx1usRwwA7YnwanKoSkHoGrns5fb+Gj64ZlF7
 Vb+2P2pXzA7J3ptXt1c0w==
UI-OutboundReport: notjunk:1;M01:P0:64AmMNkfj/U=;UYBjaJ1aHKOOnGHiXJqlNiDWyrU
 /70ohYU+k/0yEJpeyR1bzN+7BkVouEPkVn+dwXADhkY5x8GCTGELzNkcqUfN7XAjNAjFsBKP+
 RRbYmjHxyZ6rQ8muxPToeXR2d+pLB8I7oAhEjCgBKa6nxqvlIt4H94U0aR8TsCJ+JcSJzsUYu
 RCdcIasLmXhPXN3aeDH9PFGHPK5rAyMUJXVyrsVbqqKqgPetgHfr5+oX+cxRFhqIl4cM/GsEY
 bGuy5DcfHrGbeA9BrMYYvOeJGhbIaKomr37/4DPFBS0vfuUfXDwINAWcWm25LxPM/lfIFTSNC
 W4cSmNEihbU3s15VZzXfYPogsZprh559wINAoHIbotavXZzsq5pzJCSVwEeTqKDSQrftI8gkT
 sicYYfEOb73tL/3pMDKEkaBIaADbmR6ba4YJsMuQiOWgG13y5ru3OZISQ9dmBfmCbqgkHhx8b
 3jlnQ5a3wnRV7gZnPxTxXZkhg5Jyb/3tO+AyryPndlc9wzzYPQmNu5N2ShJ6QULZESkAoowDg
 5s15+4jHIS9X1B+kmKBbL8d5hgWgS+5NdsQqq0zdSbJhs7xhFpTFFqec7mp7E8y6Yfbied4j3
 K6AtRMTn64WIcOP5BmSmpJ0wiCSBjJ/yf6v1tLenVHg2z1VxI2LTHJSyFLP5DnAfwIF2Nxtm5
 wJP9/qD19GptQjFhevT+ats3Jjf56rFvegcFFoIlNsGNKIThFBOt0ADee8v8NpMRQ1iaGpZmV
 TMFlt/DctmhssKNdmet3ZNTCY9OAEvlOqRJUBPvJI2XwbBLqP4Wbkk+B0j3q62TbMh7PLue+X
 YSy+CQLXJumN1Ye8Q4rI2y/HbhJ9sTAIN1bkn5v4bII8sot82SdisMsMnw/rv57MV9HZZ8axA
 GuSJ1JJ3wjRDO2SGMa29JxGhmF1dEun0+OqNUp9TGtz1874lyYMpd55NfIHnhlMsDfO7Ps65M
 tPCG/T5mToyL5E8lDYU1fAyw9hleT7SXJcEyRqHwcQNvrlgq7hCeb0g5O+MJfKFMInvBFUD/K
 RzyDSsjgVC2bGs5rS/7Z9a+dC9Az65KsOkvE5NZCsO7W8b6Ns3jIc1l99LGzHw6B5fBGwI9CA
 dG9NarWhhpKOWsQ2D/edzbjOjK34j09gMTY/p7WQqEwHrhxfd8LFXqk7RbbUkaYqYOsKSPzRf
 IeVN/fT+daOwVxh+7Cdf/wHLoDeeHFSOkHz/4WRcXawm/lOxMQpp/ny+qWJf6MyHe2I9ost7P
 y6xQpBk+vrDHZg2NW8+OxEbfsFXW0QGPBbQgSCoWZkJV6TuMjUj5h3rE9Gl4WT27Vruk+Y2gw
 iXiL+n/H9j3/ad42fZvhgDunDSUiG2AHC30x8OE8oz0sVgKzo+Re9FJ4lNa5Ir8vXE3H2Luch
 duo0k3uyk28gd4X/P53QstW5OC56TPZ8no/zrTLioQ8yJy4wmkOtl045zEC5XP4fiLYe9BeWV
 G2MKoENB6HC3S8PdAZwSSD/wdidgRWgFvo3qQW8G0uV0fFBbclSkBNRAYVBstIhQMt+1dh698
 PnuTrDdApV5lXK2B4ywA4p89tjm1spXh62F4fyhQBUgzJKCuJ0JadE9Dixl12EkDhcdUpri54
 ezzcGhPvhByk+53rtTTNb9LF4qxCEMZfk9mByjBNnoHTaOfbZdWoe25nHKMpHfPklAvmA2VBh
 dYDElJQfjQ+aBuO1tIOouXEPwHut/nQGcPaa6fIBvVbIcU6fTxFgcoxHoQAW1r42ip9woWx/C
 IOXF5dYbwXN/yAHU4DLfi3svrM2q8ALTraqqQ5hXRck6T6uz/6KPGiuNMXYgwVfJjB7DA/YMB
 SK/RH91ccDfbzkJf3t1Eln0MzCUeWYi99G9V+JVIWj5LIbdj1O6gyfk2tOyUD3sD4R5F2pJJN
 f1eE+vlTQpetdoopnArHOVJzZE+Dts31YbPFQ2PjJbHz1VKhLM3z8WmQxkne7bvvv0ar7ACCI
 lkDMPCECI5v1tnQ3+FVI7P2TF8im8BDbtXYjJwSlAR52q4E8mtc+LO2tm/RNNXRjJjUIjU4B2
 s0prBf3faWKem7Iidz4LCYiODs08eno2QdfaavAINnvwAEo/KRSBCI0dX/5KCNU/E0Ssg1DeK
 kOKcvjB0EAvXApJW1YpFUnsOXOCJOk2g7S0wvaIAzT5XX4E7z6YjCOPjnxC4SOkQ+VGh/neC1
 N1opNFLAKiYuYrzvYIXe4OM+upuuSyR/0/agJ9KuqbmxD4QA3Eu00qK7lFg3OhniagbRwtUsq
 1u72X3J49p+sJln7vETq93so14eolvHAwuwOGWWWNif7Jx6QFBgxNcyFUEE8zFDopuIK0Osfy
 tM9k9scvSFXHvq5Xz8Q46jpOA9DP4rljqYBUcHdfpWrnqqHopVnAJZEpvKdKVHLbap1yWmZO2
 UywnSaI8Dt/c1v9gMZ8ekxJqqX1S4BhSK1aCyiL4I0hNOKhLzx2PZ3E5AcVid0amNWOq3eaLv
 szTxez27WZC8uYdGOjP4w0mgE1d2j0nn1qyyw6xFIQbirgL3FOoJc9oyVFwuAvJTo72MbTJ7E
 Lrvmqedn2t/vI5IPa3PyZCRAvLUCwjz0chY0XFxw/+/K487ZvcKMvBV+b1iR91vcNWwQAuHQq
 M1Vhd6o4Sei712knSDg/iS0uMCoeNdBhIPqmqOtUGcIJCmbYckV9IaNSXtQPUB8nnDOc2TMTY
 PS0WyqpFpHubDuiaJ2dvY4/2q+76xfsSBqRKCI4FPxNKXRoQ6Hx/wfoAXACWqLwI8SonZxy/N
 rc1DwW44Ftriepu/TFz9LmjH2pHGrvB5RrNa6FF7C7+vyzK4Gu4pE6cyz0VxzMGYV0ARtyZDg
 jK52fS87ZgER6rrOTtld3cOphU0h4KDzg/zY9LxzvcucJdv+j4ltZhfPj3AElH0dyjNNZkfqC
 YGJ2XwPe3D//EHWfvXKoIdDqtgOFlVOUCQn26cZmtQ0QejYbCe6jtkxMlM1Ny9y5TDUtquDDy
 w3ixImiZnjpQjkk7hU/6650slJbBZmpSBrIDhhTtONZ2SF0530dnV0ZxZ+ymqZbR8y4lDzWIu
 6EjQm/GuG/qFJvpTlXHXzoIw68sXN4TILeVBW249M6CgeLJgYz1Bpva0J4C1zfUhIZIH6PEcW
 2PnBE2QmpxHWHSRv63Pn7PlMrEnEPBtS4JJxTMr2xqlDtvPcrc68XLDE1/HHzLvejutjdOC01
 2GMK3bVrH0jVlySfG3MSmoUN3T9NexAgyiyXdPm0X1iKnPQhiD4c9mm7FxXfOo96jvEGc3NpX
 4ujlEiLfd1+3+ijZAU1EZFdst7WoPJFuFKXIZt7HUbYXbCzDA6JlSIkslGHWgQEwPMVsodHLu
 7Hgu5NZJG5u0cGpMpLik6Ym6RPY5m/r8IHZSq7T5exklKCw4Xslvym7kOpdzMbOjq5xqXsgN2
 cT8xyTP9rCDIwqu90bqLqtzJRZWeD74NC/gyVZXmm/PmrGIG+ByLQnsEtYGf25XsKamizkody
 3IDQQme7EOF1RLh0UU9VFP5oH5+MrbO2ssiJkb2IJT9ui05ibZ3YAcFVOE250MeRR7JDtEpfC
 4RDmpINI7Jo5hz11/SrvTEkTrDBdwyEMf9h0E3gmAM/xwR1NCN+A74kt1c5TUj67CLCj9R9Q0
 MkLC+USFy9DBhQV0zwJEMjqx0jy9wHy5trhfLBYsuHgc2qg9mE2+g/Bv32obFAAK0KqQnebgV
 XcOeeHHRiNHWG10KeJRNmKCU8KYgtuZrs6vzrMdIayTQm6b5hghjHubAoccAcNsKEegE37+1X
 Cd0NmLS0VROubNVHRKX/ccH/fxrSX98uN2eAc53Lzhgde8UOkcH/Q7YC0i27MSbfIoavXXhIu
 7CEjqym2OVfhxqz+4ck3EMXXVLZEkgj/NKyWaMcDuLQRa0YKKn7mMGyNSGPaJf+S2Wv05AwpE
 rdaPKJILwetTI4j9EDVxW2D7dZ4h4D6nSXO0b1K7V8zuSj5imcmWie5e2AGBQg6G8LvhQZxpR
 OJ2vD5vS+T5nBrptvw0aGcht6Y06ituYp+XJXNbDF0/EB+CYQtURkvn7bbR6BP86p8aiBJr7D
 Gdj9sTv17kz1gvI6XgLyEB+WyRICotDkD1CsnIpWcreoJHv43I16IWTpRIi9i7nPJUAUUL1JX
 Ul7AMoTthYGQ9Eb3VxihARW5iIGFGplpc85vnSY4R24oXb7T8WFzqu/2woQ+7NbcpRBjCXz5H
 Yl8TdK+0dSZIaYPjdSp5YnArxE7FlZ38bTLSUmrXBscDoulTh4C9QwDXK53QAMpAAkG79FcZy
 V+tqQtoGL3ujNBC2mEaIzVVq3eJRXckVhR6Pz4D1qfH9Gr6HPa+FUo+r0/5urAIkn+AizSG9H
 g+Gmv92h26ywTNBnTp5ddOdbhlyqyWO5gNr/p2ZO/a7hdLFoa3ClrQseG5Ou5H54AGNv2FPnn
 PmmKESej8E6r+K4di3PC7wolNZoR/1cHJpPpbvfxRoyWCmiwshJTA64/PZdFs8gcass6e9tTo
 LDBbDK8x2poeB7XBmhdirCdkFZWByXUtmsmV6cvqP4IMHBp7KPJIDz+iCBsHwkdEHRf+nm8ur
 ZyLFYvfh2kxncWvVAiyGcAJM5lgodvgDEC5X0BJ9VMLTKRAykYbF4T/IddQcYw/e7Iq3SLXrb
 Wpv1PS1Q010RYuESsaYOb8vVteUnerPTG1cNU90qQzCd18z1q1VSakrCa7OqFzZN0E2ZElMg3
 VKOMX4M65qVhb3qDOJp7sEJbK8yi+pNyJx00PN0JHWZRmHrwEhXG1WXYOkAYkmrmp2FOmcPFa
 7qHJXHBjppanSAwidIFIBc4ZSnW4F3JcOAMZaK8hpTIwFCfTOCWuXxmByYks4vXukC3WwBW50
 zGACzr2q4pvAKjWpuDdsZF738Lf2kx484nVSAuq+FnzQG9Sfm4Rv01KJ/eWbTVvtBoKAbyPo9
 A9Fm6rB9H1jc0/4GGGn7EpznIAJS6dBoCwPqhGgQjxu8kVUO8HiL1p7WWYT2h6TlJvI6UYOeq
 WINOQY8aoXvNRDU50hWpm5ClLkb8JRKpi2ct+oMuR3IIAzRCpHoCKi5iYzb0WqBl5dVhYsM1t
 24BY08pzBsaA3JoWmcdIvawNAq4bxV9tP2QtqNQ1FXHsIoBC1Ur9IxXhxAMsA0mtcANToPTu0
 vOBx+hQWJT5RmxmAmwBln0NorNV8xJvf4b9vZ5pARuvcwp/37Sdd4sOXaGOty05fFr/tL2Q+6
 iTqvFIDR6cAJyu/qFoMSIsqWvTyOAhuZzkoUzeHyLN5KDISzySDAuJ0GymSfNedjcP2kpL29X
 83S3YrgPaJszpBe1/M9FZeTZ9kQwpDfbNnanCZBAhQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771369135; x=1771973935; i=fiona.klute@gmx.de;
 bh=UdEZzWIbVs625CFAaAJH/H4XJk/K0SzLh52PvP/XmDA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=XQIRPOI81Go4zk6sSgTs2UVciksa/VO77L9TZYFgsohODQ0Fiu0nx2BHLRwcf6sl
 OTEkSaNVjTTefa/q2XO1PlM5NzdWIGQ78iIIY84eSUf0pQs1/zrshAWrCoqKLI4tK
 o1KrbtPRMJVZKRv3T14S5cQHutfwICTpqFTwPhDZTvUNrsZUADaVQVPNcwT2zbV/8
 PH2orG+SkSQRPBS0j+6N6tBh6JbEr8fokPy0vh1wVmMHi62gn339rjkInRYFbbTPm
 zpOTzR7sL/MQNggWjPBASjuQLLzqV/b2FjDrU7xnxsTXQJLggGRSmq3lCB+/74YMb
 fzPriWyBmq1DdCERSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=XQIRPOI8
Subject: Re: [Buildroot] [PATCH v2 2/2] package/network-manager: bump to
 1.56.0
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

Am 16.02.26 um 11:37 schrieb Marcus Hoffmann via buildroot:
> Disable building of man pages, which is now a separate option from
> building html docs[1].
> 
> Add conditional support for parsing the NVMe Boot Firmware Table NBFT)
> depending on whether libnvme is available.
> 
> Changes [2]:
> 
> =============================================
> NetworkManager-1.56
> Overview of changes since NetworkManager-1.54
> =============================================
> * Unify the versioning to use everywhere the scheme with the -rcX or -dev
>    suffixes when appropriate. This affects, for example, the URL and filename
>    of the release tarball and the version reported by nmcli and the daemon.
>    As an exception, the C API will continue to use the 90+ scheme for RC versions.
> * nmcli now supports viewing and managing WireGuard peers.
> * Support reapplying the "sriov.vfs" property as long as
>    "sriov.total-vfs" is not changed.
> * Support reapplying "bond-port.vlans".
> * Accept hostnames longer than 64 characters from DNS lookup.
> * Make that global-dns configuration overwrites DNS searches and
>    options from connections, instead of merging all together.
> * Add support for a new rd.net.dhcp.client-id option in
>    nm-initrd-generator.
> * Add gsm device-uid setting to restrict the devices the connection applies to.
> * Support configuring the HSR protocol version via the
>    "hsr.protocol-version" property.
> * Fix a bug that makes broadband connections auto-connect getting
>    blocked if the connection tries to reconnect when modem status is
>    "disconnecting" / "disconnected".
> * Treat modem connection not having an operator code available
>    as a recoverable error.
> * Add support for configuring systemd-resolved's DNSSEC option
>    per-connection via the "connection.dnssec" connection property.
> * Support configuring the HSR interlink port via the
>    "hsr.interlink" property.
> * Fix some connection properties not being applied to vpn connections
>    (connection.mdns, connection.llmnr, connection.dns-over-tls,
>     connection.mptcp-flags, ipv6.ip6-privacy)
> * Update n-acd to always compile with eBPF enabled, as support
>    for eBPF is now detected at run time.
> * Add new MPTCP 'laminar' endpoint type, and set it by default alongside
>    the 'subflow' one.
> * For private connections (the ones that specify a user in the
>    "connection.permissions" property), verify that the user can access
>    the 802.1X certificates and keys set in the connection.
> * Introduce a libnm function that can be used by VPN plugins to check
>    user permissions on certificate and keys.
> 
> =============================================
> NetworkManager-1.54
> Overview of changes since NetworkManager-1.52
> =============================================
> * Add support for configuring per-device IPv4 forwarding via the
>    "ipv4.forwarding" connection property.
> * Add a new "prefix-delegation" setting containing a "subnet-id"
>    property that specifies the subnet to choose on the downstream
>    interface when using IPv6 prefix delegation.
> * Support OCI baremetal in nm-cloud-setup
> * When activating a WireGuard connection to an IPv6 endpoint, now
>    NetworkManager creates firewall rules to ensure that the incoming
>    packets are not dropped by kernel reverse path filtering.
> * Add support for configuring the loopback interface in nmtui.
> * Most of the properties of ovs-bridge and ovs-port connections can
>    now be reapplied at runtime without bringing the connection down.
> * Add a new "sriov.preserve-on-down" property that controls whether
>    NetworkManager preserves the SR-IOV parameters set on the device
>    when the connection is deactivated, or whether it resets them to
>    their default value.
> * Introduce a new "ovs-dpdk.lsc-interrupt" property to configure the
>    Link State Change (LSC) detection mode for OVS DPDK interfaces.
> * The initrd-generator now can parse the NVMe Boot Firmware Table
>    (NBFT) to configure networking during early boot.
> * Add systemd services to provide networking in the initrd.
> 
> [1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/a11760ef39629fd5f850b9a495e5b155c2cb120d
> [2] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/nm-1-56/NEWS
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Tested-by: Fiona Klute <fiona.klute@gmx.de>

Builds for aarch64 and works fine (as DHCP client on my system, no NBFT).

Best regards,
Fiona

> ---
>   package/network-manager/network-manager.hash |  4 ++--
>   package/network-manager/network-manager.mk   | 12 ++++++++++--
>   2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> index a6e5113862..fe2f2ae262 100644
> --- a/package/network-manager/network-manager.hash
> +++ b/package/network-manager/network-manager.hash
> @@ -1,5 +1,5 @@
> -# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.2/downloads/NetworkManager-1.52.2.tar.xz.sha256sum
> -sha256  3658640e788bbcb6a000c29a95f0dccc4dfebba41c6e5e9a90ad1e6daacb512c  NetworkManager-1.52.2.tar.xz
> +# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.56.0/downloads/NetworkManager-1.56.0.tar.xz.sha256sum
> +sha256  59a32d385cc1e7ae26e43798c6f12d07ff6198abd041ec0620b3a08cfc021ccc  NetworkManager-1.56.0.tar.xz
>   # Locally computed
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 66549fcf0f..9ba664d862 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -NETWORK_MANAGER_VERSION_MAJOR = 1.52
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
> +NETWORK_MANAGER_VERSION_MAJOR = 1.56
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
>   NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
>   NETWORK_MANAGER_INSTALL_STAGING = YES
> @@ -27,6 +27,7 @@ NETWORK_MANAGER_DEPENDENCIES = \
>   
>   NETWORK_MANAGER_CONF_OPTS = \
>   	-Ddocs=false \
> +	-Dman=false \
>   	-Dtests=no \
>   	-Dqt=false \
>   	-Diptables=/usr/sbin/iptables \
> @@ -167,6 +168,13 @@ else
>   NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBNVME),y)
> +NETWORK_MANAGER_DEPENDENCIES += libnvme
> +NETWORK_MANAGER_CONF_OPTS += -Dnbft=true
> +else
> +NETWORK_MANAGER_CONF_OPTS += -Dnbft=false
> +endif
> +
>   ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CLI),y)
>   NETWORK_MANAGER_DEPENDENCIES += readline
>   NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
