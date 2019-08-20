From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Aug 2019 15:11:06 +0200
Subject: [Buildroot] New search features on autobuild.buildroot.org
Message-ID: <20190820151106.4a1ffacf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As part of his internship at Bootlin working on Buildroot, Victor
Huesca (in Cc) has implemented improvements to autobuild.buildroot.org,
with new search capabilities. These allow more powerful filtering of
autobuild results, which is sometimes useful to understand in which
situations a build failure occurs or does not occur.

You all probably knew that you could already add GET parameters to
filter out build results. For example:

  http://autobuild.buildroot.org/?arch=arm&reason=strace%

Would give you all the build results happening on the ARM architecture,
where the failure reason starts with "strace". This of course could be
expanded with more criteria:

  http://autobuild.buildroot.org/?arch=arm&reason=strace%&libc=uclibc&static=1

To further filter only the results with the uClibc C library, and
static linking configurations.

Victor has added support for two new filters:

 - The first one, "symbols" is by far the most important and powerful
   one, as it allows to filter build results using the values of
   Config.in options in the configuration that was built.

   http://autobuild.buildroot.org/?symbols[BR2_PACKAGE_STRACE]=y&symbols[BR2_PACKAGE_BUSYBOX]=

   will list all build results that had BR2_PACKAGE_STRACE enabled, but
   BR2_PACKAGE_BUSYBOX disabled.

   Note that the queries involving "symbols" will be slower than other
   queries, so please give some time for the server to reply. It
   typically takes 10-20 seconds.

 - The second one "date", allows to filter the build results by date.
   You can use date=FROMDATE or date[from]=FROMDATE&date[to]=TODATE.

Since all of these arguments were a bit difficult to remember, Victor
also created a "search page" at:

  http://autobuild.buildroot.net/search.php

You fill in the criteria, and it will redirect you to the right
address, which you can share with others if needed.

Kudos to Victor for completing this!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
