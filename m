From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Nov 2012 20:13:26 +0100
Subject: [Buildroot] [PATCH] xlib_libX11: fix compilation of makekeys
In-Reply-To: <1352028606-11338-1-git-send-email-arnout@mind.be>
References: <1352028606-11338-1-git-send-email-arnout@mind.be>
Message-ID: <20121108201326.2676f417@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun,  4 Nov 2012 12:30:06 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> xlib_libX11 builds a makekeys executable for the host, but uses the
> targets X11_CFLAGS. This leads to build failures like
> http://autobuild.buildroot.net/results/411eb3aefea859a7e31986a44acd50b475f174cb/
> 
> This problem was introduced by the version bump, because then also
> the AUTORECONF was removed so the existing fix didn't work anymore.
> 
> As a slightly cleaner solution, just remove X11_CFLAGS from the
> Makefile.  We know we don't need it, because the X11 stuff is in
> $(HOST_DIR)/usr/include which is already in HOST_CFLAGS.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Hasn't this broken the xlib-x11 build? See
http://autobuild.buildroot.org/results/6a5a16f901215acca06cb7a89f7d7fb0bc1741af/build-end.log.

It is including a host header (Xos.h) which itself includes target
headers. Sounds really wrong.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
