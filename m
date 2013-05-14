From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 11:41:31 +0200
Subject: [Buildroot] legal-info too permissive?
Message-ID: <20130514114131.0b73cee0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

Looking at
http://autobuild.buildroot.org/results/183/183d0af8c692b8c90b5b136999a0661fc7893b3a/build-end.log,
one can see:

cat: /home/test/test/2/output/build/neon-0.29.6/src/COPYING: No such file or directory

so it seems like the neon legal informations are not correct (or no
longer correct). This should be fixed of course, but the thing that
surprises me here is that the 'make legal-info' apparently didn't
return with an error. So the overall build was considered successful,
even though some license information is obviously wrong in this neon
package.

In this intentional? Shouldn't 'make legal-info' be more restrictive,
and bail out with an error if some license file cannot be found in the
source code? At least the latter would be the most useful behavior for
the autobuilders.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
