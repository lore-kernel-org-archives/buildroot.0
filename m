From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 20:52:10 +0100
Subject: [Buildroot] Error building libX11 on Buildroot 0.90.2 stable
In-Reply-To: <41370a610903261143r9ec110cu2edeaa3c6136cafd@mail.gmail.com> (Ed
	Stafford's message of "Thu\, 26 Mar 2009 13\:43\:48 -0500")
References: <41370a610903261143r9ec110cu2edeaa3c6136cafd@mail.gmail.com>
Message-ID: <874oxggiz9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ed" == Ed Stafford <ed.stafford@gmail.com> writes:

Hi,

 Ed> checking keysymdef.h... configure: error: Cannot find keysymdef.h
 Ed> make: *** [/home/ed/src/buildroot-2009.02/build_i386/xlib_libX11-1.1.3/.stamp_configured]

Taking a look at config.log shows the reason:

configure:23596: checking keysymdef.h
configure:23601: result: /usr/include/X11/keysymdef.h

So it searches for and finds the host header. I'll look into fixing
this, but in the mean time you can install it on your host (something
like x11proto-core-dev) to continue.

These things unfortunately sometimes happen. I have had
'setup-buildbot-with-builders-on-minimal-systems' on my todo list for
a while, and once that's running it should be easy to detect this kind
of errors.

-- 
Bye, Peter Korsgaard
