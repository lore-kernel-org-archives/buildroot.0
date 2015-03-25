From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 25 Mar 2015 07:49:24 +0000
Subject: [Buildroot] [PATCH] uclibc: clean-up test suite build command
In-Reply-To: <20140630200719.1339a6ed@free-electrons.com>
References: <1404149181-18586-1-git-send-email-abrodkin@synopsys.com>
 <20140630200719.1339a6ed@free-electrons.com>
Message-ID: <1427269764.2718.4.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-06-30 at 20:07 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Mon, 30 Jun 2014 21:26:21 +0400, Alexey Brodkin wrote:
> > Starting from uClibc 0.9.32 this cleaned-up command builds tests flawlessly.
> > For 0.9.31 it lead to build failure, but assuming there're close to zero
> > users who is going to test outdated uClibc library on obsolete
> > (in Buildroot) AVR32 architecture I thin it worth applying.
> > 
> > Still it's possible to have 2 variants at the same time until AVR32 is not gone:
> > 1. Old implementation used strictly for uClibc 0.9.31
> > 2. New implementation for all other versions
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Unfortunately, unless this cleaned-up version brings significant
> benefits, I believe the best option is to keep things as is until AVR32
> support is really deprecated and removed from Buildroot, so that we can
> drop support for 0.9.31.

Now when AVR32 support is finally dropped do you think this patch might
be accepted?

It still applies flawlessly on current master.

I build tested it on ARC and ARM. Note on ARM uClibc tests
(BR2_UCLIBC_INSTALL_TEST_SUITE) will be only compiled without errors
with uClibc-ng (BR2_UCLIBC_VERSION_NG), either BR2_UCLIBC_VERSION_0_9_33
or BR2_UCLIBC_VERSION_SNAPSHOT will fail on testsuite compilation but
that has nothing to do with current patch.

-Alexey
