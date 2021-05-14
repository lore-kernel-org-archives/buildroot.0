From: David Laight <david.laight@aculab.com>
Date: Fri, 14 May 2021 04:11:02 -0500 (CDT)
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG ignored
Message-ID: <1620983462705-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AFAICT the filename passed in BR2_PACKAGE_BUSYBOX_CONFIG is ignored and the
.config file in output/build/busybox-1.33.0 is always read and then
rewritten.

There is a lot of makefile 'goop' to read through, so I'm not sure how it is
expected to get passed through.
A quick look at the busybox config sources seemed to imply that NULL was
passed in as the old config file name - so it always looked for a default
(.config or /dev/null).




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
