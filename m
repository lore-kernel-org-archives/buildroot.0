From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 12:32:15 +0100
Subject: [Buildroot] Build time increase in 2018.02
In-Reply-To: <1520644453.25567.398.camel@impinj.com> (Trent Piepho's message
 of "Sat, 10 Mar 2018 01:14:13 +0000")
References: <1520644453.25567.398.camel@impinj.com>
Message-ID: <87k1ukcgjk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

Hi,

 > We've seen a big increase in build time with the latest buildroot.  On
 > a vpshere instance, times have gone up from 45 minutes to 180+ minutes.

Wow! What version did you use before upgrading to 2018.02 (the 45min)?

 > Here's a breakdown of build time by task for a build that takes 26.5
 > minutes.  ccache is in use and is quite effectively decreasing the
 > compile time.  I've split out all the instrumentation steps so they can
 > be accounted separately from the rest of host-install, etc.  In this
 > list, host-install only includes the time spent executing the install
 > commands, not instrumentation or pre/post-hooks.

 > step_pkg_size        831.17
 > configure            441.77
 > build                149.56
 > extract               40.28
 > host-install          31.96
 > all other             27.78
 > check_host_rpath      20.86
 > check_bin_arch        20.77
 > target-install        19.84
 > stage-install         13.25

 > Finding the package sizes takes more time than everything else put
 > together.  And indeed, if I remove that step, check_bin_arch, and fake
 > out check-uniq-files, the build drops from 26.5 minutes to 12 minutes!

Argh, that's pretty horrible :/ I have noticed some overhead from the
various instrumentation steps, but nothing as significant as this.

Out of interest, what kind of storage are you building this on? SSD or
spinning disk?

 > On the vsphere instance, the time is much much worse.  I'm still
 > waiting for numbers.  It takes hours.  I think the lousy vm filesystem
 > performance magnifies the problem.

Yes, I/O performance is absolutely critical for stuff like Buildroot.

-- 
Bye, Peter Korsgaard
