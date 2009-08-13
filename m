From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 13 Aug 2009 21:55:52 +0200
Subject: [Buildroot] Buildroot and OpenEmbedded
In-Reply-To: <87a5b0800908130628i760f152eu84237eb985227c36@mail.gmail.com>
References: <5f2b60908130604i7175f89h533d1b8f8444e60f@mail.gmail.com>
	<87a5b0800908130628i760f152eu84237eb985227c36@mail.gmail.com>
Message-ID: <5f2b60908131255l128ec735r2b07c70e7bb46df9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/8/13 Will Newton <will.newton@gmail.com>:
> 2009/8/13 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>> Hi all,
>>
>> When I started out with embedded Linux, Buildroot was of great help.
>> It built a working cross toolchain and a rootfs for me and I was very
>> pleased with it. (Thanks a lot to all developers!) At the same time I
>> had tried OpenEmbedded (OE) without much of a success: it was too
>> complex for me and I could not get it to build anything. Now, about
>> two years later, I started using OE at work and have had very good
>> experiences with it. So good that I must think carefully about why I
>> should use Buildroot for my next project, and not OE. I guess the main
>> reason (for me at least) for thinking about using Buildroot is its
>> easy menu configuration. But at the same time it feels like OE has
>> more to offer in terms of its build system and its package set.
>>
>> What do you guys think? What does Buildroot provide that OE does not?
>> And another thing: could/should the two projects be merged?
>
> The reasons I have chosen buildroot over OpenEmbedded are:
>
> 1. Simplicity.
>
> OE seems to have lots of config files and an unfamiliar interface. BR
> lets people configure their root fs in the same way as their kernel.

Yes, the BR configuration system is very nice. I still don't know how
to fully customize OE builds, I just build a base image and use opkg
to add extra packages :-) (Note that I haven't spent much time trying
to build a custom image either.)

> 2. Bitbake.
>
> Asking users to install often very recent versions of a leftfield tool
> is difficult. BR has a minimum of external dependencies, which is
> great when your users insist on using 3 year old distros. ;-)
> Also Makefiles are something almost all software engineers understand
> so it reduces the support burden for me.

I wish OE could do without bitbake. But once it is installed, its not
so bad :-) Regarding distro dependencies, I believe OE does quite
well. AFAIK, all native tools that OE needs on the host are simply
built from OE recipes. This gives complete control over the build
environment. On the other hand, building all native tools makes the
initial build, which is already very long, even longer.

> The things I perceive to be better about OE are:
>
> 1. Wider range of packages.
> 2. Probably more vibrant community and more commercial involvement.

Agree. May I also add that OE built images are named by configuration
and build date, eliminating the need for manually copying/renaming the
resulting binaries so that they are not overwritten by subsequent
(experimental) builds. I remember having manually backed up many BR
binaries before :-)

Thanks for your reply, Will. I hope to hear more from BR users that
have had some experience with OE, why or for what they use BR and not
OE. Maybe I have to ask the OE mailing list if there are anyone there
with BR background too :-)

Regards,
Bj?rn Forsman
