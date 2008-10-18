From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Sat, 18 Oct 2008 09:52:16 +0200
Subject: [Buildroot] Atmel file system skeleton missing /sys directory
In-Reply-To: <COL0-DAV4103F240DBC50EEFAE20318D2D0@phx.gbl>
References: <COL0-DAV4103F240DBC50EEFAE20318D2D0@phx.gbl>
Message-ID: <e4c675870810180052g314a2641oe501318f3a343f62@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/18 John Schimandle <john_schimandle@hotmail.com>:
> I'm still working through my issues with programming on the at91sam9263ek
> board and discovered a bug in the Atmel root file system skeleton directory.
> The  root file system was missing the /sys directory and that caused sysfs
> to not mount at boot time. I manually added the sys directory to
> target/device/Atmel/root/target_skeleton. removed the
> target_build_arm/at91sam9263ek/.root file, rebuilt buildroot and that fixed
> the problem.
>
> I would like to propogate the patch into the buildroot system but I don't
> know the appropriate place to fix the problem.
>
> Any help would be appreciated. Just trying to fix things so other people
> don't run into the same problem.
>

 Playing with the i386 target I see /proc /sys and sometime /usr/lib
are missing. The last one in particular when no any package 'mkdir' it
the main 'make' fails in running a 'find' in that not existent
directory.

 Thanks,
-- 
/roberto
