From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 20 Jun 2019 11:37:50 +0200
Subject: [Buildroot] [PATCH 08/27] package/boost: allow building on
 microblaze
In-Reply-To: <20190619175611.085941ec@windsurf>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-9-giulio.benetti@micronovasrl.com>
 <20190619175611.085941ec@windsurf>
Message-ID: <56623956-7711-ab78-4bb6-daa8a4bef47e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 19/06/2019 17:56, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Fri, 14 Jun 2019 23:03:27 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> Package boost builds correctly on Microblaze with Gcc 4.9/5/6/7/8/9 so
>> add 'default y if BR2_microblaze' to
>> BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/boost/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/boost/Config.in b/package/boost/Config.in
>> index 4e6bbff6df..783e86dc09 100644
>> --- a/package/boost/Config.in
>> +++ b/package/boost/Config.in
>> @@ -78,6 +78,7 @@ config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
>>   	default y if BR2_mipsel
>>   	default y if BR2_powerpc
>>   	default y if BR2_x86_64
>> +	default y if BR2_microblaze
> 
> The commit title is misleading: it's not boost that you allow to build
> on Microblaze (this is already possible), but the "context" module of
> boost.
> 
> However, reading the page
> https://www.boost.org/doc/libs/1_70_0/libs/context/doc/html/context/architectures.html,
> it doesn't seem like Microblaze is part of the supported architectures.
> 
> Below the table, there is a note that says "If the architecture is not
> supported but the platform provides ucontext_t, Boost.Context should be
> compiled with BOOST_USE_UCONTEXT and b2 property
> context-impl=ucontext.".
> 
> But we're not passing BOOST_USE_UCONTEXT nor context-impl=ucontext. Is
> this happening automatically somehow ?
> 
> So overall, I think this needs more research/verification, and I'm not
> sure it's really worth the effort. Whoever cares enough about
> Microblaze and needs the boost-context module can always work on this.

Yes, I agree. I drop this patch.

Thank you
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
