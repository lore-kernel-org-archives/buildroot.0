From: Ted Salazar <ted.salazar@maximintegrated.com>
Date: Sun, 24 May 2015 19:06:36 -0700 (PDT)
Subject: [Buildroot] Help for another newbie,
 AT91sam9x25 incorrect defconfig or incorrect rootfs.ubi
In-Reply-To: <20150524130250.36ebd47d@free-electrons.com>
References: <1432452387471-101939.post@n4.nabble.com>
 <20150524130250.36ebd47d@free-electrons.com>
Message-ID: <B03A893ADFE80748942D13AFAF28451924E703A8C9@ITSVLEX06.it.maxim-ic.internal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your responses to my Question 1. My responses are below [TS]

From: Thomas Petazzoni-2 [via Buildroot (busybox)] [mailto:ml-node+s2317881n101941h89 at n4.nabble.com]
Sent: Sunday, May 24, 2015 3:45 AM
To: Ted Salazar
Subject: Re: Help for another newbie, AT91sam9x25 incorrect defconfig or incorrect rootfs.ubi

Dear Ted Salazar,

On Sun, 24 May 2015 00:26:27 -0700 (PDT), Ted Salazar wrote:

> 1. Built the At91Bootstrap Ver 3.7.2:
> location: tsalazar at Ubuntu14-64:~/at91bootstrap/binaries/
> Output file: at91sam9x5ek-nandflashboot-uboot-3.7.2.bin
>
> 2. Built Uboot ver 2015.01:
> location: tsalazar at Ubuntu14-64:~/u-boot-at91/
> Output file: u-boot.bin
>
> 3. Built the Kernel ver 3.6.9  (I plan to upgrade to 3.18 but I'm trying to
> duplicate a working demo first)
> location: tsalazar at Ubuntu14-64:~/linux-at91/arch/arm/boot/
> Output file: at91sam9x25ek.dtb
> location: tsalazar at Ubuntu14-64:~/linux-at91/arch/arm/boot/
> Output file: zImage

Why do you build AT91Bootstrap, U-Boot and the kernel? Buildroot will
build them for you, no need to build these manually.

[TS: I am open to using the mainline BuildRoot but I just got started with the Atmel flow because it was recommended by Atmel for their processor and they have a working Flash Demo for the EK my board will be based on so I was trying to reproduce that Flash Demo. ]

> 4. Built buildroot-at91 ver 2014.05 ( This is where I have all my problems)
>
> https://github.com/linux4sam/buildroot-at91/tree/buildroot-2014.05-at91/configs

This is the Atmel fork of Buildroot. You're contacting the official
Buildroot mailing list, we only support the mainline Buildroot.

You should rather try the updated Atmel defconfigs recently posted by
Alexandre Belloni (they are only available in the Buildroot patchwork
for the moment, since they haven't been applied yet).

[TS: Yes I was aware of Alexandre's patches but several things were not clear enough to me to be able to use it. Sorry this is basic to you but not to me.

1.       Who  runs the at91.com/Linux4Sam website? I thought this was an Atmel run website? If so and you only support mainline BuildRoot then why does Alexandre's sam9x5ek patches contain Linux4sam URLs (ie URL=https://github.com/linux4sam/linux-at91.git and URL="git://github.com/linux4sam/u-boot-at91.git" ) shown here http://patchwork.ozlabs.org/patch/473928/

2.       The Atmel flow that I have been using, requires various at91sam9x5ek defconfig files. For example,  to build

AT91Bootstrap => at91sam9x5eknf_uboot_defconfig is required

Uboot => at91sam9x5ek_nandflash_defconfig is required

Kernel => at91_dt_defconfig is required

File System using AtmelBuildRoot => at91sam9x25ek_defconfig (which does not exist and what I was looking for but I never understood how to get Alexandre's patch until you sent me the link http://patchwork.ozlabs.org/patch/473928/ ) I never saw a way to download this from the BuildRoot mailing list email. Thank you for sending the link.

3.       Does Alexandre's patch create all of the required at91sam9x5 defconfig files needed in order to build the AT91Bootstrap, uboot, Kernel and .ubifs filesystem too?

4.       OK, if Alexandre's patch does not work on Atmel's forked BuildRoot then I will try using mainline BuildRoot. In fact, I'll probably try both BuildRoot versions no matter what. I'll read the manual at http://buildroot.uclibc.org/downloads/manual/manual.html

> Q1) Does someone know where I can get an at91sam9x25ek_defconfig file for
> BuildRoot-at91 Ver 2014.05?

No, because you're talking about an Atmel fork of Buildroot, and this
mailing list is only supporting the official Buildrot.

You should apply the patch http://patchwork.ozlabs.org/patch/473928/ on
the mainline Buildroot and use the at91sam9x5ek_defconfig. Also, make
sure to apply http://patchwork.ozlabs.org/patch/473935/ and read the
readme.txt file. These patches should be applied to the next Buildroot
version.

[TS: Thank you]

Best regards,

Thomas Petazzoni
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
_______________________________________________
buildroot mailing list
[hidden email]</user/SendEmail.jtp?type=node&node=101941&i=0>
http://lists.busybox.net/mailman/listinfo/buildroot

________________________________
If you reply to this email, your message will be added to the discussion below:
http://buildroot-busybox.2317881.n4.nabble.com/Help-for-another-newbie-AT91sam9x25-incorrect-defconfig-or-incorrect-rootfs-ubi-tp101939p101941.html
To unsubscribe from Help for another newbie, AT91sam9x25 incorrect defconfig or incorrect rootfs.ubi, click here<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=101939&code=dGVkLnNhbGF6YXJAbWF4aW1pbnRlZ3JhdGVkLmNvbXwxMDE5Mzl8OTI4OTc3Mjk=>.
NAML<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Help-for-another-newbie-AT91sam9x25-incorrect-defconfig-or-incorrect-rootfs-ubi-tp101939p101953.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150524/48eb5dfd/attachment.html>
