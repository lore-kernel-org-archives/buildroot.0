From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 2 Aug 2007 10:50:52 +0200
Subject: [Buildroot] Avoiding patching kernel with uneeded things
In-Reply-To: <1185998620.10521.18.camel@elrond.sweden.atmel.com>
References: <1185998620.10521.18.camel@elrond.sweden.atmel.com>
Message-ID: <20070802085051.GK11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 01, 2007 at 10:03:40PM +0200, Ulf Samuelsson wrote:
>Today we first patch the headers with
>	"linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}"
>and then with the openswan patches, if openswan is selected.
>
>
>If we added a line to patch an architecture specific patch,
>I.E:
>	"linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}"
>	"$(ARCH)-linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}"
>	openswan
>then the AVR32 patches would only be applied, if the BR2_avr32 is set.
>
>
>The AVR32 patches would have to be renamed of course.
>
>Any disagreement?

Just put your atmel patches into target/ATMEL/kernel-patches so they
don't interfere with other arches.
