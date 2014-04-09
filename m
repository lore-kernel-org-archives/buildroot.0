From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 9 Apr 2014 14:38:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-08
In-Reply-To: <20140409063009.2F8111012A3@stock.ovh.net>
References: <20140409063009.2F8111012A3@stock.ovh.net>
Message-ID: <20140409123841.GA29448@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Wed, Apr 09, 2014 at 08:30:09AM +0200, Thomas Petazzoni wrote:

>     x86_64 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e079219d70830a123977c3ee09d3c11b863d0691/

This failure is due to cairo being compiled with OpenGLES v2 support, but
surprisingly, mesa3d installs the header file khrplatform.h only if it is
compiled with EGL support, which is not the case here...

One would notice that this leads to some GNU/Linux distributions (like Debian)
having the development package libgles1-mesa-dev depends on...
libegl1-mesa-dev!

I'll provide a patch for mesa3d to unconditionally install this header and
report the issue upstream.

Best regards,
ELB
