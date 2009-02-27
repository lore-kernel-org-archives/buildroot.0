From: William Brodie-Tyrrell <william@brodie-tyrrell.org>
Date: Fri, 27 Feb 2009 19:07:10 +0900
Subject: [Buildroot] gcc compilation issues on AT91SAM9G20
In-Reply-To: <87hc2gmea8.fsf@macbook.be.48ers.dk>
References: <20090225174424.09d0badc.william@brodie-tyrrell.org>
	<87iqmyoogi.fsf@macbook.be.48ers.dk>
	<20090225191212.c5a31f46.william@brodie-tyrrell.org>
	<8763iyom4z.fsf@macbook.be.48ers.dk>
	<20090226151511.da1c9b65.william@brodie-tyrrell.org>
	<87hc2gmea8.fsf@macbook.be.48ers.dk>
Message-ID: <20090227190710.83ff1d6d.william@brodie-tyrrell.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Feb 2009 10:15:27 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Are you trying an EABI or OABI build? The aapcs-linux stuff is for
> EABI.

EABI, though not for any particular reason other than that's what the
linux4sam-provided .config does. The gcc configure only works if I
leave the BR2_GCC_TARGET_ABI line out of the .config. The cross
compiler (when it's working) is called arm-linux-uclibcgnueabi-gcc so
perhaps I should put linux-uclibcgnueabi in the BR2_GCC_TARGET_ABI?

> We don't have a defconfig for that specific board in BR, but I just
> tried the at91sam9g20dfc defconfig where I added "native toolchain in
> the target filesystem", and that builds without problems.
> 
> Could you post your .config?

It's attached.  It's entirely possible there's something that the
linux4sam patches do that is missing from this fresh build I'm doing,
but I don't know nearly enough about buildroot to spot it.  I copied in
my old/working .config and local/AT91 directory and ran 'make oldconfig'
to update the .config.

PS: when one gets a fresh copy of HEAD from SVN, the scripts/wget.sh
file is missing.


thanks,

-- 
William Brodie-Tyrrell

Carpe Diem - fish of the day.

<william@brodie-tyrrell.org>
http://www.brodie-tyrrell.org/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.gz
Type: application/x-gzip
Size: 4651 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090227/a4167faa/attachment-0001.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 197 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090227/a4167faa/attachment-0001.pgp>
