Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E2606A323
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wvmc6mab
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24C06405D7;
	Tue, 27 Oct 2026 16:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TGlzdhOxqHk; Tue, 27 Oct 2026 16:44:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3BF1640580
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119447;
	b=cHw/oxZRoNwCstxqndoClmaTmVzq+nz8rUhj7DtP5F/x3yxXo3XG4zIQGUfjEnMo09pr
	 YfV1ps/8YOEnIhOWyUN2D/+Vp7tExwU0+QmW+NuNWAFTqVZHjAq4e7alYK+aUzm4Cxr1g
	 9RanHPFfvHAlE/IJPscePuwlVBU02BPSMDkfgovogzzSzJTC6OoV+tZ9YWOFzg1VBnpqo
	 d54y3TFrRCTXrlBKPaH3yI4aE1NWJm2sw5RCXezoEvD4eA6XEOx/gm0A+4xga2eueK7kd
	 gPQLzha3kjqb05TdoSWAXlfPO0vVk349dWeNrPk+0nnsh4vOJdB5rgInyjVTdAqyJnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119447;
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
	bh=QMgR1NgWsbgmXJXog4UEnvzh79SG+dmyBbG+Bfo8UEM=;
	b=PCZOnXSyWFUILF4S3HFzeEnRR/IDc4jeWpv5id2zb8fAHfNLVgUdhVTF6iuPI9TUYn9P
	 o/pjyM7pfBHfkxGS3Rqzimsz6MH3SUdwvL6pTJfwkLtebYOtZrMMccMy2F50YVmwX51HS
	 qnfckUSK2T1EaH94mkwqyuVIpPvya7VgENXgT6r84nGT9aJRz6KgnVMpchE3684o5ZI8+
	 UqynPeU8Ag64Kl4JEyZS8f5gToPe9kG8wNN0N6dKzwFPJHSNDLzBn5886ZufK+7ELkeOk
	 /Bkqd/FsILmsDykIipi01jfs7fqEsEYKgKSvOwU37GhZH9KhxP3ex8KfoHV74RpSDhQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119447;
	bh=QMgR1NgWsbgmXJXog4UEnvzh79SG+dmyBbG+Bfo8UEM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wvmc6mabvdjsPjvA2YGH7lRSkXeL81JacvpFNPOjljkXbxICDnxJ01jI+lHV6fNSr
	 QiA07VIF6tAGaAZU050DGAmC92A7I/wHHSKBGtq3dll2H7FSwuyBGA/TpEVabfZOXh
	 zIaNVao+pW/tnj5Q8yGVRvbHmJtr56nK6Dr9jg/q9FrZKiB/jJrnwtjrt9zv3IQYUo
	 5KYsW59Ef6mMmfBkf19VpdKPxWEmLJpwp27/P/tYcI0JpEBkAwVSz3CsOBEG5H9Jaa
	 Fc0qo1HEr/ep6pCR+uEA1NJDbdPwXHLxNKUA0cA069ApdfZVBxRdYVmWRBsFmf/wxy
	 6rjqvbJU3j4Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BF1640580;
	Tue, 27 Oct 2026 16:44:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98CF44BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A69D605EB
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2J1lMgJg4pxR for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:44:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3C6E1605CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119444;
 b=PIn4yOAfaLBW0VMpTK7Nm4dlxcZ+k+4kFPjZm7wpaBy2GyFlGb3OV2TCePlKv4+QIjqN
 Y8F1fb0Vd10L/uHAECasw0j3kasmhuvoTHpOB36OBPRgQueAObOAEH61z/y3Snf8wOX5W
 7gIQbh/3Q5u1ozVys+8Vyh88oxxs3wr2QmE+5X+7u4mY5mXKThIrMIZLPIiMSslfyeIAv
 GPLR6qZtlkdGZ14cNfulzLu7645YJRM2nUL/+k2SwhN0yZCA4/WWSNHlTSjYVF4v02I6H
 6SonysKkRpVlzTVnvdw7UkqMah4MDsXHCNJlAtBMM4aX5nU2Z3saspJwnU/FkXaCkrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119444;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=4pk+VgPxpi8j6QV0Aj3lmg0malZ83I40d1BaJ5n9jyE=;
 b=oOQ8DovbcW0BV6ECYi5I6n37xB2RMvkmfgv0EHhXbuLhxpZ+oYdwmjWHGerwRHXHOxG4
 yds1LAr0WbnVwCw9SzAZ2cXW15N4D9wH4fto9Znr9N168d0/eirdzEFHmbRy8WE8rWpsJ
 d+DUyLcEHAr6X6pJnEpoY6ogqW1gp8M2heuCJ0v9N22NooaYnZTiMBENMgaYX3XAhvszM
 vG7H7YVJnZe2qGguCxkswAG3BSAEW0Frs++FXZoshTM839963yvmnnLY8cgqQU/0Q32O5
 dkKvYkMilGRp0UxWMnQFRRXKZZZN1RE9Y6C+fempNiKODqoE6+YnfdGRw9FOOtGK90g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=IvYLs3aQ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1361"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1361; helo=mail-dy1-x1361.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-dy1-x1361.google.com (mail-dy1-x1361.google.com
 [IPv6:2607:f8b0:4864:20::1361])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C6E1605CE
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:44:02 +0000 (UTC)
Received: by mail-dy1-x1361.google.com with SMTP id
 5a478bee46e88-35829219da8so1545003eec.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119442; x=1793724242;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=4pk+VgPxpi8j6QV0Aj3lmg0malZ83I40d1BaJ5n9jyE=;
 b=N3O1zXoFLdBpqVubJtme3adFHV4MzwKRL+BIsi1XvY67KVbKkJyn4lwsl4gVZxRoVk
 /pSZP6FK6U5eiHx7laPXRYsZbJSeOtdwXq9voS3CSGBmiRSuWXCZBfkv7kTK5CrncASI
 3o9tzIeLiOPwxl4epQERnYDQjJUWVT5i20ys5/mchMOcHnpFue4IBwfOdc14fUN1IFqy
 WHi45QlGZTyBwdEtF6pvQg//3rjUSkZbey/jh7s7SQjweqKZePCM73fg/igFwD9sIP+M
 ZpHwZt9bSO/Wh/wF/s5SBEnElTxzZzgPalkYDq0MCZJGrkRapHdkAxd3HV7Ynnj0cV9W
 2k+Q==
X-Gm-Message-State: AFq9FYLc3IC/g8R/kJu1QHsu6XkScvgThBYQ58kkMejMDD9mKExQ110m
 HnUZbgPoh3XtF5jMmSveYsZnaq08DXvrke1tRd8/9H1HFKxn0fb3oKIf3CID3Pj08v3b1tBXDsK
 apr+OEuGPrAZUC1l1oVY6WIRpH086Uh17UdVngJMUnL2T5do9vaUmqApYBtLvblou3jqmiV0rsE
 VFgZGHCRfeQT1geklM4MNWE6ZeYq44cCwPJRcZWjjpbAlBQu9ZMoOfnF0zLij0cysyIaxRP620q
 tRuMShe0q3ob77oM9eF
X-Gm-Gg: AYBFou314jlVGW6OUdSP8UTMyJ6AyKVE/dOmPzSFsA7jidUWaPmx0U7vXAne72bdqR9
 zQH88jsdjiRaovYquRijHBhLN/hmo4t+jVjqQbZTxpudgVfuD8TYferznXI/3E3lernK9ThuDYB
 UA7bhg4oXlmENoJBO58hZ21ZgO4JvgcpFtUG0D4nILMgln2lC02Jwy00JX3pg01zVnJaf43yFrX
 6qi7qlQgQLIphu6gRfGbo1nqHkqFn81R9hCBohrQRhKGJyxSHJfsNYlmrQfWLsge1QLpsxNk/GL
 KFahSykQR3YKsPHa1XNdDNGqylDuTVF3Jo19FUR5VkuZtH1vK4wEm+UWJ115enazX0DiamYv5xf
 qJqJG/gKW4BEkm1HXPDp6ymFotnSbCaMuGWhQ/BsU4UHJ0XHk0bvglHnw+I4IKCR/OKYmrQj52t
 TTHKFBJiYU0m9XFM7l0KMK92VBG3EzlSVNs54+CsSz
X-Received: by 2002:a05:7022:283:20b0:184:ae11:51c8 with SMTP id
 a92af1059eb24-1a3c9cc235emr3801947c88.23.1793119441170; 
 Tue, 27 Oct 2026 09:44:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 a92af1059eb24-198a37c88b5sm79673c88.19.2026.10.27.09.44.00
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:44:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9179a2035a4so24869766d6.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:44:00 -0700 (PDT)
X-Received: by 2002:a05:6214:4017:b0:917:7cc7:8768 with SMTP id
 6a1803df08f44-91c6d367fe1mr59704556d6.11.1793119439785; 
 Tue, 27 Oct 2026 09:43:59 -0700 (PDT)
X-Received: by 2002:a05:6214:4017:b0:917:7cc7:8768 with SMTP id
 6a1803df08f44-91c6d367fe1mr59703976d6.11.1793119439163; 
 Tue, 27 Oct 2026 09:43:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c7dd1bsm107788656d6.30.2026.10.27.09.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:43:58 -0700 (PDT)
Message-ID: <aa58f218-648b-4f61-8ab6-a1926589852d@broadcom.com>
Date: Tue, 27 Oct 2026 09:43:55 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Cc: buildroot@buildroot.org
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-6-florian.fainelli@broadcom.com>
 <CAMTop88VNT5nza_-_1HRRUdw8XQjsiitYhK0OkoLJQwYgK44=Q@mail.gmail.com>
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
In-Reply-To: <CAMTop88VNT5nza_-_1HRRUdw8XQjsiitYhK0OkoLJQwYgK44=Q@mail.gmail.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: Re: [Buildroot] [PATCH 12/23] lua: rework post-patch hook usage
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjQvMjYgMDM6NDYsIEZyYW7Dp29pcyBQRVJSQUQgd3JvdGU6Cj4gCj4gVGhlcmUgaXMg
YW5vdGhlciBob29rIHdoaWNoIGFsdGVycyBhbHNvIGx1YWNvbmYuaCBvbiBob3N0IHRyZWUgc291
cmNlLgo+IEl0IHdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCAicGFja2FnZS9sdWE6IGFsbG93IGhv
c3QtbHVhIHRvIGZpbmQgCj4gaW5zdGFsbGVkIG1vZHVsZXMiIGh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tLyAKPiBjb21taXQvNGJlM2ZkNmZkYjczMDg1YTM1ZTg5
YzJjMTIxOGMxZTBiMWU3NGE3OSA8aHR0cHM6Ly9naXRsYWIuY29tLyAKPiBidWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2NvbW1pdC80YmUzZmQ2ZmRiNzMwODVhMzVlODljMmMxMjE4YzFlMGIxZTc0
YTc5PgoKVGhhbmtzLCBpbmNvcnBvcmF0ZWQgdGhhdCBjaGFuZ2UuCi0tIApGbG9yaWFuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
