From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 7 Jun 2019 08:39:07 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: work around gcc bug 85180
In-Reply-To: <20190607080838.46d5065d@thl530.multi.box>
References: <20190606131035.47417-1-giulio.benetti@micronovasrl.com>
 <20190607080838.46d5065d@thl530.multi.box>
Message-ID: <7edbb3f8-65fa-4ea5-c2b4-e60b387ddac2@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas H.,

adding Thomas P.+

Il 07/06/2019 08:08, Thomas Huth ha scritto:
> Am Thu,  6 Jun 2019 15:10:35 +0200
> schrieb Giulio Benetti <giulio.benetti@micronovasrl.com>:
> 
>> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
>> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
>> shows up when building kmsxx with optimization but not when building
>> with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
>> force using -O0.
> 
> According to the description in the bugzilla, the bug should also go
> away when compiling with -fno-dse ... so wouldn't it be better to use
> "-fno-dse" here instead of disabling the optimizations completely?

Honestly I've completely missed that possible solution and didn't even 
tested.

Anyway it's been discussed on IRC channel to keep a common work around 
for every different GCC_BUG_*, so since many packages are affected by 
Bug 85180 and -O0 seemed to work every time Thomas P. suggested to 
always keep that flag as solution.

I hope I've understood correctly at that time on IRC!

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
