From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 11:57:25 +0200
Subject: [Buildroot] genimage with GPT partition
In-Reply-To: <ea-mime-5b851227-2313-3c034151@www-1.netcourrier.com>
 (lpdev@cordier.org's message of "Tue, 28 Aug 2018 11:13:11 +0200
 (CEST)")
References: <ea-mime-5b851227-2313-3c034151@www-1.netcourrier.com>
Message-ID: <874lfe7r0a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "lpdev" == lpdev  <lpdev@cordier.org> writes:

 > Hi,
 > After successfully booting an EFI-generated distro, I am now looking
 > for an easy-to-install steps for my image file. (using the
 > pc_x86_64_efi_defconfig).

 > I first tried to flash directly the .img file on my device, and
 > actually it does not boot. The reason is because the generated .img
 > file is containing mbr partition instead of gpt.

 > Is it a limitation of genimage? Is there any way to generate a
 > gpt-compatible .img file?

Yes, unfortunately it is.

Genimage is a standalone open source project, not specific to Buildroot:

https://github.com/pengutronix/genimage

Perhaps contact them to ask about GPT support and/or contribute it
yourself?

Genimage is just a handy way to execute the basic
fdisk/mkfs/.. commands. Alternatively a script to do something similar
with gptfdisk could probably be written.

-- 
Bye, Peter Korsgaard
