From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 11:31:59 +0200
Subject: [Buildroot] Improper device nodes
	createdinsideproject_build_arm/uclibc/root/dev/
In-Reply-To: <004201c8a593$e3796b20$080514ac@atmel.com> (Ulf Samuelsson's
	message of "Wed\, 23 Apr 2008 20\:33\:47 +0200")
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au> <16819059.post@talk.nabble.com>
	<20080422005042.GA19794@cloud.net.au>
	<8763uaqs3b.fsf@macbook.be.48ers.dk>
	<20080422095909.GA31643@cloud.net.au>
	<040301c8a49d$c1408170$050514ac@atmel.com>
	<87tzhtoihz.fsf@macbook.be.48ers.dk>
	<044f01c8a4a9$cfed41c0$050514ac@atmel.com>
	<87hcdtobni.fsf@macbook.be.48ers.dk>
	<d6cda7730804221745r419a43dft863faddfd681aba7@mail.gmail.com>
	<016401c8a564$106164b0$020514ac@atmel.com>
	<87od80fnnu.fsf@macbook.be.48ers.dk>
	<004201c8a593$e3796b20$080514ac@atmel.com>
Message-ID: <87wsmna99s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Sure, but where to stop? I think most if not all disk based needs are
 >> covered by the existing tar/ext2/ext3 support.

 Ulf> I am just talking about a configuration option which will 
 Ulf> write a file system generated using the existing options
 Ulf> to the SD-Card card.

 Ulf> config BR2_WRITE_SD_CARD
 Ulf>         string    "Write to SD-Card in the /mnt area"
 Ulf>         default "sdcard"

Why special case SD cards? it can be any block device you want. What
about permissions?

I still think it's silly - What is next, add stuff to fire up a
terminal emulator (with config options for port and baudrate) and
upload file to bootloader?

 >> Not in a current project, no - But I have (or rather CF cards, but
 >> that's the same). What's the problem with the existing ext2 support?

 Ulf> It creates the file in $(BINARIES_DIR) and not on the SD-card.
 Ulf> It would make sense to allow creating a CF-card as well.

What's the difference between CF and SD card support? The big
difference between putting stuff in BINARIES_DIR and on some block
device is permissions. You can do everything in buildroot without root
permissions, let's not change that.

-- 
Bye, Peter Korsgaard
