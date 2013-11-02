From: Stanislav Vasic <svlasic@gmail.com>
Date: Sat, 2 Nov 2013 11:39:01 +0000 (UTC)
Subject: [Buildroot] Introducing new package type,
	side to side with generic-package
References: <CADYw_JLHofB+VQ2rktw_reWCvAWU9rj7VJ95tgVnW5OujYisow@mail.gmail.
 com> <ca3a5174-c804-48b7-ad60-720f3926223c@email.android.com> <
 CADYw_JJuE71mqxSmQtT1JKLN7d0apTS=DAz+KD7of7n3sVsWnw@mail.gmail.com> <
 CAAXf6LWqFR1mPtJ=w8g73R7Ut7m0wxPu_kwgn=ODW1axBx06uQ@mail.gmail.com>
Message-ID: <l52o8k$d6q$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 02 Nov 2013 11:27:12 +0100, Thomas De Schampheleire wrote:

> Hi Stanislav, all,
> 
> On Sat, Nov 2, 2013 at 2:46 AM, Stanislav Vlasic
> <svlasic@gmail.com> wrote:
>> Hi Thomas,
>>
>> thanx for answering my question.
>>
>> Not sure if you noticed, but currently in my buildroot, xbmc stuff is
>> tightened to Amlogic ARM platform, as well as xbmc itself. It does not
>> follow mainline xbmc and also depends on some other amlogic related
>> packages. Some of these packages (like libamplayerm6) are not hosted on
>> my github. Reason for that is simple - they have to be rewritten and
>> parts of it needs to be published as compiled libraries because of
>> license issue with Amlogic. Your question still stands? :)
> 
> The problem with buildroot forks is that many good developments in these
> forks do not flow back into the mainline buildroot. This is not only
> disadvantageous for mainline buildroot, but also for the fork that has
> to keep up-to-date with developments in mainline buildroot.
> 
> I hadn't heard of Amlogic before, but as far as I can tell it's just
> another device manufacturer. I don't see a reason why mainline buildroot
> could not contain support for such devices, and the related packages.
> Buildroot is just a set of scripts and Makefiles, the actual package
> sources are hosted elsewhere.
> And regarding the pre-compiled libraries you talk about: if it can be
> considered as a 'package' that can be downloaded, then I also don't see
> a big problem. I can't promise that everything will be accepted,
> but at least it would be great to try it.

I agree with you. I'm going to fork buildroot repository from github and 
will keep it updated + adding Amlogic things step by step.

Amlogic is Chinese SoC manufacturer. There are 3 different SoCs used in 
Buildroot for Amlogic devices. It's M1 (800 MHz single-core cpu), M3 
(1GHz single core cpu) and MX/M6 (Dual-Core 1.5GHz CPU).

Amlogic SoC exists in tablets, STBs (Android TV box) and smart TV-s. All 
forks you mentioned here are STB based, intended to run Linux XBMC on top 
of it.

My fork covers MX/M6 platform, while Pivosgroup you mentioned covers M1/
M3 platform.

It's not that easy to put it all together, but will do my best to add 
Amlogic support to mainline buildroot.

I started doing this way I did till now because it was simple to fork eg. 
vDost's buildroot which was already prepared at the moment for Amlogic 
MX :)

Anyway, I'll to keep on track, but with all the work I have, I can't tell 
how fast/slow it will go.

> To the community: I was going to propose to create a github mirror for
> buildroot to clarify which is the upstream project, but it seems one
> already exists:
> https://github.com/buildroot/buildroot If I search on github for
> 'buildroot', I get 227 repository results :-(
> Some are just personal repositories, but others are actual forks, like:
> 
> Amlogic-related:
> https://github.com/Pivosgroup/buildroot-linux
> https://github.com/vDorst/buildroot
> 
> Raspberry Pi:
> https://github.com/nezticle/RaspberryPi-BuildRoot
> https://github.com/gamaral/rpi-buildroot
> https://github.com/huceke/buildroot-rbp
> https://github.com/albertd/buildroot-rpi
> 
> GCW0 (open-source gaming console)
> https://github.com/gcwnow/buildroot
> 
> BeagleBoard/BeagleBone:
> https://github.com/nerves-project/bbone-erlang-buildroot
> https://github.com/MaxGalemin/buildroot
> 
> Maybe we should add something to the website or README regarding forks,
> something saying that we strongly discourage that and are in general
> open in accepting board support in mainline buildroot. But what do we do
> with all the defconfigs and supporting files. I think there was some
> discussion at BDD about that, but I didn't follow it well.
> 
> Best regards,
> Thomas
