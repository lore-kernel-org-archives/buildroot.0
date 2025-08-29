Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9361C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 09:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64D8F417A9;
	Fri, 29 Aug 2025 09:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWcpniODOP8y; Fri, 29 Aug 2025 09:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6326041786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6326041786;
	Fri, 29 Aug 2025 09:15:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 010E169
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E674E83E2C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8qwRGJASop3 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 09:15:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99E5C83DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E5C83DD5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99E5C83DD5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:15:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.26]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCpb-1uKECu18IJ-00mrT7; Fri, 29
 Aug 2025 11:15:11 +0200
Message-ID: <0d2e5636-59c3-4230-9ed9-c4342a83c98b@gmx.de>
Date: Fri, 29 Aug 2025 11:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
References: <20250818132436.338635-1-fiona.klute@gmx.de>
 <CA+h8R2pxc0gy4pjVnBJr596Z6RTsMV25svYwP-OLOwigzTb6Cw@mail.gmail.com>
 <cc0f34e2-366d-4f78-a8e7-5c163e57c3c2@smile.fr>
 <17c60c20-55aa-4864-b838-45751b67210e@gmx.de>
 <20250826121851.06ec731e@windsurf>
 <f6d95d33-d134-4390-be7f-ee1a674b25ee@smile.fr>
 <875xe7lsjv.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <875xe7lsjv.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:PnluldsfRucsZnOIkBJQMF7LABABf5q97Uef3yoFjb0jxmTwFOM
 uHDC6flZA7hZYaclLdd+D9tI+5e6UHBILv8QM0/qly1AVYrY1tqs8dcqMeZH39neam7MxK/
 9wpZsxhhDQF27MDud4h9My+i1WdkOWdXf0yScLLf/dOmch/hB4ybCxqhu595t+3aHAbVEL4
 LWK/hf4OaaLHbO0ZGBbyw==
UI-OutboundReport: notjunk:1;M01:P0:lN0DgkrMK3M=;gz4MROs4KYw1C15UUNZB/OtGncP
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756458911; x=1757063711; i=fiona.klute@gmx.de;
 bh=C6xyWynhapt/osynx4Jn6y+7zCzoqnWMoYPb4fFQfOY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jcr1AZgLrADVpRIUOJyHK3wJu8MSTOB20qy7w31+vgG5ftDEoN16eGXGmimqX7Q2
 3BeBvojx4dRa6SS0H6j6oP0G7gPXdfq9OcW9ZPAMA9WREskMABacBMKLKcwfQrmbv
 fIwwHKttUGQUR/hIEEhkVy3bleEwgL8azqXjvO+PxqMtRNj2yxu7HlERqN2j00LHR
 4Zdo4OzWLCLxmH/ahvV7GLJDk0ZQitPu7ePTgKRMP32pfqKXD94dIopf9m5e5gwWa
 iyzlOzcWQdxExSWD/ONnWkcO612q9LOGwhwDLholoU+NOuLxz9/cBKf7cZR+0z9KL
 0u12XGM7pGrbJVEYGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jcr1AZgL
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: prefer cgroup v2
 with kernel >=5.4 and no systemd
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 28.08.25 um 11:11 schrieb Peter Korsgaard:
>>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:
> 
> Hi,
> 
>   >> Totally fine with this idea. I think it's OK to require a 5.4 kernel
>   >> if you want to run Docker.
> 
>   > Agree. If we really want to keep cgroupv1, we must at least add a specific test
>   > to check if other packages (like docker) are still working with only cgroupv1.
> 
>   > I'm not sure it's worth the effort.
> 
> I doubt it as well. Recently, systemd has also dropped cgroupv1 support:
> 
> https://mastodon.social/@pid_eins/115088165140443645
Thanks everyone, looks like there's strong consensus, I'll respin 
accordingly.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
