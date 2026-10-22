Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41584606A91B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RF2g0tFJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B350811E5;
	Thu, 22 Oct 2026 18:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZZnBCjZVlc7; Thu, 22 Oct 2026 18:35:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B18181192
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792694120;
	b=KNEGCFp41dZSehqWf+mylf+VzXVZziE2CnrjJykwLY11sqyPgO/YLqgrqF5lR75XMkS5
	 B/7kg1nTX2KvMHcmo8ug7H6TENYAP/g5+HKbaKITPY0IfLB8RYHuNM4G/cpBArIf7p6tk
	 irZq8QWgT9V7P8GutzV/WGNv0EpgrCGGOchbVQSSCL3reH4IOTh/ejIAIaFQURHnWTFZY
	 dguKWbTmXbbI5Fanf+Ytxh45GQFWYNdkeqR3z8FO54mAEiJqIc5WmqFht1mNn3qnXCg2Z
	 yWQFCS/xBl4p5i4bSpgPFbzQbeXx5TS1/aHdqVySD2rSwrNGiCb3Iv7Jdt+M7nkaDqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792694120;
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
	bh=O6Xu7QC8DBqmoTLe3QmS7DoQA/HEAiu2lETqlbY2gPk=;
	b=WBow5CZfB0w6vG2K2NGJ5LoD5z7PopGh3wX1RxMxMVLmXHjIRsRSxvNNs0Zy7uHquU8h
	 yPbkVZnoTjuGWc9nz9bNB9uaUjKXRR1F8od86gFxNJg8MsnfniHjV8ksSvNFPbCbxQN+V
	 x51SLPJUWQi+4luUV8/zzg+wb8gGy9LJgbA2VLSb1RhmZdu6mnM7WcZYNVB7jZCHHKXI6
	 WLNLFWl6j3E9HdOYArsu7u2yFm+bYG5oApCQKr5+GBFBs8nn1crhZ5Fyt5V/fzBzFWN/A
	 iEK5edNZKXT6SHuRiDlMPbf94EOER7Cj+ZgGPAU/uW72x1D4283PFztGBya74i0WQnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792694120;
	bh=O6Xu7QC8DBqmoTLe3QmS7DoQA/HEAiu2lETqlbY2gPk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RF2g0tFJf/YHvE+qUUDfauOcrTM09r4NY/Jmi2uc3FIE4lhY+9X8D9fuTC2lMrrYx
	 /Oznon3DEVwS7WVcpSvbEEK1j9B1H1z9d6UCelCThv30yPFzWMnzyxDDIPeImmsn8T
	 wQXPwdHbUAZzCmnBV8l57bQRUtjrgE3ShPfIykqbEAJVmDOta3kka8AQwhe8a05D04
	 kqS2IiVJSRPgQ6Rr3eOoEjoThJnprgws8LyJcLZpLiO9AwlOBRSOjzGjpxrT2Zxmfq
	 u8MLkvNnPxOqTzYC/SF+c3xITewqlaKFySy3CeN1bIsyG75BzlVdBLC52cdvUOMkGl
	 a+azxYZuHiEQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B18181192;
	Thu, 22 Oct 2026 18:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E07B4BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F41A40199
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4Z5CubsQWRR for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 18:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 42369400B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792694118;
 b=SqhZGPB0Uw/CyPzhPq4FY6Iu+WuUkAgQztsN8jq1jS2NAZ60UHY2dLw87uXbabpSIAZm
 ftYp3d0JXsgwNy6otuui7eoK5rS8+C2G0QnsbV+qCVYmv1QjRtwW2Zf6qMURAgX4+Iu8a
 horyjFGAW3FWttAJk2giw0bEf6iFd5AH9QRvjb0+aixg1gvX36wXTszmL6gr7kBAXkalM
 3eQIlQK+Y+pqoMxHK+zR+lmJ8WIo5YxvJjzWHQ/MqUq5Kq/Dihw6meBR5MwWaG7mcIF69
 SSVR0KyT6ckKxyaRIqLUsSjwUUdFli8fDCERh8/4OXkYoNmtWDb796m760kpIrWLkIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792694118;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=tmb+YdWU4LEvwI6lx+IBfGiIfsvP2fBC+sMr94zT9mE=;
 b=KSwRi4uMeDYhiKeIOCyl/B+lXtSwwFqdMdwwT0U18ZJ+QHKTvLi/kHvywD0tGHCWEk9r
 sAbCWIDJRlDm9TX1ivnqrh32kO7Ll/6QFZTZDSXZMRKzyTWktBb+HzxLLLykJsbAjeaFz
 rfGbqtuGEoHOAogix8hKrrryQwiUBy9XTG9g84thnKZzg3R2JmlOujMqoNsy4T9FQjUTt
 wVflMx0sILl3DZm1/OPJwmWKtuwmIFoweP8knEL1lRU78snACobqA3ZjA4M1ykv+XOgAL
 sFCu1ke8mZ6WRlytmZuLkormvpVmTjOMN6f/VyLXWAGcHoNPKWgp7fBTF9lVBSY5E4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Ya3jD+Yo; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1064"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1064; helo=mail-pj1-x1064.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1064.google.com (mail-pj1-x1064.google.com
 [IPv6:2607:f8b0:4864:20::1064])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42369400B1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:35:17 +0000 (UTC)
Received: by mail-pj1-x1064.google.com with SMTP id
 98e67ed59e1d1-3ac677668a9so155770a91.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792694117; x=1793298917;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=tmb+YdWU4LEvwI6lx+IBfGiIfsvP2fBC+sMr94zT9mE=;
 b=0SsHlVBnnguZMg8/8QuJyApteAgjf8p3+gwLLiOHx+eHd3aZSCg6OahaD1FFjzmbpB
 RAP8YpHxQOOJCwu4ls0si/j1uGAT3FQd8TP4M/6KkmKUxEUbLmmiJMRaLK7iE/Ga97cQ
 /d0jsB1kcUiCiWgwF4+FZro2GyiL7+3e/rzDJBSI90/b0LQYhxBlJsOgWwcsnjqRr1/c
 HPRmW7ZWdVYLRbP+j48aI7IrUSfImtiYKhoT6XY+fwGfWrK/33YPn7YTMKga8bt+qxMc
 1v/piQjoU0gA6+Z1Lfn1QVqydAjC5k87JuKz9GP66BxYZq9Q4GzLzmp/2NZAjloQtmPz
 A6GA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx71FVV/yii01J/XU/c3NmXAe5s972EXb/3OQ6/p0jrh+KPE8coJp0lzNRBP2FJLzVIFge3HUhEb5E=@buildroot.org
X-Gm-Message-State: AFq9FYLNgc3KdCkWwVEsFVsNMrT/i46/kAOQ3SrneuBazpYtkkC14zSl
 LCMFDJa6pIWr2XffoRykXSU6JFd6iptzkoD0UGHzRrnzO0LpCjC9JQ161WGSBRsjpEPC4f/vBvi
 qItMXfIfPXQXpLXzkLnz4yEt52HTgTGF+tyrlCPE4TtMw4fnMA57gZPn4aXWZL7xx02j5QJTNTJ
 DEBftYx82GVLHc4Fe2dQ8enoRCWG4cqsaQ60xBtDp1LdtUlVRNWLjXakCYWWcgvFaU4mgamtO2D
 MhgIzklrrr1lWue/w==
X-Gm-Gg: AYBFou10EV1H2LtvQ19JSOx3WHQ45dULmEkSRKcw7tUCkC3yVrXU3cnHl6durxT/KkP
 zgrPWLRCyCNRQYe/k9wNAOZsF2A+By/i48jp1+l0XjrgsPLP2PDyuN0Y2mr4gMzNtrYmlJeigbF
 ccAmzFA+XjRKiLoTUWv9EIVZPNLLMBFExvkw5bIxF3ZcE6JQbgPaDh3gJ17ELOBCDOQkeUzvvJ8
 ve2po8J1YwYrjYB948h7bHx4vsOg15sdwzWMupArt6qJ7Fxki2Yeg3bWEDKLYEVXkM7dYryxb5D
 SMhpHj609lO+P5zgb9l/qqObK58Lij4WXJg7bXF7iRx3/Fsb3+ncZ5Ulq0fgAuSpiVNrkhKzrgo
 D14EB2+HMsFobCWANfVWLOfzn+QmboYlCrE96fM1ESuGKxauG/SmKZQKZq4QQnLIqU7DQuHW2ZW
 bSyfjzNyQhXxTmDTKWknMJCYt1nmP22bdlo+64h6o4wPI=
X-Received: by 2002:a17:90b:1dc4:b0:3ac:8741:e2e4 with SMTP id
 98e67ed59e1d1-3ad86cc1f2amr5336254a91.52.1792694116737; 
 Thu, 22 Oct 2026 11:35:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adc964eb15sm57256a91.1.2026.10.22.11.35.16
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2026 11:35:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5365d95f4a1so468221cf.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:35:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwHXq/hJmBOgROV5eFgTGAyMTvd/AkJym5sro5QHR6uxHWQ8lHCA4UvDXBOFE5luZUt+acUYAebQpc=@buildroot.org
X-Received: by 2002:a05:622a:4cc4:b0:532:abc9:8f4f with SMTP id
 d75a77b69052e-5369b817e2fmr91621321cf.37.1792694115382; 
 Thu, 22 Oct 2026 11:35:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc4:b0:532:abc9:8f4f with SMTP id
 d75a77b69052e-5369b817e2fmr91620841cf.37.1792694114792; 
 Thu, 22 Oct 2026 11:35:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c370751e9sm3858426d6.26.2026.10.22.11.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 11:35:14 -0700 (PDT)
Message-ID: <94786551-afda-4d20-b259-6ca2b8ffd05c@broadcom.com>
Date: Thu, 22 Oct 2026 11:35:08 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr,
 buildroot@buildroot.org, fontaine.fabrice@gmail.com,
 markus.mayer@broadcom.com
References: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
 <atpJvzAWPfCcAFln@windsurf>
 <00959e65-921f-4fe0-8c3b-38961367fa5e@broadcom.com>
 <atpWByZNXAvK-Cgg@windsurf>
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
In-Reply-To: <atpWByZNXAvK-Cgg@windsurf>
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
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 11:30, Thomas Petazzoni wrote:
> On Thu, Oct 22, 2026 at 11:02:41AM -0700, Florian Fainelli wrote:
> 
>>> Hm is this thread dependency new? With the Linux 6.14 change, or
>>> unrelated?
>>
>> I looked at the Makefile and because it linked with libpthread I assumed it
>> needed it, but the source code reveals that it does not actually, just sent
>> this out:
>>
>> https://lore.kernel.org/all/20261022180022.1282641-1-florian.fainelli@broadcom.com/
> 
> Saw your patch. Problem is that all kernels from 6.14 to 7.4 at least
> will require pthread to build the pci endpoint tests. So in the end, I
> suggest that we keep your thread dependency.
> 
> Not a big deal as 99.99% of people will use a configuration that has
> threads enabled. Better that than having random build failures from
> time to time in our autobuilders.

v2 explicitly passes the libraries to link against, so that should avoid 
the dependency upon the patch above.

> 
>> Yes we certainly can do that, it's more concise, v2 on its way.
> 
> Thanks a lot!
> 
> Thomas


-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
