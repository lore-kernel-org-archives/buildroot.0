Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA5CC3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 10:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6B7140BE3;
	Tue,  9 Jul 2024 10:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpYUgMVt6CZL; Tue,  9 Jul 2024 10:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A45C406D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A45C406D5;
	Tue,  9 Jul 2024 10:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABFFD1BF298
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99A0B813E9
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcjRIsA1420C for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 10:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F91A81149
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F91A81149
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F91A81149
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 10:19:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.127.252]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlXK-1s0LNw0zVm-00fqxK; Tue, 09
 Jul 2024 12:19:50 +0200
Message-ID: <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
Date: Tue, 9 Jul 2024 12:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
 <20240708235639.7a9cc07c@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240708235639.7a9cc07c@windsurf>
X-Provags-ID: V03:K1:uEjqJ5ER+rJrWO9163nUpultW/dMH7JEC5z9DTBB2kKBy/EVmbe
 t4U47lqX2xseH1JhgUaAFUu62Wdq7QcK1Ewdolcg/zCaxeFiS+IN0Vf4h6RAqX1IEmgDibg
 zzmhIPAmhy0FT+QxR1gf0BAaPg95+YDChfX72tJm5tS2N4ITNlm7ipaF9wochxXmnAN3SjU
 wHRe9Z4a7F0MLNCxQJ7Hw==
UI-OutboundReport: notjunk:1;M01:P0:wdPr7OMrpHc=;5VKdTa0FjY/t8s6xqdUmu1GSQye
 rQHJKHbD7Tg9LP84qjjXEAQ8kL71SuUgWBo3tXh/W3T1MXNZo+ssxdO9gpaHufeqvvLb0/Z+J
 /ShkbnRyfI+7Tjk1wRihs1tIkhrPSqR3vHjQSF3iBYbshB+tuSFE2ZA4DpzQxy1tE/HMKvbA8
 xS5/ADlxOVsb3AcaMOOoSxxibPFVwfiUSTYqvgQTITVNm4TMK88Hm2GjT9z1SpF4L/C9EW4Le
 FwcFMm3f/wShG575XB8DmG+FDb9Q7svP4ef7PK8psLfuquuKX7lVKOSY04jhlA04I53D8uy0W
 /ExNmlAH6y60Qct2qri7Aub0K3LjgNf3rpy7+dhb9LdrEtdItkmszB2p2XmldqhzDXLLks0Jg
 n1wsPD2KFhuuEwk1vqlyO5D6mf1ZbmlJ1Dr+9eOWeR4fz6twzCBVEjidzb+KDvPrXwRqi9dR/
 Ul7u2ANrT3EaexN15TR0Y4Gqx/AfMmAcTtE8/MVAsK+OLpEjMdm/tuMpXh6N82QUL3D7DZg5i
 Xg0jTfy85/IPmepJhnjSLTuc/rcSYYn89O0ASUz5zW0RaL/GdqV0Am9/H01dqaJU0exHHoos4
 3+rvRc+KPPBkKoQfDd6LSz+fmnhN3nDYiVpZeao1JS54lzVZi1DzcWRnf1wh6sJY4C+mJT99F
 OzAhtcg8tqO185dHkK3CkiBpLPW0Hmsti4+4WWoWMxzNQbRPlbjZI7BdFr2eTsd8ypcwFBVTS
 vFzt8+oxAvj7nybScxnGcQT7n+LWKfTq+IgxkRTAIjNmqOzXZ9AuqE9Lh9p8uWrhRQpo5V5lZ
 OHuCBd9V41uU66gJmu9iQ/R+8TpZVJPpF+y2N2z0BAEmg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720520390; x=1721125190; i=fiona.klute@gmx.de;
 bh=jzH1sJbSlcVhiTzjvhZnHPe06bz+a0KKgYRRmFqs+fI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Td133aasl22/cQf3qsPILkRX1S3rSHmHVpEkDNBTQ4z4bZGnT72E2IkrdYnKL2LF
 oaWlLDK91LQJ9we7IQsQhRyTflfU6h9lnQvss7TNdoxHtUqUj+Pc2Tx8zBMaiBfYc
 EqzgZHMb89MV/t5eYqEZZOfZyDmF53h5tn2vuslelgwqmsFCa5gO3TRtVbYMqRfii
 Mg69bYKWQ4KmNIzW4KxfX4YnrBg2fcfaV6BD+qa7tjp6817vEbiAIaCP9K+M72nJr
 W26wmEVnEaRyiE0eTUYZTLihAoU/0WnskvXBlBUL3oAcyK+B+S9L5cLrnP9wQrwwz
 uqPBeiJ/LBvu/3u3vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Td133aas
Subject: Re: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to
 1.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 08.07.24 um 23:56 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Thu,  4 Jul 2024 14:13:51 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support
>> for 2.x. This means 2to3 handling can be dropped.
>>
>> Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,
>> which have been removed from the Python standard library in
>> 3.12. Depend on the compatibility package python-pyasynchat (which
>> pulls in python-pyasyncore) and remove copies bundled in upstream
>> code.
>
> Thanks for the detailed commit log. One question below, though.
>
>> -FAIL2BAN_VERSION = 1.0.2
>> +FAIL2BAN_VERSION = 1.1.0
>>   FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
>>   FAIL2BAN_LICENSE = GPL-2.0+
>>   FAIL2BAN_LICENSE_FILES = COPYING
>>   FAIL2BAN_CPE_ID_VENDOR = fail2ban
>>   FAIL2BAN_SELINUX_MODULES = fail2ban
>>   FAIL2BAN_SETUP_TYPE = setuptools
>> +FAIL2BAN_DEPENDENCIES = host-python3 python-pyasynchat
>
> Why are you adding host-python3 in the dependencies here?

I saw a build failure because host Python hadn't been built before
without it. I now suspect that was the result of adding a runtime-only
dependency to build-time dependencies (see below), I guess it broke some
implicit dependency handling? After completely removing that line the
build passes, too.

> Also, are you sure python-pyasynchat is a build time dependency, and
> not just a runtime dependency? If that's the case, then you need to
> kept the select in the Config.in file (with a comment # runtime), but
> not have it as a build-time dependency in fail2ban.mk.

That's indeed a runtime dependency.

Thanks for the review! I've just sent an updated version of the series
with the runtime comment added and the build time dependency removed. If
it's good to merge now, please keep in mind that it's only going to fix
the fail2ban build if merged after Angelo's fixes to the config file
handling (linked in the cover letter).

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
