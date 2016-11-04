From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Nov 2016 22:37:28 +0100
Subject: [Buildroot] Support for MPC_8323E-RDB Board
In-Reply-To: <20161104145937.174c3cb6@free-electrons.com>
References: <CANO2Q2-50CT2crNwtt8s7oyh_n+s0ukZ=zqT+R_8EtKh0+jg-w@mail.gmail.com>
 <20161104145937.174c3cb6@free-electrons.com>
Message-ID: <3f936023-7444-e74f-75dc-0d428e27590a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Siva,

On 04-11-16 14:59, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 4 Nov 2016 18:03:38 +0530, Siva Prakash Reddy Nareddy wrote:
> 
>> The issues I am getting are as follows..
>>
>> jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make menuconfig
> 
> Don't run Buildroot as root.
> 
>> configuration written to /home/buildroot-labs/buildroot/.config
>>
>> *** End of the configuration.
>> *** Execute 'make' to start the build or try 'make help'.
>>
>> jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make
>> boot/uboot/uboot.mk:295: *** No board defconfig name specified, check your
>> BR2_TARGET_UBOOT_DEFCONFIG setting.  Stop.
> 
> This means you have enabled the U-Boot bootloader, but you have not
> defined which U-Boot configuration to build, so Buildroot cannot start
> the build process.
> 
>> jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make
>> linux/linux.mk:441: *** No kernel device tree source specified, check your
>> BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS
>> settings.  Stop.
> 
> This means you have enabled the Linux kernel, with Device Tree support,
> but you haven't specified which Device Tree files you want to build.

 We hoped that the error messages that are given by Buildroot would have been
clear enough to make Thomas's reply unnecessary. Apparently they are not. Can
you give a suggestion as to what we could change in the error message to clarify?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
