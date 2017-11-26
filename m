From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:12:08 +0100
Subject: [Buildroot] [PATCH] openssh: fix getpagesize() related static
 linking issue
In-Reply-To: <20171030224555.3220-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 30 Oct 2017 23:45:55 +0100")
References: <20171030224555.3220-1-peter@korsgaard.com>
Message-ID: <87d145jtef.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/8cc/8cc30818a400c7a392a3de787cabc9cd8425495f/

 > The configure script checks for getpagesize() and sets HAVE_GETPAGESIZE in
 > config.h, but bsd-getpagesize.c forgot to include includes.h (which
 > indirectly includes config.h) so the checks always fails, causing linker
 > issues when linking statically on systems with getpagesize().

 > Fix it by including includes.h.

 > Patch submitted upstream:
 > https://lists.mindrot.org/pipermail/openssh-unix-dev/2017-October/036413.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
