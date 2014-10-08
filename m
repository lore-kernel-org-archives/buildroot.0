From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 10:48:45 +0200
Subject: [Buildroot] Review of FOSDEM 2014 meeting action points
Message-ID: <20141008104845.495ad683@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In preparation for the upcoming developers meeting on Saturday/Sunday,
I had a look at all the topics/action points from the FOSDEM 2014
meeting, and tried to see which ones were implemented, which ones were
not. The idea is to create some discussion around those action points,
and see if anything needs to be done about the remaining one, discussed
this week-end, etc.

 - BR2_PREFER_STATIC_LIB refactoring. The point is to clarify
   BR2_PREFER_STATIC_LIB, and separate three cases: static only,
   shared+static, shared only. Thomas P. was supposed to work on this,
   but nothing happened.

 - Hashes of download. This has been implemented by Yann, and merged,
   and more and more packages are gaining hash files.

 - SystemV/systemd init scripts. The idea was to do automatic
   installation of init scripts / service files located in
   package/<foo>/. Maxime Hadjinlian said he would work on this, but
   not much happened. On a related note, there is a need to separate
   the skeleton to not avoid Busybox-related init scripts in a pure
   systemd configuration.

 - Clarification of the meaning of Acked-by/Reviewed-by tag in the
   Buildroot manual. I think this has been done by Thomas DS. To be
   confirmed.

 - Evaluation of the patch acceptance process. The idea of a statistic
   of the list of pending patches in patchwork has not been fully
   implemented: Arnout has proposed a script, but it has never been
   converted into a cronjob to provide publicly visible statistics.

   Regarding Thomas P. taking over the commit access when Peter is
   away, this is happening more and more frequently.

 - Autouilder wishlist:

   - Run-time tests. Nothing has been done, since we had no GSoC to
     make progress on this.

   - Expand the number of autobuild machines: done, thanks to the
     autobuild-run script. Nathaniel Roach and Richard Braun are
     participating to the testing effort, and Peter has added more
     machines. We now have ~200-230 builds per day, up from ~100
     builds per day.

   - Click on a package and see the last failures of that package:
     this has been implemented.

   - Expose read-only SQL queries: not done, maybe a bit difficult
     security wise.

 - Genimages. No progress has been made on that front.

 - How to handle the uClibc problem.

   Recently, we've had less problems caused specifically by uClibc
   feature patches. And uClibc-ng has appeared, which is giving some
   hope of improvement.

 - Website and branding.

   A new http://buildroot.org has been put online, thanks to the work
   done by Maxime Hadjinlian.

 - Google Summer of Code

   One student (Hadrien Boutteville) participated. Unfortunately, it
   didn't work very well, and not many patches have been contributed.

 - Evaluation of BR2_EXTERNAL. Not sure exactly what was needed
   here. Jeremy Rosen was supposed to submit a patch, but I'm not sure
   if it happened, or even if something needs to happen.

 - State of major patch sets

   - Systemd/udev support. Has been merged.
   - Perl package infra. Has been merged.
   - SELinux. Still not merged, but not really pushed actively
     anymore.
   - libdrm/mesa3d updates. A lot of things happened in this area,
     with now a clear owner/maintainer of this package (Bernd).

 - 'target' defconfigs vs. 'development' configs. This was supposed
   to be an addition to the Buildroot manual, but it never
   happened. Not sure this is very important.

 - Python packages: depends vs .select. Conclusion: we change the
   handling of optional python bindings: instead of selecting them
   automatically when python is enabled, we add explicit config
   symbols for them. ThomasDS will update the patches accordingly.

   Not sure what happened on this topic.

 - pkgparentdir removal. Has been done.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
