From: lpdev at cordier.org <lpdev@cordier.org>
Date: Tue, 28 Aug 2018 13:28:17 +0200 (CEST)
Subject: [Buildroot] genimage with GPT partition
In-Reply-To: <1201350910.3105921.1535455139614.JavaMail.zimbra@datacom.com.br>
Message-ID: <ea-mime-5b8531d1-607c-3c8a0ad5@www-1.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

I think support for GPT would be a useful feature to add to the back log.
Carlos, would it be possible for you to share your custom script? It would save me a lot of time not doing it from scratch.

Thanks!

De : Carlos Santos <casantos@datacom.com.br>
? : LP <lpdev@cordier.org>
Sujet : Re: [Buildroot] genimage with GPT partition
Date : 28/08/2018 13:18:59 CEST
Copie ? : buildroot <buildroot@busybox.net>

> From: "LP" <lpdev@cordier.org>
> To: "buildroot" <buildroot@busybox.net>
> Sent: Tuesday, August 28, 2018 6:13:11 AM
> Subject: [Buildroot] genimage with GPT partition

> Hi,

> After successfully booting an EFI-generated distro, I am now looking for an
> easy-to-install steps for my image file. (using the pc_x86_64_efi_defconfig).

> I first tried to flash directly the .img file on my device, and actually it does
> not boot. The reason is because the generated .img file is containing mbr
> partition instead of gpt.

> Is it a limitation of genimage? Is there any way to generate a gpt-compatible
> .img file?

genimage does not create GPT partitions. In my current project I made a
tricky post-image script which uses sfdisk, mcopy and mkfs to craft a
disk image with the required partitions. It's beautifully horrendous. 

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180828/f6e35654/attachment.html>
