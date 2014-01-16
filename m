From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Jan 2014 23:37:11 +0100
Subject: [Buildroot] [PATCH] weston: fix fbdev backend.
In-Reply-To: <1389888141-3030-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Thu, 16 Jan 2014 17:02:21 +0100")
References: <1389888141-3030-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87ha93pn8o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > The compilation of the program weston-launcher is currently disabled, so
 > the only way to launch Weston (on framebuffer) is to execute (as root):

 >   $ openvt -c 2 -s -- weston \
 >   	--backend=/usr/lib/weston/fbdev-backend.so \
 > 	--tty=2 \
 > 	--log=/tmp/weston.log

 > Unfortunately you will only end up with a black screen. The reason is
 > given in the log file:

 >   /dev/tty2 is already in graphics mode, is another display server running?

 > Here is the fix from upcoming version 1.4.

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
