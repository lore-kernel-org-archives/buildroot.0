From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 03 Jan 2009 14:43:33 +0000
Subject: [Buildroot] UCLIBC_USE_NETLINK in uclibc breaks i586?
Message-ID: <495F7995.4080601@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to track down a segfault when building a i586 buildroot.

In the uclibc 0.9.29 config UCLIBC_USE_NETLINK is disabled and works 100%.

In the uclibc 0.9.30 config UCLIBC_USE_NETLINK is enabled. I've just
built for i586 and can confirm that enabling this option causes
segfaults in ifconfig and dropbear just after the netlink recvmsg
function calls.


Can anyone point me into a direction to resolve this?

-N
