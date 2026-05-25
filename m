Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532E7CD5BC9
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 16:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 072816071D;
	Mon, 25 May 2026 16:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMSKySc2bCO4; Mon, 25 May 2026 16:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A996070D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779727108;
	bh=pUo8/lCpUpAydth2aZa+wraScf1CdXr0DA4rkY/GOXM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kkJql5vQJqexOxphe8RUCT/wbFGOafvglEzM0yXfYZvdxlTILScU0dnYGz9/EpD1y
	 9fBDEWyV8iLGDwSaomuCchu6bHLNzlZ0G5q7Drcp2B594rAkI8+KZMehtRC2fKB3wf
	 4P1X/0DUWZUMVmzqS2kgnwSlpMqikE9Gwcsh8VosyFzk94mRG6BtG+YJmwtgqE7/bx
	 KeRPMn30jiETfnvXlB2Bbf6klbB5jg5UA+Qyzm9q4qkO+kUixYDFDUcKwvVxY5r9aT
	 kB9HL0MZtxsYotcbdmMuuQo1BpNJUBef0dDUTU2cAsg4TAhhmpYX+winxaXvMeBYUI
	 DLUYLxohZh2Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A996070D;
	Mon, 25 May 2026 16:38:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E9521F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F1C24007E
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeZnisgibUtU for <buildroot@buildroot.org>;
 Mon, 25 May 2026 16:38:25 +0000 (UTC)
X-Greylist: delayed 923 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 May 2026 16:38:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DABAC40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DABAC40010
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.9;
 helo=send170.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send170.i.mail.ru (send170.i.mail.ru [95.163.59.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DABAC40010
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:38:24 +0000 (UTC)
Received: from [10.113.63.23] (port=33998 helo=send217.i.mail.ru)
 by exim-fallback-f8ccb84c5-grdtr with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1wRY58-00000000IwI-2INy
 for buildroot@buildroot.org; Mon, 25 May 2026 19:23:10 +0300
Received: by exim-smtp-8466d5ddfc-846nb with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1wRY4w-00000000P9a-0BZr; Mon, 25 May 2026 19:22:58 +0300
Message-ID: <a56e82d8-0a2c-4f8c-bdd9-d69035e06419@inbox.ru>
Date: Mon, 25 May 2026 19:22:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260525154624.188492-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260525154624.188492-1-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD98DC58EE55F2C5C37235345BD62AE6C9C712A59D0E6C829EB00894C459B0CD1B9C61250B0309B9B8506104296DCCA83D28E167D9963657CC1975C56EB723B0DBD4B72E82432766FBE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE784354AC09E4761BEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2EF12EF7F2F840BCC2E070BE324C7D3C4593031450F75F568BB0A4F435E46E6718B35066C979671628AA50765F79006376B023E84F73EF47C389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B292D688DDAD4E7BC389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC3A703B70628EAD7BE2021AF6380DFAD18AA50765F79006371BCC3D0A94B9E03222CA9DD8327EE4930A3850AC1BE2E735F43AACC0BCEB2632C4224003CC83647689D4C264860C145E
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5FE6018145424D03B5002B1117B3ED6967166518E82B577826E5F408120975D33823CB91A9FED034534781492E4B8EEAD2739D626790C8313BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CAB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659828EE571F9A8B49C445A074226DDAAD36B6B63E8E27881D6B6D208A43B45E978442C25CE77241C6FB8341EE9D5BE9A0AFBE6DB3BF599BE5912FF6BF3E6A1AE237853E79AD58DF7F58CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVax5M0mESuWmODucFl3aZ6I=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE27FA848891D73CF8733ADE439464599208C7CE2582D5CF35190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4253C1AE593082A99F15FEC50743827BEDD4349255E2BED7D049FFFDB7839CE9EAB38C4147240D8FE06742D9854C81A9621A3F404D85154B42DCC4EC7FCFDCD2FA946DFE8DEE998C6
X-7FA49CB5: 0D63561A33F958A52076C9DA5A1DC7675002B1117B3ED696B98C0721BF5806C68E3074072ED0045E02ED4CEA229C1FA827C277FBC8AE2E8B26FC1AAA2885278A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ7gwlXMytaDnzOOaknfrqlQ==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=vefgfuzWzsiTPhVNeXtQzokUio1NYyOCK7eGjU15Z5g=; t=1779727104; x=1779817104; 
 b=XqavmC6P83KOWT3pJn9vp42DtGvP4XWQxldOx3VTWFqJpLF+/IncvTeDWLEhtAHOBfW+iA0HTWa
 Na3wRnVn5nrsVR3G+NV/q/LngvqW8vKySxjio/Pae9fnRLB5Wa+Ah5g9mmYd/nfFyQK7K43JYi8ox
 2B+jxnFLGf2O9gyYwqgIngR2uloqjDjewM7BkeCszAUCOiiH+jEFDIIbdxVZkSHvCPFVsl4bwaOww
 heBN7TotlQ1M9bsoPlzbU8s+B8439PaU7yj+Kx4YF8ML2bPXh7BpV3skyHV8E/MxTXhw6uJIXphVR
 FWrNKcn8lKQEhGczHPbgvEEAXMQiyffUQztw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=vefgfuzWzsiTPhVNeXtQzokUio1NYyOCK7eGjU15Z5g=; t=1779726190; x=1779816190; 
 b=C3zOo+uMMh7eRlHFCJrxgGQV/VLla9HvjZPovBReCSjLiGucByZJ/Z093QGOjQdWUFuKX4au/J6
 3CV8JemMB0svR+bB5+RwGDgTTSC6U2vSgOjm/QBlcFlN3mKr9Yb3gkJFs2/WB2ioG1Lcqmn3nR5Xd
 hf2CQUNl1oOdh+cHwc88t8ZZuasMFRBHQLC+VuPHfqMeImqpLjcpUzRpm5u+yTiy2d+SJGhgM6ksI
 xImLe/ff3neZBPktXupsld/AY34EbKLmzf7mqxOnBWYpwfF1l7XP0W5hn0smoEBjMh9uZJIx0tXQ5
 KQ+UY2re3T6DhXuhVKxYwnzIhZebKkYMYRtw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=XqavmC6P; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=C3zOo+uM
Subject: Re: [Buildroot] [PATCH/next 1/1] package/timescaledb: bump version
 to 2.27.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

25.05.2026 18:46, Bernd Kuhls wrote:
> https://github.com/timescale/timescaledb/blob/2.27.1/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
