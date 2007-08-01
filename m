From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 01 Aug 2007 22:03:40 +0200
Subject: [Buildroot] Avoiding patching kernel with uneeded things
Message-ID: <1185998620.10521.18.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Today we first patch the headers with
	"linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}"
and then with the openswan patches, if openswan is selected.


If we added a line to patch an architecture specific patch,
I.E:
	"linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}"
	"$(ARCH)-linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}"
	openswan
then the AVR32 patches would only be applied, if the BR2_avr32 is set.


The AVR32 patches would have to be renamed of course.

Any disagreement?

Best Regards
Ulf Samuelsson
