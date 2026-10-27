Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92161606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H+DmDNED
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C7E407C9;
	Tue, 27 Oct 2026 16:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZC3bFBOnsCx; Tue, 27 Oct 2026 16:53:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 747A940757
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793120001;
	b=gFUDx0KMGTXLr4s5UsAcBJU2Ol61tnwrH8GFU80Jml88n3v3IUipZjO2OWNln4DjZEoV
	 tx6w7Yf9i0guFa8tpPz9YNi1AqGMeHEPLy6hqhNsD/OFg6NUzAG2V857dgAO+HcqN4sXN
	 mKV/qq0LJmMDD4rM+iJez4cG0WVBSaihG4Yxwf9loPy16HyTLFHY0WcrptCoq5m20V7uE
	 0e7R9AkU6kw+oBOq08XBxTxHXtJI4x11VqkX+i3NDwQDb6nppDnRdVxRMJGqfQ0yak5d+
	 twWo3//vMxlLRRb52WYQOOwFNYMHGnEeM2EGXtXNwF47+yXPrJdIFoR4eWWcawJKm5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793120001;
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
	bh=UdwIypPZ+xT0qCfZsmCIwHyTOvCpFPLPWnOVaLJH8gA=;
	b=XoyTclU6CVc3kPTRmtAkh65d12Tjb1Dsmo96inRUwqgEIX4upOl1LSC8KeASC2xJRjKM
	 d/qrSZZaeDThQcpirQb9H7NQXTukln15WN5qXG00QvuG02S2zBfaYW8PKK23S1gmX8HOC
	 26aeqNmZXzTLmJJtCFjQOu1KDw2Em/V12dKw7PEVBsjGJE1l5dCYoj18zy3JvHNv0e+AJ
	 Bw/LF0hqrMBzzJas9ET1w3nrMk9UuIUyqbxBXV2ym91UyrrmfkkktwoolbIiFVEcWrDN0
	 EnjyiRdTqbGlZdL87qgBvwS231HHrLa2NQx8kO5wiIjlbV/9Ve3t0tLt0N94MdqJ/WQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793120001;
	bh=UdwIypPZ+xT0qCfZsmCIwHyTOvCpFPLPWnOVaLJH8gA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H+DmDNEDAx98RsaR5KqnoUKrSrWO563tWbTHOrk2L/fP9dbkNeRx/sGfdikMHezRn
	 KM0bMoNY3tK0dh1uRvRAmLa1XVpWnQluGlxB5oMM8IY+WkABtkEFOgGalgsZpGFlWl
	 0d7APT6BmtpPKaB+QyIwT/gfGUF18EQxQMX459oIQui4SGZ8c+tMlAwH57ghsrjUEe
	 +8Ctg4WZVynWERv97IBQNEEFUQvFp8Uqw455w1sqZwGHYs3jujOl0LTF7zl6QsnqGy
	 C+SjEEYeMPdEa8OVuW2CvQrNQqf2bWuX8iJA7OlxrGj4N8DNJ4ZZw016Z2LdH4KEC/
	 yonCwDfhoJ4XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 747A940757;
	Tue, 27 Oct 2026 16:53:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E3A0279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F90F80FBC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8T-hdCjl7Xu for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:53:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31D1A80970
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119996;
 b=GXVWQcmhPyTUJEYdpYvmH1suaAy0zG1amf5RbOB3r0q3ifbZrW2A6mVhKs1SxV2iQ2FG
 zsJtOTuYQXURvCMMEO2+BFjiVLtAqa0xnksSs45w6FDy2gskYXFoGT4lbwZLSQGZM80Bg
 ZNFSrB19G5KfxLxXIZfrK5wdHBNULvYvrZujWJ3M30mzfn9fWj+2CjVIlaB3YidEyR5pF
 tJPQi3KjMNpNNi9Oc+rGOG4ZGWpG3mqXLja4YfdGjI2VIE+3C6tc4+1cGWL6S5+MW+Tdt
 WR0x1ih6DOuosRM24n7KkJMS2TipxDzaZDw3MqxP8+axF/rzd41xOSNBg0rV4t/VyyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119996;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=QW6xKnFHRx4pD/3ned35zaTBXlZZXvcS4pZn+3wg0l0=;
 b=iWI23YX+3FMLt3rZt0f0S2jUPy+DPIc7cMSoHX5YNnyy+pM6ZUsGA0ptqHizC88UQIo/
 hEBY+W6UXhJX64SvHQRgf/eLniAHrkTvFHRG0f29Vgdb4kLQljdlrX2Lq8J2NFOGS/4Sd
 FoXEm4HGwhvRCeN24Bq81irHWhJujgvYEQiFQVwcd28ulNhCBkUUoQFGRyUG+X8A9jTG5
 1k2FrFX0hoeQ8K7ZxR2Tl/Fl8Ee5GH2VHJQuAeHDucTOZSHoVTA5ISV3crExzqRO525Zc
 2TXw3Y2Jm8lTdMC2nNdVa4AZsudjP3g+MGYXkrbB+g7KrHUObKCTrF99AVexzguPlAA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=gOUZkdFD; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31D1A80970
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:53:15 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3ac451e128cso87950a91.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119995; x=1793724795;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=QW6xKnFHRx4pD/3ned35zaTBXlZZXvcS4pZn+3wg0l0=;
 b=IoWy6wTLyPcCmBYoG/KfxXhnGoYO6bEHTPhmseTq8xTyqu9OkPof3WIOgrtnGNVzYr
 liqxlYI+CsWRmlIMS8bqp6sPv80BjjNAXgPLyqCanJGwcKdd2gtJuuaCLHzPRnY9wKrp
 LJi/0mkVJ+U+PxiWRI2nktM3iPDZNxm8OOGsGv+qfwEFf4hMv6FANHyYLi4eaG0lKh8m
 OGbve8DQdDh6jfcLnSovkw3+ogdDb8iEUbdgT6dt9/RSVwEPtFLhddBt9mp0rnuLyQoa
 VC9LJa5mYeNOcNJAT1pUtPl1/ijslDy3OQeQx4n4haFpZb3+tiNv8zh0WDEYHn/Tjift
 mwRg==
X-Gm-Message-State: AFq9FYL1xu6wi/AGLQWAaLgzCGrC1igVlBCX4vZAS4fw8o4gHgsxX+Hw
 E2t30Qm5wQgQiHEyxl5+mSPKTrboiFW0DsYbvIA3Z4++cy3kFPxZFoobshpvHllegkJ653l8J/O
 S6aEvbE5l7U/YygmsKOe6RVuGa+BJpdo+S4YRd2ID5uCRGWxSnSIbvtJiAbnmjk2wr6T2MmuvVp
 iflo0NujY7D+56MYY99ECBKeJ4AWl4ku0eHi9hn9GG95t30MzZp0N2r/9i98/NkSpFxj+nD8eEw
 Ra78wJMD7MvZpZWTg==
X-Gm-Gg: AYBFou3mWoJsUYNZAA5KQrJaO5pNHbP7rC9Ua5yn/qgFP83/aJD51k0h7jpg77Ypkyb
 eJfQQI+paxjdO7lAKONRa0UtLRWBdtIC99sWIojIGNx7nMyJEbgjbsLqC/MMT5S+pDo+3FuXp8B
 2sEWWyZo+7XudX6ebsmYZA+UEKsHoBYZJ3kXkpEcNt2CUZkwfD8ciJ8ZTBhuecrw1MSHSyZcIFK
 rqLV+kT+6vxA2WmUFDZ4y33NLqYFZ6xWifOenLRudWPkBpm4q7hETd9ICyLw5VO2ZAPQI9/gzae
 M9rYaDJAweB6anlmUrLhIjf41LYoGoI8liJM+wfqv+/GbRC6sq43pHBw4HNaluyxWOapHBuzYPJ
 MHrKmXt3D6xVdmYWDr4yFI/HHkaSoOfwEfo8iii/WOfIcKK0zJQgQkLj53yVq3enWEt2qqFmX5O
 zEjbgrVvUBBNweL+CqChCk8qUvRxB86N/Qix4wCHTxFes=
X-Received: by 2002:a17:90b:3c03:b0:3a7:a463:54bf with SMTP id
 98e67ed59e1d1-3adeafb074cmr7501107a91.33.1793119993500; 
 Tue, 27 Oct 2026 09:53:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae55d4f7e0sm10910a91.1.2026.10.27.09.53.12
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:53:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f5844e383so768949585a.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:53:12 -0700 (PDT)
X-Received: by 2002:a05:620a:278d:b0:93e:653e:6981 with SMTP id
 af79cd13be357-940ef7cbd2amr1581269685a.11.1793119992057; 
 Tue, 27 Oct 2026 09:53:12 -0700 (PDT)
X-Received: by 2002:a05:620a:278d:b0:93e:653e:6981 with SMTP id
 af79cd13be357-940ef7cbd2amr1581265585a.11.1793119991552; 
 Tue, 27 Oct 2026 09:53:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f078ba99sm1025944685a.32.2026.10.27.09.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:53:10 -0700 (PDT)
Message-ID: <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
Date: Tue, 27 Oct 2026 09:53:07 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
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
In-Reply-To: <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjcvMjYgMDY6NTMsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IAo+IAo+IE9u
IDI3LzEwLzIwMjYgMTM6NDQsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4+IE9uIE1vbiwgT2N0
IDI2LCAyMDI2IGF0IDAyOjQ5OjUzUE0gLTA3MDAsIEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6Cj4+
Cj4+Pj4gSWYgd2Ugd2VyZSB0byBtZXJnZSBzb21ldGhpbmcgbGlrZSB0aGlzLCB3ZSB3b3VsZCBu
ZWVkIHRvIHN3aXRjaCB0bwo+Pj4+IG91dC1vZi10cmVlIGJ1aWxkIGNvbXBsZXRlbHksIG5vdCBq
dXN0IGZvciB0aGUgc3BlY2lmaWMKPj4+PiA8cGtnPl9PVkVSUklERV9TUkNESVIgc2l0dWF0aW9u
Lgo+Pj4KPj4+IEkgd29uZGVyIGlmIHRoaXMgbWFrZXMgc2Vuc2UgaG93ZXZlciwgbm90IGFyZ3Vp
bmcgYWJvdXQgaXQsIGJ1dCAKPj4+IHRyeWluZyB0bwo+Pj4gdGhpbmsgd2hldGhlciBpdCBicmlu
Z3MgYW55dGhpbmc/Cj4+Cj4+IEZvciBtZSwgaXQncyBtb3N0bHkgYSBtYXR0ZXIgb2YgY29uc2lz
dGVuY3ksIGkuZSBhbGwgcGFja2FnZXMgYW5kCj4+IHdvcmtmbG93cyB3b3JrIHRoZSBzYW1lICJ3
YXkiLiBJJ2QgZmluZCBpdCBvZGQgdGhhdCBzcGVjaWZpY2FsbHkgZm9yCj4+IHRoZSBMaW51eCBr
ZXJuZWwgcGFja2FnZSwgc3BlY2lmaWNhbGx5IGZvciA8cGtnPl9PVkVSUklERV9TUkNESVIsCj4+
IHRoZXJlIGlzICJzcGVjaWFsIiBtZWNoYW5pc20gaW4gcGxhY2UuCj4+Cj4+IFlvdSdyZSBmb2N1
c2VkIG9uIHRoZSBMaW51eCBrZXJuZWwgcGFja2FnZSBiZWNhdXNlIHRoaXMgaXMgd2hhdCB5b3UK
Pj4gYW5kIHlvdXIgY29sbGVhZ3VlcyBhcmUgcHJpbWFyaWx5IGhhY2tpbmcgb25lLCBidXQgSSB3
b3VsZCBpbWFnaW5lCj4+IHRoYXQgYW5vdGhlciB2ZXJ5IHNpZ25pZmljYW50IHVzZSBjYXNlIG9m
IDxwa2c+X09WRVJSSURFX1NSQ0RJUiBpcyB0aGUKPj4gZGV2ZWxvcG1lbnQgb2YgZW5kLXVzZXIg
YXBwbGljYXRpb25zLCBmb3Igd2hpY2ggdGhlIEJ1aWxkcm9vdCB1c2Vycwo+PiBoYXZlIHRoZSBz
YW1lIG5lZWQgb2YgcXVpY2tseSBpdGVyYXRpbmcgYmV0d2VlbiBtYWtpbmcgY2hhbmdlcyB0byB0
aGUKPj4gY29kZSwgYnVpbGRpbmcgYW5kIHRlc3Rpbmcgb24gdGhlIHRhcmdldC4gVGhleSB1c2UK
Pj4gPHBrZz5fT1ZFUlJJREVfU1JDRElSIGZvciB0aGF0LCBhbmQgd291bGQgYWxzbyBiZW5lZml0
IGZyb20KPj4gb3V0LW9mLXRyZWUgYnVpbGQuCj4gCj4gIMKgVGhpcyBzZXJpZXMgcHJvdmlkZXMg
ZXhhY3RseSB0aGF0OiBpZiB0aGV5IHNldCAKPiBGT09fU1VQUE9SVFNfT1VUX09GX1RSRUUgPSBZ
RVMgaW4gdGhlIC5tayBmaWxlLCB0aGVuIEZPT19PVkVSUklERV9TUkNESVIgCj4gd2lsbCBza2lw
IHRoZSByc3luYy4gQXQgbGVhc3QgdGhhdCdzIHdoYXQgdGhlIG1hbnVhbCBzYXlzLgoKVGhhdCBp
cyBjb3JyZWN0LgoKPiAKPiAgwqBUaGUgb25seSBpbmNvbnNpc3RlbmN5IHRoYXQgRk9PX1NVUFBP
UlRTX09VVF9PRl9UUkVFIGlzIG9ubHkgdXNlZCBpZiAKPiBGT09fT1ZFUlJJREVfU1JDRElSIGlz
IGFsc28gc2V0LCBub3QgZm9yICJub3JtYWwiIGJ1aWxkcy4KClRoYXQgaXMgYSBnb29kIHBvaW50
LCBGT09fU1VQUE9SVFNfT1VUX09GX1RSRUUgaXMgY2FwYWJpbGl0eSBiZWluZyAKYWR2ZXJ0aXNl
ZCwgaXQgc2hvdWxkIGJlIHVuY29uZGl0aW9uYWwuCgpJcyB0aGUgZGlyZWN0aW9uIHdlIHdhbnQg
dG8gYmUgcHV0dGluZyB0aGUgc291cmNlcyBpbiBhIHNlcGFyYXRlIApkaXJlY3RvcnkgYWxsIG9m
IHRoZSB0aW1lPwoKRldJVywgeWVzLCB0aGUgcHJpbWFyeSB1c2UgY2FzZSBpcyB0aGUgTGludXgg
a2VybmVsIGJ1dCB3ZSB0ZW5kIHRvIHdvcmsgCm9uIGFkamFjZW50IHNvZnR3YXJlIGFzIHdlbGw6
IHRjcGR1bXAsIGxpYnBjYXAsIGV0aHRvb2wsIGV0Yy4gc28gdGhlIHVzZSAKb2YgRk9PX09WRVJS
SURFX1NSQ0RJUiBpcyBmcmVxdWVudC4KClRoYW5rcwotLSAKRmxvcmlhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
