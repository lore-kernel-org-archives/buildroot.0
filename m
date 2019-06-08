From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 8 Jun 2019 13:52:35 +0200
Subject: [Buildroot] [git commit] package/brotli: work around gcc bug
 68485
In-Reply-To: <87imthdgz8.fsf@dell.be.48ers.dk>
References: <20190527220327.636798E6D4@busybox.osuosl.org>
 <87y32ehh34.fsf@dell.be.48ers.dk>
 <b01b61c5-4105-efb8-37db-bb5f0479b568@micronovasrl.com>
 <87imthdgz8.fsf@dell.be.48ers.dk>
Message-ID: <586a4f9a-7ba2-d882-920c-c3f9a4f10591@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Il 07/06/2019 08:52, Peter Korsgaard ha scritto:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
> 
> Hi,
> 
>   >> > +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
>   >> > +BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="-O0"
>   >>
>   >> Hmm, why is this not "$(TARGET_C_FLAGS) -O0" like for the other
>   >> packages?
> 
>   > Because CFLAGS were needed only once in that package.
> 
> Yes, but we should still pass TARGET_CFLAGS as well.

Damn it, you're right, $(TARGET_CFLAGS) got lost..

>   > Anyway, if you say, I can modify it and use a BROTLI_CFLAGS
>   > intermediate variable.
> 
> That is less important, but we shouldn't drop TARGET_CFLAGS.
> 

I'm going to fix this.

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
