From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 06:32:20 -0500
Subject: [Buildroot] [PATCH] add some simple "config & build" board
	shortcuts
In-Reply-To: <20101118115910.5261e8af@surf>
References: <1290075996-31465-1-git-send-email-vapier@gentoo.org>
	<20101118115910.5261e8af@surf>
Message-ID: <201011180632.21272.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, November 18, 2010 05:59:10 Thomas Petazzoni wrote:
> On Thu, 18 Nov 2010 05:26:36 -0500 Mike Frysinger wrote:
> > I like to be able to do `make foo` and have buildroot build up an image
> > for the board named "foo".  This saves me from having to do a full clean,
> > config, and make cycle.  Yes, I am that lazy :P.
> 
> I'd prefer not to have this in Buildroot. The general direction we are
> taking (from my point of view) is to try to *reduce* the number of make
> targets and the number of ways to use Buildroot, in order to make it
> easier/simpler to understand for users.

i dont think this has any real impact on "usability" for new users.  buildroot 
shouldnt really be forcing people into strict usage patterns to cater to new 
users while screwing power users.  the existing distro for Blackfin processors 
has similar targets and gets used quite a bit.

> So just like we removed options whose sole purpose was to rename final
> target images, I think we should not add new make targets that should
> instead simply be a shell invocation "make clean && make
> foobar_defconfig && make". In addition to this, I am not sure your
> implementation correctly passes down the O= argument for out-of-tree
> builds.

i dont see any reason why it wouldnt work.  it's using $(MAKE) after all, not 
`make`, to process the sub-targets, and that, by design, preserves the 
original make setup.  and if this were true, i dont see how any of the current 
$(MAKE) usage in the top level Makefile wouldnt also be broken.

also, please maintain proper CC when replying.  not everyone gets e-mail from 
the buildroot list.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101118/d8d247c0/attachment.pgp>
