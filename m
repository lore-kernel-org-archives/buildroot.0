From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 20:27:54 +0100
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <201012060156.53523.vapier@gentoo.org>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<20101205115745.0e86c054@surf> <20101205131952.50400c59@surf>
	<201012060156.53523.vapier@gentoo.org>
Message-ID: <20101206202754.57658344@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 6 Dec 2010 01:56:52 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> On Sunday, December 05, 2010 07:19:52 Thomas Petazzoni wrote:
> > Yet another question regarding non-MMU support and support for
> > static builds in Buildroot. Obviously, not all packages support
> > non-MMU architectures and/or static build, so it'd be good to not
> > allow the users to select those packages. So the packages known to
> > work for non-MMU and/or static build should be clearly identified.
> 
> you can do shared libs under nommu systems.  binding the two makes no
> sense.

I know you can do shared libs with no-MMU systems, I've already used
FDPIC on Blackfin, thanks.

I didn't mean those two things to be bound together. But it's well
known that :

 * Some packages do not support static build

 * Some packages do not support no-MMU

Those two sets of packages are not identical, that's why I proposed two
different options. A package that doesn't support static build should
do:

	depends on !BR2_PREFER_STATIC_LIB

and all packages that do not work on !MMU should do

	depends on BR2_USE_MMU

My intention is that users can't mistakenly select packages that do not
build statically and/or do not work on !MMU systems.

Is this more clear ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/fd256e41/attachment.pgp>
