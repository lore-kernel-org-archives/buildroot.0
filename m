From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 May 2018 21:10:56 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/protobuf: bump to version
 3.5.1
In-Reply-To: <AD5C86F9-A62E-4AC7-94C1-D7AC33C6D672@storagecraft.com>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
 <20180521175310.18563-2-charles.hardin@storagecraft.com>
 <20180522121101.07546890@windsurf>
 <AD5C86F9-A62E-4AC7-94C1-D7AC33C6D672@storagecraft.com>
Message-ID: <20180522211056.359dcfa9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Would it be possible to teach your e-mail client to quote properly in
the plain text version of the e-mail ? And ideally to not send HTML
e-mails ?

On Tue, 22 May 2018 17:18:15 +0000, Charles Hardin wrote:

> The docs say to rebase against origin/master before submitting a patch not
> origin/next. So, it is unclear if we are suppose to submit a patch series that
> compiles as a set or a patch series that relies on something already in next.
> 
> I erred on a duplicated patch at the beginning to try and make sure it was
> understood this patch series requires the bump - else, it won?t compile.
> 
> If there is a better a way to do this, then it wasn?t clear from contributing guide.
> 
> https://buildroot.org/downloads/manual/manual.html#submitting-patches

As often, documentation is a hint, not always an absolute truth.

In the general case patches should be based on the master branch,
indeed.

However, between the publication of rc1 and the final version of a
given release, the master branch is only used for bug fixes, security
fixes and build fixes. We do not merge version bumps and new packages
in master during this period of time, which is used to stabilize the
master branch.

However, since we don't want to completely stop merging patches adding
new packages and updating existing packages, we open a separate "next"
branch during this period of time. So, if your contribution is
submitted during this period of time, and provides new packages,
package updates or anything that doesn't qualify as a "fix", it should
be based on the next branch.

The calendar for the year is as follows:

 - January: everything goes in master

 - February:

   * Beginning of the month: YYYY.02-rc1 is released

   * Only fixes go in master, everything else goes in next

   * End of the month: YYYY.02 is released, with the contents of the
     master branch

 - March:

   * The YYYY.05 development cycle opens. Everything in next is merged
     back into master.

   * All patches contributed are merged in master.

 - April: everything goes in master.

 - May:

   * Beginning of the month: YYYY.05-rc1 is released

   * Only fixes go in master, everything else goes in next

   * End of the month: YYYY.05 is released, with the contents of the
     master branch

 - June:

   * The YYYY.08 development cycle opens. Everything in next is merged
     back into master.

   * All patches contributed are merged in master.

 - July: everything goes in master

 - August:

   * Beginning of the month: YYYY.08-rc1 is released

   * Only fixes go in master, everything else goes in next

   * End of the month: YYYY.08 is released, with the contents of the
     master branch

 - September:

   * The YYYY.11 development cycle opens. Everything in next is merged
     back into master.

   * All patches contributed are merged in master.

 - October: everything goes in master

 - November:

   * Beginning of the month: YYYY.11-rc1 is released

   * Only fixes go in master, everything else goes in next

   * End of the month: YYYY.11 is released, with the contents of the
     master branch

 - December:

   * The (YYYY+1).02 development cycle opens. Everything in next is merged
     back into master.

   * All patches contributed are merged in master.

Does that clarify our development process ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
