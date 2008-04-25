From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 25 Apr 2008 12:00:24 -0300
Subject: [Buildroot] Improper device nodes
	createdinsideproject_build_arm/uclibc/root/dev/
In-Reply-To: <87wsmna99s.fsf@macbook.be.48ers.dk>
References: <16803332.post@talk.nabble.com>
	<040301c8a49d$c1408170$050514ac@atmel.com>
	<87tzhtoihz.fsf@macbook.be.48ers.dk>
	<044f01c8a4a9$cfed41c0$050514ac@atmel.com>
	<87hcdtobni.fsf@macbook.be.48ers.dk>
	<d6cda7730804221745r419a43dft863faddfd681aba7@mail.gmail.com>
	<016401c8a564$106164b0$020514ac@atmel.com>
	<87od80fnnu.fsf@macbook.be.48ers.dk>
	<004201c8a593$e3796b20$080514ac@atmel.com>
	<87wsmna99s.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730804250800h439e3c64ic532fa5dc76564bd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 24, 2008 at 6:31 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
>  >> Sure, but where to stop? I think most if not all disk based needs are
>   >> covered by the existing tar/ext2/ext3 support.
>
>   Ulf> I am just talking about a configuration option which will
>   Ulf> write a file system generated using the existing options
>   Ulf> to the SD-Card card.
>
>   Ulf> config BR2_WRITE_SD_CARD
>   Ulf>         string    "Write to SD-Card in the /mnt area"
>   Ulf>         default "sdcard"

This is not enough. You will also want to initialize the card... if
it's brand new, it has FAT in it,not ext2. And, if it has been used
before, it can have files in it from previous builds that will not be
in the current build.
To add to the issue, it's a removable media, you will want to make
sure it's mounted.

>  Why special case SD cards? it can be any block device you want. What
>  about permissions?
>
>  I still think it's silly - What is next, add stuff to fire up a
>  terminal emulator (with config options for port and baudrate) and
>  upload file to bootloader?

I agree... If you want to go an extra mile for the users, why not add
a script to ~/buildroot/script? It could be customized to one's need
if it's not perfect.

>
>   >> Not in a current project, no - But I have (or rather CF cards, but
>   >> that's the same). What's the problem with the existing ext2 support?
>
>   Ulf> It creates the file in $(BINARIES_DIR) and not on the SD-card.
>   Ulf> It would make sense to allow creating a CF-card as well.
>
>  What's the difference between CF and SD card support? The big
>  difference between putting stuff in BINARIES_DIR and on some block
>  device is permissions. You can do everything in buildroot without root
>  permissions, let's not change that.
>
>  --
>  Bye, Peter Korsgaard
>
