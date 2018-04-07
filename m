From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Apr 2018 13:40:54 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: bump to 2.56.0
In-Reply-To: <20180406222253.308a2ffd@windsurf.home>
References: <20180314110224.32587-1-aduskett@gmail.com>
 <20180406222253.308a2ffd@windsurf.home>
Message-ID: <20180407134054.2ccf1bcd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Fri, 6 Apr 2018 22:22:53 +0200, Thomas Petazzoni wrote:

> On Wed, 14 Mar 2018 07:02:24 -0400, Adam Duskett wrote:
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > ---
> >  package/libglib2/libglib2.hash | 4 ++--
> >  package/libglib2/libglib2.mk   | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)  
> 
> Applied to master, thanks.

So I have to say I am not happy. At all.

Once again, you have contributed a package update without even testing
it with what is the default Buildroot situation: a uClibc toolchain.
This has turned the autobuilders all red since I pushed your commit.

You asked on IRC the other day why your libglib2 update hadn't been
applied. Now you know why: because you regularly break the build in a
way that shows that the testing has clearly been insufficient.

I don't require anyone to test all the reverse dependencies of a
package being updated, especially for a package such as libglib2 that
has gazillions of reverse dependencies. But here you didn't even test
building libglib2 itself with a regular uClibc toolchain. I'm not
talking about a weird case, on a weird CPU architecture, but I'm
talking about the very basic case of building libglib2 with uClibc.

So for me, things are clear: from now, I will no longer merge any
new package or version bump from you if it doesn't come with a
test-pkg output that shows it has been tested with the 6 "main"
configurations that we test by default in test-pkg.

In the mean time, I have fixed the libglib2 by backporting an upstream
commit:

  https://git.buildroot.org/buildroot/commit/?id=bd90def0ded4b71dbc40b78b8b4dacba32687885

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
