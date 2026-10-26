Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73266606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V4MQqfGc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 444A580BFE;
	Mon, 26 Oct 2026 21:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EC_JjD9pQHu3; Mon, 26 Oct 2026 21:50:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5260680A9B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793051402;
	b=axF4OFLvjFKwkUnyRPX/dT/WANb6diSw3Zbd+zFGS64JCy3cjtZ0baupwGyw6+eyO/vF
	 zJKrpW5rsk54hrJ2Qw0v9KKTGLN2DRUmF9m5Kq0Gxbes9Um3asc6sldqPp8YeQFrZsgxU
	 JJR20ras6P/8Oyo7kddNi7aLd/eKKpa9+Zxxcuek2R8wdTtVdZrbpOKFp4N/Hr6nazwDW
	 O/riBOPNLAHFk7AseWSXnLrJtZLsFrIxtA+3oTGksCYNtBqpNkX0hRG5h+byPKH6xFO4l
	 RBde5CxbldaNTWeXPQ6fHKkeEZx30y/A8uf4Cjwd/F3V0vTVQF2f/y+N/fYQij2OsMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793051402;
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
	bh=lMa/1MYni0AInbh/xHqE3FF5UG+AnxJl0QcRWcyxyFU=;
	b=az+h/HoBaqRc85g52sH0r9Ib4rmQSNdPj0Yl8PGwygPmgPegH1CwtHDHvntmTU0GZhG2
	 Y7Dkm9TZ//hnoLtziGF4032rgZG1Ji60T+iAnbwo7Cp/YaDIOCy2zJBxZZ0iVOpREVSgh
	 Kzh9KmIEL0oQA2BhChhJor1NWHrjwFGvhDA0zbV7d1CYVoLG9TSnHZdBPUKPVOF+hP5mB
	 B1o33sQ5k7x822Y5H3YB8VQhnv2bZVd8EhbnXDv0wPqTu59BCN7PsjgoC0RqweziGpFuI
	 vha2xarPss6imVI7pgOvunKnqoI3tzDLtaHHi9lOkQKtS8QB913U0i7vRClvPOLEwmA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793051402;
	bh=lMa/1MYni0AInbh/xHqE3FF5UG+AnxJl0QcRWcyxyFU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V4MQqfGcm5k3rigEYpmuAvx9KYp+JAR/u9Unux3O2Bv9x/7EOvTW7T1EN/2jfQnnf
	 tosIa7tJUn+ABAeVz3U7pPF4QcLhXT0V2V9cPyTRCTYiR36/b3SZKU84ryXc3dTc5S
	 f2JbUI2jE+jOQJokS9VrzfGgTXUPveVH8zbYXhQVEqxNemXx5uToPL5EVsdm4rUFLB
	 0u+I1V4W1inPF1mFk7mfPdYpMdrfD4Gjepn+5S2+UW/CpG/WN7u8CGWEPIMvF7lNqI
	 N4wXI1rUReH+njYA0JvEmhQv3mkdnvzC4JUn1lrugzFUJpVhpsQs0W0FsKv0NmlLm2
	 1Y5rvYJzd019Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5260680A9B;
	Mon, 26 Oct 2026 21:50:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7400C3421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A37E80A9B
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGsN5MeXx8Xx for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:50:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F3AD80A79
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793051400;
 b=X393xjDHeTIy6VNlR8aUiA1sJ/7W9SvlWwa8fAK2JxN0WBdbBKG+lm+zcCCuHv/EKJ8Q
 PdDkgaplp66F6a1P7IRgElU2neR8W1BbampRW3Kpr1eoD6y9qQdWNsBJ1scledxYEbEA7
 NWquOxBqmwLVXSCS9cWCp+lrL0YF5JzLtDqkvgW5bKhUK7tLdnihhyEGgwZU5STI0a0Nm
 uzeidPyMlVEIeADhtC0x09S6kvYaeGTSfAcPnyLtQEqMBFYaK2IZ0kLTwZNubUXkCsw8f
 mpUt5A9jBljXzoiACu1sn/1+RzfVmW55ySjkdTRWyzX8WCDP3VHWTK3rR3A3YqCYSNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793051400;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=D3ru2zYY3iD9+XREURwcvUhtzad94IXNZfTbWO2RjdQ=;
 b=hpj5Ex0EHCalb1sTzR0vOw0bkILpF6kSVRB7xrmV479qd1IeocACxrOSOvMJLhvPYLei
 ma201FC2hA6VMdAwbyFQgQ55uMNVTsa86Pmznj5GYpjEMrkZBgiKuo4NCk5wIgRQy6GYa
 gglNJUIG+1D/LoD6+dIq3X9zOSD+uvtQCi3mPqDZ5JI86BxyzWuDFMImlFETL5GRg4OXU
 ZBRi9KcTVWygW4R/EhItNlpt+fj5jOLHgLbttYsSU/AFnJJ6HPHeQPJtry4S5aZrWD9Pa
 iL8QTMb9kVYjS0h69+7FfhcBOzKjzrVkqB/elLnbYiZvCTH2jXwaRQTw9PUZUtjt7mg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Gh4LEzbs; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::661"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::661; helo=mail-pl1-x661.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x661.google.com (mail-pl1-x661.google.com
 [IPv6:2607:f8b0:4864:20::661])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F3AD80A79
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:49:59 +0000 (UTC)
Received: by mail-pl1-x661.google.com with SMTP id
 d9443c01a7336-2e831e86ebfso21662265ad.1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793051399; x=1793656199;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=D3ru2zYY3iD9+XREURwcvUhtzad94IXNZfTbWO2RjdQ=;
 b=1dIO+Xpp7Q2HLpSjBZ+XZaC2Vfd6IPrroHmaUFgsL2bqYEPCxdVyde/DIDCmzKZW31
 X2CaC5tBn/GWcgQw1gaxG4JTfaTJzh4uxdHijuv0WrzXQDU6foB9zLAOAl81oR/uA95G
 NmzwfO0Bj/o+kkkWm/eHmxGEU5jbaVqPmBSTEwTnXE390+KUB0+BB5ZIywqIMAVv68+d
 NY+8XgOm7D8FPT36KsKRs2BbOVS6pPeIYiyeIZqVhwRfD3J3zmJP9LbgNl3vwgRAuGav
 ZFwf8KY9rRI07q1dnWR/IECd9+GiDfQqZCdYR2uZeUZqvFceL+HNRxVKU0IZjv6OEh70
 QUAg==
X-Gm-Message-State: AFq9FYKzlShiQWIO5zMRy8T5SLsnazvBnWNUoOjcxB2ctj0NyDiYHyC0
 o4UnWuWxgAyYX8P7FypF5emnpCtisxQttSfjJOjdPSfq1cqUPHP9eq6CWnQm97MI4AqANQGkoet
 zJTgiktIs4L40Le1S8Z2oATxJbfYxlAx7Dnc5GjP9HaYKApBknAxY6uL0MC1rn/dOT0ns0dpsUh
 gTMh3KspgaQZWakFBiG/oJj76OXLG7Zyu8IVv7V1mGSFSbzkQsFM7YZA0bjS4P+E0GEn5PONS/m
 SjNuQoXiFROKKhjJPHK
X-Gm-Gg: AYBFou0c+nGmcmrkdm1pfLuR6jTxlKLXZer6oZgzC4fQKzP+N1948U6/gnfJf/zjbKy
 udaj8P4zcA249ZfK2OwINHS3+rcA+J+3DyuUek75MFP5SLSnmHvfxQyFL3t0lfy62m6FMuHzwpr
 6CAGS4Vn8WR4XwocLzjoQaxqruxi8mx31P/OVP2IATPh2qvPQdppjCAfnTqvib7dMRQRodvH6e3
 S8FZahv7EdxqGxCwSlmTNsZLdHsia1ZN11HXGRzu/mboVGgcbr90dyo4W4M7Slm72BjOipRgg08
 IOOK1t/kyveHPrmJYhb3Wa/vJvnwjVckzPho0wVwqJWW/MAxzF5i4KLyu991394fAQboeBFJFpH
 fV6EOgcD6AvqAmsyxepkgm0XX793VM+la4ewKYyP7GzX2iaF/uGkz6s4M31fbIretCWFczPIZv2
 vUMk+4F7+Heal25Nhmn5LtJGUXTFSWHh0W5j22g/KC
X-Received: by 2002:a17:90b:35c5:b0:3a4:b3ac:904c with SMTP id
 98e67ed59e1d1-3adeae6d8bemr6148701a91.51.1793051398796; 
 Mon, 26 Oct 2026 14:49:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae4085eedasm526470a91.8.2026.10.26.14.49.58
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Oct 2026 14:49:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-53639e47be2so80107701cf.3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:49:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4814:b0:537:5818:185 with SMTP id
 d75a77b69052e-5383b413457mr117098901cf.8.1793051397261; 
 Mon, 26 Oct 2026 14:49:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4814:b0:537:5818:185 with SMTP id
 d75a77b69052e-5383b413457mr117098491cf.8.1793051396739; 
 Mon, 26 Oct 2026 14:49:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53839709ed6sm64761041cf.16.2026.10.26.14.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 14:49:56 -0700 (PDT)
Message-ID: <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
Date: Mon, 26 Oct 2026 14:49:53 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jezz@sysmic.org>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
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
In-Reply-To: <at0YSHfI0gcUfMtX@windsurf>
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

On 10/24/26 13:44, Thomas Petazzoni wrote:
> Hello Florian,
> 
> Wow, blast from the past here. Tough (but interesting!) topic.

Indeed, this had been bugging me for a long time, so here we go again.

> 
> On Fri, Oct 23, 2026 at 02:47:44PM -0700, Florian Fainelli via buildroot wrote:
> 
>> Patch 9, the kernel:
>>    - add <pkg>_SUPPORTS_OUT_OF_TREE. When it is YES and <pkg>_OVERRIDE_SRCDIR
>>      is set, the rsync step is skipped, the stamp files go in the build
>>      directory and kconfig is called with -C $(SRCDIR) O=$(BUILDDIR);
>>    - opt linux in, in the same patch. Kbuild requires a clean source tree
>>      for O=: a tree with a stale .config, include/config or
>>      arch/*/include/generated is rejected by kbuild itself.
> 
> So it means out of tree build is only used when <pkg>_OVERRIDE_SRCDIR
> is used, and for a "normal" build, you still use in-tree build? (Note:
> I didn't check the patches yet).

Correct. Out-of-tree is only used when <pkg>_OVERRIDE_SRCDIR is set and 
the package opts in with <pkg>_SUPPORTS_OUT_OF_TREE = YES (only linux 
for now).

For a normal build the tarball is extracted into the build directory as 
before, and _SRCDIR, _BUILDDIR and _DIR are all the same directory, so 
there is no change for any package. The goal is to avoid the rsync of a 
developer's source tree, which does not exist for a downloaded tarball. 
Other packages could opt in later with the same variable if there is 
interest.

> 
> If we were to merge something like this, we would need to switch to
> out-of-tree build completely, not just for the specific
> <pkg>_OVERRIDE_SRCDIR situation.

I wonder if this makes sense however, not arguing about it, but trying 
to think whether it brings anything?
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
