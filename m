From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:16:42 +0100
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <201101231607.30938.vapier@gentoo.org>
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<1295493032-4705-1-git-send-email-vapier@gentoo.org>
	<877hdvapq0.fsf@macbook.be.48ers.dk>
	<201101231607.30938.vapier@gentoo.org>
Message-ID: <20110124171642.6cff75a4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jan 2011 16:07:30 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> hmm, well Thomas' suggestion before doesnt work ... the current autotools 
> Makefile only adds $(PKG)_MAKE_OPT to the build step instead of all the steps.  
> so ignore this patch until that can be fixed.

For the moment:

 $(PKG)_MAKE_OPT is passed at build time for target and host packages
 (maybe we should rename it $(PKG)_BUILD_MAKE_OPT, or pass it during all
 steps)

 $(PKG)_INSTALL_STAGING_OPT is passed at staging installation time for
 target packages

 $(PKG)_INSTALL_TARGET_OPT is passed at target installation time for
 target packages

So in your case you probably need to do something like:

LIBPCAP_INSTALL_STAGING_OPT = DYEXT=none DESTDIR="$(STAGING_DIR)" install
LIBPCAP_INSTALL_TARGET_OPT  = DYEXT=none DESTDIR="$(TARGET_DIR)" install

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110124/4e46cae6/attachment.asc>
