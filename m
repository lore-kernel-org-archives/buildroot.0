Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBFFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 12:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2176082B1E;
	Fri, 15 Apr 2022 12:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HBx3ZLcAAM_N; Fri, 15 Apr 2022 12:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FC27824DC;
	Fri, 15 Apr 2022 12:25:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 852971BF32C
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 12:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81B6560773
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 12:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64vgBBXzASx6 for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 12:25:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 154936068A
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 12:25:30 +0000 (UTC)
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Macf4-1oD2Cm2BUg-00cCXc; Fri, 15 Apr 2022 14:25:22 +0200
Message-ID: <32c50049-ca86-b729-aec9-4893711dbc2c@green-communications.fr>
Date: Fri, 15 Apr 2022 14:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Eugen.Hristev@microchip.com, Jason@zx2c4.com
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com> <20220324082433.GA3649946@scaer>
 <87fsn2b4ht.fsf@dell.be.48ers.dk>
 <df314344-f151-7ae4-1e56-b65b8532d6d2@microchip.com>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
In-Reply-To: <df314344-f151-7ae4-1e56-b65b8532d6d2@microchip.com>
X-Provags-ID: V03:K1:WvfUBhQLdA9qXaTzwqiYUXqaTuD4SrY3sMSO8WPZFWT5UqmVkBA
 odkIAl4crxoB4PXl8Ln3te+3ttLaFqLBnguFExpb/hIt/U2NXZj5d8n3Zpi6IpHNvSf7Z71
 d8t6bQkBG1XwjI5r2WXgOeaDLY5lgbzEJZOTii3x3jutGZoOk4jKjhNIl73NSoJmnXqJ7jL
 NN1bNRw6uyYW7JIBzpG1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V+Qjac0xq6s=:ZeqcGW93nTcR/pVX+Hegwi
 xMR3IZsBswhSpvS6omxBKdNAPApompDMaUydBRxd5Y0uopcZSazVHyO1aR/LctwR5Cyu+WD6m
 MLgj/uBiVJ35Z7EqERpwdqy5nfhCWZT0EWH7i9dvEIc9lai0cqNZeDG4eGX+KbvJ7liemclXe
 q35fqgDwb0NjRPEQKfRssNWqUY8cmmptcRC7MiogTKodPl3xQnTBP8uznS0Y8DgbLiY3tnfon
 ltF7Sxpxo2LY2JX+6Wm7XQBFDqC44Oo5ktyOq+NFOcg6n51PHUP0PZCYru7S8+PPMQGs9VYxN
 bTbGrMsOgzMcMU0to7cdvK1sq9VaDYhv94WVORlmvx++pWQXS54YEOMP8i+gu5+UVD8h2/ZYw
 /kCWuagtgo+MJdPv3RzzTYNs++aN+cNMyTtEkWYHF3hrWZUe0swxMbEzAxr7GaPNewftGu0uo
 0mJX6M++qKDn7LMM3wDfbf9o22PmZ+RMOcRjR/rnus0LpD17ppx7gs63t4bOGnj1PKhvtZBYf
 hYdIS/knrLjrb5Pa1LDcc40oMKm17tlMPmGXsWR/8FEQKbjczJu5pwruVydlq0BvNpfnRo4Ni
 9AEQe8SnHUUVtgdcDD+xdBKKaZR07PF8jcqrohl0jCaqK8uQBPyENTaM+aJTn06lfwnW1/fnu
 v7ML6LdxGafQJmnieMjyjNd0dQEx7wtsZhzpDQwpJCW4Evn0ANbw7fXeUNOAhThtLshNNBpWh
 Eu2zvONnTRiRymiasCfxxoQD73UqxiZBR6/ATA==
Subject: Re: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/04/2022 12:54, Eugen.Hristev--- via buildroot wrote:
> On 3/28/22 4:17 PM, Peter Korsgaard wrote:
>>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>
>>    > Jason, All,
>>    > +Peter: candidate for backporting as a security fix
>>
>>    > On 2022-03-23 14:07 -0600, Jason A. Donenfeld spake thusly:
>>    >> Writing into /dev/urandom doesn't actually credit any entropy bits. And
>>    >> while it adds that data to the entropy pool, it won't actually be
>>    >> immediately used when reading from /dev/urandom subsequently. This is
>>    >> how the kernel's /dev/urandom has always worked, unfortunately.
>>    >>
>>    >> As a result of this behavior, which may be understandably surprising,
>>    >> writing a good seed file into /dev/urandom and then saving a new seed
>>    >> file immediately after is dangerous, because the new seed file may wind
>>    >> up being entirely deterministic, even if the old seed file was quite
>>    >> good.
>>    >>
>>    >> This has been fixed in systemd with
>>    >> <https://github.com/systemd/systemd/commit/da2862ef06f22fc8d31dafced6d2d6dc14f2ee0b>,
>>    >> and fortunately it's possible to do the same thing in shell script here.
>>    >> Specifically, instead of just saving new /dev/urandom output straight
>>    >> up, we hash the new /dev/urandom together with the old seed, in order to
>>    >> produce the new seed. This way the amount of entropy in the new seed
>>    >> will stay the same or get better, but not appreciably regress.
>>    >>
>>    >> At the same time, the pool size check in this script is useless. Writing
>>    >> to /dev/urandom never credits bits anyway, so no matter what, writing
>>    >> into /dev/urandom is useful and not harmful. There's also not much of a
>>    >> point in seeding with more than 256 bits, which is what the hashing
>>    >> operation above produces. So this commit removes the file size check.
>>    >>
>>    >> As a final note, while this commit improves upon the status quo by
>>    >> removing a vulnerability, this shell script still does not actually
>>    >> initialize the RNG like it says it does. For initialization via a seed
>>    >> file, the RNDADDENTROPY ioctl must be used.
>>    >>
>>    >> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>
>>    > Applied to master, thanks.
>>
>> Committed to 2021.02.x and 2022.02.x, thanks.
> 
> Hello Jason,
> 
> I noticed that you worked a lot on the S20urandom init script for
> sysvinit in buildroot.
> 
> I recently updated from 2022.02 release to 2022.02.1 and now on booting
> all our boards, I noticed this message:
> 
> "Initializing random number generator: FAIL"
> 
> 
> With the 2022.02 release, with the same kernel, the message stated "OK".
> 
> So it might be something changed on this BR revision that causes this fail.
> 
> As you worked more on these scripts , do you have maybe an idea or a
> hint about what I can try , to have it working as before ?
> Or maybe what change can cause it ?
> 
> I tried to test 2022.02 + this patch I am replying to, and things appear
> to work fine. So it must be something else then...
> 
> Thank you for your help !

If /var/lib/random-seed does not already exist during boot then the new version 
of the script will fail and not create it, because start is "init_rng && 
save_random_seed" and init_rng will fail.  If S20urandom stop is never called 
then this may explain the issue.

I pointed this out before but it must have been lost:

https://lore.kernel.org/all/20220324103939.GD3649946@scaer/T/#md433db1bd1e08f3476eefd4e9a83ead5e12b1276

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
