From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 09:38:43 +0100
Subject: [Buildroot] Changing the selection of kernel in buildroot
In-Reply-To: <COL104-W7087909B192B1EAEBC0814EE9B0@phx.gbl> (T. Y. Lai's
	message of "Mon\, 16 Mar 2009 16\:21\:33 +0800")
References: <COL104-W83AF8BEBACE3D5C6708B29EE9B0@phx.gbl>
	<87ab7lrjmu.fsf@macbook.be.48ers.dk>
	<COL104-W7087909B192B1EAEBC0814EE9B0@phx.gbl>
Message-ID: <871vsxrhf0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "T" == T Y Lai <d_unno@hotmail.com> writes:

 T> Hi,

 T> I'm working on RTAI with arm which support kernel is 2.6.20.13 and
 T> gcc 3.4.6

Poor you ;)

 T> I did try out the oldest 2006 release with kernel 2.6.12 which i
 T> can find on the web It causes some kernel oops with the release,?
 T> most probably is the issue on the kernel header while building the
 T> toolchain.

 T> Is there any method which i can get my hands on 2.6.20.13 release?
 T> else I'll have to give 2009.02 release a shot or roll out my own
 T> toolchain.

I would be very surprised if the change from 2.6.20.13 -> 2.6.20.20
would make any difference, but you could always edit
toolchain/kernel-headers/Config.in to change 2.6.20.20 to 2.6.20.13 at
the bottom, and then run make oldconfig; rm -rf *build_*; make to test
it.

-- 
Bye, Peter Korsgaard
