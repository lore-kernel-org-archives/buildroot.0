From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 31 Jul 2013 21:05:56 +0800
Subject: [Buildroot] [noMMU] How to generate FLAT executable for busybox?
In-Reply-To: <CAFRkauAXEpeZu6PNDvR2TiU9D=EidiaREJCFTjCP1BqrX0Y8zA@mail.gmail.com>
References: <1375076435.4630.2.camel@phoenix>
 <CAFRkauAXEpeZu6PNDvR2TiU9D=EidiaREJCFTjCP1BqrX0Y8zA@mail.gmail.com>
Message-ID: <CAFRkauBReYkcyUzaOdHk586wNm3vgP0Uaztv3vgvfvz608NidA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/7/29 Axel Lin <axel.lin@ingics.com>:
> 2013/7/29 Axel Lin <axel.lin@ingics.com>:
>> Hi,
>> I have BR2_BINFMT_FLAT=y in my setting.
>> However, the build system still generates ELF executable for busybox.
>>
>> $ file output/target/bin/busybox
>> output/target/bin/busybox: setuid ELF 32-bit LSB executable, ARM, version 1 (SYSV), statically linked, stripped

Hi,
Just try to figure out if any platform can build FLAT executable.
So I just tested build for blackfin (BR2_bfin).
( I don't have any customization for this blackfin build test,
only run make menuconfig and select blackfin. Test with current git tree. )

I thought I should have a FLAT executable, however it produces ELF executable.
$ file output/target/bin/busybox
output/target/bin/busybox: setuid ELF 32-bit LSB executable, Analog
Devices Blackfin, version 1 (SYSV), statically linked, stripped

BTW, I found BR2_ELF2FLT is invisible for BR2_bfin.

package/elf2flt/Config.in.host:
config BR2_PACKAGE_HOST_ELF2FLT
        bool "Enable elf2flt support?"
        depends on BR2_arm || BR2_sh || BR2_sparc

Does this mean blackfin does not need elf2flt tool?

Regards,
Axel
