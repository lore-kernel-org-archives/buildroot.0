Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74045C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 23:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27040815AD;
	Sun, 13 Feb 2022 23:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIegFeuy1KUX; Sun, 13 Feb 2022 23:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0819781757;
	Sun, 13 Feb 2022 23:35:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B46871BF3D0
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 23:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2AB581757
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 23:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUyutZJ2D5yP for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 23:35:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29C5E815CC
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 23:35:46 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JOPAnjB9oXmFAJOPAnvHpI; Mon, 14 Feb 2022 00:35:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644795345; bh=dYsM72kWYRwY8T+kCsQEW/5wodkMYasQdQajLsZ2ANo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=an19sbR9txF1himm98GjepcsC7zJ4KRo2tgN79bQ0PS6hivllGlTCP6d2tjIxu3yX
 LJnOFmMsNBNlX5jdQnfkw4L1ZG5I3v0ZSXf5Tajy/t6/UcnWMxmuCBnjVMiTQsDQTg
 fnLnXp77FsdospqeV/Xm5KS2sal3sT6aUxdb/EtL6sxBrtOR0BObPqtPEzP54hbOI8
 xj+XLS4BeTJMH7VN7ET87TO5GuCa3qRYuhDPvA29fFsB/5l1OjKbad/0l2drhF2ASS
 I3zh6j6K6MmuuF+ovxBzUNaOAf4a8FWLr27wesVgfPBbuDUSwg+gjQ6KdYzLEXd3U1
 jmxjeYBZ6bGVg==
Message-ID: <80ba31da-8a8e-12ed-bded-025e47f5cced@benettiengineering.com>
Date: Mon, 14 Feb 2022 00:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
References: <20220203235438.610277-1-giulio.benetti@benettiengineering.com>
 <eff4604f-7630-d8d3-6ebb-dfbef57b8663@lucaceresoli.net>
 <f942379b-566a-dc23-b593-968b8613ef83@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <f942379b-566a-dc23-b593-968b8613ef83@mind.be>
X-CMAE-Envelope: MS4wfOZDOK7aEfISj9B9n24iBE2uDTQB/aPSB/FkJcFvZy2JYNhVDva2tTXT6fRiylDSXahkufKSdWBNxUCLRxd8BkjVXbw+1w6CRRO1nJe3tu/2kM84Cc9S
 QHk5t9XODPcta59jgXaBVeQKprd3DbVWZSdtD4RfebwzqeZs5Kgn8nlBeAi2C79HarFyjZM6p/DaoigHavsHFAPXZBvxybyvaqpWhtVkoSZAAur8wqdM3wlO
 wbAqupTCR6Xwv0e9p+AHKxYu7NdXNMn4pNnaerXWjuMZ8XKTPrt6neWbEHRuvK3QMz8xzDac3/yNZhtR2yp5aiSJ0PoinFDmEhGUG2FrHWLLxmUPQz0EkSU3
 UPK31SYa8iLo9fYNh343y0ciGWsmRCi9SDyQ0qOXzpJ9rLkNYO0=
Subject: Re: [Buildroot] [PATCH] manual: board support: add instructions to
 test defconfig in the official docker
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca, Arnout, Thomas P.,

On 13/02/22 11:39, Arnout Vandecappelle wrote:
> 
> 
> On 12/02/2022 23:56, Luca Ceresoli wrote:
>> Hi Giulio,
>>
>> On 04/02/22 00:54, Giulio Benetti wrote:
>>> Often new boards have not been tested with official docker so let's add
>>> instructions to do it.
>>
>> Thank you, I think this is a very useful addition to the documentation!
>> However I would suggest some changes for it to look more "professional".

Always welcome!

>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> ---
>>>    docs/manual/adding-board-support.txt | 22 ++++++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
>>> index 33ed709535..f5fb3af371 100644
>>> --- a/docs/manual/adding-board-support.txt
>>> +++ b/docs/manual/adding-board-support.txt
>>> @@ -46,3 +46,25 @@ create a directory +board/<manufacturer>+ and a subdirectory
>>>    +board/<manufacturer>/<boardname>+. You can then store your patches
>>>    and configurations in these directories, and reference them from the main
>>>    Buildroot configuration. Refer to xref:customize[] for more details.
>>> +
>>> +Before submitting patches for new boards it would be better to test it
>>
>> "it would be better" -> "it is recommended".

Ok

>>> +by building it using .gitlab-ci.yml specified docker. For example at the
>>
>> I think this should be reworded in a simpler way: "by building it using
>> the docker specified in .gitlab-ci.yml".

Yes

>> BTW as I am a docker newbie: is it common to say "the docker"? Or would
>> "the docker container" be more correct? -- By comparison, I would never
>> say "using the virtualbox" but rather "using the virtualbox machine".
> 
>    I would say "the container" since you can use it with any container manager
> that follows the OCI spec.

Ok

>>
>>> +time of this writing the docker is:
>>
>> Remove the ':' from this line, or you'll have multiple ':' per line,
>> which looks awkward.
>>
>>> +$CI_REGISTRY/buildroot.org/buildroot/base:20220105.2314
>>
>> Hm, this string is already old.

Yes :-/

>    Actually, this part of the documentation is already superseded since we now
> have utils/docker-run that does everything.

Oh, I've missed that, just checked and it eases life not few!
I have a 120 columns command to start it that I copy and paste 
everytime. Because also, what I don't take care of here is the -v flag 
that allows you mount a host folder.

>> There's no sane way to keep docs and
>> .yml in sync. I wonder whether we should have in the manual a command
>> line that always use the current string, such as:
>>
>> DOCKER_IMAGE=$(cat .gitlab-ci.yml | \
>>                  sed -n '/^image/s/^.*CI_REGISTRY/registry.gitlab.com/p')
>> docker pull $DOCKER_IMAGE
>> sudo docker run -it  $DOCKER_IMAGE
>>
>> However I must admit this is not very readable in the docs... :( What
>> about adding a simple script (utils/run-docker?) that does the trick and
>> just mention that in the docs?

utils/docker-run then. Now we know it exists :-)

>>> +so:
>>
>> Add an empty line here, so that the output separates from the next line.

Ok

>>> +Pull the docker:
>>> +--------------------
>>> + $ docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
>>
>> Missing 'sudo'?
> 
>    Docker access is usually managed through the "docker" group rather than sudo.
> 
>    And if you use podman as docker replacement, it can even be done in an
> unprivileged container. Not that I tried it, but I think so.
> 
>    Oh BTW, the pull is in fact not needed, both podman and docker pull
> automatically when you start a container. That's the reason the container name
> is so convoluted.

All new thing I didn't know!

>>
>>> +--------------------
>>
>> Add an empty line here. This has no effect on the output but makes
>> source code more readable.
>>
>>> +Run the docker:
>>> +--------------------
>>> + $ sudo docker run -it registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314 /bin/bash
>>> +--------------------
>>
>> As above, add an empty line here.

+1

>>> +Inside the docker hint:
>>> +--------------------
>>> + $ git clone git://git.busybox.net/buildroot
>>> + $ cd buildroot
>>> + $ make +<boardname>_defconfig+
>>> + $ make
>>> +--------------------
>>
>> As above, add an empty line here.

+1

>>> +Wait until build finishes and eventually add host dependencies.
>>
>> If I understand what you mean here, it should be "and add host
>> dependencies if needed" ("eventually" is not the english translation of
>> italian "eventualmente").

"...and possibly add host dependencies", right?

>> If my understanding is correct, I don't find
>> this sentence very useful: a docker newbie perhaps doesn't know how to
>> add a host dependency (and maybe not even how to understand that they
>> are missing one).
>>
>> I would just remove this line, but if you think it is very important I'd
>> clarify it, maybe with some examples.
> 
>    Yes, I think this is what triggered the addition of this documentation. If you
> have e.g. libopenssl-dev installed on your build host, then you usually won't
> notice in your test builds that a dependency on host-openssl is needed. So test
> builds should be done in a minimal container.

Yes, it was because of that.

>    Unfortunately, the buildroot/base container is not exactly minimal. It's
> really what is meant to be used for running CI tests, not exactly what is needed
> for build tests. Ideally, we'd have
> 
> - an absolutely minimal container that can be used for build tests - ideally in
> a couple of variants for different distros;

There is a bunch of dockers like that(more or less) here:
https://github.com/aduskett/buildroot-docker-devel
I've also contributed to, and at that time Thomas P. in IRC asked why we 
didn't upstreamed it and I told I would have done like 2/3 years ago and 
I've never done it :-/

And also modifying autobuilder's script to pick random distro and build 
to avoid possible host issues. But it's a bunch of stuff to do.

> - a container for CI;

Do you mean the one we already have but more shrinked?

> - a more complete container you could use for development, though I can't
> immediately think of extra stuff you'd want in there 

Is it really worth it? I mean, I've never seen anybody in IRC(even if 
read few in it) or ML(same) that complain about "I can't have buildroot 
working because I miss host tools". But I've seen recently gitlab-ci 
results that took me like 15-16 hours to fix.

Does Yocto have something like that? And if yes, does someone can give a 
feedback if he really uses it?

>(but then, I wouldn't use a container for development).

Me too, and who would use it? I think nobody, because I don't think a 
newbie is that skilled to use a docker too(or maybe yes), but my first 
try would be using it with my distro and probably same goes for other 
people. But here again, I use Terminator+Midnight Commander as my "IDE", 
so I won't be happy enough with it. Someone else uses real "IDE" and we 
can't add Eclipse or VSCode(I hope), so it will be something that is not 
enough for anybody, thus IMHO useless.

----------------
Going back to this patch:

What I can do with this patch is to rewrite it pointing how to use 
utils/docker-run to check that at least configs/* and board/* patches work.

Another solution to my patch is what Thomas P. pointed in IRC:
"it is probably easier to ask people to use gitlab CI"

But my worry is that lot of people actually fork from github and not 
from gitlab. Who would really do that(both docker and gitlab-CI solutions)?
But also, who would really install docker(if they don't use it) to 
submit a patch for gitlab-CI build failures?

I think that counting the ones who took care about their maintained 
board gives us an idea, very few. BUT for new boards, and I see not few 
of them adding in the last period. It could be a way to force them to 
give a proof of a successfull building with gitlab-CI pipeline log as 
Thomas P. proposed.

So I would modify this patch with instructions to:
- fork Buildroot in gitlab
- trigger gitlab-CI pipeline for a single defconfig

What do you all think?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
