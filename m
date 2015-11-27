From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 19:48:59 +0100
Subject: [Buildroot] [PATCH] package/gstreamer1: add symlink to
	gstconfig.h in legacy location
In-Reply-To: <1448632736-9476-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 27 Nov 2015 14:58:56 +0100")
References: <1448632736-9476-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d1uvqnvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > After version 1.4 (the previous one packaged in Buildroot), gstreamer
 > has changed the location where it installs its gstconfig.h, because it
 > is architecture-dependent, see upstream commit:
 >     http://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=444ceb068424122ceba46d8cc48a53b8b32c3cf5

 > However, this causes build failures in some pcakges (at least FreeRDP
 > is known to break) because either they do not use pkg-config (bad!) or,
 > like FreeRDP, have a broken buildsystem and have not yet fixed their
 > build failures [0].

 > In Buildroot, we do not really care about architecture-dependent
 > locatios, because we only build for one architecture. So, the legacy
 > location of that header is not problematic to us.

 > Create a symbolic link to gstconfig.h in its legacy location.

 > Fixes numerous FreeRDP build failures:
 >     http://autobuild.buildroot.org/results/438/4384ab572bdcb1d148bcdae5a67d8b0bf26d3049
 >     http://autobuild.buildroot.org/results/b00/b0060f16c7464c240bc7d3b0ff17c9cb311fe30d
 >     http://autobuild.buildroot.org/results/cad/cadb2fb90ce66b1fa3051a6fcfb7c8142f420c31
 >     ...

 > [0] FreeRDP does have a commit supposedly fixing the build with "newer"
 > gstreamer versions:
 >     https://github.com/FreeRDP/FreeRDP/commit/bea27fd919b64ee8d97996409e279e1e83d13594

 > but it makes the whole build completely fail, as it does not even
 > detect gstreamer anymore. Sigh... :-(

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
