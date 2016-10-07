From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 7 Oct 2016 18:54:52 +0200
Subject: [Buildroot] [PATCH] libmicrohttpd: update to 0.9.51
In-Reply-To: <20161007160432.635dc932@free-electrons.com>
References: <20161001100102.GA26989@waldemar-brodkorb.de>
 <20161007160432.635dc932@free-electrons.com>
Message-ID: <20161007165452.GL2052@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sat, 1 Oct 2016 12:01:02 +0200, Waldemar Brodkorb wrote:
> > Bfin workaround is not required if the gcc bfin patch is applied.
> > (gcc: enable _REENTRANT for bfin when -lpthread is used)
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> I initially applied this patch, but immediately reverted it after I
> realized it was breaking a valid situation: you're breaking the build
> with the Blackfin external toolchains.

Okay. I always forget about the external toolchains.

Are there any plans to remove this very old toolchain?
One of my motivation of getting internal bfin toolchain in a good
shape was the possibility to remove the old toolchain to get rid
of many package failures regarding the very old uClibc.
 
> In addition to this, this patch is mixing a version bump, with removing
> some work-arounds, which are unrelated to the version bump.

The removal of the workround worked only in the latest version for
me. 
 
> So I've marked this patch as Rejected in patchwork. Please resend a
> patch that does just the version bump, and leaves the work-around in
> place.

Okay. But I think version bumps are made mostly from other
developers, I just needed it to remove the workaround.
Sorry I should have mentioned that in the commit log.

best regards
 Waldemar
