From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 5 Apr 2019 00:22:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr-plugin-vnsiserver: fix
 build with host-gettext-tiny
In-Reply-To: <788e07ba-6280-66ff-23c7-e6e25e7cc212@micronovasrl.com>
References: <20190402203237.14733-1-fontaine.fabrice@gmail.com>
 <20190404222124.0ed5b312@windsurf>
 <788e07ba-6280-66ff-23c7-e6e25e7cc212@micronovasrl.com>
Message-ID: <1260bc63-0b57-fcba-cdfb-d4acd3009228@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 04/04/2019 22:38, Giulio Benetti ha scritto:
> Hello,
> 
> Il 04/04/2019 22:21, Thomas Petazzoni ha scritto:
>> Hello,
>>
>> +Giulio and Vadim in Cc.
>>
>> On Tue,  2 Apr 2019 22:32:37 +0200
>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>
>>> Don't build and intall i18n if BR2_SYSTEM_ENABLE_NLS is not set
>>> otherwise build will fail with host-gettext-tiny on:
>>>
>>> msgmerge -U --no-wrap --no-location --backup=none -q -N po/lt_LT.po po/vnsiserver.pot
>>> fopen: No such file or directory
>>
>> This looked a lot like the msgfmt issue that was causing build issues
>> with rygel, and that got fixed by upgrading gettext-tiny.
>> Unfortunately, I tried it, and even with the new gettext-tiny version,
>> I still get those failures.
>>
>> However, I believe the right course of action is to fix the issue in
>> gettext-tiny itself. Could someone report the bug to upstream
>> gettext-tiny ?
> 
> I'm going to reproduce the problem and see if I'm able to fix it if it's
> easier enough and then upstream.
> Otherwise I will open an issue on their github.

I've given up and opened an issue:
https://github.com/sabotage-linux/gettext-tiny/issues/42

IMHO msgmerge seems to be behind respect msgfmt.

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
