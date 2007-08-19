From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 19 Aug 2007 20:56:41 +0200
Subject: [Buildroot] How to change kernel version
In-Reply-To: <d6cda7730708190756y64362d58x28fffa6d014b182c@mail.gmail.com>
References: <d6cda7730708190608i1b754e71r25dac548fd1c922@mail.gmail.com>
	<20070819152845.a2be6def.philippe.ney@tizoo.com>
	<1187535085.31921.5.camel@elrond.sweden.atmel.com>
	<d6cda7730708190756y64362d58x28fffa6d014b182c@mail.gmail.com>
Message-ID: <1187549801.31921.22.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-08-19 klockan 15:56 +0100 skrev Thiago A. Corr?a:
> Hi Ulf,
> 
>    Not yet, I'm still unable to find the right place.
>     In target/device/Atmel/Makefile.in there is a
> LINUX26_VERSION=$(LINUX_HEADERS_VERSION)  but my grep for that
> variable doesn't seam to reveal anything usable *g*.
> 
>    I was planning on adding the patches from avr32linux.org into the
> buildroot patches folder.
> 

Don't bother, they are old...
The predefined toolchain in the buildroot trunk contains newer stuff.


>   There is also another problem with the vanilla buildroot, it tries
> to download a version of uClibc from atmel ftp that doesn't exist
> according to wget error, so I was about to try this on the atmel
> snapshot of buildroot.
> 

Checked, and I now know the problem.
It is in the "target/device/Toolchain.in" file.


  BR2_VENDOR_SITE is wrong...

replace 
$(BR2_ATMEL_MIRROR)
with
"$(BR2_ATMEL_MIRROR)/Source"

so it reads:

config BR2_VENDOR_SITE
	string
	default "$(BR2_ATMEL_MIRROR)/Source" if 

Will fix this ASAP.

BR
Ulf Samuelsson
