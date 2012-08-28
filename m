From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Aug 2012 17:59:35 +0200
Subject: [Buildroot] Some questions about buildroot Target toolchain
In-Reply-To: <CAD4nNjU1cEJvd3LfwnKFDp12_11onm-vTc2JJidtWOz4vLuexg@mail.gmail.com>
References: <CAD4nNjU1cEJvd3LfwnKFDp12_11onm-vTc2JJidtWOz4vLuexg@mail.gmail.com>
Message-ID: <20120828175935.4fe0aa87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 28 Aug 2012 16:04:42 +0100,
rechid miloi <in.hiring@gmail.com> a ?crit :

> I've build my own Linux system for X86_64 using Buildroot/uclibc. I've
> successfully added number of packages : libpam, openldap, clamav,  ...etc.
> However other package I wanna add can't be cross-compiled, so I decided to
> compile TARGET_GCC and TARGET_DEVFILE into the system.

Really, using the toolchain on the target is not the right solution.
The right solution is to get your "other package" to cross-compile
properly. What package is it?

> The problem, is when (ld) try to link any object, I got the famous
> "R_X86_64_PC32" ERROR.
> I've tried to figure that out by :
> 
>    - Recompile all buildRoot with : -fPIC -DPIC
>    - Recompile all BuildRoot with : -pie
>    - Deactivate binary striping
> 
> Without any result.
> 
> However, I've tried to compile the "file" package with 'LDFLAG="-static"'
> and It worked ! Sincerely I don't know why !

Maybe because our target toolchain is broken with regard to shared
libraries or something. Since the target toolchain is not really useful
(Buildroot is meant to cross-compile things), almost none of the main
Buildroot developers use it and test it, so we have had repeatedly
reports of breakage. Unfortunately, none of the people reporting
breakage, who should be the ones interested by this feature, have
contributed fixes to improve the situation. At some point, we might
even consider removing the possibility of generating a toolchain for
the target in Buildroot, but this remains to be discussed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
