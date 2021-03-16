From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 20:46:17 +0100
Subject: [Buildroot] Improved CVE reporting
Message-ID: <20210316204617.6e0b0b2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Last week-end, I worked on improving a bit the CVE information
reporting. Until now, the reporting was done only based on the master
branch. However, we definitely want to also watch out for CVEs that
affect our current LTS branch.

So:

 * The pkg-stats script is now executed on a daily basis on all active
   branches, with active branches being defined by
   http://autobuild.buildroot.net/branches, which is also used by the
   autobuilders to know which branches to test. The results of these
   pkg-stats runs are available at
   http://autobuild.buildroot.net/stats/.

   You'll note that even though 2020.02.x is an active branch, there
   are no results for it. Indeed, the pkg-stats machinery in this
   branch is broken, and 2020.02.x is anyway soon going to go out of
   maintenance.

 * The weekly e-mail sent to the mailing list and to individual
   developers with CVE information about packages now contains details
   about all branches. See
   http://lists.busybox.net/pipermail/buildroot/2021-March/305859.html
   for an example.

Hopefully this will be useful to the overall Buildroot community to
ensure that we have all the security fixes needed in our packages. As
you can see from the above report, there is quite a bit of work to be
done. Of course, some of the issues may also be in correct
classification by the NVD database, in which case our goal is to
contribute to this database to get the data fixed.

Let me know if this is useful, and/or if you see additional possible
improvements.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
