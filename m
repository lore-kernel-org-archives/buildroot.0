Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D377606A326
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 20:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FVKly+Oi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBB260808;
	Tue, 10 Nov 2026 20:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pokjRzn3dlWt; Tue, 10 Nov 2026 20:01:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7B7A660881
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794340866;
	b=hdAXSCh7f9Zemg4LQIHwpNjLST2WiWnQm6JcjIiGkIXmMy12923M4sW3sWgwacMCHCSb
	 h7/eh2H1n1Qz+lAWtbLVMfGRkJz0pbHTFhIfzXQZuDUMsQosb7hi82K1VjWahY1T0w1hm
	 glZv69g4YJhYTeiTnW1MGuFk///h73l7McYa7SE0NFj8PGg3NGcAqK7djrlyn/mSfL9k3
	 jfvLUH8Hppve/3/LK0j7zWmpwQ4qkBGRxxjjnXdW2AAH8TIws2ECF5Bmj9xFalUG+Qg9R
	 kBqEHzyDhtlJehXuF6V2eUtHQzj+hiZcYjgUPM29eA2g5KeJUKC3DeJ1bDqzWw79YiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794340866;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:
	 X-DetectorID-Processed:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=xxLSnJUaG9rFMyca10KaGXhKXaa1olOCzga4Ltahp/8=;
	b=PzZ7xB8OHM8DN47sA1AE6PGrnwMpa8V+wVpcW8jO8L2Spx6cLH+iNA3ENXeovVtXeFZA
	 knzQFxbMUefVOEV6OVv0kUmIpnAXzfvcvLInaPYvQ9PMP/EH/eRnZPCqft+qykiIFsti9
	 UPfsFnENMlBNTzqd3l8lEGKMt5SHAGqfclqJW4W8hKN2YB+JMlz8oJfirEE2rv7JWxUNc
	 YXsO+UjyWGq1Ap6E7xmkXFrk8HbMds+tGOablIUDfvdZ1UhiLgRrpR8P6DdFH6sre5Tmb
	 qvwOuk+VwM0Sbp6foiEDXDjSlFOyUb1PfGN7HrKuILMAkd+IoM3oHNhcnjhT/teVOCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794340866;
	bh=xxLSnJUaG9rFMyca10KaGXhKXaa1olOCzga4Ltahp/8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=FVKly+OiveE7El3vBeSW+kUpLmPMB4M/YNsannZ5MkfgNk/Q5XZUSRwUnEBMnVsPv
	 gaPluPm+VyuWkt7OTbK5jmhvpNFLVEe+n6Xkv/RVfFHvPHjtjte4q+iDsoZ7q1FH4J
	 CbASY1H2hgLsm/XriWn1Gx8gGDBT86ts+Ox7DZ8s4Gm+bPkbkvMtqRwea7X/B5isIH
	 OwnaTr5+F5z0JXSrJ1oSOgFd6rH1HgUATSg4MJ7OevuVP7Wzhyla3qDJKYAslWbpYv
	 ACqhpXEwm5Kb37TRVfCQ+9NpN6i42Krzs9xsRYKp/c0I50q7nwnOZjBmtT0k1r3QKU
	 cT/umTrXwxh4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B7A660881;
	Tue, 10 Nov 2026 20:01:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34281388
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3077B60881
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xUhpRtlguiB for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 20:01:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E6D7460808
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::563; helo=mail-pg1-x563.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x563.google.com (mail-pg1-x563.google.com
 [IPv6:2607:f8b0:4864:20::563])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6D7460808
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:01:03 +0000 (UTC)
Received: by mail-pg1-x563.google.com with SMTP id
 41be03b00d2f7-cdb15cd8558so1057432a12.2
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794340862; x=1794945662;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=2culpNdLcpIRl+BrgWoH5h0MS3kVosJ6UyrIsckxp7o=;
 b=uxQyFTYvU+Obf+bmqkhBDOXAImSkQ3tIwzpTL1VVe2WKwJlvPezZfM452RZ0ttB6m8
 kPt3mEHJ0dXhot08uawsD/CJNcLeEGzPctAMFIEla2V+EYmrlpgAVdqp7btE5YXyjqaf
 82eeHV9MZQMld4seW/pXok4t6wrK8wTL7OuT3VnKB0D1vDzsrTwfbAEkhvJaBHE3AAKI
 VKtO1yUvRYYqsk2DfmdMFdLNOafnqmipTaBPCAsQ0h92AiXHqC0K/wrNMl5jqHrNUmcU
 So548GkcMTtnwjRlle746rh7MIBt/ePlC5Vy/QStjQP7nEPth7jrcN1scSn8erJqZuXX
 AI/g==
X-Gm-Message-State: APuU4Z/TmezrmJbCili6A6izrc5iqvLIFO1XHToLoWKNlL9J7nYKOLSL
 hKbFdKQNgXbeK1zpxtHijx7DRDR2UkfNkL01p6F+L2DC1HPDkDFIFVTLNxDYK6vnWdhTGUtT3pX
 GC2u8CnwAoGotEgqAyhbY6JNQgIyJQSsn8GEQAGIpMZkf/foJwh8BJ+WVtgJuFX34nflSvAMgi5
 9nubonOhyysPXMVXhSz2F3yJA45UuFaViMBIBoUbvaLhJdpX7AucsGysdCGrIQhGcDdQPOvBixq
 z3ofXtBH+AW7XpucQ==
X-Gm-Gg: AYBFou2qbK/RNCbbELprsk7jKnTIABfFtUTdl3M4friOsUjxJ8hqKUvJdpLFVYEs4aQ
 x1iaUyo4XlUSyF/42a9xW0qIDhWNNQJbQNpWfd+S1AxEoU8StnCj0FC2MytBaZS3j1xliaROt6d
 65JdvhjEl0hUry/vD4psdcQAllAxUZiABsNjITsVrtxzcvazeCawPFZuGUFVNFJyOxv37PswXMf
 8N4q2cXeSAv6IsNvhsFdachw/63X6wFAOy6dR78DFtVtc8AIBq8dwHV2toMiHmwBOl9LCoaL5rc
 DDOMMn35gt0QK3EzOXcZ9R02+rsbttWC1mVgtYHr4HhXjv4dJT1U5sYJimn/wwrpNblUhgV4/Qu
 UX4ujl4dartE08qWhX5eC28h88JBXPRxAK41MnLuCQSVwHVo87g3gBVrjzu8wVBp8ds1yaVrdqy
 9XlAPw4gLgHgSr1mZbGPXNUG7/pg2m4PxOzI3yz8yI
X-Received: by 2002:a17:90b:2d03:b0:3ad:a17d:f46c with SMTP id
 98e67ed59e1d1-3b182fcd3c4mr24781a91.62.1794340862175; 
 Tue, 10 Nov 2026 12:01:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3b17de318c9sm513888a91.2.2026.11.10.12.01.00
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Nov 2026 12:01:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3b15e47e57fso1112442a91.3
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:01:00 -0800 (PST)
X-Received: by 2002:a17:90b:1c88:b0:3ac:4e18:238c with SMTP id
 98e67ed59e1d1-3b182f858eamr22604a91.49.1794340859319; 
 Tue, 10 Nov 2026 12:00:59 -0800 (PST)
X-Received: by 2002:a17:90b:1c88:b0:3ac:4e18:238c with SMTP id
 98e67ed59e1d1-3b182f858eamr22537a91.49.1794340858249; 
 Tue, 10 Nov 2026 12:00:58 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b17db31cafsm1086704a91.3.2026.11.10.12.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 12:00:54 -0800 (PST)
Message-ID: <4be1b4bc-eea8-41d4-9518-c3267acca084@broadcom.com>
Date: Tue, 10 Nov 2026 12:00:52 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: Re: [Buildroot] [PATCH v2 00/23] Support building the Linux kernel
 out of tree
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 14:37, Florian Fainelli wrote:
> Hello,
> 
> This series lets a package be built out of tree, i.e. with its sources
> in a directory separate from the build directory, and enables it for the
> Linux kernel.
> 
> For a large source tree such as the kernel, this matters for the
> LINUX_OVERRIDE_SRCDIR workflow: the rsync step is slow, doubles the disk
> usage, and leaves the developer's tree and the build directory out of
> sync. With this series the kernel is configured and built with
> O=output/build/linux-<version> (or linux-custom with an override), and
> the sources in the overridden directory are never written to.
> 
> A package opts in with <pkg>_SUPPORTS_OUT_OF_TREE = YES, and is then
> always built out of tree:
>    - without an override, the tarball is extracted and patched in
>      output/source/<pkg>-<version>, and output/build/<pkg>-<version> only
>      contains the generated files;
>    - with <pkg>_OVERRIDE_SRCDIR set, the overridden directory is used in
>      place, with no rsync, and the build directory is
>      output/build/<pkg>-custom.
> Only linux opts in for now, all the other packages are unchanged.
> 
> Most of the groundwork comes from the out-of-tree work Thomas Petazzoni
> and Yann E. Morin did in 2015-2017, which was never merged. It has been
> rebased on current master, and extended to cover the custom logo, custom
> device tree files, and linux-tools. Their authorship is preserved.

Any feedback on v2 and whether this is where we would like things to be 
heading? Thanks!
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
