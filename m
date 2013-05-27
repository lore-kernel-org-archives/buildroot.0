From: Carlo Rajko <carlo.rajko@scen.it>
Date: Mon, 27 May 2013 10:03:50 +0200
Subject: [Buildroot] AT91SAM9G20-EK and aplay
In-Reply-To: <519F6226.4060002@zacarias.com.ar>
References: <519F186B.3060606@scen.it> <20130524100520.01c518fd@skate>
 <519F2CDB.8080805@scen.it> <20130524112355.70d1cc53@skate>
 <519F452D.4070505@scen.it> <519F6226.4060002@zacarias.com.ar>
Message-ID: <51A31366.4060405@scen.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 24/05/2013 14:50, Gustavo Zacarias ha scritto:
> On 05/24/2013 07:47 AM, Carlo Rajko wrote:
>>>> I think the problem is not in aply because I have the same problem with
>>>> mpg123.
>>>> Could be the library alsa?
>>>
>>> It could. But at least gdb will tell us if it's an undefined
>>> instruction, an invalid memory access, an unaligned access, or
>>> something else.
> 
> Actually it's the toolchain, seems CS 2012.03 isn't emitting proper
> arm926ej-s code.
> I've managed to reproduce it with the qemu_arm_versatile sample
> configuration and adding a bunch of packages (mpg123, vorbis-tools, ...)
> It did strike me as odd that i've got the same failures as yours (aplay,
> mpg123) but ogg123 worked fine with alsa output.
> So switching to an internal toolchain or CS 2011.09 magically fixed the
> issues.
> Regards.
> 

I switch to CS 2011.09 and now is ok, thanks.

Regards
Carlo
