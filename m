From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 16:37:30 +0200
Subject: [Buildroot] More Python 3.7.0 issues: paramiko, crossbar, pysnmp,
 twisted, django
Message-ID: <20180912163730.764068b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The bump of Python to 3.7.0 continue to cause a number of issues in the
autobuilders. Since they happen in the final stage of the build, during
the byte compilation, they appear as "target-finalize" in the
autobuilder failure reason.

A couple of examples:

 - paramiko is using "async", which is now reserved

   http://autobuild.buildroot.net/results/a6f/a6f37932fb4e4b1e9a68aed3b553dab0aeba2b73/build-end.log

 - crossbar is using "async", which is now reserved

   http://autobuild.buildroot.net/results/559/5597b8a7e31472a4a568a151eb9ba703137f3544/build-end.log

 - pysnmp is using "async", which is now reserved

   http://autobuild.buildroot.net/results/e8a/e8a04e070ca35dc0ae259e07d0f00b9e3c8cd2f9/build-end.log

 - twisted is using "async"

   http://autobuild.buildroot.net/results/6df/6df20369fe8925020c9a266db59563857641b1d5/build-end.log

 - django has another issue ("Generator expression must be
   parenthesized")

   http://autobuild.buildroot.net/results/7d8/7d8ac242c48f367069570aa68b3a97f7dbd394f4/build-end.log

Could you have a look at those issues, and send corresponding patches ?
Ideally, bumping those packages to newer versions that have been fixed
to work with Python 3.7.0 would be the best.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
