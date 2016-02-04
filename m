From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 4 Feb 2016 10:22:02 -0200 (BRST)
Subject: [Buildroot] Why is libbsd limited to ARM, x86 and x86_64?
In-Reply-To: <20160204052132.GK3529@sapphire.tkos.co.il>
References: <1326783145.511396.1454427009117.JavaMail.zimbra@datacom.ind.br>
 <56B11B08.2070306@mind.be>
 <1351688359.878304.1454513991848.JavaMail.zimbra@datacom.ind.br>
 <1734711132.950514.1454525438621.JavaMail.zimbra@datacom.ind.br>
 <56B2948E.2090805@mind.be> <20160204052132.GK3529@sapphire.tkos.co.il>
Message-ID: <963387420.1109035.1454588522735.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Baruch Siach" <baruch@tkos.co.il>
> To: "Arnout Vandecappelle" <arnout@mind.be>
> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "guilherme machado" <guilherme.machado@datacom.ind.br>, "buildroot"
> <buildroot@buildroot.org>
> Sent: Thursday, February 4, 2016 3:21:32 AM
> Subject: Re: [Buildroot] Why is libbsd limited to ARM, x86 and x86_64?

> Hi Carlos, Arnout,
> 
> On Thu, Feb 04, 2016 at 01:00:14AM +0100, Arnout Vandecappelle wrote:
>> On 03-02-16 19:50, Carlos Santos wrote:
>> > 2. I'm absolutely ignorant about nios2. What defconfig should I use to
>> > build for it?
>> 
>>  Hm, looks like we don't have a nios2 defconfig... But you can do a very quick
>> build-test by setting arch to nios2 and selecting the Sourcery toolchain.
> 
> You can also use the config at
> http://autobuild.buildroot.net/toolchains/configs/br-nios2-glibc.config.

OK, I was able to build libbsd and its dependent packages (libedit and netcat-openbsd) using br-nios2-glibc.config, as well as the following defconfigs: (some of them modified to use glibc instead of uClibc):

- qemu_aarch64_virt
- qemu_mips64_malta
- qemu_mips64el_malta
- qemu_mips_malta
- qemu_mipsel_malta
- qemu_sh4_r2d
- qemu_sparc64_sun4u
- qemu_sparc_ss10

The compilation for microblaze failed using br-microblazeel-full.config, taken from the autobuilder (build log saved at http://ur1.ca/ohak2). It also failed, for similar reasons using the existing defconfig's:

- qemu_microblazebe_mmu
- qemu_microblazeel_mmu
'
The compilation also failed using qemu_sh4eb_r2d_defconfig but I don't think it is a valid test, since I forced BR2_TOOLCHAIN_BUILDROOT_GLIBC to "y".

So I think I should disable libbsd for the microblaze architecture, at least for the moment.

Carlos Santos (Casantos)
DATACOM, P&D
