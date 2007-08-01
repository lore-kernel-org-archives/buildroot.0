From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Wed, 01 Aug 2007 07:59:56 +0200
Subject: [Buildroot] staging_dir/usr/lib vs staging_dir/lib
In-Reply-To: <07c301c7d3a1$ebb2fdc0$2600a8c0@engineering5>
References: <07c301c7d3a1$ebb2fdc0$2600a8c0@engineering5>
Message-ID: <1185947996.20419.8.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2007-07-31 at 13:38 -0500, Christopher Reder wrote:
> It seems like there may be some confusion over what directories to use
> when installing/hosting/storing libs.

Probably my bad (-:

> I just pulled down the latest and enabled fbv which selected libungif.
> In doing so, it fails when it tries to remove libs from
> staging_dir/lib because the libs are actually in
> staging_dir/usr/lib.  

Weird, because staging_dir/usr is a symlink to staging_dir/.

> Where should those libs be?  Are they being installed in the wrong
> directory or are they trying to remove them from the wrong directory?

Normal libs should (IMHO) be in /usr/lib.

> Can someone clarify this?  Same thing happened when trying to build
> libpng as well when it was trying to cp libs over and it was copying
> from a directory where they were not installed.

I will have a look at libungif, libpng and fbv to see if anything is
wrong. IIRC fbv was my first try at adding a package to buildroot, it
could have used some reviewing.

-- 
With kind regards,
Hans-Christian Egtvedt
