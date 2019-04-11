From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 11 Apr 2019 16:50:06 +0200
Subject: [Buildroot] [PATCH] package/vdr-plugin-vnsiserver: package
 needs host-gettext to build correctly
In-Reply-To: <811c4e06-7fc1-b6f5-0fef-16aa6e5604b1@micronovasrl.com>
References: <20190409174535.31768-1-giulio.benetti@micronovasrl.com>
 <20190409232142.5c751a17@windsurf.home>
 <811c4e06-7fc1-b6f5-0fef-16aa6e5604b1@micronovasrl.com>
Message-ID: <464f165b-f63b-8438-9df3-0e04b5f7c2e1@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 10/04/2019 12:05, Giulio Benetti ha scritto:
> Il 09/04/2019 23:21, Thomas Petazzoni ha scritto:
>> Hello Giulio,
>>
>> On Tue,  9 Apr 2019 19:45:35 +0200
>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>
>>> During building msgmerge is used, so at the moment if build environment
>>> doesn't provide it, build will fail.
>>>
>>> Add host-gettext to VDR_PLUGIN_VNSISERVER_DEPENDENCIES.
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>
>> In retrospect, I think http://patchwork.ozlabs.org/patch/1074926/ is better.
>>
>> In fact, my analysis of Fabrice's patch was wrong. Even if the
>> gettext-tiny issue gets resolved, vdr-plugin-vnsiserver (apparently)
>> still needs msgfmt/msgmerge unconditionally, so we would indeed need a
>> host-gettext dependency.
>>
>> But Fabrice's patch makes that not necessary, by only installing the
>> i18n files when BR2_SYSTEM_ENABLE_NLS=y.

So you mean we need to avoid build step using msgfmt/msgmerge and need 
to copy i18n files with something like "cp i18n-files target/i18n-files" ?

> 
> Ah ok, this is clever, since gettext-tiny maintainers pointed they only
> provide stubs and not complete gettext support(this is why it's called
> tiny):
> https://github.com/sabotage-linux/gettext-tiny/issues/42#issuecomment-480127106
> 
> Thanks for the explanation.
> Best regards
> 

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
