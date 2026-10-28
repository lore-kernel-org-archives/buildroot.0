Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E772E606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jBr81/d0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D1740EB2;
	Wed, 28 Oct 2026 18:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fu6q4C-8SdvA; Wed, 28 Oct 2026 18:34:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BEBFC40412
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793212483;
	b=Ugu+A3YtXZ6J4uPksZZyEcTGfbbe9dmIYAzy0hut0Ac8OWWkoJsKPtjH+93wsPkRrXI6
	 u90m0WhFuzk8V6dsyFjeSucP7CtKi1d3it9bDAIiAkcERSEphJds1AMTS2b4AEe9C9t5z
	 GMJxGO1kDCEAI3nAU7ecC/3s3qBwgW9q3QlkFL6+3HkyZ//BR8CkBmIC9+ogYV18p90ri
	 wiFMYXDvFQLeS+26vLQC2OZijVSJLambcP8f5bpdm8rF4QXjVzO94Ybc0M3X7SU0LpU0t
	 ORYLKYhFuy8MOeOSADRiP461Le3ygil9yGR+IKuY6XGNEMnGzg2TqBQ1JPp1ymSgKZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793212483;
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
	bh=/H6INa+Mk+7hA5u8ft3yzHaKPD1c60sZrOBeuqjPzvs=;
	b=gEHMZy1QZcIEHznv53uW2Unc4i24GRoorySGrowKDMcNPpfDJPqGIH1Msg0dLUnlBF2l
	 lYwlkdzeD2mVTZSfxA1sYQdfDavTwVsa9hYTJhMV6B+f2nwBGAxKq6NcnXnJunRVFZLKm
	 QxVGywD8Z9PwWv6b0J76UBOszKsc4uvzI3THZWe6+A4eGK9Fsd8iADEl6JVHhhEGjPCbG
	 9i3RGNKPPtp1OrUVPnmW7BT3AepgkBaI9pSM1LbNlBjf3Xohqxwmw7zvW2lZEQRuS6axz
	 VFsVyDUI0k9dlAheeKBRLUjbafZYH6iwslIDdgpJGlxuLAdWBWKcb6vDuG8RX7xCz/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793212483;
	bh=/H6INa+Mk+7hA5u8ft3yzHaKPD1c60sZrOBeuqjPzvs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jBr81/d0QUYloUKK9DgKm5Ci5fTw9TXpy2259g5+WbYcFMgahiUsVdxZY7OXM6g6e
	 grXionrtymbmQznzY2f2SyoOZHzN/n0mA4tuTA4/BAS/ddDoZo8UmmOwte/R4se+hE
	 juJCE36fg+AqURyhDQBu5NoKtc0sFqEyaoF/lrMHOL+2f2Ivd5CrklMgysZ54DV7hq
	 l3Y2ue3APM3Kr8loCfXf1bpxP1MdIn2JAbXEbYFBXz7igxUCds3bts8eRZ7sl7a68O
	 6KNlLpSz8jaq731YEao1dqQaL66HiI4iBNpdRgNZKBPcRt71Auzd5xCdW1ewAi6UsR
	 E+Lnkn2rdpGJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEBFC40412;
	Wed, 28 Oct 2026 18:34:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85AF1362
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69A08404BF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLh90pkCEJov for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 18:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2C0F1404DF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793212480;
 b=JVpI4/hefvWgLeOGCG3m5cjgTWh366CGQqmrt6iChsMN2xDKxB4fvXFKLJt82N+u9y2q
 HQDDS83O/KrCuGlHddV9tipRPiodoqAlKC9CF8QBNG3K8zhZuqmMRZwZcO+S+MfO12Cxr
 SR11ch+R1isBcq3+5GxvU3c2EBR4mH60slVe8f3X1LlH/RV94H3odaPU6nm640l96CxHz
 Ia9MxECkZDtyTfc/gknz1DPuSiClWrE1acmrzSr1y/ly1VNdz0vj8z8AnUaRxYPKmgGCU
 sP7c58w9JsHi5Yv7IT+E704THuK3MzuOm0/RRsON1bqPLnYt4VFaKgWu954cRjJfxQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793212480;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=1q4Yp/QF76kfPLHwB+/8922BidulKthRn/J0I45b+2U=;
 b=bsLrJw9GLsJGcyyHszw1x4gWWqKk7evE+vwK2tYpCFhnlws1OtajHKhOa50c06I9n6+2
 wZiI/T8HP4ouiuUgv73aFEZ8SFRqeKtOxULKmVvjXFZiPVCSmAXYBqYbtv6SZfiBbEgz+
 g/1cdkMiRYXSYAmHRWuC8gp4uaiaKORwDLXwLE7HY/PQGdJYKNpA33dxEZRdTbniFpOYr
 i7FJBeAUqJatEfT/77anYI9DrGqvFQGHjTyw8NeYmbd6krSXV+/XjQ/6jUB7mr0ByFGA4
 DXxRU2G9sgmFrnLX0I08/xSzhhA6bEF3bWlXTOxDZEIIC9meq8O3/WWdS5KUeiPQUYw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=VGEgspeK; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::663"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::663; helo=mail-pl1-x663.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x663.google.com (mail-pl1-x663.google.com
 [IPv6:2607:f8b0:4864:20::663])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C0F1404DF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:34:39 +0000 (UTC)
Received: by mail-pl1-x663.google.com with SMTP id
 d9443c01a7336-2e9f6a16aedso8710505ad.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793212479; x=1793817279;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=1q4Yp/QF76kfPLHwB+/8922BidulKthRn/J0I45b+2U=;
 b=JT3qkm3RuFmZO+DJSYhymJ8pn7p+SpMSVWdoFQcsLarDmQG9RvRFgx/CXeXY6/IM/8
 z8eBwe0R9xM94dtfH/4gWoY+6Los1VaUQQNrH9ePQJ1GeGbCyW3fH+R97AeQccZTmCH1
 q/HDHoUw1BU+PjUFkXg4ltI9FjXmctbxUjsApjxWiOz56sF18woy9j0IvYM756Glqw6L
 TBpdgWaw+KkyWvIqKKtwrsoqzZ3Elj0TKK8duLiVwUS9JgCgLjfJK4YqqRVg+33KYXpR
 ioov8l4Qgkhsl8uobSHwQdKC8y8cWWsqKUwa8e8XJzLDR+UBGaVZrQPwaDlvtzevR5Yi
 /TOA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzK9l/zIQPNkyOSqFQkMtun+2FVM1olzcxQ94hJogWZ3qnzxjsU5zqZdg3SnRxbswnFIOaitZiYGlY=@buildroot.org
X-Gm-Message-State: AFq9FYL7U4V6k7ebmzS2i/7m6cNO51HQ8ohAyNv/czkeUANFasbqP0QA
 P55Y+nXWU+Ntlki+04ePXoS0aOJ6XOz0GoX+RiWftM7l3/oHc+RmFyHpyaC/lAIzxItiKhy22nt
 sOAfAQ7h449RcUXTIAKo56MpvkdgCW8hXfLAV8olSZoRzE5Ti8hyRrwi/UxxBLrQR2DwwCPuV41
 c2ffXWCHf+fUI67aDRchk6zzbgLjZccC9Q+5XD2f9nUFdZi+EyyHTEX1Xcg9lOEBt7LFNSxkheO
 NW7BHAwU7/9x97fgw==
X-Gm-Gg: AYBFou0uPSMa+2yhGthYVNBGK/zEmQ+syc7rtmBYZzBgfSfBDoypqdTeNIrqqGDtpm3
 kgXAglJjhuT3lOW+1sjxUR3rnmmgOdjmTxFGOd+QykRsgrQui2C+RyGAhHZO68Z66CCqIlcHoTe
 KFqq7AYFZbUp0CwTU8KG5nUe45aU1y0wAKR8edBFkig+qLCBn1AhOHiMM4X2zsk+Q1ksbptJLtk
 y+o7essHOV5H1EiKURNAzwX4BiupAvIqCaMy2Tr61CkuhhPVFIcHLgSjqjY7cy8DBxUMqVHoK7b
 s003talOcMt3g7brTPZ5BTzOLGprSSUJwuP9f3jhF0JEJ2rvpqkJs5CWwdhjZCE2OAxSXx/5kyv
 sv+Po8uPgTYxokHSu45zIv6rGHHDG/PsmAmy4EbLWgNZJOkpxongJs2hVkqsvJpRVXY5MevOinJ
 VzY2+kZT8+xyXUkEzt3QAR3FmpPCorA+YiR4FJkKMM
X-Received: by 2002:a17:902:d54a:b0:2e8:3190:73a with SMTP id
 d9443c01a7336-2eb0057c299mr28262605ad.58.1793212478734; 
 Wed, 28 Oct 2026 11:34:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2eae6c3ff43sm1411375ad.44.2026.10.28.11.34.38
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 11:34:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3ac6795617aso1186652a91.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:34:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzsoMY24Z8nCB1ueshS/iQxGUgp+aiwPIdzayJNgeg1HDOsc02j/c4N/U80qUwUQWnDcAyjX5wEpMw=@buildroot.org
X-Received: by 2002:a17:90b:1b0f:b0:39e:4c80:f67b with SMTP id
 98e67ed59e1d1-3ae580cef2cmr2473753a91.26.1793212476553; 
 Wed, 28 Oct 2026 11:34:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0f:b0:39e:4c80:f67b with SMTP id
 98e67ed59e1d1-3ae580cef2cmr2473728a91.26.1793212476107; 
 Wed, 28 Oct 2026 11:34:36 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae55d555d4sm2378826a91.1.2026.10.28.11.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 11:34:35 -0700 (PDT)
Message-ID: <8389fc2e-4265-4d12-8123-2fa6a05f2361@broadcom.com>
Date: Wed, 28 Oct 2026 11:34:32 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jezz@sysmic.org>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <auCcCZK-kGH25_uM@windsurf> <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
 <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
 <auD5d-yrritLxAfN@windsurf> <d32b0f06-9105-4ee5-99ef-84a6fdda0e41@gmx.de>
 <auI8BTyNtvmooUTW@windsurf>
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
In-Reply-To: <auI8BTyNtvmooUTW@windsurf>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
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
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjgvMjYgMTE6MTgsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gT24gVHVlLCBPY3Qg
MjcsIDIwMjYgYXQgMDk6MzI6NTVQTSArMDEwMCwgRmlvbmEgS2x1dGUgd3JvdGU6Cj4gCj4+IEkg
bGlrZSBjb25zaXN0ZW5jeSB0b28sIGJ1dCBhbHNvIHJlYWwgcGFja2FnZXMgYXJlIGEgbWVzcy4g
QXMgeW91IGtub3cgSSd2ZQo+PiBiZWVuIHdvcmtpbmcgb24gcGFja2FnZS9kcmFjdXQgbGF0ZWx5
LiBJdCdzIGJ1aWx0IGFzCj4+ICJob3N0LWF1dG90b29scy1wYWNrYWdlIi4gQXV0b3Rvb2xzIGhh
cyBvdXQtb2YtdHJlZSBidWlsZCBzdXBwb3J0IChpdCdzIGJlZW4KPj4gYSB3aGlsZSBzaW5jZSBJ
IHRlc3RlZCB0aGF0LCBidXQgaXQgd29ya2VkIHdlbGwpLiBFeGNlcHTigKYgRHJhY3V0IGlzbid0
Cj4+IGFjdHVhbGx5IGFuIGF1dG90b29scyBwYWNrYWdlLiBKdXN0IGNsb3NlIGVub3VnaCB0aGF0
IGl0IG1vc3RseSB3b3JrcyB0aGF0Cj4+IHdheSAoaS5lLiBpdCBoYXMgYSAuL2NvbmZpZ3VyZSBz
Y3JpcHQ7IGJ1dCBpdCBkb2Vzbid0IHByZXNlcnZlIGFsbCB0aGUKPj4gZmxhZ3MsIHNlZSA0NWFj
YjI4MWNhYTlmYTMwNzk5NDI2YmE3ZWY0Njk0YzBiNjFmYTg1ICJwYWNrYWdlL2RyYWN1dDogcGFz
cwo+PiBIT1NUX0NPTkZJR1VSRV9PUFRTIHRvIG1ha2UiKS4KPj4KPj4gSSBmZWFyIHdlIG1pZ2h0
IHN0dW1ibGUgdXBvbiBtb3JlIG9mIHRoYXQga2luZCBpZiB3ZSB0cnkgdG8gbWFrZSBhbGwKPj4g
YXV0b3Rvb2xzIHBhY2thZ2VzIGJ1aWxkIG91dCBvZiB0cmVlLCB3aGV0aGVyICJub3QgYWN0dWFs
bHkgYXV0b3Rvb2xzIiBvcgo+PiAiYXV0b3Rvb2xzIHdpdGggd2VpcmQgY3VzdG9tIGhhY2tzIi4g
RG9lc24ndCBtZWFuIEknbSBmdW5kYW1lbnRhbGx5IGFnYWluc3QKPj4gdHJ5aW5nLCBidXQgd2Ug
bmVlZCB0byBiZSBwcmVwYXJlZCBmb3IgaXNzdWVzIGxpa2UgdGhhdC4gSWYgeW91IGRvbid0IGxp
a2UKPj4gbWFraW5nIGl0IG9wdC1pbiwgbWF5YmUgb3B0LW91dCBzbyB0aGVyZSBpcyBhIHF1aWNr
IGZpeCBmb3IgdHJvdWJsZXNvbWUKPj4gcGFja2FnZXM/IEV4Y2VwdCBmb3IgImdlbmVyaWMiLCBp
cm9uaWNhbGx5LiBJIGRvbid0IHNlZSBhbnkgZ2VuZXJpYyBzb2x1dGlvbgo+PiB0aGVyZS4KPiAK
PiBUd28gYXNwZWN0czoKPiAKPiAtIFBhY2thZ2VzIHRoYXQgdXNlIHRoZSBhdXRvdG9vbHMtcGFj
a2FnZSBpbmZyYXN0cnVjdHVyZSBidXQgYXJlIG5vdAo+ICAgIHRydWx5IGF1dG90b29scy1iYXNl
ZCBzaG91bGQgaW4gbW9zdCBjYXNlcyBwcm9iYWJseSBub3QgdXNlCj4gICAgYXV0b3Rvb2xzLXBh
Y2thZ2UuCj4gCj4gLSBJbiBhbnkgY2FzZSwgZXZlbiBwdXJlIGF1dG90b29scy1iYXNlZCBwYWNr
YWdlcyBjYW4gcG90ZW50aWFsbHkgaGF2ZQo+ICAgIG91dC1vZi10cmVlIGJ1aWxkIGlzc3Vlcy4g
U28gbXkgaWRlYSB3YXMgdGhhdAo+ICAgIHBhY2thZ2UvcGtnLWF1dG90b29scy5tayB3b3VsZCBi
eSBkZWZhdWx0IGVuYWJsZWQgb3V0LW9mLXRyZWUgYnVpbGQKPiAgICBmb3IgcGFja2FnZXMgdGhh
dCB1c2UgYXV0b3Rvb2xzLXBhY2thZ2UgYnV0IHN0aWxsIGFsbG93IGVhY2gKPiAgICBpbmRpdmlk
dWFsIHBhY2thZ2UgdG8gZGlzYWJsZSBvdXQtb2YtdHJlZSBidWlsZC4gVGhlIGxvZ2ljIHdvdWxk
IGJlCj4gICAgdGhlIG9wcG9zaXRlIGZvciBnZW5lcmljLXBhY2thZ2U6IHRoZSBpbmZyYXN0cnVj
dHVyZSB3b3VsZCBhc3N1bWUKPiAgICBvdXQtb2YtdHJlZSBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRo
ZSBwYWNrYWdlLCBhbmQgZ2VuZXJpYy1wYWNrYWdlCj4gICAgcGFja2FnZXMgc3VwcG9ydGluZyBv
dXQtb2YtdHJlZSB3b3VsZCBoYXZlIHRvIGV4cGxpY2l0bHkgZW5hYmxlIGl0Lgo+IAoKRm9yIGdl
bmVyaWMtcGFja2FnZSwgaXQgYWxyZWFkeSB3b3JrcyB0aGUgd2F5IHlvdSBkZXNjcmliZSBpdCwg
d2l0aCB0aGUgCm5lZWQgdG8gYWRkIDxQS0c+X1NVUFBPUlRTX09VVF9PRl9UUkVFID0gWUVTIHRv
IGdldCBvdXQgb2YgdHJlZSBidWlsZHMsIApvbmx5IExpbnV4IGRvZXMgdGhhdCBmb3Igbm93LgoK
Rm9yIGF1dG90b29scy1wYWNrYWdlLCB3ZSBjb3VsZCBhZGQgdGhpcyBob29rOgoKJCgyKV9TVVBQ
T1JUU19PVVRfT0ZfVFJFRSA/PSBZRVMKCmFuZCBhIHBhY2thZ2UgY2FuIG9wdC1vdXQgd2l0aCBz
ZXR0aW5nIHRoYXQgdG8gbm8sIGhvd2V2ZXIgSSB3b3VsZCAKcHJvYmFibHkgdGFrZSB0aGF0IGFz
IGEgc2Vjb25kIHN0ZXAsIHJhdGhlciB0aGFuIGFzIHBhcnQgb2YgdGhpcyBwYXRjaCAKc2VyaWVz
IGluIHRoZSBpbnRlcmVzdCBvZiBrZWVwaW5nIGl0IGVhc2llciB0byByZXZpZXcgYW5kIHRlc3Qu
Ci0tIApGbG9yaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
