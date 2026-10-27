Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A614606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lDS15NPJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04FC2606BA;
	Tue, 27 Oct 2026 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31dZyvtNP9Dk; Tue, 27 Oct 2026 19:56:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 310A3606CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130989;
	b=Mj1lz9/lYo5AsRbUbMkXRoNadqiTfjy/Re96BIrne7iRpVfJpEPuEEP88rY+Q7F3i+78
	 6QTSaSdHgX8aAVZs2Uam2KrCu+PwWosBOrUDeucjLggMfwkYDoC2M4sfu1XuCqLBxExJr
	 86C6rlQLnffwu++Qg5s5Ae7tzvKWGE6HNqp+3tKNM6DL83hW13DpTZiCVvwbhO/yjf/gI
	 VdGez01ftXTzsqfbjYSKdznmP6GH9rhDB2F0MhdmrNqMnsub4volNGeQxNWkkWkVCdFxZ
	 ffIZutd/rhrK0Do8B35QaBD0whVO/cjugMqBb1cqkfGvQumKUkyp3zOmw9SorUHLX+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130989;
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
	bh=60b3svCeOwTkLqOs6TCKrhg6MkZaavH21RFM7RBq34Q=;
	b=Ghb9ilmDeyOWyq9G8SgJkOG8a3RRp4tBQj43Jr2DdlQTehoCkl7zVCqzBSGTvnBLgLBe
	 NfI+YiCrAdY2WLvMsLz0/8FKsT62KS/PraEvnNKE5sPbEKuwJgaZ+XT8NFieATUgJfmW8
	 2NqQsmTdN3ouZqGJ5NWyl9JW/L4p29NdYt2OzH+EHkq3J6mjWIEeDxJiBVi2EHuTxAmLx
	 nQdDrtT0gEiBWGXeQl8HSwMbOiVFIn5NpZWVz1w8oVGmiEWJ1T74Xih0Q9fO5C5Y5s24f
	 f+u9iIQZBfHqZa5Pwj/ut3PPVVYJ8/5k2aZ5AehXyjlhaTBrGYdVCwU5Aa9AjuBBSHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130989;
	bh=60b3svCeOwTkLqOs6TCKrhg6MkZaavH21RFM7RBq34Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lDS15NPJnpgdFVDC2Z/cGpILYVhv0CZFJtKxQftKFVTvbkBG0pw0DWisUkR9FZDMR
	 z/cUw9fWw8kORWBNuFcyR86ZqHuMh8w//3NW8/MeRz69FYPVHJnZfjH8vo4OqsrMRj
	 h2RNMWF5kBGmg9/SiOJzTsva3WnGNO3XcxMMzNkYIJqGmaOzRXySNRbAXSFbYzOzzq
	 QLlCmdmRsYKSXO43e0xbqyjAWkV3usSIAMZER5TgL5tKLyijvq3AtcA9rKkOP7OitV
	 TmREQL8YD3h8ONqkq3GMdmL1QzpU+SbfnRvr8/RUJnqwQXhsltt7OFfBtyE4hYvZNN
	 Dpzyr0lFynhqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 310A3606CB;
	Tue, 27 Oct 2026 19:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC024279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD563606BA
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVhlnb2Jee0s for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9DA34606CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130987;
 b=kbtzJ2PibBC6OKdaFPE72pzXKlYxgMuZLxKLCiNkjWi0lsSOmECKVdoLyXRS3aKHBxmo
 DVses/2rsmGdKX9xQ4iX4ReQKziY5b2oU5tT8/1ICRsuBCgKwAfZcEHC8LHEtqvToQqd+
 zS2zy6bp4dxZwt1EIzqn5xjmHIFjyyQBbqonQnwv+WeY3ojxtkQXrhhhVZmr1CXsOzeKr
 3e09BEviUnT/MA14kMZHtdeccIiYdmhGtLnixxDetzmimnotmskqNTNWPC1tp/wCcBIQI
 9B9ltTD6QUnX0qEpeOLCtXt+TnwW3ltGGWI1/8hN32krKWY6q21LA5fGun3jtv1e6LA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130987;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=FvdAf0nu3FyWWLwbvU9K6YQzQLPY6ut6YjF2l+ZDdxk=;
 b=P+0+flMfztsDr1agDrrXff+CRIu1R3xKPIbr3kkBolFkjrsnB2CFrsFz/F9qI37HBPoK
 dWd7dsPCu8y9L+c7WhTTciP/5W1uhmH06anvsGrcbMPff2j5O5YD3wTfN4sDvQuYl1xhv
 CrWF8ltdhqY39rZO4kmJL1v/Opkcno1Ehyy/Fomch9P6fxt3iI6EcJUsnPqyV+EcezE4z
 VnYUfHLfT2FRFTKpyEVW7YeIATEuw5yf88NIe2EdAUR0D9SZzI0dZNUqJqClJP8d7Actt
 CjEV/G8ZodQbs4mrIwm3VqMGugG/Rszesp1U1sYEtVM3xw/00Hq5sLsoTmfktVeHNRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=V3ENSO9H; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::b162"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b162; helo=mail-yx1-xb162.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-yx1-xb162.google.com (mail-yx1-xb162.google.com
 [IPv6:2607:f8b0:4864:20::b162])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DA34606CB
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:25 +0000 (UTC)
Received: by mail-yx1-xb162.google.com with SMTP id
 956f58d0204a3-679a2b540f3so290648d50.2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793130984; x=1793735784;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=FvdAf0nu3FyWWLwbvU9K6YQzQLPY6ut6YjF2l+ZDdxk=;
 b=qXhyfvtyXPUP1w/+ryaWTGQKdzMK4DsgEgEsA1+7bShjByVHAV4pyAIcXPK8T/+u9q
 03yt2b7NUNQpAONftfjV1MDQMXbBsLBa5VyfOALbC2Uv+//1aN/DaYELFxlSd9ut9TGo
 SqiGEwYUye+QVg863Lg9CMl6ElJ0NHCc/pA2Mbu7u28YWUnXVqEYz+bLPl7TqJ6kF59o
 djByU75W4TKMUNVBTjaALZWYHXJPplRXvw5b9+v97rE9Ct8JNRdPyeD2R0UeHqPl0SWo
 hOzqtiqEPd8hueZe2HUR1bHCQpBp4sSIabroZNS2EqZZNUmH3kwvYcAmnvnyd2BuoWl3
 jrMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxWYFeiuEdfCPo1kY6rP9dHgM8SVZMQVjO1d/WBNgXSHbuTLgURJWvgCLhHrXUyWjuUyGsHr1Jj1ag=@buildroot.org
X-Gm-Message-State: AFq9FYIJ3qtkRFFWHXmbSIJI9Atds/cIhL65JuZMnh/fBLvus45xvBOK
 vylIzjd0IzoWTM4BOWSrxoMp2nblYTbdkeCXiPaN/s3Qo2ywGwQPuD0XWmF3IYnbXmvsU/T35GT
 ByUjDo+d9C6TvxKZrt4GNoNo6C4ALP+cKbtya6bc9mzaCD8tcIGYf0ceeTCw2HubzaRHNzNzYZy
 Z++DfUqDdIM68kOIZMhtdgVUbKKr+rtr84BXWVhiwY1JLvGGWg0JS3sex9pYQ5mPPsQLsLk73aC
 4H9Gky8qtEYgtlraJE1
X-Gm-Gg: AYBFou0QcJ1i9dSsZ2tUdj3VO+/Ikq4eAj++jPAGiSm3d4wdm5/ywH6isew4b43dvQZ
 Au8M9GkYExEX+alghyuGIYAlttZfa13L/JhaiIUVMnbUa4ousVriMFepRoSrB6hzgLzr9VHML18
 9zBBdMtpgJA1gZkwacJwMzDnWTEQ/mXoxjclkszqRUdBsGRfgsSv679S9GNDXBUUOgRs7srF5yN
 efUtAIuezLC5muMrCyEPnpd9EZknQ7LjnWI6IVxBpuMam2kho/Wy6Xn1VGVP86EzEXny412cZAl
 PNlR/Vvih+orRSOeqCLMFBgue/Ncu/oKznmpMwI93MipO5AvNEQ6CDjTwvuoE3r3D46p5uXlg8I
 RB5zvR7/vgI4U5xebioqI6tFReWxrnMMcKDKByGP3fHHZI6xnPT2a4lPVRlB2btIqnYoThAOsYv
 hdEdbLq9xO4UM7O6zzK5xZKe8BraQrxmSG1zVtbEEt2C0=
X-Received: by 2002:a05:690e:43cf:b0:679:2a90:d3ad with SMTP id
 956f58d0204a3-67a7bd5967amr304238d50.102.1793130984600; 
 Tue, 27 Oct 2026 12:56:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 956f58d0204a3-67a7a1570c8sm23285d50.30.2026.10.27.12.56.24
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2026 12:56:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f322ef7d3so35784985a.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:56:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwNoAwPvWBGVqRNXixyezf1D1BLIdDs6VWqWcB6+39rKekGj85ul1u6SsRAv6Cxc4ilLKRCJZFCLjQ=@buildroot.org
X-Received: by 2002:a05:620a:17ac:b0:93f:1d5:9973 with SMTP id
 af79cd13be357-940ef9ca5e0mr1533889385a.73.1793130983843; 
 Tue, 27 Oct 2026 12:56:23 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:93f:1d5:9973 with SMTP id
 af79cd13be357-940ef9ca5e0mr1533884685a.73.1793130983302; 
 Tue, 27 Oct 2026 12:56:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f0a8549fsm1047366085a.39.2026.10.27.12.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 12:56:22 -0700 (PDT)
Message-ID: <ae0634ed-d834-4ff6-a239-6fdbdb180334@broadcom.com>
Date: Tue, 27 Oct 2026 12:56:20 -0700
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
In-Reply-To: <auD5d-yrritLxAfN@windsurf>
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

T24gMTAvMjcvMjYgMTI6MjIsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gT24gVHVlLCBPY3Qg
MjcsIDIwMjYgYXQgMDk6NTM6MDdBTSAtMDcwMCwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPiAK
Pj4+ICAgwqBUaGUgb25seSBpbmNvbnNpc3RlbmN5IHRoYXQgRk9PX1NVUFBPUlRTX09VVF9PRl9U
UkVFIGlzIG9ubHkgdXNlZCBpZgo+Pj4gRk9PX09WRVJSSURFX1NSQ0RJUiBpcyBhbHNvIHNldCwg
bm90IGZvciAibm9ybWFsIiBidWlsZHMuCj4+Cj4+IFRoYXQgaXMgYSBnb29kIHBvaW50LCBGT09f
U1VQUE9SVFNfT1VUX09GX1RSRUUgaXMgY2FwYWJpbGl0eSBiZWluZwo+PiBhZHZlcnRpc2VkLCBp
dCBzaG91bGQgYmUgdW5jb25kaXRpb25hbC4KPj4KPj4gSXMgdGhlIGRpcmVjdGlvbiB3ZSB3YW50
IHRvIGJlIHB1dHRpbmcgdGhlIHNvdXJjZXMgaW4gYSBzZXBhcmF0ZSBkaXJlY3RvcnkKPj4gYWxs
IG9mIHRoZSB0aW1lPwo+IAo+IFRoYXQgd2FzIHRoZSBkaXJlY3Rpb24gSSBpbml0aWFsbHkgd2Fu
dGVkIHRvIHRha2Ugd2l0aCB0aGlzCj4gb3V0LW9mLXRyZWUgYnVpbGQgd29yay4gSSdtIG5vdCBz
YXlpbmcgd2UgbXVzdCBhYnNvbHV0ZWx5IHN0aWNrIHRvCj4gdGhpcyBpbml0aWFsIGRpcmVjdGlv
biwganVzdCBzdGF0aW5nIHdoYXQgbXkgaW5pdGlhbCBpbnRlbnRpb24gd2FzLgoKRG8gd2UgaGF2
ZSBhbnkgcHJlZmVyZW5jZSBvbiB3aGVyZSB0aGF0IGRpcmVjdG9yeSBzaG91bGQgYmUsIGFuZCBo
b3cgaXQgCnNob3VsZCBiZSBuYW1lZD8gb3V0cHV0Lyovc291cmNlcy8/Cgo+IAo+IEkgcmVhbGx5
IGxpa2Ugd2hlbiB0aGluZ3MgYXJlIGNvbnNpc3RlbnQsIGFuZCBzbyBmb3IgbWUgdGhpcwo+IG91
dC1vZi10cmVlIHRoaW5nIGhhZCB0byBiZSBhbiBhbGwgb3Igbm90aGluZyB0aGluZy4gQnV0IG1h
eWJlIEknbSB0b28KPiBwc3ljaG9yaWdpZCA6LSkKCkNvbnNpc3RlbmN5IGlzIGltcG9ydGFudCEK
LS0gCkZsb3JpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
