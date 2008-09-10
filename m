From: sddnd <sddndw@gmail.com>
Date: Wed, 10 Sep 2008 11:22:50 +0800
Subject: [Buildroot] autoreconf problem
Message-ID: <161618df0809092022u53bfaaf2y2609a40c0ab8dfc1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear devs:

I use buildroot on my Gentoo Linux box to develop my project.
Previously it worked like a charm, until I upgraded my gentoo system.

Now the gentoo use autoconf-2.62, it breaks the AUTORECONF stuffs in
buildroot.
Many packages which need AUTORECONF complain about version mismatches.

I found that alrought buildroot has host-automake, host-autoconf, host-m4
... etc built,
but they are not used.
All these still invoke the _really_ host ones.

Currently I don't have any better idea to solve this.
I just downgraded the autoconf to 2.61 on my gentoo box.

I think the host-* way is good, we can trap all these (buildroot's
autoconf-2.61 ...)
in our buildroot environment.
But I don't know how to feed all the necessities to our autoreconf.
Use env variables to set AUTOCONF, AUTOHEADER, AUTOMAKE, ACLOCAL, AUTOPOINT
.... ?

Any idea ? Or any one has the similar problems?

Thanks.

Regards.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080910/9c549c65/attachment.htm 
