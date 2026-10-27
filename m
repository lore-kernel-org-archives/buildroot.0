Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9868F606A32D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lwL8BeeB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC8C80CF1;
	Tue, 27 Oct 2026 16:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOy44QGM6axm; Tue, 27 Oct 2026 16:44:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D50D80B49
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119459;
	b=VXXo5Xc3hTbF8sVir8ebFwPaDqKQAOar9dg0Vg6C3PDfRAYh6igRSkjMPkeSAUNkwb1T
	 3f482LTpPKzy/vBTw0P5h2LZQyQX8v6I64mq7ly+ebj+uyMKCNzLSOKPc+PAQn57IGPKu
	 6XWf706Tz/3C+4lqsQyNwmSky1UrejBAD1YP0806Ru9L2UWFilDn8jFKPY2DDhfku0M1D
	 v/FKHVGiLc7LKRgwLeJvn7u4RLwdoVb3MW7Te15DXOBZEClqI4biOjniPTcs6w3XePEZo
	 9YYSws+zVqzg+9Ocbk67jEAqu/4E0p0+ZZuozt3FWSc4oZa/DLF3gsHm0RydkAPk6Ng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119459;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:Autocrypt:In-Reply-To:
	 X-DetectorID-Processed:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=pG4CfkYtP2eTQjUhOiZ3rtxxsfazbp5M/7NDXZcqLqs=;
	b=Mharia2DdBmk5oYuNQOfJnyfmYpnu6fav1szeEK9lVJnEEAb41nUgZP2010AFQnnrGzO
	 08TpAQn2F515RREntLnE9oSb8NZqrjcNK45aX1VBsvNgekCqjDIkfmaaLD0lkktMEZ3oB
	 g2bRcYPh9K42P7T0KzjLDXMX5tb7/8e6qlBS1RWX916bxlWPURrcl39LZ3Bs+T++W5gti
	 kcmzoJRoO1f9JsYQ9XuQnbps7hHaRGAIPxc5xMb7kptX5AgzR2VAVcF4j3goYSSO+7Vno
	 XkxdN+Gzzca9vnfSnP2+GyjLiSiij/Si+obdlNnAjRkZuskoE8xOTAw16FuJL5Eg8Ug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119459;
	bh=pG4CfkYtP2eTQjUhOiZ3rtxxsfazbp5M/7NDXZcqLqs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lwL8BeeB+lDAzMnrbr+iuBGUQOzCosqZlD2V6utAE1c+0VbhxlnZW3qvf6aCwMQVo
	 AWso3eZ/YhymWM6dcSspibvQYVyOreYpXoFTYJSHJsZLmgb/+Svq7tIRXbZ8CRVavu
	 L+skrDCK3FHZ+vW20urMM3m+XOeHxcwqV0a6rPnMtLWvhjVG6xToqy3gOTxhl9BT9Y
	 lntMF37JYP7BjgLfjp13E2ZU97mvgBJvA5ximya3auikrXpi+hGXdJWFPrFEpWvYwU
	 5z4DGEdxqTml8m//swIcRo/Z30GN1V6e/vvBObfkZi9fi7EkGAcsCTvu5NBhwcmV91
	 qKZaI/kBHqPaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D50D80B49;
	Tue, 27 Oct 2026 16:44:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 642AF72
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AA65605EB
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JTDK2Tr3UVa for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:44:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A6C3605CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119457;
 b=fmP35g80+p5Y0qduL9gZ3SYUD1kFOnGpIC4xXbdH+pGS9y/FfprRygX8TZGjEE3dwxXw
 9cJf3n1OHNwcwWttdca9RaFuuwU4t/SDaz8aJwe9UHeEwkK1x8hZhvy8/qjnjhP855lC7
 J2Yt0NdD8ihv9CGaIpGjU2uvLveRBA31edbtAs170BMzWYWFYKmnZDb7M4c9RbTMZGPaK
 tGEXVtxiIDBbXCAcBy1MywDvKGWuj/zRZZyKKDJzKSA9eZzhUZr+zFWp1O+/Z6yZE51JT
 sfe1lfftTy9NoGBvOhIoRZ0WPpmx1t+JX1eOkteak5e3smWS/YvJKHxqtnoORdcW4Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119457;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=NH/Fnn5n9nGFIwMTkSofcoF6MUtI2tcmA5b9b7fWZ4g=;
 b=SUBkWFP29jjzaJGCur6d54cPcSgMqekPQZbKWkHdxxsJhR1JeAiTmt+CxeEyfm7ruNQk
 99Pp90eJ64jDcPAzTucWZbgyD5CSMCGA6jcgbohmwDqsfXq/JQI3imzujJwPA38GsRtco
 wdFtnjucBO5qKpar7UB0VVThFpuaR2xlUAx4MdgzQBEcKDk/YbK/UlWDZaHJw98w2MKty
 026DkjzcVvK794ocszISnIGBiUFUtUPU/yB2UIX7JM7XKSPcfDhVUlHM8lDfMSQTw1nBM
 EydvTISUdpTERB3UVLpQ081LEe/R6sK3jzKYSHbGPgBgzdG0O114RY/RavaYBY68BRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=d7wBMoiw; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1064"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1064; helo=mail-pj1-x1064.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1064.google.com (mail-pj1-x1064.google.com
 [IPv6:2607:f8b0:4864:20::1064])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A6C3605CE
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:44:16 +0000 (UTC)
Received: by mail-pj1-x1064.google.com with SMTP id
 98e67ed59e1d1-3aded3c6103so60338a91.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119456; x=1793724256;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=NH/Fnn5n9nGFIwMTkSofcoF6MUtI2tcmA5b9b7fWZ4g=;
 b=vffooVqFNtoyeEmrfOC0a1oDAFunLI4QGI+rIYtokPgKTKyLa6Yecqdo7sw1K6N8tI
 MGUIqxQ6j6on4lHoDTGQA1+reDcLPF9IvHBxQfN9DGEPPwrMqaujHXSP0t9/vBAHaqiL
 YheIwakbO+6m6rxFXI4a/zN946ZiWwuIYkAuydSnYY5l483rDBQmA3JTKgTqE3T2epo3
 2L/KGnpblirtlKwlcZjItQOr5Nscw42N0WZenhAAji1+GTNF1I6Pjl8Gwl7zmBzzwlvX
 kbrwsKLxa2O6B29tczLQGzPe0nn+/nTJ7wkUa2tsaSxAbZa0dl+sa+kCn6ZJyUc3GGqy
 1VYg==
X-Gm-Message-State: AFq9FYKZ2CyUA2S6HZQNL4rVi5jNM3/Nv1rNP2Fhse7qITYWcumumvI+
 fxbXldlYF/yF0m3W7maJ8TnjWj2gijhV2LKqF2lbLn0dOpTfz46MmrRiCvB/0a7NvQ5a7xRvkcU
 u6hwViYypI+tNUERfcI/YaaIimALWUyF7Ct4LbDul31HoveB7rl1KyfS4ihBmbQ7uRPJ0biz/yJ
 +RG9IypwnDspxyVguT4wVIFUz7S/t2p3Z37atWdloEFGBWQn8Kjmm5J/cec2fpgHi3Uyj3o6d+I
 YovMAoor0LKPtIQ+9Ee
X-Gm-Gg: AYBFou0oYBEKJrFn87aQ7L/TJxXtCDoW8kajobbTFVngnz2ZXxQR+yP8ei1k6/cVCGt
 j7kcWAm3Eou0Tc8dUgYS978haMpPk8uYupDrJpcyenRFxIRoKfkgg7+hmPtLPnl03mVed2OvScT
 FYtuN8j8yMH3PAZWTQN+Iqr/HpNRP97SkhGkAIUEkeYrYGH/IonXCZez0CzckJ+Ps+t4vhhdsRY
 s0eXgrQo43X0t1NhqsL+42o9Zeeu8lL5D9lWNycYsiHoXEtX0dXFU2IcCTQm0H3XuHvWIENshmL
 woPMWym5H0ELiiuoZwjslm1cwZKC1BOJUXf0Ya0LxheDyW1sosgplTPpcwqWBZYqBp09+y1IcYf
 ICtx4ibI/jIjSCbz2IzL6B+Tn2NY0lZUhnhQ8UiErrfIQhnKj8RfuqWHRn1IQRNa2BVO+jZE2Aa
 /Hse/dDj0zbatVjaWwe6ChOBCWNVDrlxA6YgLYVMVL
X-Received: by 2002:a17:90b:4acf:b0:3ac:9e76:aa93 with SMTP id
 98e67ed59e1d1-3adea0b1206mr7860901a91.7.1793119456151; 
 Tue, 27 Oct 2026 09:44:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae55de71c8sm7340a91.5.2026.10.27.09.44.14
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:44:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso577416485a.2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id
 af79cd13be357-940ef956c10mr1565925585a.46.1793119453109; 
 Tue, 27 Oct 2026 09:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id
 af79cd13be357-940ef956c10mr1565922285a.46.1793119452667; 
 Tue, 27 Oct 2026 09:44:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f05b20d5sm1019851885a.2.2026.10.27.09.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:44:11 -0700 (PDT)
Message-ID: <ad404943-6d73-44f9-98a6-4feeb18d58fe@broadcom.com>
Date: Tue, 27 Oct 2026 09:44:10 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Cc: buildroot@buildroot.org
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-11-florian.fainelli@broadcom.com>
 <CAMTop89wEH4R8Jvf2zQoDU1f-Mf-Sc_QGAobjM2gOOfbYTmDnA@mail.gmail.com>
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
In-Reply-To: <CAMTop89wEH4R8Jvf2zQoDU1f-Mf-Sc_QGAobjM2gOOfbYTmDnA@mail.gmail.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: Re: [Buildroot] [PATCH 17/23] package/perl: apply the perl-cross
 even for the host variant
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjQvMjYgMDM6MjAsIEZyYW7Dp29pcyBQRVJSQUQgd3JvdGU6Cj4gVGhlIHJlY2VudCBj
b21taXQgInBhY2thZ2UvcGVybDogYXBwbHkgcGVybC1jcm9zcyBwYXRjaCBvbmx5IG9uIHRhcmdl
dCAKPiBwZXJsIiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS8g
Cj4gY29tbWl0LzhkZWE2ZTdjMDg5Y2I1ZDRmYTdiZDc4OGZjNmUwN2M5ZjE5ZjcwYTggPGh0dHBz
Oi8vZ2l0bGFiLmNvbS8gCj4gYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS8gCj4gY29tbWl0Lzhk
ZWE2ZTdjMDg5Y2I1ZDRmYTdiZDc4OGZjNmUwN2M5ZjE5ZjcwYTg+IG11c3QgYmUgcmV2ZXJ0ZWQu
Cj4gSXQgaW50cm9kdWNlcyBhIHRoaXJkIGhvb2sgUEVSTF9QT1NUX1BBVENIX0hPT0tTIHdoaWNo
IGJlY29tZXMgdXNlbGVzcyAKPiBhcyB0aGUgaG9zdCAmIHRhcmdldCB0cmVlIHNvdXJjZSBhcmUg
bm93IHRoZSBzYW1lLgoKQW5kIGluY29ycG9yYXRlZCB0aGF0IGNoYW5nZSwgdG9vLgotLSAKRmxv
cmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
