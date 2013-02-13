From: Dimitrios Siganos <dimitris@siganos.org>
Date: Wed, 13 Feb 2013 17:22:54 +0000
Subject: [Buildroot] uboot-tools and uboot being separate
Message-ID: <511BCBEE.5040704@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I have a query regarding uboot and uboot-tools. Currently they are
separate packages.

However, if I am building both the uboot bootloader and the uboot tools
would it not be reasonable to expect to use the same sources for
compiling both? At the moment, I am in a situation where I am building
uboot with one set of files and uboot-tools (e.g. fw_printenv) with another.

Is the recommended solution to point both uboot and uboot-tools to the
same package version and apply the same patches to both? And have two
parallel builds (uboot, uboot-tools) that should be identical?

I have also being thinking along these lines:

1) Edit the uboot-tools makefile to not use its own build directory but
use uboot's build instead (silly idea idea I admit, but you never know...).

2) Edit the uboot package to optionally compile and install the
uboot-tools as well (this seems to me to be the most logical way).

Can I have your feedback?

Regards,
Dimitris
