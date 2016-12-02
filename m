From: John Gulbrandsen <John.Gulbrandsen@wdc.com>
Date: Fri, 2 Dec 2016 18:41:11 +0000
Subject: [Buildroot]
 =?utf-8?q?SH4A_target=3A_error=3A_command_line_option?=
 =?utf-8?q?_=E2=80=98-m4-nofpu=E2=80=99_is_not_supported_by_this_configura?=
 =?utf-8?q?tion?=
In-Reply-To: <20161202095821.0b9fc50c@free-electrons.com>
References: <DM5PR04MB0635AD43067B754A23B8BAEE958F0@DM5PR04MB0635.namprd04.prod.outlook.com>
 <20161202095821.0b9fc50c@free-electrons.com>
Message-ID: <DM5PR04MB0635485E4E8675471039DD12958E0@DM5PR04MB0635.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for your response and for making available such a great tool as buildroot. It is most valuable, especially for an engineer with background in Windows development like myself who don't enjoy digging around in obscure makefile syntax conceived in 1970...

As for the debugging of this issue:

I have confirmed that buildroot for some reason sets all three of these below flags when a SH4A CPU is selected in the top-level .config :

~buildroot/output/build/linux-4.7/.config :

#
# System type
#
CONFIG_CPU_SH4=y
CONFIG_CPU_SH4A=y
CONFIG_CPU_SHX3=y

However, only BR2_sh4a is set in ~buildroot/.config :

BR2_ARCH="sh4a"
BR2_ENDIAN="LITTLE"
BR2_BINFMT_SUPPORTS_SHARED=y
BR2_BINFMT_ELF=y
# BR2_sh2a is not set
# BR2_sh4 is not set
# BR2_sh4eb is not set
BR2_sh4a=y
# BR2_sh4aeb is not set

I tried to manually edit ~buildroot/output/build/linux-4.7/.config :

#
# System type
#
#CONFIG_CPU_SH4=y
CONFIG_CPU_SH4A=y
#CONFIG_CPU_SHX3=y

But this resulted in all four CPU types being put back by buildroot when doing 'make linux'.

Why does buildroot force ' CONFIG_CPU_SH4' and ' CONFIG_CPU_SHX3' to be set?

Thanks,
/John.

John Gulbrandsen
Western Digital Corporation (and its subsidiaries) E-mail Confidentiality Notice & Disclaimer:

This e-mail and any files transmitted with it may contain confidential or legally privileged information of WDC and/or its affiliates, and are intended solely for the use of the individual or entity to which they are addressed. If you are not the intended recipient, any disclosure, copying, distribution or any action taken or omitted to be taken in reliance on it, is prohibited. If you have received this e-mail in error, please notify the sender immediately and delete the e-mail in its entirety from your system.
