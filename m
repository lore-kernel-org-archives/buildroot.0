From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jul 2016 11:26:09 +0200
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot
	2016.05
In-Reply-To: <170867641.7742576.1467562508600.JavaMail.zimbra@datacom.ind.br>
References: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
 <20160701151804.61f389e9@free-electrons.com>
 <1572014322.7513168.1467381657827.JavaMail.zimbra@datacom.ind.br>
 <20160701161556.5e65b3df@free-electrons.com>
 <1533419985.7541395.1467386922132.JavaMail.zimbra@datacom.ind.br>
 <e3405ae6-8f0b-0e40-e2e4-efafe77bf717@mind.be>
 <20160702125625.11882f51@free-electrons.com>
 <170867641.7742576.1467562508600.JavaMail.zimbra@datacom.ind.br>
Message-ID: <902df8d4-b600-9322-af0b-eea6aa56be9a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Carlos,

On 03-07-16 18:15, Carlos Santos wrote:
>> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
>> To: "Arnout Vandecappelle" <arnout@mind.be>
>> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "Julien Boibessot" <julien.boibessot@armadeus.com>, "buildroot"
>> <buildroot@buildroot.org>
>> Sent: Saturday, July 2, 2016 7:56:25 AM
>> Subject: Re: [Buildroot] Unable to compile uboot v2012.10 on Buildroot 2016.05
> 
>> Hello,
>>
>> On Sat, 2 Jul 2016 12:47:14 +0200, Arnout Vandecappelle wrote:
>>
>>>> Because the value of HOSTCFLAGS set in U-Boot's config.mk is overwritten.
>>>
>>>  How about leaving HOSTCFLAGS alone, and instead setting
>>> HOSTCC="$(HOSTCC) $(HOST_CFLAGS)". HOSTLDFLAGS can probably be overridden.
>>
>> Good point, that's possibly an alternate solution. I sent a patch
>> implementing a different solution, but Carlos, if you can try Arnout's
>> suggestion, it would be good.
> 
> Yes, it works, but this reminds me that HOSTCC is not passed when building buildroot, so the command line for version 2015.01 becomes
> 
> cc -Wp,-MD,tools/.img2srec.d -O2 -I/work/freescale_imx28evk/host/usr/include   -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch/arm/include -I./lib/libfdt -I./tools -DCONFIG_SYS_TEXT_BASE=0x40002000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE -pedantic -o tools/img2srec tools/img2srec.c
> 
> This may not be a problem now but I believe that HOSTCC should always be provided.

 Care to prepare a patch then that replaces HOSTCFLAGS by HOSTCC?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
