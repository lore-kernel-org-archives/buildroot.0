From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Nov 2011 19:26:21 +0000 (UTC)
Subject: [Buildroot] [Bug 4484] libstdc++ has _GLIBCXX_HAVE_FENV_H undefined
 but uclibc appears to have a fenv.h
In-Reply-To: <bug-4484-163@https.bugs.busybox.net/>
References: <bug-4484-163@https.bugs.busybox.net/>
Message-ID: <20111129192621.97E1B8F6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4484

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> 2011-11-29 19:26:20 UTC ---
(In reply to comment #4)
> Submitted my configuration file and full error log.
> 
> Solution for compiling without this error:
> after getting the error
> make uclibc-menuconfig
> switch UCLIBC_HAS_FENV to [=y]
> 
> PS. bug reporting for the first time - please excuse any inconveniences

From the .config I see:

grep ^BR2_UCLIBC .config
BR2_UCLIBC_VERSION_0_9_32=y
BR2_UCLIBC_VERSION_STRING="0.9.32"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"

So you try to build uClibc 0.9.32 with a 0.9.31 defconfig. That is not going to
work. Please change it to uClibc-0.9.32.config and try again.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
