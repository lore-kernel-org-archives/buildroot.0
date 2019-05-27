From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 11:06:06 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/sqlite: fix BUG_85180 build
 timeout
In-Reply-To: <6dcdb1eb-5d48-e773-9711-1df461c542e2@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-2-giulio.benetti@micronovasrl.com>
 <20190524222459.2fc91773@windsurf.home>
 <6dcdb1eb-5d48-e773-9711-1df461c542e2@micronovasrl.com>
Message-ID: <3e1c735b-0639-ffaf-9d96-7b51920668fc@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 26/05/2019 00:14, Giulio Benetti ha scritto:
> Il 24/05/2019 22:24, Thomas Petazzoni ha scritto:
>> On Wed, 22 May 2019 15:59:00 +0200
>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>
>>> With Microblaze Gcc version < 8.x build hangs on compiling last files
>>> before linking.
>>> This is due to bug 85180:
>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
>>> Bug shows up building sqlite with optimization but not when building
>>> with -O0.
>>>
>>> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
>>> SQLITE_CFLAGS.
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>
>> I cannot reproduce this timeout, and you don't have any autobuilder
>> failure. Could you provide a configuration that exhibits the failure ?

Sure, the problems comes out building libnss with gcc4.9/5/6/7.
Here is pastebin of my savedefconfig:
https://pastebin.com/wmR8Dme3

I use external toolchains, but they are BR toolchains.
The commit log is not precise, need to improve it.

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
