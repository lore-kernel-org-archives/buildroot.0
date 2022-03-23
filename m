Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5C4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 13:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39C640C47;
	Wed, 23 Mar 2022 13:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cQfhYa0jw57; Wed, 23 Mar 2022 13:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D17BD4056C;
	Wed, 23 Mar 2022 13:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 756F51BF57B
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 13:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7226A84746
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 13:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja2oi8W2VtSm for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 13:45:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B86D84A41
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:45:54 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxmFk-1oI04c3KNK-00zGYP; Wed, 23 Mar 2022 14:40:32 +0100
Message-ID: <8ee34df1-a616-f9e4-a12d-777c055e83cf@green-communications.fr>
Date: Wed, 23 Mar 2022 14:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220323035233.140997-1-Jason@zx2c4.com>
 <20220323091336.GL1566358@scaer>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20220323091336.GL1566358@scaer>
X-Provags-ID: V03:K1:Vd1EbzU1kvnI/VtLWY5aA7iOh6/E30AONl3Fmqj6ByPWMyCW/ck
 88TJTjppyowTW+bWhIUg2Sw0QANiKjTGF2IMZ321btWcTkreSdUCRoBziTd7O61PkbyvAeJ
 D/rCQNrnKGNZQfEHNxD2dGmUFyw4FajozovJLaHwFV6CSusF9kmEjG82y18a7Un7m6WKZtt
 P8G5a5qQQr2xgNTDxsbhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BrF9mA8bHFc=:z4ObkhSXUZwWNVZLrsw3YH
 WOuWg1oWWhMwQ/PjGcGYfeOwgwig+rQv+n22zmM4h23wKldPRdaX0E6xLHm+7Hug/95H92B3s
 ScYoe7JDXl+QGDSEueOLfCE/QMbowiXFoOYuJaCvQuPyYyXKRB/ttXTe0CKccEMuzbhpDnamR
 1qyhQBREYPSPvmJwYVHk0RnJVQxAy/jRGyPfgWWE32lPI+qOq4Q4EI7qyM2sCWRUSUu9oTXPQ
 dJouLqIIWIvFoxhiLBgw+JSHfB5FvsJJJ8DWhBIzib1V/tZpXICLE/bZyKy74C0EW3EbaQqqd
 5gZ8EjbHtSQhTXAsrHec6gY/Mvx/va18SFjtslm6WW8d5buFYq7RTJ9w8PNSPEOJ4Q+oPqt3a
 ZwGFnNEEG0GlgRToKutGaBAsyByFxna4+tHnze6nce2ZWVE01SMBGoDPzpgKEDBVWwcS4Ij+b
 LkXu+ych9pwraNCwaCh+FkgOcxmSOlzhQMcrnwh97lvby4E5OxNvF5mORq2G1JAPDvds9DWaY
 ugpgBdKXR9RiU+Jl4/zw9XHOogB7sPFnlgGGDQep/E+NfxczNLXols2fX/0QV8o40wnH9g4lo
 AtK3ilLXfKQxOJ6TMO9TB8cymeW7Mg/0RTqSvTlKFywHr6CkhIlM0+ynMU0vPMBJikR5nuFPm
 E2cCclmYHE35LIw1lsuLrzmJxBh0cgKWLeZnXqhhjqSO4DXSPLQewr8j4lZCMFakW2UJIHnfS
 nPAElEJdXszJYo9bNDT1iHKDC+q+gb9Kd7RTyA==
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: hash old seed with
 new seed when saving
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
Cc: =?UTF-8?Q?Christoph_M=c3=bcllner?=
 <christoph.muellner@theobroma-systems.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/03/2022 10:13, Yann E. MORIN wrote:
>> As a final note, while this commit improves upon the status quo by
>> removing a vulnerability, this shell script still does not actually
>> initialize the RNG like it says it does. For initialization via a seed
>> file, the RNDADDENTROPY ioctl must be used.
> Is there a way to do that within a shell script? If so, would you be
> kind enough to send a followup patch, please?

No busybox applet is using RNDADDENTROPY, so it cannot probably be done 
in a shell script :(

It's also unfortunate that the urandom(4) man page's example script 
tells people to write to /dev/urandom exactly the way S20urandom does.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
