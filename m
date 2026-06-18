Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632DBCD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 18:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E78614D2;
	Thu, 18 Jun 2026 18:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ukql8s7kugI; Thu, 18 Jun 2026 18:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E92B961476
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781806998;
	bh=EwohwzRbDB/jeVdN9SDetTj5ye1fF2nQ+FVcBy1D7B8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NejvwaD7t/KbuBvmYejjH3LCffuXcYCzJLx4jRhzLoxQkC60JkGn1VCDuMwdA2hSm
	 7R+dS0FMbJ3EYoHWXQX29wZD1UnPH64MCJJ+kPQ+bbvW/mPausHZDZYOWyxnr7/3I7
	 m54WlKVk5OAAaiUM20sdAhQGuxsGqckP/ZvQ33FBQaJNeMV0wqMjXiIq+n58W9JbVQ
	 9rF8Bt6FirpK6Y3ZF/h5fCbPoqmtbHrSMW1IW3Yx1sooRlZ/MUgeOrOYPX5oEn62gZ
	 x0+v1fT5fZEkxR1TA1tm+XmgxNc+cqYGkVKX9cnu7KArF0k/xnruyJ3AsLUv1ND0i3
	 loclYLe1TfWbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E92B961476;
	Thu, 18 Jun 2026 18:23:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A023358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 18:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B8D7610DF
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 18:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axHvM4w0D5k7 for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 18:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D29E460F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D29E460F3B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D29E460F3B
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 18:23:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzuB-1xBXYJ0u2p-00jTsn; Thu, 18
 Jun 2026 20:23:00 +0200
Message-ID: <d8e8e35b-469d-4f10-9d9f-5f59273cc8e1@gmx.de>
Date: Thu, 18 Jun 2026 20:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260615123930.447-1-kory.maincent@bootlin.com>
 <abca804a-1a63-4319-9b7e-ff9cdfed053d@gmx.de>
 <20260618181452.6fe3794d@kmaincent-XPS-13-7390>
 <20260618183509.0d99856e@kmaincent-XPS-13-7390>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260618183509.0d99856e@kmaincent-XPS-13-7390>
X-Provags-ID: V03:K1:IJl7bQ+kxiP45764ySLhzVv+ARNUaG89J/RbgHcvBax4pFYbwJW
 nmkAKusfRH7N+SsxI3KuBvTT/ERhFGJhJY6v/S3IJ3YVhOpsjmys+x0xEG7k2cAm4E0jxvq
 oGXJ9rDIn85c4ALUWv73L4KwmYkDsFpZ/UjZR7mUqmIDg6qibvRNjlBmq7ECk2UDbbFh/Z/
 QcWUKa9u0lGJl/NpRh8EQ==
UI-OutboundReport: notjunk:1;M01:P0:fktMYlB5dqw=;6NL5LqHs2PKvKU6GgaoKr34mCVk
 Hf2fuyMHBundE6d0rFdg07+aNH2KBnmQb0C81PDwmZwTRyQ55JCRbOC6n8frh9rTrsCXtoMTd
 Z2MkXBXpc2pPIUWqF5n/AXxAZF2h76WXLp9lTG+Y4ChBCRTzWsAEuB2GD0HDcnqTze/fAagby
 fwfXorJ9IdRjGTfiRJh81A/e8f9zzE8ZW4oJt5vztrgwypPrHEZpgsgOXiXQyh0BF0xKt7NdH
 4I57MVE0BvYLYcRbvb5cJhx7ScdrLvLAfIDny9mtjAFNS/YhNGLM0vWNu9OO+Oi3DalMQCWdl
 zzBv5ZW1y+q1cAz/nScQBImb+TDsWVhkR6HPKMhAkg3J4wxVzSkLDZ3ThoVNdMCGOT/48udrf
 lzQhvqGopsOMHWGfN6FkDEyxM2Q4N6mDj/RyMz05X7qUcZ8VbtddcWFQrc8N/C5ECVHKvNc/y
 RekMbjikevb1GLzxTxQNaIuXiD/S6dZsrippP0mbJJf77mKr2qqGMBcc5HriMEDQmo0jjrFUF
 ZCeMbdex7JTjYAGE6kZm2RHFSLCnajA++Py3SnTqytJOMlrep3qb5C1gG5MtxP8bCAT5vQ+Mb
 yqhcaVJYeExGhhxoM6erVjy9/c0HUZjWqTpVT87SMA5+qimZ7onlot9H6Anq/BZp/ChdGjdx1
 Sf2lDqDVAMDnL7AFF+6pdB+IQEnja38lSS/bE1IzcIpeXEsc74U/itiWiaKuDUqfGpRuPJrb+
 wJt9Cpb1VOG3AzoussHmhQVmDCR2Fa7G2uYMBq9IFQa43gb++nNe5uM037Om47sEOq07ql39I
 yIyGLBdIBviu1aSAR3Sx87/6bSehjvstlRCMbD0iNOK+xHdx+qpT8oSc9TbE6CmQTgJDcXDr6
 xkKc5NOVRzr3EVpxVPPi75D1+7cU3EyCiW/021UGVZEw/DfyeMgzUgntp4d7RfiVdyC5V/BFS
 j2IdwTIjta449ksRasJEJyDx5po9lRcorVhIKLrnObLV1pX7FVjdqjc3/SjL3ztSqfc1/QHrM
 PCQZ9non2sgO3s9P7RLD/dH8WqcP4fIuTcUgLqNevZEJnW39ev+dTMhRCrX7adZ291vq26oef
 NXa29Cf+gFY+Rg5sl6zAqnvjhiiFruZxLsEncKRPLGUOXDcB9MjnmMxt+KOPSHRoWs+YB6Gxx
 PnQs4WCKxnUWR74YPTe2QcNieVEcEf5Mo1jMYNWrvboTsQJA1+k0u6a3hbto0nM8kq/t1P4dG
 djC1c6wW9IVN6OqXrU8hntwyZPysiT75SdrBWf/9jKJyBlA8U0gFPOxm9n/metfltqvOJU3I7
 tklk0XPJzOuYlsja8znDIPbpNQ0TRieluny2rbo2wJOnN96RE/yErgPWFkvGzT4DzUDkS+r0K
 8/cBfJGz5BKX9uBliM0t5FbQwvxk3RxOcCzlPGs5yMNzoHvJ0byHg//+mSbgn7AxuyjiJ4D2+
 fX9ily6CKIrq6wHTVzkQe6oHEs93OANfehmBmI5tOS3S5meEKgcHD2YzZoTdYR/UkrRk5MGqc
 fhCSdTzlxURItEsjqN/qSSJHYABkYENLzv7FaMQetcHfBdqiccCrYMuEHzsdgVgQP+l72mkQD
 QLnePo2ly+kIJt/Z6GyLPRAZqtWCN2vqXtGzXyACcloOftIa2fuDSRprdoAS68E4ROuFOVs0A
 3DYO719PncrUF7jXS/G4yRcWCAMKa8LsVI20e9Gp+94nvr/fvYSxaAJJwKi3/VbkgU9STwa/R
 rO3FxCU4T7230g2VkzbADGmT5YHy2fcifXRdo+FZyROzz/Z0pTPC0cgZbiRG8NcojSXz8xpKu
 j52QDU0GswnwMViRb5cXdrDcR1zBFe9XCdYlyyVWmI4rl4w/63Evq5koVH3xSbpXUUIkdqfDS
 kzsyu6kep4cPbcNBOsOf78DJ877NgG9lQLgGUKREmlVxXCn2ry0x5kEDcaa7E9ON0jmicGqy0
 pAEOKAuNa31i4qGaMH4l5PuyFdJR63rCoAj3aWmEmp55aoocUpkmb8qJGDqCalJ/vrNRaL3vZ
 rgafmFWchCyZsp+cyumA9kQsZyNWHuhGqzjZEspAJhFqn/LCF6ytXovEtdFDJmt47rUX5FPjV
 /29wPhXil29JRGqB5DA9Zvw6Wry6OloP69LH+joZH1zropju9y4J79dgNTBRF/qf7okStYOqy
 ITPo5CXTnNbjLkne4GY89VmvesaBWqdGoy3rHufKXlpfcl0YORwxWQgNzPpLzpUubLjG4gd/S
 MQtpgnDu3D+tCScZIsJ6bC/8mKwG9WYvxZpYTrQSusu+874lnIlRpXuWE6VaB+ymhjpFUrghP
 hvChZIdclkDzmo6FbtIdiKpjh91MGmCcnWD7h3JkJjK5sUIzGo15bItgmXkqojXCd54eekVBd
 opHiY/RstDbS4/RLC8MmoxN8BPvU8V8Lz3beIWbG5r3OBw9iQgB11+LTsU53gy2zO5saMT58+
 P8hd1UBxOopuyiTK+pG4T8zRotHchil2sbN4k7YnNV3XkE1uZ+CpSceBct/8ysus6x/cX4ccx
 qpUW001jJ8NPC3YyKb/NuJurvDSoqzFGiaNFRHpv0SpxuIlUXE6loHllz+PKQyJIVZN4YR3ET
 UP9DCQexYE9n6HninFqqY14rEc7QQtGRDRdv1gHNT1y1GnzLE2ghK1bn0r6ke5u5jpV1ncrUc
 +e8XsJooJ27KX5BF3U6EOsKumX7UlgljS6qwDJ85xqmo4XoJ5QVTxaWvld9jr2khyyva5SgGq
 Ime7CjEv972Wrmh3LY9i3qfQpRPOdkywweMjQICBEgpNrW8cA21I9wBUDZ1gxjb3Ixchr5vhn
 4pVYND+B+tbOPB0LOtfUJudhrnEBezpIxJgwpY+1uZwL7Z29tt2ijvdHFpU9HJTDTy3sOu17h
 4Uk0BzrkgWojHJ4hnGSAFxt1PqtTYo3n4bNI+nbHlLZJSS5hHY/+DypZB4hw99QXeGf/EtAhB
 6nRGvfYCDymEfhxWSpD9y8pYlJQbM/pMCaTvvXI5YzHIzUxMn2kn1iS7sEJLqonjlJobctURb
 n3kSQUd2GJyP+eK1YPiE/WHDQ+i57fSMM9HYjM/ys2OnSYNRkItD6ABhdm3wuN7kYB4rWv5QU
 dci1wI0RPJ1e5Er6xW/srqzB3ZgobyRCeYbLvLbj3Onw9L3WRj+/o8xj4tS+gKJt+T5m+uB/g
 NJAC0oBhKKW1A2XTp120nZm5KV6/ADpumLSTCJd6czGoa9vE/HhHFd+Aik8dkjoKTbrFrzD4V
 W5c+83YPngkgWKlumiZMEIVgnSffAOZkE3+dqAgh1GnV10HgTpuvu7/S6AXZbtxF9RAfbjdll
 KCUpXYDvBQm4iDWzG/J/wX0ihbu5Eo2zQxwnrpr/QyM9/3jmjhjHcgo5qTk5pl47rigmiW7k2
 1dnIWj6g4DZCQtI/tYchKk3uJOZNVg5sMRpKxaQieNmkhsvlmw7Gy8fWE085A61TGjhI4uNls
 tboTHMixj3BSdQyqgBS4+zzT1YS0H04MSvnJXCNo2eUEoW0eCfiXYldOcH4XArUJlrfFDqsX2
 OAhgJd84eu/+0hy+0vdtyE+5Cf8favi2NALsyqvTcTCSgfL2SZkzIoWAYQfTfyp4tYOUCjFi5
 I+mFuW6c/XpkJEHOlGw5occIGR61YyD8aL7T37yF780SDNdnrzWtBXpA6i0tZ4ZRWhV/dnv3D
 3gQ/YsiEb/pEj9DMxMpX/UUZ7a4URmEi4nnmUawulit4eNJ3qjmlt1wX88Z0RzMNT8QHEtfVj
 5feUTgMGPBNVQwuHQMCtfMdo6n1L9dkfwgxgY7LrknwijrA6uhBhP0LDJSiux/1NVT41Zz/i1
 1Ir/n/1YuSXOHUQyhE8pmYaJ+fW1RibJ/HokZluiPmtdsFDS22NiybyG+L1QJBOQSHCYW8ib9
 dl/PTWQrZIgMfV/pAomr1UaI45v/E9Pkl0dFaSqd2mOoZWOWeUqPve/6/8/NPDNBxAy4bwBbq
 2JPK8FlgpmEKBX/ToVp8LDa70Qdss4EWEi9r7lS4bF4Jbix8cWFf8rhKeRejAi10a+d34UBnC
 yDnyEKNbm/uvgCdgN3XpxrS/1RQcPzjBJBBP18DSL6WZJgKzvnX/sxQoUhkRTY5sccxebtRXe
 u3Vk1jcF/f54Y6/gGpeOFrJyU9+GFceNx8/FIT54R1Qzg0mqtne+IZ9QG9m/qeFynjiCeukx8
 Mkb4P6CQybXlSlMURz0REUZBcVO5JiABdJ9BCl9OmwSl00zYlHQbiTdrqEl1/Mfi2LOgGYo5z
 RRV4A73csrLboKeTtAe9I527S+QWkNl+qtF8DKbmnRN4pk1Q3qwrjx2JMkGWWV+mVKCGdO+Zo
 KVBbcDGvicUsuXCk6SiDfSJsknIUIBdaaHPIXj7wIHkosJv5LI7gAz0bSxKVOK6fTraFTqR0P
 lPg0CcD+6TX4unrSfAFDE+m8G/rhK0MiBwIzJ+FWvoO60P1+pmU6OnwuQb3ov/Vaq967ePwS9
 D3Th/8iBRgzzrEir5xvxiKlAZfyzmELLMCpqbvYoB/v+If0LJkRWO1jfxn9LBQgfW65Cq4wrD
 rAWJLeBmdjy0+HY/DoNneUSdKZpKOCvZz32ahY/ioeG2kdzJZQn8gHu4Ov3akBCSc/piJMpxk
 ryrmZ3ptVRy+2PzAxeQgyPQR2BXLcnlH0VcUA1GJpcsUiUD/kRC2sejbIjEDcxiWxD+JIuVSE
 Jo9cGEVxB00P88bHINRIBJz2S1sVHHVlYFQ8s2EsIA89iHOhyRX0kQ7GGa8bqCb3Nf0HZbqfz
 usOC5H0uaPwR/f7I/4oOkky+2I7WXQ83nafEWfqEid0qXGxDbrHj+TcH5c9hPbUE4g3qVVUgl
 8ba7PJmjqNdhx0uZfZFqMdFXYwtNTJr7Vvs5/KGy9b+BiVdTYhDIQ3E1I08EgTcfAmWAzRlxP
 GK7/x/q8xfHgslh7A8LSDGhDrT5bU1Y3GyL4PM6TRCvFclAwAx5tsx2prnnxrcOwOx0tUMWZE
 MKsDR/YFklLSN6EAAqkIiSlg2e/JoaBCjGbhsVF6UY/vauz++qD+ZbokeJ3LUifQZ5vwo20N2
 +Ad35NZ7mdqpGh2IiNgITCSEg4f/OWQAPwD8cYKWcdzNp+lRKItbp+4HLvniiyuGFIBzJAEN2
 iMqtit8sum7qNdcumaYvfRS9wEtEtsx3EJ+M37GOUgSnbLitqhaVTRa5wtGRFS1K5X2kmKWiG
 2rgS9cgrW2V/fedI3h3UUBhDb/+LgplZ6pDHeNwAlWkTa/W58Ro/q9MG/F4CvvFvTaeC7pJhu
 SgkmIIRUH3ry26G/0UWEqT4xd6HwfZeiwoa0Dt8y0XCuai4njzkEg711M/BzpRrWgGs0YTDCt
 b1ffUsGEQxHEf9a4MpA9C6inhADhqdLJb8XE/OzJ4GN/N0IAegX+Zw5CxBX1bla1Eem/TSCfW
 uQDaGjSWVhp8BZqI81mAeW28fJJ3uuZRMZFUjHZrIdari27mrU2I1RK9TqdA5TrzNofJmCb7o
 2uJC7Wxx/LUaOwmWDf+lumsn5R/UtBvjL0R8PD7KZcdVd6suHqbAGoOFJPpCzZfrhraBga5yA
 JiLteAqGDK4YXNk44cUJ66vzyagcnq3AfpFQqWXemvo5T6nr0fNPYmJd1aBefNt2YqV8Mw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781806980; x=1782411780; i=fiona.klute@gmx.de;
 bh=A9nyASG1aOsNDNhJ+pz7hXuWpwWJKDntE5qmR0pDMbA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=CrpMhthrsY5Ze8Q2J5R7up5+FJeSFrcRQ7CDauJP79jenKKNpkY59YyLaH1Q1Jaz
 nyIqzbJJFzGJXtKwmUwVO9WKLWLUNxjdK4UvgKag+MNLoTLr86CX+8tDiSVXrF9ZE
 0f9XsW5TVpprjIFcg91xWrqYD9q9uFYEysc5jAnzGLS4MhFX9s7vClbwbEyPK/7pU
 G6W21reoCPYfygXOPCiXgLxQEgpCD+kMr4MUyMeUpumN2zYyDmOa3HWIZU2nejLkl
 VDGoky3bjAUxiJ21+mwiLb4wNZtNM3BjDOJjKzSaP8fkgCSXEe5fRCtAXDcNTl5RG
 KUg/cjcccNGBIkgJjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CrpMhthr
Subject: Re: [Buildroot] [PATCH] utils/docker-run: Support BR2_EXTERNAL with
 relative paths
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

Am 18.06.26 um 18:35 schrieb Kory Maincent:
> On Thu, 18 Jun 2026 18:14:52 +0200
> Kory Maincent <kory.maincent@bootlin.com> wrote:
> 
>> On Mon, 15 Jun 2026 20:07:09 +0200
>> Fiona Klute <fiona.klute@gmx.de> wrote:
>>
>>> Am 15.06.26 um 14:39 schrieb Kory Maincent via buildroot:
>>>> The docker-run script did not handle the BR2_EXTERNAL environment
>>>> variable, preventing use of external trees in Docker builds.
>>>>
>>>> Add support by converting relative paths to absolute, mounting the
>>>> directory into the container, and passing the variable to the Docker
>>>> environment.
>>>
>>> I've sent a patch a while ago that does pretty much the same thing, and
>>> handles the possibilities of multiple external trees (space separated
>>> list, or legacy colon separated) and empty BR2_EXTERNAL (to disable any
>>> configured external trees):
>>> https://patchwork.ozlabs.org/project/buildroot/patch/20260405185608.1357633-1-fiona.klute@gmx.de/
>>>
>>> Could you test that one?
>>
>> Oh I have missed your patch.
>> It works well on my side.
>> You can add my Reviewed-by.
> 
> I meant Tested-by tag.

Nice, thank you! :-)

>> Small question, why would you want to disable configured external trees?

I'm not really sure, I haven't needed it myself. But "set BR2_EXTERNAL 
to empty to disable any external trees" is a documented option [1], so 
when I wrote that patch I figured it should work with utils/docker-run, 
too. ;-)

Best regards,
Fiona

[1] https://nightly.buildroot.org/#outside-br-custom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
