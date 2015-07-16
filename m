From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Jul 2015 18:48:11 -0300
Subject: [Buildroot] [PATCH] package: Fix overwrite inittab w/ default
 skeleton
In-Reply-To: <20150716233553.4d46b3d0@free-electrons.com>
References: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>	<20150716230722.304e5f9a@free-electrons.com>	<55A81F61.3050307@zacarias.com.ar>
 <20150716233553.4d46b3d0@free-electrons.com>
Message-ID: <55A8269B.4030208@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/07/15 18:35, Thomas Petazzoni wrote:

> Well, all the commits I cited in my previous reply definitely changed
> the behavior in a similar way, just for different files.

Hi.
Yes, albeit in less intrusive files.
Also not all of the packages did the check, we just made it consistently 
overwrite.

>> My usage scenario is customized initscripts that rely on a very minimal
>> inittab (rcS, rcK and getty, nothing more).
>> All of the basic startup is handled in initscripts, which i think we
>> should do for BR as well - there's no reason to stick a lot of stuff in
>> inittab IMO.
>
> Possibly yes, though it's a different question. Even if the default
> inittab is more minimal, there are still lots of reasons for which you
> might need a custom version of it. So making the default version more
> minimal is kinda unrelated to whether we keep or overwrite the inittab
> of a custom skeleton.

It's just an example, i might just as well configure "no init system" 
since part of the customization is nuking all of the BR-provided ones 
since i provide more feature-complete ones and it will definitely fix my 
problem - i'm not concerned about my corner case, it's just debate about 
what's the right thing to do.

> My personal preference would be to ultimately get rid of the custom
> skeleton thing. We have been encouraging rootfs overlay and post-build
> scripts since quite a while in the Buildroot manual, see
> http://buildroot.org/downloads/manual/manual.html#rootfs-custom:

Well, exactly what i'm going to, if we don't respect it why keep it?
Going forward it's getting more overrides from new stuff, we don't 
recommend it and so on and on, maybe it's just time to kill it.

> If were to not overwrite the inittab, we should also revert all of the
> commits I mentioned, and guarantee that the files in the custom
> skeleton would not be overwritten.
>
> I agree with you that this is a change in behavior, but I would say
> it's a change for good: making people realize that using a custom
> skeleton very often doesn't work as they intend it to work.
>
> Any opinions from others?

I was kind of joking with Maxime on IRC about defining an 
INSTALL_NO_CLOBBER to avoid checks on these things, it would avoid going 
all atomic on overwrites by using a custom install all along, maybe that 
would be a solution.
Regards.
