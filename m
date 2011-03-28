From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 28 Mar 2011 16:49:56 -0500
Subject: [Buildroot] prefer static libraries question
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AC7E@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Understanding that "prefer static libraries" is "highly experimental at
the moment", should this export some default LDFLAGS=-static?  I
attempted this with a very minimal set of tools (kexec, ssh, and
busybox) and I found that busybox _does_ build statically, however, ssh
and kexec don't.  Furthermore, openssl gets installed to the target
(which is expected since ssh is built dynamically).  Preferring static
libs would indicate (to me) that the _whole_ system will not have any
libraries and each util would be linked statically.

Based upon the "at the moment" clause in the help:  is this an effort
that is currently underway?  If yes, who is doing it and would you like
help?  If no, since I have to do it anyway, should I start with the
tools that I'm using and should I key off of the BR2_PREFER_STATIC_LIB
for kexec, ssh, and anything else I run across to set *_CONF_ENV =
LDFLAGS="-static" in the *.mk files?

Comments?

Thanks,
Andy
