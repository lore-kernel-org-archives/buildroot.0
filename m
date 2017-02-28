From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 10:03:46 +0100
Subject: [Buildroot] [PATCHv2] openocd: avoid documentation rebuild to
 fix build issues
In-Reply-To: <20170228002625.GC2535@tungsten.ozlabs.ibm.com>
References: <1488147736-9778-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170228002625.GC2535@tungsten.ozlabs.ibm.com>
Message-ID: <20170228100346.5c550404@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 11:26:25 +1100, Sam Bobroff wrote:

> i.e. This causes a doc rebuild on my system (with freshly unpacked
> source):
> touch configure && ./configure && env TZ="US/Eastern" make -C doc
> 
> But this doesn't:
> touch configure && ./configure && env TZ="Australia/Sydney" make -C doc
> 
> (So it's actually a bug in their build system, maybe they'd fix it
> upstream? ;-))

I'm not sure it's really a bug.

The version.texi file contains a date, which will be 17 May 2015 or 18
May 2015 depending on your time zone.

In one case, the version.texi file generated will be the same as the
one in the tarball, and in this case, it is careful not to change the
timestamp. In other case, the version.texi file really has changed, and
therefore its timestamp is updated, causing the rebuild.

That's my explanation of the issue. Of course, there's always the
possibility that I did not fully understand the origin of the issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
