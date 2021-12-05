Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA07C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 07:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9446607CC;
	Sun,  5 Dec 2021 07:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXhICCsIzjw0; Sun,  5 Dec 2021 07:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B856071A;
	Sun,  5 Dec 2021 07:56:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59E931BF294
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 07:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49D88405A1
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 07:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aW-90WzyLa5S for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 07:56:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F09D40594
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 07:56:24 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z8so14787785ljz.9
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 23:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=GgTLcOkYu5hN/D6wDNYxg7M2xVGDL+w6fb0MhzzjmXY=;
 b=V7/UR9W88LYKwUxCk0RzLpuwmK1NgofIE6RDGALP97LI/JiqPvDBg/LuODBD1wN6w8
 ne8pNcShc40vllc5UAl7cOufHXRgnhnK5Sf9VDlp9lRfKYlveS1OYunFwlymUXU+OEoa
 WJRSDBR3hnjr+Dn0amkOUYxkmM5W7vWl9Wr1jvspBoRT06kfKsiiCJ/92spozcE5Zmxk
 ZaLJGtw3ntWWea3f5+hDP0ORSx2KoKurx9gwdsI90Jnn3GLm79dypC6f1C6BKQENBobo
 z1gI8QyzBEAhOQaO5X/C/s9VXohcN75TlzKrsZ/TsJ1vWLr2Vlm/iMSjUew6Ecwun9xX
 hIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=GgTLcOkYu5hN/D6wDNYxg7M2xVGDL+w6fb0MhzzjmXY=;
 b=lGS9vJ7GzaAXur8gD9Ue/ir3cGkH7bAMqKnZho8SxeKSqaU7/wYfNqPw02kzYojpnV
 F0prDWj2blo40IfM1XM0wTPEFd7RLio2u8yAwDvZQaWUzTWrggonaRnCxDkjUpYhM6zi
 2BHQ016tekbj4bK3mv8xJQSfChwMD5hSElG8goKT4P78NMV4DNecPmI6IQK47wFu2R+V
 cNkbcNr/vBvP9L/O73mW5m2aF1l2Gaxvdnc5nqT6iVyeuLPnm+m5a04Hu/j+7R6QeolK
 UsbMyOUAAA4w/sNIMm/ODVwjfUGYMhgOVhDf9CBTulWphe5SxsaBJI/J2oob6M+fAeB/
 MVuw==
X-Gm-Message-State: AOAM531JTSmzWRfv+zzKHdI7/zdP0VlF8i8hxDSE3jZJDtbi7EYw8fwl
 z53FL4y7rx/q7bwuo/ZXuCWsBQ6rDcE=
X-Google-Smtp-Source: ABdhPJxE6jBLU5aa2JHJHTWNaauDcr5Dx8w1aztVwnuH28rHS4ec0+0uyeA1KEtNgspwmJ54OCvFUw==
X-Received: by 2002:a2e:81c6:: with SMTP id s6mr28660939ljg.302.1638690982161; 
 Sat, 04 Dec 2021 23:56:22 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.198])
 by smtp.googlemail.com with ESMTPSA id l12sm1014927lfk.212.2021.12.04.23.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 23:56:21 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211122020804.535891-1-troglobit@gmail.com>
 <20211122020804.535891-5-troglobit@gmail.com>
 <20211204231509.2507f151@windsurf>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <002ef1ea-f890-e812-e677-ee9a3787cc3b@gmail.com>
Date: Sun, 5 Dec 2021 08:56:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211204231509.2507f151@windsurf>
Subject: Re: [Buildroot] [PATCH 4/5] package/inadyn: refactor start script
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0959145509228256422=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0959145509228256422==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="i0uWRfmF5T7SJygWuq4302YyX0TX8IebD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--i0uWRfmF5T7SJygWuq4302YyX0TX8IebD
Content-Type: multipart/mixed; boundary="OVmd4IP5Lp1ZJhIH1oYrJVyvC7CcBSDhW";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <002ef1ea-f890-e812-e677-ee9a3787cc3b@gmail.com>
Subject: Re: [Buildroot] [PATCH 4/5] package/inadyn: refactor start script
References: <20211122020804.535891-1-troglobit@gmail.com>
 <20211122020804.535891-5-troglobit@gmail.com>
 <20211204231509.2507f151@windsurf>
In-Reply-To: <20211204231509.2507f151@windsurf>

--OVmd4IP5Lp1ZJhIH1oYrJVyvC7CcBSDhW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Thomas!

On 12/4/21 11:15 PM, Thomas Petazzoni wrote:
> On Mon, 22 Nov 2021 03:08:03 +0100
> Joachim Wiberg <troglobit@gmail.com> wrote:
>> This patch is a complete rewrite of the start script, reducing code
>> duplication by using a helper cmd() function and adding support for:
>> [snip]
> Actually, for init script, we are now trying to use a common style and
> construction for all, based on package/busybox/S01syslogd.

Ah, I was actually wondering about that, couldn't find any info on it
though.

> We don't want each init script of each package to be its own creative
> work of art, but instead we prefer consistency.
Understandable.  That's good policy actually.

> It would actually be good to document this in the Buildroot manual.

I'll see if I can whip something up :)

> Could you try to rework your init script according to
> package/busybox/S01syslogd ?

Sure, no problem!


Best regards
 /Joachim



--OVmd4IP5Lp1ZJhIH1oYrJVyvC7CcBSDhW--

--i0uWRfmF5T7SJygWuq4302YyX0TX8IebD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmGscKQFAwAAAAAACgkQLCqwqW4MR1ju
pAf/QmdrxwkRV5iOwnd5Hc5ty35zDGCPPOvllcYEg/I9wN/CSYRA5cj8NdC5dFXyUD4cnjMiNcTk
G3JOVi4QpXltun1oSprFBTUmvWw9WN3JVV6o5yNhDFmOSQ07nFcvRKbK/2g7G0NebtAc1Qfqa4JB
NZAVIz/p6befg9cV1VoT8JDA/1WAdpKBWYUwD2rsRf4X+CmrARrhaGsNlI/8nEPBN4PM/KocP9pr
J9m4B7TvyQDsag3Z71DAhkILne4U9dATB8BofWhuBRguGxGUmW0WQudgJNjkQO8XeBsNkAZRAcSv
+L9Rp4Y10rui25liRMfKCJpo3c7e/yQa3Li7EHRneA==
=4h2B
-----END PGP SIGNATURE-----

--i0uWRfmF5T7SJygWuq4302YyX0TX8IebD--

--===============0959145509228256422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0959145509228256422==--
