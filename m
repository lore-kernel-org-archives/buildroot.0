From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Nov 2010 11:59:10 +0100
Subject: [Buildroot] [PATCH] add some simple "config & build" board
 shortcuts
In-Reply-To: <1290075996-31465-1-git-send-email-vapier@gentoo.org>
References: <1290075996-31465-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101118115910.5261e8af@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Nov 2010 05:26:36 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> I like to be able to do `make foo` and have buildroot build up an image
> for the board named "foo".  This saves me from having to do a full clean,
> config, and make cycle.  Yes, I am that lazy :P.

I'd prefer not to have this in Buildroot. The general direction we are
taking (from my point of view) is to try to *reduce* the number of make
targets and the number of ways to use Buildroot, in order to make it
easier/simpler to understand for users.

So just like we removed options whose sole purpose was to rename final
target images, I think we should not add new make targets that should
instead simply be a shell invocation "make clean && make
foobar_defconfig && make". In addition to this, I am not sure your
implementation correctly passes down the O= argument for out-of-tree
builds.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
