From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:44:43 +0200
Subject: [Buildroot] [PATCH 1/1] screen: fix rare build failure on T_N
 undeclared
In-Reply-To: <20180905172644.1871-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 5 Sep 2018 19:26:44 +0200")
References: <20180905172644.1871-1-fontaine.fabrice@gmail.com>
Message-ID: <87wor57pvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/arm-none-linux-gnueabi-gcc -c -I. -I.  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DETCSCREENRC='"/usr/etc/screenrc"' -DSCREENENCODINGS='"/usr/share/screen/utf8encodings"' -DHAVE_CONFIG_H -DGIT_REV=\"\" \
 >      -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_GNU_SOURCE list_display.c
 > In file included from screen.h:150:0,
 >                  from list_display.c:36:
 > display.h:154:19: error: 'T_N' undeclared here (not in a function)
 >    union tcu d_tcs[T_N];  /* terminal capabilities */

 > Macro T_N is defined in header file term.h but it may not be created
 > then fails. Backport patch to make sure term.h is created before compile
 > other source codes.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a62bea1fd32246526d59f029df3dca60f1cd710f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
