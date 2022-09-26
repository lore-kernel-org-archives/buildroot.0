Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D26C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 09:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A16082419;
	Mon, 26 Sep 2022 09:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A16082419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20PIXWqZnR5W; Mon, 26 Sep 2022 09:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3768A8239A;
	Mon, 26 Sep 2022 09:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3768A8239A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB4AF1BF25F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 09:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9423D81CAF
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 09:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9423D81CAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76ab_Dk2vTqO for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 09:04:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C7C18239A
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C7C18239A
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 09:04:51 +0000 (UTC)
Received: from harderbit.localnet ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis)
 id 1MGQ85-1oSXpL4BLR-00GpX9; Mon, 26 Sep 2022 11:04:47 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Sep 2022 11:04:38 +0200
Message-ID: <3124822.5fSG56mABF@harderbit>
Organization: Green Communications
In-Reply-To: <20220925215340.43f64019@windsurf>
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
 <20220925214700.5e222e95@windsurf> <20220925215340.43f64019@windsurf>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PB1Nwnj8lyhCy5iwsujtxrWi82zL1ADd2NpDh1CPxpRJ1OP1gC7
 VelylOhfmDYXz+8MOgafAa4e3BPf6EuAeeVlNkuIYNd64Ql7bqB1+KGfz9JCifkm4cPySBc
 T3g3IVaZvZCFICaXnk3V2MJ5hk0tbOs3duQh8337HSHFi9b9d/meJ7CLMjjki63GLWQu+wU
 HG82hXOZ3SyPn4zbTXvzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sCLwlLHyIKQ=:u6tq3XOSBJ4x6FAsYL8PZr
 0t3/j3Xx1oyh+TT6auaO4YH4Lt2OzH3oVHB/GjiEw1YPgGGk4QuL3lO1EqBbZtRH1mGNznhs6
 2it7FsEUVdS0woqDlDmrIU7sC7OazebVgOVJCds/S/5d2u7TcrgVZyXWdTsbG1yz8AyAbsmKJ
 MN6k/eePSvlbNN2h4t0bCptTeh8unaKkG5DOF/5vd+OMXPqVkzVK2m30rn12CAzHR33FakPPU
 uQ+MJiEnv25kMMaMDqGlvnoBwDg7R6zeNL4WLq5aKrv4ZOfoifzLS4JOVjt2/qmvZ/r0L9K0Q
 XS6MJWJf073NOkUSmX7pJQRVAEocWGZnwWcq9ALyYLAZ2WH3HASM9yguTbBWXMiN+yCQsJAZs
 W37odzZDoaDazZdF6hkYK6om/sqKFtqT0BeFUgD3ZI11B6rz95IYuT3jXlZX+hhodcUP8DXvo
 DPNQd9By1Zyoecex5ijJIxTQ/7y6RVUmGp+B35t74fl9shttFWUBWJJJCKUjqGxK3+LgZPfZq
 zXTdlmwkEPns2tJKzwIL+CR+OYjTcsAb+1lemUrKHjcn4GzuILmYwngG/wtIa/w/npYPQI0JI
 YuhzuSrEnpTI8rGAssdf/KvsnxeXUhBhp5o1GSVvtcJ3Tx3i8chGezGkKIdy05Ti/6Ik6kb92
 s509Qpfv+apA27YHemDWK0XWDrneDZ1sft79smj+pJHr6gxnWDG6IID6OhJv+Up0n8W4ZV/4B
 RalHlV97TQFJIGT5DBdan4XLJOTwddItrD9xJUK2K1IiN/1zYoIINhlW0eWEwz7KAp2Rc6YVt
 RlvhY5gh1WS3Ppiz14cSyODGJyk3QQfI6RVG/o+CBB2p2qrKNc=
Subject: Re: [Buildroot] [PATCH 1/2] package/nodejs: introduce
 BR2_PACKAGE_HOST_NODEJS_COREPACK
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6819920428070257215=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6819920428070257215==
Content-Type: multipart/signed; boundary="nextPart5760946.MhkbZ0Pkbq"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5760946.MhkbZ0Pkbq
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Sep 2022 11:04:38 +0200
Message-ID: <3124822.5fSG56mABF@harderbit>
Organization: Green Communications
In-Reply-To: <20220925215340.43f64019@windsurf>
MIME-Version: 1.0

> Replying to myself: "corepack enable" does not download stuff. [...]

It sounds good indeed.  To be honest, all this Node packaging gets a bit over 
my head and I am not sure how it works exactly (the whole JavaScript packaging 
ecosystem just looks crazy to me).  I usually just use compiled JavaScript 
files and almost never compile them myself.

I thought that using host-nodejs to compile JavaScript packages was a new 
Buildroot policy, but apparently according to [1] and [2] we prefer to stick 
to precompiled JavaScript files?  If so, I will send a v2 patch for the vuejs 
package (... when I find some time.)

[1] https://lore.kernel.org/buildroot/20220919114617.67d80b53@windsurf/
[2] https://lore.kernel.org/buildroot/20220924170516.4a0323dc@windsurf/

(As for my opinion, should it have any relevance: I also prefer that Buildroot 
relies on pre-compiled files, at least as long as it cannot do some vendoring 
for Node packages.  Downloading stuff outside of Buildroot's download system 
is quite annoying.)

-- 
Thomas Claveirole <thomas.claveirole@green-communications.fr>
--nextPart5760946.MhkbZ0Pkbq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEz8uGFb4L8Pqboq/N8Hq/R4RuLogFAmMxayYACgkQ8Hq/R4Ru
LohZfRAAmM4z/rDCtvZzd8NW/ojEf8YGrS7ZVD+qzbddm9crnHfR6R3e2Hxe8e4u
zFyGHY/P9WLHg9rnY9ISvDyEih6BJU3pz/XR7HTCxW0ZyebNTBTjIi29sBVJEWkh
g0l08nLjwVH9WQMNhTHMC6Zf2rTW2IVuWYJNFMCDidltGfQ3hQTNg3rEF4ZkFbqK
9fGTT87Coe5aDtQyKOJgJ93pDS17AgOGg8QlP0qNINDFy8WgMEldsMHoFrlvMWF0
v0gILHJR7dYJVHvB9GrREoPDPUZV6MtWFjglhWIBuDW1fS4fD9S7S28RDHS6Iojx
sNz3AXYWKfwIQgDvxNVuT+wFMUG6SK5XlFiHAz/EY04sC4plirIsEb0quCqqVDpC
bUOBntbd67Nzr3zKwp8H2vzZeMjrKQ7d8AfokpaxSyQvtXjt0Bg1ZnCg8RwXnDjt
2cLMkUroVWac5XEwNZLqjE6ebEMxWJAAC7Kw94mx/sFJJJCL5/nSXrr+I5tm8dCD
gAaHJRZGhYNk40/c0ry7zVYsEWJfRN/724ztPW27mwUlkQMXDwHwr/CNTBfp+b+R
4flxxNjfPubc0+B/zk4W2ndbZw9N7EdNF0qR5ML3TmrETnh4h33NTCu10JzMAezl
e3yw7SsA54i8eHWea/MVC1JAqVZdSHnkFjoe3ByeoF2K0WwUal8=
=uYoq
-----END PGP SIGNATURE-----

--nextPart5760946.MhkbZ0Pkbq--




--===============6819920428070257215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6819920428070257215==--



