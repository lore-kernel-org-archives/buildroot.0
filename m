From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 8 May 2008 10:58:02 +1000
Subject: [Buildroot] buildroot - python problem
In-Reply-To: <1210206686.29431.8.camel@elrond.atmel.sweden>
References: <223E6519BDCAC74695BEE9D163F8E6592218AB@oakleaf10.oakleafconsultancy.com>
	<c166aa9f0805070734h10591bf3sbdf6c6b5bc696c04@mail.gmail.com>
	<079f01c8b054$166a3620$060514ac@atmel.com>
	<20080508002716.GB5014@cloud.net.au>
	<1210206686.29431.8.camel@elrond.atmel.sweden>
Message-ID: <20080508005802.GA6115@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 08, 2008 at 02:31:26AM +0200, Ulf Samuelsson wrote:
> tor 2008-05-08 klockan 10:27 +1000 skrev Hamish Moffatt:
> > On Wed, May 07, 2008 at 05:07:18PM +0200, Ulf Samuelsson wrote:
> > > The python.mk looks pretty unclean to me.
> > > Should not the host python be built in the toolchain directory,
> > > and the result moved to STAGING_DIR?
> > > Then it could be easily be used for other stuff as well.
> > 
> > I'm using the python package here and never saw the problem reported in
> > this thread. Your suggestion of installing properly into $STAGING_DIR
> > seems reasonable though.
> > 
> > I am planning to update the package for Python 2.5 soon so I will fix
> > that up at the same time. Next week hopefully.
> > 
> > Changing versions might break some people's code, so it may be necessary
> > to support multiple versions and allow the user to choose. Do you other
> > Python users have any comments on this?
> 
> Here is a start, not tested yet...

Thanks. I think that for a host-python in $STAGING_DIR to be useful for
more than just building target-python, you need to build/install more
than just the python and pgen binaries. It needs to install the standard
library (some of which has to be compiled).

I don't think "make install" installs the host pgen (required to 
cross-compile python) though so we can't just replace the copy of the
host python/pgen binaries with "make install".

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
