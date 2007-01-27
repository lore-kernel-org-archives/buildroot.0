From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 27 Jan 2007 14:03:44 +0100
Subject: [Buildroot] LFS vs 64bit arches
In-Reply-To: <200701261909.04622.vda.linux@googlemail.com>
References: <200701260607.30905.vapier@gentoo.org>
	<200701261909.04622.vda.linux@googlemail.com>
Message-ID: <20070127130344.GM28221@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 26, 2007 at 07:09:04PM +0100, Denis Vlasenko wrote:
>On Friday 26 January 2007 12:07, Mike Frysinger wrote:
>> after seeing the readahead depending on LFS, i have to wonder without looking 
>> at any code ... are we handling LFS properly for 64bit arches ?  which is to 
>> say, it doesnt really make sense to have LFS disabled for 64bit arches ...
>
>I would be able to try answering such questions as soon
>as I will be able to run 64-bit busybox compiled against uclibc.
>
>Currently I cannot do it because uclibc seems to suffer
>from stdio bugs. At least I definitely see them,
>but uclibc mailing list is totally deaf to my mails...

For the weekend, i planned to add a BR2_PREFER_IMA to buildroot and will
then redo the patch for uClibc's GETC/PUTC in order not to pollute the
(visible) namespace. After that i can try to read and/or reproduce the
problem you were seeing with stdio (offhand i don't remember what it was
about nor if i read it in the first place, fwiw).

Then there is also whirm's soekris update that sounds like i should
generalize the so called generic x86 support i added for my own
convenience to be more generic. That'd allow for using the linux26
kernel for non-i386 and non-soekris devices with just an updated
platform/board dependant linux.config.

I also like to try out the patch for bug #881 while i'm building
buildroot anyway.

There are also some shrinkages for busybox and uClibc that i ment to
send out, we'll see if i find enough time to take care of those this
weekend..

And there's also Ulf's atmel patches which will have to wait for the
soekris/ia32 addition and cleanup to be finished first, fwiw.
