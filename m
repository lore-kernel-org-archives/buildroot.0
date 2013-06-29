From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Jun 2013 17:03:55 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: add new package
In-Reply-To: <20130628213002.GE3165@free.fr> (Yann E. MORIN's message of "Fri, 
 28 Jun 2013 23:30:02 +0200")
References: <1372452103-14337-1-git-send-email-spenser@gillilanding.com>
 <20130628213002.GE3165@free.fr>
Message-ID: <87bo6px8kk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Spenser, All,
 Yann> On 2013-06-28 15:41 -0500, Spenser Gilliland spake thusly:
 >> This is the first patch for the TI Graphics SDK in Buildroot.  Please review
 >> and try this on your own boards.

 Yann> Just a very quick review with obvious comments.

 Yann> [--SNIP--]
 >> diff --git a/package/ti-gfx/S80ti-gfx b/package/ti-gfx/S80ti-gfx
 >> new file mode 100644
 >> index 0000000..4e0b32b
 >> --- /dev/null
 >> +++ b/package/ti-gfx/S80ti-gfx
 >> @@ -0,0 +1,45 @@
 >> +#!/bin/sh
 >> +
 >> +case "$1" in 
 >> +start)
 >> +	echo "ti-gfx: starting pvr driver"
 >> +
 >> +	BITSPERPIXEL="$(fbset | grep geom | awk '{print $6}')"
 >> +	YRES="$(fbset | grep geom | awk '{print $3}')"

 Yann> Why grep+awk?
 Yann> 	BITSPERPIXEL="$(fbset |awk '$0~/geom/ {print $6}')"
 Yann> 	YRES="$(fbset |awk '$0~/geom/ {print $3}')"

Or even just awk '/geom/ { print $3 }'

-- 
Bye, Peter Korsgaard
