From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Dec 2011 15:17:34 +0000 (UTC)
Subject: [Buildroot] [Bug 4484] libstdc++ has _GLIBCXX_HAVE_FENV_H undefined
 but uclibc appears to have a fenv.h
In-Reply-To: <bug-4484-163@https.bugs.busybox.net/>
References: <bug-4484-163@https.bugs.busybox.net/>
Message-ID: <20111208151734.E71E48F8C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4484

--- Comment #6 from Jacek Ko?odziejski <jacek.kolo@gmail.com> 2011-12-08 15:17:34 UTC ---
(In reply to comment #5)
> (In reply to comment #4)
> > Submitted my configuration file and full error log.
> > 
> > Solution for compiling without this error:
> > after getting the error
> > make uclibc-menuconfig
> > switch UCLIBC_HAS_FENV to [=y]
> > 
> > PS. bug reporting for the first time - please excuse any inconveniences
> 
> From the .config I see:
> 
> grep ^BR2_UCLIBC .config
> BR2_UCLIBC_VERSION_0_9_32=y
> BR2_UCLIBC_VERSION_STRING="0.9.32"
> BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
> 
> So you try to build uClibc 0.9.32 with a 0.9.31 defconfig. That is not going to
> work. Please change it to uClibc-0.9.32.config and try again.

Hi,
I changed the .config to use "toolchain/uClibc/uClibc-0.9.32.config" (I only
touched this thing), did make clean, and git pull.The compilation ends in the
same place with the same effect (small unrelated differences - I can submit if
you want). 

I looked at the two defconfigs - both have # UCLIBC_HAS_FENV is not set. 
I also noticed this patch:
toolchain/uClibc/uClibc-0.9.32-honor-UCLIBC_HAS_FENV-for-e500.patch, but sadly
I don't understand if it has anything in common.

Regards, Jacek

grep ^BR2_UCLIBC .config
BR2_UCLIBC_VERSION_0_9_32=y
BR2_UCLIBC_VERSION_STRING="0.9.32"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.32.config"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
