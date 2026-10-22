Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C6606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 17:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=px6W9r94
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D82880CBA;
	Thu, 22 Oct 2026 17:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bmZfIEBjCRg; Thu, 22 Oct 2026 17:33:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3587B80CF2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792690402;
	b=l8nCpoPMLzQ3PBRxuH79jlgbvCB8KmBrsJzGMl0o8SmVUxBNV74SYnZxuo7pelaYBBov
	 cJR8vb9V5W+2eQXr8w9AE6ILpm0uWKeQrmcczRzy1evY966h1p77lc3Dt1tg85M1hniza
	 +2c9VGrPv2XCGEajzS/WhsDa2keSqt92yEnsedGfcVWQeGffMwOP9GO+wBzqQafZCOz8N
	 eiSSOep9QgH2SnwC4K9GOBBg2Rt/4KzHruR1foH3IdJxlgWNgwV9mZvxrbAIg3XhYtG8u
	 Ou1rkeDQ/ru2nRilcs7HiFvj1UZtGN3xIMJs5Tmsg9YLj1qgKywFBkHb2iTTMg72i/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792690402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 X-Forwarded-Encrypted:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:To:Cc:References:Content-Language:Autocrypt:
	 In-Reply-To:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=0hRRM3hxnpQBiO0fmvIc/OyGLP5zlmz5h3i3Xo8emvU=;
	b=Hb6qlFC7l9rVGLuQqW7oWcXCojhTYmxy/SUJYx0V+DtibGdbcyF5lBV2sRX199f1K8IQ
	 CBdmgeJMv8cskWRfBtmbvpVc+24vYOGMrp4c9flWh3VApc92h/PG2OU7IaG4SNayNr3d8
	 deVvRYXxEDeRsbFHRDL01JCZx+9/NGjGXMI0QIU9yZs0g0JIO3Gm2TgmfAu9EUoLPg2RV
	 bdcLfI03+W4MgbsI4G98u/1/bnj/DIaL2H0nT60KL5km4s5hgqgoLSLlUJMnTBDAOCEsT
	 UP0ARU/Ir9aHjzWq4pWqInWlHcl9L14QQqQjCb1Nq9zYdQxm0c9PVRfJFm1ybsO0AKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792690402;
	bh=0hRRM3hxnpQBiO0fmvIc/OyGLP5zlmz5h3i3Xo8emvU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=px6W9r94wpWI+VU6YnGfTDpI6BrcAs4FSgwnJgs1trlz2U1Te/5q4h8pv2BQJXCN4
	 hDOl9AdXPtHXoh9E4/BMGWbKQMrq2MfMkZWncQyqaXHXhvjKEfTaOQeJLWX59fQGWV
	 SVc/bKpPmt4a+hbmVYlpCJY23nJAtr+ns3YOJYURzwVIH6olZ/zvEJH+M8/5dPHnjN
	 ePZTCsgFh8rsufki68np4C4eplXwNsuBsZYwpdlaU8QePJSRe7RGmMiI0tkuEwuRky
	 fenSnwIEQ48Vi3RTMcIaQcyjPzKCr8iZRYteHjmY+F0ldSAii5XNw7YXlq4+52aDu7
	 UMK+Mwu/yfUag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3587B80CF2;
	Thu, 22 Oct 2026 17:33:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7913C3A7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EEF680CF2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pjz4GJRcTRk for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 17:33:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7D3D80CBA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792690399;
 b=TOiI1q2Ei5RqhNtSkBByTiVFICqmDPmUhku/83MwEchrNEDRuEfbo2XP+us7gpTp7Vcl
 4WITc1DwvRDYBwCmaoH+7bI96dr8xOO+zzQl4L01t37qGyaojYURge+EwpzbUuSjmVHKH
 RHIMd3/EUmAqlGUByeIOrNVwcv0BymAdliNJU8mwoXk03xHF14K0st7L3LDqbMTPymKuE
 v/OKFGu0S1Tp37Ip45ap3ZsDny5zzny+0Ezatojk929dXRhIVM9paJpq+q3Aneddjh6bt
 hjiXbPIH+RxxMf+1rs1N1U/qfNsy6msWw1QGzplkLOZqi69uX8z4ETNvJk84p1RA2yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792690399;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=3UQjbFs4KONtlrieKhnsyEJ2j/PzZRhZgMVNMxLoopk=;
 b=Cl3GschbohRIGiCuRykC2+yXWQf9ZP5GLekXmOaMpHwLtL6peAEOSQJj1+KUyXbwt1Js
 vRyj65llLLKKwapYr7/bxDqEbMufIXWr8JVohaUNriRPAgRsFSL/5rHSHApeK1vUDF7VE
 H7DKd2HyKOripy5ZIOTEOTuWit6KlR4/ouGQx42llqnQTM6sx2mH4oyWYE4ThHgvBflyH
 ZKJvQRD3LNoeLF/BBDZme5tQgD/X70XfAHzEtKv1pfIzqiyp1c5fMgKP5oqFJBdWkd+ZC
 K+bDjUXV16RZwozWMjTlu9d4CcIpvYNcM5URnhxEaKFBscEk7Lq1K0GYfkV0USv4lBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b="Wmpq/tBr"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1061"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1061; helo=mail-pj1-x1061.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1061.google.com (mail-pj1-x1061.google.com
 [IPv6:2607:f8b0:4864:20::1061])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7D3D80CBA
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:33:19 +0000 (UTC)
Received: by mail-pj1-x1061.google.com with SMTP id
 98e67ed59e1d1-3ac677668a9so93932a91.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 10:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792690399; x=1793295199;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=3UQjbFs4KONtlrieKhnsyEJ2j/PzZRhZgMVNMxLoopk=;
 b=VxupFdUah7cDihD0K9bIFAwy9l/aseoGMgfGKpFGP85EMGDSNiXxgihtlWChs9OpOG
 g8GjuT2TsZICNg86bDGE4sj7OXFafBvs6nAuWN0ZnpVP2+oqyKB4ORfjPGd7YjE0Lnmm
 6WwoDsH1PY6jYViwB0Inmgisbj76u/Ddq65bqtT4ty0/aQ8DDS0lKOjXESJO16i4Ybg5
 WCbP+NArcs/HPtJU53e3KJcRh+lqcRhj43jmTd05VFxpliG/2e/t9ZbYT+xhVw8Rw6gw
 //swqsEOKzCYz8j5hWIPU6sJL1twcdiQvf8BjGKpSv6X9ln6GUYZCBqRTYkbhCXC1HPA
 ALeA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1L3CT0DmGPdF6lW19C4jfOqV6NcWvXNBt6lwPT+ZF2DiCFeyD2GU9AZIDfTXXGTuKFV0KqxnlsVw=@buildroot.org
X-Gm-Message-State: AFq9FYKMXBoYhZZeRrIOwAUMkLIoPEXJb3o5fuBE7JPNYQRFhvLDltgf
 Yeq0NsYeDqFPdeKFIqxgmnH2vh6LVL8iD2Iw+4rj6hhoqgOtsCbvaZ4rRBt/wNYFz6DTbXeDj90
 CLaulp9ObBFMCcbLeFRzEc/MNN7nV4dreSUsoYIVuYWxMH/KhaNLGz7m5422H3C3gI8RwmTgz66
 de1bsjWMdy49g3TxfTRazm/6VH8JTLh0bV704nvwQDKHGU+nLB2xgJmaG1Xjec+4qO7cRvyMcMQ
 2zJX6TELDzMx+NOJA==
X-Gm-Gg: AYBFou06iMTPwqsCUopd231top6D1ehDb5uSXGGilOe4qa7ZB9cORY2Nmf9XImatG4r
 l64pud9SSlGE+kRzHOknqRrGsEOas/Drhm+TPboNNxREmFtwIk6GkwJMTrJjL3KjPES3LGOHuWd
 topALv5ZfPHMPFIgyrh7F8CYPS2PLCFtMgjP3FfQ6ke9qeKosxFKRqYnhGIfibR1rg2nyVioQgp
 FNUCLPnVCFyiZjtvSy1II3LjnmiwUDmewMPGtxJ6uWzanqmqBF20TRNs4BsJ4T3myKVHV41Scxl
 4jtg6tiJJH0cv0xBVbf7i9ul7tFJVq/DO2k07D4ElmIle/jYBErSJNuLVYvpY9OZAPV8+JVFEoI
 bIff+Q835H9sMyZjaidBj1X+6SS27ON0Q8CbQHhtTLZCfLIRj7UxnU4wqp2p5Xetz3d2kYQ5TSi
 9lyoonMZYcMFpBX+ykk6NwT53uDWGy+tc5vTFsjde/Kk8=
X-Received: by 2002:a17:90b:224e:b0:3ad:6781:da6b with SMTP id
 98e67ed59e1d1-3ad86cd6d65mr5027368a91.62.1792690398475; 
 Thu, 22 Oct 2026 10:33:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adc95f8e1bsm23701a91.2.2026.10.22.10.33.18
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2026 10:33:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3ac450b74b0so111632a91.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 10:33:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBygY47wTg9B4XPKPvn7xrIuP/yUEc35kkbg6QoT/c+h9ezc8FRsAVG4jdsdv12PVRoNV4r0le0jKu8=@buildroot.org
X-Received: by 2002:a17:90a:d883:b0:3ac:17c:6e74 with SMTP id
 98e67ed59e1d1-3ad86cc2074mr4392086a91.53.1792690396458; 
 Thu, 22 Oct 2026 10:33:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d883:b0:3ac:17c:6e74 with SMTP id
 98e67ed59e1d1-3ad86cc2074mr4392065a91.53.1792690396015; 
 Thu, 22 Oct 2026 10:33:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ea7b3bc54fsm1375485ad.47.2026.10.22.10.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 10:33:15 -0700 (PDT)
Message-ID: <86d682f7-d88b-4bad-8769-2b553d93d3e2@broadcom.com>
Date: Thu, 22 Oct 2026 10:33:14 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Fainelli <florian.fainelli@broadcom.com>, buildroot@buildroot.org
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, fontaine.fabrice@gmail.com,
 markus.mayer@broadcom.com
References: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
Content-Language: en-US, fr-FR
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: Re: [Buildroot] [PATCH] package/linux-tools: fix PCI endpoint tests
 build with recent kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 10:27, Florian Fainelli via buildroot wrote:
> Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
> tools/testing/selftests/pci_endpoint. The existing build commands still
> use the old location, causing the build to fail with newer kernels.
> 
> Detect the selftests directory and fall back to tools/pci for older
> kernels. Set OUTPUT and INSTALL_PATH to build and install the selftests
> under /usr/lib/kselftests/pci_endpoint, and pass the required libraries
> explicitly.
> 
> Add a threads dependency and update the help text to document the
> binary names and installation paths. Keep the minimum kernel version
> check for the legacy tools and report missing sources explicitly.
> 
> Fixes: 63e457639abb ("package/linux-tools: add support for pcitest tool")

That should have:

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

I will resubmit shortly with that SoB unless there are other comments.
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
