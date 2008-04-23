From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 23 Apr 2008 20:33:47 +0200
Subject: [Buildroot] Improper device nodes
	createdinsideproject_build_arm/uclibc/root/dev/
References: <16803332.post@talk.nabble.com><20080421140757.GC21702@cloud.net.au>
	<16819059.post@talk.nabble.com><20080422005042.GA19794@cloud.net.au><8763uaqs3b.fsf@macbook.be.48ers.dk><20080422095909.GA31643@cloud.net.au><040301c8a49d$c1408170$050514ac@atmel.com><87tzhtoihz.fsf@macbook.be.48ers.dk><044f01c8a4a9$cfed41c0$050514ac@atmel.com><87hcdtobni.fsf@macbook.be.48ers.dk><d6cda7730804221745r419a43dft863faddfd681aba7@mail.gmail.com><016401c8a564$106164b0$020514ac@atmel.com>
	<87od80fnnu.fsf@macbook.be.48ers.dk>
Message-ID: <004201c8a593$e3796b20$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Subject: Re: [Buildroot] Improper device nodes createdinsideproject_build_arm/uclibc/root/dev/


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
> Ulf> You could generate scripts to build all packages...
> 
> Ulf> Then you can remove ALL package/*/*.mk.
> 
> Ulf> I do not think this is an improvement.
> 
> Ulf> Why is it better to run a script than to be able to configure to
> Ulf> generate an SD-Card as part of the make?
> 
> Sure, but where to stop? I think most if not all disk based needs are
> covered by the existing tar/ext2/ext3 support.

I am just talking about a configuration option which will 
write a file system generated using the existing options
to the SD-Card card.

config BR2_WRITE_SD_CARD
        string    "Write to SD-Card in the /mnt area"
        default "sdcard"


> 
> Adding more config options for really specialized stuff doesn't
> increase usability imho.

$(BR2_WRITE_TO_SD_CARD)/bin:    $(BINARIES_DIR)/<rootfs>
        extract "$(BINARIES_DIR)/<rootfs>" to "/mnt/$(BR2_WRITE_SD_CARD)"

Isn't really "specialilzed" stuff

> >>> I still think it's needless bloat.
> 
> Ulf> Do you generate SD-Cards images or not?
> Ulf> Have a feeling you here define bloat as something you do not use.
> 
> Not in a current project, no - But I have (or rather CF cards, but
> that's the same). What's the problem with the existing ext2 support?

It creates the file in $(BINARIES_DIR) and not on the SD-card.
It would make sense to allow creating a CF-card as well.

> 
> -- 
> Bye, Peter Korsgaard
>



Best Regards
Ulf Samuelsson
