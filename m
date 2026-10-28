Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4DB606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AW92/UD/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E12F84358;
	Wed, 28 Oct 2026 18:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9QAnz98g8sK; Wed, 28 Oct 2026 18:36:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2968B8435D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793212570;
	b=Ed7ubwicwvESZqwZLQ3qschwSUfayzPBTZHaHHB+JWTbX6SkAt8dLtwKGMXWykvvoACb
	 eJe3qk61IEoZGtFvNx6GeXhtfYEkMaYnV1vjJnJB3Yej5MBDXkulD3pqDmrR5t8exiQV3
	 9TiTwSGCGA8GmhWVFQ8wTyX64ok2aCs+mDSDxfafWr463aAXRT0ooghJxJPIFIW2pXOMp
	 AxskqyvNhmTciUcxx7hC4K3LLP1bH8ME0/wevg6901oWHcar0j50Vm5v/zKgKGkfzvKNP
	 GZ8B4SunUp08csFv3psfmN+PyKdWYbVWFB0KjACl97BKpfmPYdmYi72ALIBXhWw07HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793212570;
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
	bh=55G/JBAKOGIqYl82xBuoX+S+qtT9bfJdS48BAjzh0Qc=;
	b=mA+z2t6Llg/rrEU2q9Hq2wVrSkd9av/Q8Fus6m7zoYdpOVU3/dAIYcoEOazNRxv2G0Yh
	 iYhrP0eZTnkCD1SlquLhSBlt5r0jtWeRhO/r8jzFIPuP0/AwpyhwABCwOiiFxBwkcJTaq
	 82l//Fapq5l3x6TGvWZ1qw2QFXCSOU8pj1lACBpaewTaW7qBh9RkOm9gl9HqyyyzxviIh
	 MepgHzFgl8+Eq2auu7a8OH94BLYJJc41Hq9tJ+CBHkCm4X4DOjTgMsG68SeWXIU3cckDF
	 UV6Kp1NofCDDDKvbUUbTwpSwJdG0xMOwlhsTGXe58Fwr0Fqjs5t+fnr/CVRzeiNi5rA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793212570;
	bh=55G/JBAKOGIqYl82xBuoX+S+qtT9bfJdS48BAjzh0Qc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AW92/UD/JjxG1GD3TbXn14uumAp5hqgf5/RMUcLQzinafEmrSVwFuXx47VnETwy79
	 kmrDUAr8OFxMRxxwpd4bSuMskjzzDRv1dFXzYW0BqBRyUXFmoX+k6DxOmdQGjsv4ZS
	 aorHWUijERno1paAUD3b01SQBILb3H+2e8ffs6cgRz4O2Jhy4uSqh1/ol2BofBRkyJ
	 HbxwIq+on8/vT8uIp3vQSyUwFoh9pbaHeIjOOdMigcaDfak0tH54CMbBotyDBIzFxS
	 g+XeE1ehnyHUTbcTze39tu62mdIQcomukbZ2DrMDLqzWLd9SB/0Rznzwojmo5mcMXa
	 8juqm1Baw4N8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2968B8435D;
	Wed, 28 Oct 2026 18:36:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB649362
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD712414CA
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaoGhuygHkGE for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 18:36:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9B1BC40FD2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793212565;
 b=odqLpJZMSHV6c3f5hT7ppRkbyUGsvON4D2siNOvocEyo9oTsfjetSYx0jMvWBEkCvhtA
 PMI40M1o6tEuxMylVrS6yOTUycFWM13IxbC9Wbk3HVymCqAJhXQ0Qx76BAQmCBC3/Z2vr
 ZYuDGOW6m/0R4PvkR8/XbzIgRi/aYUjUhOR9ay3tkoCW9NaUWxXFCurm9wQw82TBGpgoM
 hjKSDN2gJI3/RpeAsDmQl/ius2KAF/xiQl/ga2EYD1c2G9vLEugPAHxPLQHasTmOnvo4y
 s8tEt13lLHVETRnJfo1pdBKKXPDnYMK2mCv6634qoQPFd0mypAkVjXVWTe+C7ylP17w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793212565;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=h7pqpA/tVwjYGkJmAyNsURLIHoz7TNbutEPQoSRACFo=;
 b=A5pvwuHlbxbQIJ/lhdCoV0tL2mNZb2i5QwYoXk4YI97bfZKxcNEhK6yZpmhLzuVQOJJN
 WGQT5PXA7QcTBXZ+O2OFel4/0fb1YCXuXYr3W7wynZ33lKm/GKX3utFciTNxm5f9DhZAW
 9RAIXm4o4fuEYCJFe4b95Pu2xPc09GHMZ+9Yt4b0HIsIRUiwFaWBYmN9u2mzNUaV4uVQo
 CV8SlfQZ3SgYlJDSlffRrlwM4+GkeZtKK9gGd89Dl13EixNcnpzTANve0ca4TVLmtpH0r
 JKaVGCML4kzYjrdQPsIOjHYkw9zrYfuVeP5xrK7RKZ2rxPIRw+AX2YS0jbCDgCxdFpQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=aa6uDY99; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c61"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c61; helo=mail-oo1-xc61.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-oo1-xc61.google.com (mail-oo1-xc61.google.com
 [IPv6:2607:f8b0:4864:20::c61])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B1BC40FD2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:36:04 +0000 (UTC)
Received: by mail-oo1-xc61.google.com with SMTP id
 006d021491bc7-706113e92f9so851491eaf.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793212564; x=1793817364;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=h7pqpA/tVwjYGkJmAyNsURLIHoz7TNbutEPQoSRACFo=;
 b=JL86tgsaOxZgbHDP//ZdCBhzqZ4idc7CRLnTI6GMe5y8xXsL0iaqKRa4v4xlaU9p1C
 5vJsHIqvuOS2VznpbRH31zTzeT0lgO7usNs4PX6GVFhtSNUgVJtRwTjh+iXN1Vu/q5x8
 C5HouGczCCjU/gqQxjDXdjjlT1b4R0GQw/w/INDnDn1NkwZBCLWZgjfXIKACGKXC5IZt
 24aleT4mgrcphj+xphVtmdQG3DLFIzKI+VZt29ID85c03JJTHy/gXBOwOtWKPQjmMvd5
 jmU8peVopqP2ny3p9eObkbkzivcZTut1bwsb5nxmXM+U51DqTVm0DjhjtHpxcvbsG7vI
 bLEw==
X-Forwarded-Encrypted: i=1;
 AKwUvByVlxxzGmjchWesxnsH+2hOkSmSyTXgkx+M2shq1zia2cjQ6p4TlJ7MUHHTRpkMl3fHDiu1CG3RW6Y=@buildroot.org
X-Gm-Message-State: AFq9FYI+Fo5y6G0RWUjrUfBBmLDs09AQe2TddAOPYosBs6oAPHaTVyfI
 oBQm64j7GvvuLxiGo3xojtdr6tXRJWGMEAkDyPD/iOlw0ctYIND0cv0MkzkSw+b25qbZPbYkLVd
 w/rxAmq6d5yEEvY+0UEBR4gXpVU1SnwoXhTOK4uVfThF5U1/emucgPePq06fn4vcNKmlX3pqSzP
 qLkOi9olonQgnfoGlXoy0ILbKBA9GM3zJISgo8+9JkScG831pGPcPnwomkkNqQIV8asOBQ0aVpn
 QxcJk6tgQ==
X-Gm-Gg: AYBFou3B0GAmQxhY/IdJRjAUfmMwZAGExVKYPpckXtXaO896d3vzwgVrf5mgO6Nq+Bi
 CUJ1vkRoDknEKe4sbeJEXXAQqa8pMbtD00XFLj+Oyqw5tP086GCu/+DaGLmI3Jfn7frMr8LVJWZ
 AHJFU6/XgkV7r4AGrtk7L/B8LDyOJ0RAZE8mQyRC+4jXAdIP9uuhX9PGojx2mUuk4GXJ7D/z3zJ
 2Ja7YpQaahag5Dv0+Y2qD9Css1kzhHaZjU1uqYfz3JKGpKuYsgVk6TY7yn6eXflL4m95h9i6EFE
 CfCfbvixQFSAp9SdpyM/CwWvvlqV0eF1RYosBv9qFXIkDS04vi0dny/eKGBnCaFopq24fS9dwTX
 QOHcT7oe0i5+gW1EB5K19HjyFhmFV7TjNPR7sC4eqf9GVe42iy/lAK92p0Nv2/ZShtf0AeSjrQh
 zPqak2KfGY
X-Received: by 2002:a05:6820:c3c7:b0:707:7495:9458 with SMTP id
 006d021491bc7-713f0ca7adamr1150943eaf.16.1793212563820; 
 Wed, 28 Oct 2026 11:36:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 006d021491bc7-7142d12d89fsm38125eaf.31.2026.10.28.11.36.02
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 11:36:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2e94f72fb9fso11967345ad.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:36:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxoLWFAam5KLmnmYNUBmQxiQzK0/xMutUl5pK8ZYJpboOoSGwHsk5Bp1NHdHarHGBZ2mep7hHJ+eL0=@buildroot.org
X-Received: by 2002:a17:903:3708:b0:2d9:464f:d45f with SMTP id
 d9443c01a7336-2eb0024279fmr30769055ad.5.1793212561513; 
 Wed, 28 Oct 2026 11:36:01 -0700 (PDT)
X-Received: by 2002:a17:903:3708:b0:2d9:464f:d45f with SMTP id
 d9443c01a7336-2eb0024279fmr30768775ad.5.1793212561078; 
 Wed, 28 Oct 2026 11:36:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2eae6c37551sm26110595ad.51.2026.10.28.11.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 11:35:59 -0700 (PDT)
Message-ID: <365a841b-48e5-41a1-8711-5db60f759ffa@broadcom.com>
Date: Wed, 28 Oct 2026 11:35:56 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 <auD5d-yrritLxAfN@windsurf>
 <ae0634ed-d834-4ff6-a239-6fdbdb180334@broadcom.com>
 <auI71Zq-3lVH7z4U@windsurf>
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
In-Reply-To: <auI71Zq-3lVH7z4U@windsurf>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 11:16, Thomas Petazzoni wrote:
> On Tue, Oct 27, 2026 at 12:56:20PM -0700, Florian Fainelli wrote:
> 
>> Do we have any preference on where that directory should be, and how it
>> should be named? output/*/sources/?
> 
> Wasn't this already in my (very) old patch series? I think it was
> output/sources/<pkg>/ or something like this?

Currently it's output/source/<pkg>-<version> and it is set in Makefile 
in one location, so we can certainly change that to sources (plural).
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
