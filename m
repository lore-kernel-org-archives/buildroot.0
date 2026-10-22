Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4958C606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mwvP8d58
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3EEF81201;
	Thu, 22 Oct 2026 18:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VI1gUpprYQtM; Thu, 22 Oct 2026 18:02:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 50DE1811DA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792692174;
	b=ZXlzFlbcQkOX6v/dmdPvklj40lgGQoID7B1wuejavubigy+zck5ApeRezLhzfSpjvON9
	 lf2lGP/1B+fGwhUOZ1CK3Afk0mwFbGOWdmR8QfCbE0uAEdC55GwdCUMQ8pUuvG4ddRYea
	 +g1bj5k8hhIiKq2O6AFwz57ssj+ASeTMWkzGzxjl0dOtV+ZFO56Ge3ITju6V9K9nhuX0u
	 W/aJp1jP7SPkyzkEtwYbRuyOUBmzt/vZb6sMMzTzFrbEB5huY9SMK7RxDGVrZ9uKtutFc
	 GS/H2H7Wo0KU2Tp1xcGt6eTH8VG+b7bsji+2hABsQgqBTqDocIaYveRW2YpRZHsQ8/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792692174;
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
	bh=9MdB6S36ySrlByTLUQZo9u6ligz37pTCsOqRC5XVMKc=;
	b=rEKKELxBrOj8UlZDSbRCGcUWmkcPL5gLoVxWaz87QpafeZ1AhlLdI8/DzHG3CyD3WGrZ
	 Pbi5I/bcFn/IqlIKA+fRTUnJ2K1T2gAtsjO3Cei2ER4CMk+yR03tT0tUiKloFXGnphVvp
	 nmeE435SiRemp0+LIfl2cOPM4cLgeS9JIdlaUSuFoa0ZxipsrxedNp0IlzM4HSuTjVGcU
	 AG9+A63uda61hONZi8glXUnloD4+YHliWUxlePHNYJkj+CENpM+QYVKxj4F/NBlo3naok
	 v66Vv8GDIJU33IDMxrhHm5myxIu7gv6SyUf9V8pDZo7XdOgfft7/11vtt7LmFbBhvmQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792692174;
	bh=9MdB6S36ySrlByTLUQZo9u6ligz37pTCsOqRC5XVMKc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mwvP8d58ZW1cWtqYwnJmW2DkpLU/8ZnH90Tqo/3E09Dacr/dQDThQUG/+Ro+jqdrk
	 WeVfEw34RqP/olGjRy55DlOX/VlKFY/f4mC2BdWzzhWuWTM2f73YPWyuniBQM3Kg5U
	 XxIl/tMxz5fPP/16mHwfwYwHRJDh4g7fiAdKFxpv1UTZvYuFCqui3v0IvelUDoabaV
	 cSn2ysl/4HA7LYpLXEMbqxQYedJ6vIHPnb5YiZzr8XT72dP2Z6F119yAN/EwoySWaA
	 WMp2kfbtkcQX7B5hf/Ve8WFFzGtWze4lLAYFeQtIbU5BH8ZEJVUc89O6bm+GxFV/mV
	 3Pn3mh8NZ6VuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50DE1811DA;
	Thu, 22 Oct 2026 18:02:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D8432EE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F80F40176
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSGYIdzTrrwT for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 18:02:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F135E400B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792692171;
 b=kHrVIcr8pkZrcTFXzsMsgfvOlT0n9ODMyMl2HLlhyQDZhem69XaHMDS7mooCMYo/ZNUw
 wxYn3NEtmy52kCRmGwNaZWcQGfkoUXxObHldeBv4LC3UhOUIUsrFsLkCG518fqefSy/wn
 7Ex4tnY/YrAh3FCcT0yGOt6MeC4JF/dpwb28myQtpf9RoJ4OkJpaLf06zQw773Po6FtS/
 pRxHYnbj66Sh20AMDlsnCDtHvVu2S3fojWtArAWVnaxZmbzen8X76M1A9sw2dRsbfLomF
 Xg0jeQk1E+0FgtjaY7fSF3Bug+3wIw8eDED5MrN7lO9oIGbvfw+8KfewO+CrbD6gWSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792692171;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=PBljGHHWJKF2F18/qExgvCsADxmRNWQdQ06mgaKc2Rg=;
 b=NMudOqwBqGXnVp48JTjYUJEtc8dx2O96sFzQVeEtW7t92BkkTItg6XKSyVe3LRmhUnYO
 zURZoLdNgQFYDjeykajpWA1BSXS0TNRc6dQokOrMC5ei9l2/BQMqQXGtOKjYVtmKYj9h/
 YwDSBpX1FKUxeeGGipoChUX1hE4XDqf9K83QqmBI0MPjytP0qXHDfxRjM391Uzd3qq3cx
 LWYKGvVTXpH/sc3fNGAgZqYiJS334aRZRzwttRFxpebvc1j/I8WdPT0cnNP+x4fGGsSxr
 hmf316ZJCaOk+lG8fQpow5zIX48G3kXBnbVoMhXW2wdYxEX8iJL0LgzbGOyZ0obpXWA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=NLztRqcB; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F135E400B1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:02:50 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3ac7c7b3a90so57089a91.3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792692169; x=1793296969;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=PBljGHHWJKF2F18/qExgvCsADxmRNWQdQ06mgaKc2Rg=;
 b=LMlP3ypQWB+yiD3qJctkSLXt/n0DMadirS4OS24Z7zxql0iNhpfTZ5WbWwV9I59fWM
 CMeLCxmrPUS2GQmYfcacD0fvXMild98g28dE4RJCDvAsC5V7c7v3ZACGHyiiWFddkybi
 pYYq2sPvT4ahA8DiIChoAULMGy4fI+4UhTT/Qp/Wz3csppgpLQYOjQjA2NTJPcGu/75V
 VaLrNgX+94xLRZUuRwKBjBxfC1SspNWxxPnf1JxB0pAGzJMdaThk8kDM+whR6w0TgQi6
 KIfWcr1Iu1+xxqn+rNgxFbImlmc0/2l4d8xHgQD523J/h9q68MlkwL/jLbAWDwL3qAR9
 +HVw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqyV1QMzLc7Z1ttVQ26xwj5hRV87ViU/4BvDt2YCNbJD8ruCx+o2EortxWytvG0zZm6RhcjAMKHJM=@buildroot.org
X-Gm-Message-State: AFq9FYIhsTlslWNtBHysRQayiK6aGLrRTiAHJEbw7jt0OQXMnnPJa506
 ZeN+WvZRQ5rT4mFT3B9tIy54cvwrqL/xWiZiXc3+SvpLoU35MruxRWsmrkbRvz0BnzLV23YagPb
 nNZn1tG4RDrkWhYel0IylvnsStGqaGfSXIqWfN9vGSfEof172Ut+/jDkgHezBNbjiYR2t9Lvk3N
 2Vvq3XIn0kulIb5u/6KYn+KRtVn8kGJGhv5wqmJ2tJ43dHFCWuj9GVHNqVUi0lSu1yCyfBceWU3
 HKyg2djZ+SYQrFzbA==
X-Gm-Gg: AYBFou0NpcZoCemWvFjRMZo3ACyKN2ijkITCmY/WopZsKL/Wduf5S3gfxV3WNH4+xBM
 u/zB4EQFbUE7ApL+doJmh9b1lkmhneaYugtXqwEJfriYmdO9Hm2k9M3kvfpE3z2ETZrF/if6HXq
 kWKvXj1clNM6WsUB2GJyacuZr2liWSX4iXGY+EnKinj6ggZSN4ylyaf1ETppwpxKZpmeoy5xxim
 Bq3waqNSLW6m4Wfl3BtcgMmnALo1tT6rVe3FPH4SlVYyg4ONtax+I9bLtdVvoE+nWy4Nd0SQqwi
 eJI5j6j9LRoYY0tVI2oNtq+UxiNfp2YyIeB/pFRm/tiTtgFM4hBGvibnTikRRcQPr7nWSeEptWl
 jCBCAe06tnl9oaHyAex8Ki4gLqYnv+zq77pjWYLZhtqf7hUv9zoBzEbnBPy78iUIRCQEKunsj4s
 eig/TvsE4CEsMmZCkFUCd66om4iZIIjIiLqOueoj3qppw=
X-Received: by 2002:a17:90a:c107:b0:3a8:495b:d64b with SMTP id
 98e67ed59e1d1-3ad86c2e6dfmr4951239a91.4.1792692169434; 
 Thu, 22 Oct 2026 11:02:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adc8bc1782sm43035a91.2.2026.10.22.11.02.48
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2026 11:02:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3acc98e3b3cso73856a91.3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzNe9diJD4T5CTY7LD+m70BejBrOc3N5VCDqEFcg1tIA3FxXxJhO7VD5H+KlwL2BXXh1C5GrLUu8iY=@buildroot.org
X-Received: by 2002:a17:90b:164b:b0:3a4:6e84:e7f6 with SMTP id
 98e67ed59e1d1-3ad86c2e5e0mr4994407a91.5.1792692166015; 
 Thu, 22 Oct 2026 11:02:46 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:3a4:6e84:e7f6 with SMTP id
 98e67ed59e1d1-3ad86c2e5e0mr4994314a91.5.1792692163961; 
 Thu, 22 Oct 2026 11:02:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ada493261asm5274085a91.12.2026.10.22.11.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 11:02:42 -0700 (PDT)
Message-ID: <00959e65-921f-4fe0-8c3b-38961367fa5e@broadcom.com>
Date: Thu, 22 Oct 2026 11:02:41 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr,
 buildroot@buildroot.org, fontaine.fabrice@gmail.com,
 markus.mayer@broadcom.com
References: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
 <atpJvzAWPfCcAFln@windsurf>
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
In-Reply-To: <atpJvzAWPfCcAFln@windsurf>
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 10:40, Thomas Petazzoni via buildroot wrote:
> Hello Florian,
> 
> Nice, nice, I stumbled across this issue yesterday, and I was
> precisely looking at cooking a patch, but you beat me at it! Some
> review/questions below.
> 
> On Thu, Oct 22, 2026 at 10:27:52AM -0700, Florian Fainelli wrote:
>> Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
>> tools/testing/selftests/pci_endpoint. The existing build commands still
>> use the old location, causing the build to fail with newer kernels.
>>
>> Detect the selftests directory and fall back to tools/pci for older
>> kernels. Set OUTPUT and INSTALL_PATH to build and install the selftests
>> under /usr/lib/kselftests/pci_endpoint, and pass the required libraries
>> explicitly.
>>
>> Add a threads dependency and update the help text to document the
>> binary names and installation paths. Keep the minimum kernel version
>> check for the legacy tools and report missing sources explicitly.
>>
>> Fixes: 63e457639abb ("package/linux-tools: add support for pcitest tool")
> 
> Technically it doesn't fix this commit. At the time of 63e457639abb,
> Linux 6.14 was not a thing, so 63e457639abb was correct. It's really
> Linux 6.14 that broke stuff, so I don't think we can really point to a
> particular Buildroot commit that is fixed by this change.

You're correct, a Fixes tag is a bit too much in that case.

> 
>> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
>> index b9adc25ad51d..19d54cbbe707 100644
>> --- a/package/linux-tools/Config.in
>> +++ b/package/linux-tools/Config.in
>> @@ -59,13 +59,18 @@ config BR2_PACKAGE_LINUX_TOOLS_MM
>>   
>>   config BR2_PACKAGE_LINUX_TOOLS_PCI
>>   	bool "pci"
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>>   	select BR2_PACKAGE_LINUX_TOOLS
>>   	help
>> -	  pcitest is a tool for testing capabilities related to a
>> -	  PCI Endpoint (only works with specific Endpoints).
>> +	  Build the PCI endpoint tests (only work with specific Endpoints).
>> +	  Kernels before 6.14 provide pcitest in /usr/bin. Newer kernels
>> +	  provide pci_endpoint_test in /usr/lib/kselftests/pci_endpoint.
>>   
>>   	  These tools are available only from kernel version 4.20.
>>   
>> +comment "pci needs a toolchain w/ threads"
>> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
> Hm is this thread dependency new? With the Linux 6.14 change, or
> unrelated?

I looked at the Makefile and because it linked with libpthread I assumed 
it needed it, but the source code reveals that it does not actually, 
just sent this out:

https://lore.kernel.org/all/20261022180022.1282641-1-florian.fainelli@broadcom.com/

> 
>>   comment "perf needs a toolchain w/ dynamic library, threads"
>>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>   	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
>> diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
>> index 17246f5d7ed2..f9acf8f041d8 100644
>> --- a/package/linux-tools/linux-tool-pci.mk.in
>> +++ b/package/linux-tools/linux-tool-pci.mk.in
>> @@ -6,22 +6,36 @@
>>   
>>   LINUX_TOOLS += pci
>>   
>> -PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
>> +# Linux 6.14 moved the PCI endpoint tests into Kselftests.
>> +PCI_SRCDIR = $(strip $(if $(wildcard $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile),\
>> +	$(LINUX_DIR)/tools/testing/selftests/pci_endpoint,$(LINUX_DIR)/tools/pci))
> 
> Aaaah nice. I hadn't thought of doing it like this.
> 
>> +PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
>> +	OUTPUT=$(PCI_SRCDIR)/ \
>> +	LDFLAGS="$(TARGET_LDFLAGS)" \
>> +	LDLIBS="-lrt -lpthread -lm"
>>   
>>   define PCI_BUILD_CMDS
>> -	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
>> +	$(Q)if test ! -f $(PCI_SRCDIR)/Makefile ; then \
>> +		echo "Your kernel sources do not contain the PCI endpoint tests." ; \
>> +		echo "Expected tools/pci or tools/testing/selftests/pci_endpoint." ; \
>> +		exit 1 ; \
>> +	fi
>> +	$(Q)if test "$(PCI_SRCDIR)" = "$(LINUX_DIR)/tools/pci" && \
>> +		! grep install $(PCI_SRCDIR)/Makefile >/dev/null 2>&1 ; then \
> 
> I'm wondering if we really need to grep for "install" in the
> Makefile. Can't we just do:
> 
> 	$(Q)if test ! -f $(PCI_SRCDIR)/Makefile; then
>    		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
>    		echo "At least kernel 4.20 must be used." ; \
> 	fi

Yes we certainly can do that, it's more concise, v2 on its way.

Thanks Thomas.
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
