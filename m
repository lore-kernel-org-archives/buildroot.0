Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04542ECAAD1
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 13:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4AD4115F;
	Thu,  1 Sep 2022 13:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4AD4115F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8_k4CmbLgas; Thu,  1 Sep 2022 13:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FDFA404EC;
	Thu,  1 Sep 2022 13:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FDFA404EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18BC21BF3F6
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 13:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E357941A58
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 13:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E357941A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-yJQ8cklqp9 for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 13:51:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4167841A5E
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4167841A5E
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 13:51:55 +0000 (UTC)
Received: from harderbit.localnet ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis)
 id 1MvKTJ-1pKknp46BV-00rFXF; Thu, 01 Sep 2022 15:51:53 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 01 Sep 2022 15:51:52 +0200
Message-ID: <3453234.iIbC2pHGDl@harderbit>
Organization: Green Communications
In-Reply-To: <20220827093603.GT37358@scaer>
References: <20220825151204.390615-1-thomas.claveirole@green-communications.fr>
 <20220827093603.GT37358@scaer>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LOCgoVY3V32WZEl9/VIQOvbA5SYxT3Wfv7dMVVJ9kGSR+z6MQXo
 Fc2TYRQcIwhM2FRWRhl09Y1Qu7rZYRNjW8aCjHiPvN2VMACoH/phsAcBoTQJdjhRsQCDtQL
 lPEPg/XSKilN0KmpJVMBBO7P0jqjCkO4noHQps/B6PYedJUji8NydjVMORBsyfNs521+iwA
 jh2KdPxFS6ikw5uaeqUFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SPF4K9FJms0=:Q8S7wihZkSjjRmaVOXVW8b
 lDhJUmk1s2Q4eQNh3O+TC5gkiIu0DjE59wCiPnYIoYpqimxtOGSEvv1RDThrXClEG9z5cjaii
 kXkBpkHW5j3WQoSrZJtzXDN84sFpsqGUegyn0ozHsXxsQc+D6SXir2GTbfDtAd4UBwVrtJKzO
 sl5z3PxzDNToqQijJP8cw5/ZIdN+be/prOyJUT7w9ccCGXjyKemfpdGTQKq7dMk+/2pN7vKq5
 HEP2MAwarqcbrJnMZzK+nz2uoe2S2cUL1EtjhSGxOlc/lBUb8bmdUza7nhjmyF9Fs4nrpLNie
 yNXz8Y9Ivg3ApdLpjEsJ9fou4515301N+ph4LzwvVwwUnrTj1gx6JvjoLPiN/mrLEl2JMsL3s
 i+t1IRLtQNik7mH4m+EDMeBCwAviZIGwYvd91tOgGtCNj7o3ot8ezOaMN24ewi2eNNg0urv9r
 EUGFIwSuBEhtkcIf4nU8k1at4JxLt93rTETB9PsNO+SX+WJxNvCt3IkErvLgQjA9D2XTXa3up
 zRlZjvL+DQYUZujVSz7Ch4aZfaSv4jiGC3wiVARJd4215Izi0wudnvCmpUsXW9GUdp/ouKMi+
 MADGQuUBpzltwAfa10samWn9m+dAmPmwqUr+EgoBSRsoZG4uYHVoFdG6MV6uiMLzc6B1idapm
 /YqSZx7PHdKBnyev2em4ZPwHY04GD5m0perdMJ72NXsvexYcpoGo0rpv01HNt9CkOS88m53Rx
 vUlqIbLxxFzWV3U03EW9EeDH2yG5adcYbgp9jj8QlnuW0Hd3DSTZaZcUmZ4awuTSWAjTzb1Sr
 WjFmLyBlP0l7//zc/u5PkW6HrDnDS/7M6HJZNyaDEkeslvhbHM=
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 7.0.0
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
Content-Type: multipart/mixed; boundary="===============3485161011637675018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3485161011637675018==
Content-Type: multipart/signed; boundary="nextPart8989019.CDJkKcVGEf"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8989019.CDJkKcVGEf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
Date: Thu, 01 Sep 2022 15:51:52 +0200
Message-ID: <3453234.iIbC2pHGDl@harderbit>
Organization: Green Communications
In-Reply-To: <20220827093603.GT37358@scaer>
MIME-Version: 1.0

> Ah, another case [0] of building sith host-nodejs, two data-points,
> better than one! :-) And see below [1]...

Yes, I actually work with Johan and he pointed these messages to me already.  
We also plan to use host-nodejs for the vuejs and vuejs-router packages when 
we find time for this...

... and, at this stage, I am thinking this would probably need a dedicated 
architecture.  Unfortunately I am not sure I know enough about Buildroot and 
npm to do this (I know next to nothing about npm, actually...)

> > Note that the v6.14.1-dist.zip archive for the previous version did
> > change, hence the hash for previous version is broken.  [...]
> 
> So, for master: v6.14.1 is just a fix in the package-lock?json. Since
> we were not building the package, but were relying on the pre-build
> archive, we should not be imapcted by this change, right? In that case,
> we could just revert back to using v6.14.0, so that we can have a hash
> that is correct.

I did not look into the details.  If package-lock.json is the only difference 
between v6.14.0 and v6.14.1, then yes, I agree.

> [1] As I said in [0], it is weird to see that we need to install before
> we can build?

npm install does **not** actually install anything into the target file 
system.  If I understood correctly, it just downloads the dependencies 
required to build the package, and installs them in ./node_modules, which is $
(@D)/node_modules in our cases.

This is according to npm -h:

npm <command>

Usage:

npm install        install all the dependencies in your project
npm install <foo>  add the <foo> dependency to your project
[...]

> Why build-legacy? a small note in the comit log to explain that would be
> nice.

The default build generates a lot of JavaScript modules that clients should 
load independently (if I understood correctly) and this is not what we want 
here.  We want a single JavaScript file to process without using modules, that 
will populate a global ol object ("namespace") with the library.  The other 
JavaScript packages that I know of in Buildroot (e.g., jquery, vuejs) work the 
same.

I need to make a new revision of this patch anyway (I will try to do it as 
soon as I can, sorry if I am a bit slow these days...)  So I will add a note 
when I do this.

Thanks for your remarks, cheers,
-- 
Thomas Claveirole <thomas.claveirole@green-communications.fr>
--nextPart8989019.CDJkKcVGEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEz8uGFb4L8Pqboq/N8Hq/R4RuLogFAmMQuPgACgkQ8Hq/R4Ru
LohaZg//bjGi8ZLe1PqyCa+DDL/ymzMXFdjDcFuWtfubpsS8L7kvG6OcFWplssKd
KopBFmZmj1lr2ZJv2qVuEdc89MW+p5wupmKA6Ky4fw8PSGrK4Y1kpFs0Y5LvYh2X
9Wwmk+80NcKdW4V5u7xgUzt2upLCK6Jn3uNz+2JQj8cUjhW4xsu6Q1i0mCbtlNJV
Q25dK4RLJR2yYRO8FAu920dB7EB+PzX6Ozsy4OdrOTOJvvEIWeYey8CmfoxbcswF
bmTDQvniLsbPwbuDQLAU/ULDst07nTarKv2t55y5CVHRKWUbu8EJDsgTM40uhQM7
KGEOScKj1AJgKM0tClQmo0MHeis2I54m+fphAOVynliygi9K9r5zT78d5jHZqzCq
SgIkaEGQ9y+PuVgRbMlA665jgGBcX5x4MTHGKh+4VbvkEbVDJZjZaC6rANPEnZY+
Jx4X0jsbgGm5scW6XzKf83XpUlkvDXcoUnPD++HCms6L7iGSxDiVADQGXbR1l+5j
8DHUAOT6schmHBhXDabsQg380n3Z6Br7ZuEGfLvNufNuYlQkM+s9I1WkHN+9HBR/
ARMqdRLZWkv9MxcccphBneoaXMC8bF8XZO2IqireCql+oyQtmtju7IuK5YN+sRA8
9pIfkQdg7RIMae5jT8LPBawQjClxDzhn4hewB7UTQH1qUx1onKo=
=NmzU
-----END PGP SIGNATURE-----

--nextPart8989019.CDJkKcVGEf--




--===============3485161011637675018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3485161011637675018==--



