From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Nov 2013 13:26:50 +0100
Subject: [Buildroot] running gtk programs fail
In-Reply-To: <527CB831.7060806@rosho.de> (Frank Bergmann's message of "Fri, 08
 Nov 2013 11:08:49 +0100")
References: <52330AFB.1050204@rosho.de> <527CB831.7060806@rosho.de>
Message-ID: <877gcjf59x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Bergmann <bergmann@rosho.de> writes:

Hi,

 > I did a step down and wrote a small glib program (in attachment). But
 > it does not work in buildroot-2013.08.1 ! The glib main loop seems to
 > get no events from timer nor from input source. On my host system the
 > program works with no issues.

If you're using uClibc, then it might be because of the eventfd bug. You
could try adding
uclibc-0013-eventfd-Implement-eventfd2-and-fix-eventfd.patch and rebuild:

http://git.buildroot.net/buildroot/commit/?id=055f1c02d35068d0b0

-- 
Bye, Peter Korsgaard
