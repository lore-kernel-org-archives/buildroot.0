From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2010 08:44:22 +0100
Subject: [Buildroot] [git commit master] xfont_font-util: convert to the
 autotools infrastructure
In-Reply-To: <4B85ACF0.4000005@carallon.com>
References: <20100223202924.D6947776A1@busybox.osuosl.org>
	<4B844BFC.6030906@gmail.com> <87aauzei61.fsf@macbook.be.48ers.dk>
	<4B8589C4.5060206@gmail.com> <4B85ACF0.4000005@carallon.com>
Message-ID: <20100225084422.63ef8c84@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Feb 2010 22:49:20 +0000
Will Wagner <will_wagner@carallon.com> wrote:

> > Why do we need POST_INSTALL_STAGING hook when we installed only to 
> > TARGET?
> 
> I also have done a similar fix. I believe it is need in staging so
> that the pkgconfig info is correct, otherwise other things don't build

Ok. I've just sent a patch to fix this.

However, the way xfont_font-util is handled today is horrible. The
post-install script removes binaries compiled for the target from the
staging directory, and replaces them by symbolic links to binaries on
the host (making the incorrect assumption that they are available).

So, xfont_font-util needs be compiled for the host (using the new
infrastructure we have).

I haven't looked at the details, why are pkgconfig files needed for
font-utils ?

> I have also have patches to submit for X.Org 7.5, was just waiting
> for 2.10 release before submitting.

Great!

Could you cooperate with Paulius on this ? Like setting up a git tree
somewhere where you can collaborate and show us your code before
submitting it ?

Thanks !

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
