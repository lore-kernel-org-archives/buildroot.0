From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 2 Aug 2007 01:01:59 +0200
Subject: [Buildroot] libtool
Message-ID: <008601c7d48f$fc262a80$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A lot of the packages output an information message, requesting that
$ libtool --finish /usr/lib
should be run to finish the installation of the package.

"PATH=\"\$PATH:/sbin\" ldconfig -n $libdir"


Inside the libtool script, there is a call to ldconfig 
which will by default write its result to files in the host /etc directory.

You can supply parameters to ldconfig telling it to store
the result in another directory (I.E:   $(TARGET_DIR)/usr/bin)
but I do not see that happening.

Is 
$ libtool --finish /usr/lib
really neccessary?

If so, it seems broken...

Best Regards
Ulf Samuelsson
