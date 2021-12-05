Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D8FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 07:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C4780D8D;
	Sun,  5 Dec 2021 07:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17Jv_YV6u8t1; Sun,  5 Dec 2021 07:53:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5452980CAA;
	Sun,  5 Dec 2021 07:53:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 504E31BF294
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 07:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D2A2605A7
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 07:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id om1yC4k2osiY for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 07:53:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8489B6059A
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 07:53:30 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id d11so14786901ljg.8
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=+EybmqHXOF1jvZ8RMIJt+/Gdfjtg6GeI0wu5x1iTU98=;
 b=mrhnPf+83CxOHM27I4s16uy4umuziJNHRs93kNBYBBbLHUkxGkofK+5yWrquUIF3oJ
 6tPwtvibirqMCEf5ewGCd3vCshDQK4tfFbVHM52q8ZiKtAq1bwpDr4nVJ4pQ1+ZcO1LR
 /IuhvMM+39Y7IsM/oC0uEBnXzaiK2Rh51TyiEhJD4IEAAEX7upoBv255zIu1K44AW6+2
 joatBq1S051O/noSeJMsSf/PyLAM238P5EbqZTwH6zMt4LEoYQlVt4qvG02g5D3c594G
 nAVOhXX2yzCxZdnT8MQA86B0nCrZlF/R+KQFZaIW245+MMfgHUe1bXF07Z5IMFqA+BNj
 xPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=+EybmqHXOF1jvZ8RMIJt+/Gdfjtg6GeI0wu5x1iTU98=;
 b=R+IjxU3l3ezgEXwfhBYdOXWpMKAewaMhKUbkPJkFAtRyliA3q1jo9khVkJpJ/iqjjY
 WpttrzF7ugeVX5pFpRjFmFgDilFTqOC8DG46D4Zg60PnAvbNMeCaZxBX+K92KTJLTRQ3
 zn1zLRlclNgqTv8yO7/5oe+39P0/x6O5Vq+H98EzNOSGsjDnpfWT0V7KGFHbn4P9/LKa
 FcvBHdqzpSneGbFaegheJ7zUOWw6m0DLAEPE/IT8J/lGAbKNTf9U/kuE/RKGaF8z1Se3
 dPrUZdpmmYCuM8nRl8Q/Biy4nRjBTTUpbReCaiomOvD3x7j570wxkt0mheWOdvLhluiU
 rs3w==
X-Gm-Message-State: AOAM530zyTF5bhxw2AAFPKfZxkF6yIzH28uz63bJR0xPy3rz45jvXGBM
 Q604wb6ZZlhV5ReSyhPd1qITOpT06bI=
X-Google-Smtp-Source: ABdhPJyLouS6l5VrqubRac6j3dAZTDWFuqN37sPlMlevzNKWdDYSiJOPso1tkl1o0ewoshQvH/qTfg==
X-Received: by 2002:a05:651c:603:: with SMTP id
 k3mr27419213lje.35.1638690808008; 
 Sat, 04 Dec 2021 23:53:28 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.198])
 by smtp.googlemail.com with ESMTPSA id h17sm1022939lfv.62.2021.12.04.23.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 23:53:27 -0800 (PST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211202013902.1593562-1-troglobit@gmail.com>
 <20211202013902.1593562-2-troglobit@gmail.com>
 <20211204210459.461e4f39@windsurf>
 <0f7d1dfe-07c3-198f-3449-9179db0e385c@gmail.com>
 <20211204205921.GD472627@scaer>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <566e7cff-446a-2293-a831-90c8f884a68e@gmail.com>
Date: Sun, 5 Dec 2021 08:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211204205921.GD472627@scaer>
Subject: Re: [Buildroot] [PATCH next 1/2] package/watchdogd: bump to version
 3.5
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
Cc: =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4759251333165056071=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4759251333165056071==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ENzS07ImUFp4qalHRsLYbJrhyk0HF2JUT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ENzS07ImUFp4qalHRsLYbJrhyk0HF2JUT
Content-Type: multipart/mixed; boundary="R9Njs6PHZ9bTi0BanZJaFy2im7ZdiwCWv";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>,
 buildroot@buildroot.org
Message-ID: <566e7cff-446a-2293-a831-90c8f884a68e@gmail.com>
Subject: Re: [Buildroot] [PATCH next 1/2] package/watchdogd: bump to version
 3.5
References: <20211202013902.1593562-1-troglobit@gmail.com>
 <20211202013902.1593562-2-troglobit@gmail.com>
 <20211204210459.461e4f39@windsurf>
 <0f7d1dfe-07c3-198f-3449-9179db0e385c@gmail.com>
 <20211204205921.GD472627@scaer>
In-Reply-To: <20211204205921.GD472627@scaer>

--R9Njs6PHZ9bTi0BanZJaFy2im7ZdiwCWv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi everyone!

On 12/4/21 9:59 PM, Yann E. MORIN wrote:
> On 2021-12-04 21:23 +0100, Joachim Wiberg spake thusly:
>> On 12/4/21 9:04 PM, Thomas Petazzoni wrote:
>>> On Thu,  2 Dec 2021 02:39:01 +0100
>>> Joachim Wiberg <troglobit@gmail.com> wrote:
>>>> This addresses the autobuilder failure for master as per 2021-11-27.=

>>>> The root cause was a name clash in a dependency, the libite library,=

>>>> clashing with the DirectFB LiTE library header files. =20
>>> Thanks, I've applied both to next, as indicated in the patch title.
>>> However, in the commit log, you seem to indicate that it's fixing a
>>> build issue in master. Could you confirm?
> We've discussed this on IRC with Joachim, and it was my expectation tha=
t
> the patches would be aimed at master, because they *do* fix an actual
> build failure in master.
> [snip]
> So I would say that we should also apply them to master.

Also, on 12/4/21 9:49 PM, Thomas Petazzoni wrote:
> On Sat, 4 Dec 2021 Joachim Wiberg <troglobit@gmail.com> wrote:
>> However, I think it's highly unlikely they'll be enabled at the same
>> time. My recommendation is for next and let 2021.11 out the door.
> But if the build issue exists in master, we need to fix it in master,
> or the issue will keep popping up again and again in the autobuilders.

I'm sorry for the misunderstanding on my part.  I simply didn't realize
how seriously you viewed the issue, and also did not want to needlessly
block the release.

I leave release critical decisions up to your discretion, obviously.

Best regards
 /Joachim


--R9Njs6PHZ9bTi0BanZJaFy2im7ZdiwCWv--

--ENzS07ImUFp4qalHRsLYbJrhyk0HF2JUT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmGsb/YFAwAAAAAACgkQLCqwqW4MR1jX
6AgAiYn3kMxRYtF+4/xHWHAhy5h4eqPirVCJuHCmvUg3xsZdI12oiDe8PgguN4VIRoKgcyHtFyjC
bfUAsEu2Nyg/E8OxA6uRzYac39sdL8WPxMQkWvZNe/j9wU1r0IUQf2TBn9GW7lZv81QxPRXCQVxO
tSx1Ih9QXowVioGjCwN8t/flkgMc5DUek8Z8p9cxC47m3Sb72NZjvVM2yhHJnER32tfNmzSHdvbE
S+4M7p17RS1s0xVNbIwrFj7HMQED3aLzup6gOkrGJTk+5uUFcAbwk/RDnDDx5IyE74C6uSPv75TD
GNBIurD2uiQ6+LvasmyawSzmjBEbRiYEA49wlqHlqA==
=tYKn
-----END PGP SIGNATURE-----

--ENzS07ImUFp4qalHRsLYbJrhyk0HF2JUT--

--===============4759251333165056071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4759251333165056071==--
