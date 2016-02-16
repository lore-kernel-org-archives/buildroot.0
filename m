From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 16 Feb 2016 12:46:55 +0100
Subject: [Buildroot] $(SED) not defined if 'make menuconfig
	savedefconfig'
In-Reply-To: <CAM+bi4vL3aa+RO30s7ScAti=yykL+woGXpA=KaQMMgAd3HEd-g@mail.gmail.com>
References: <CAM+bi4tjaJB2bJuQ40_cap55ZrEmOYg4Ssz+TMM_zg5Cb0yo6A@mail.gmail.com>
 <20150615153742.02ebdb85@free-electrons.com>
 <20150615142011.GA16458@dkarchlinux64.currentcomm.com>
 <CAM+bi4vL3aa+RO30s7ScAti=yykL+woGXpA=KaQMMgAd3HEd-g@mail.gmail.com>
Message-ID: <CAM+bi4vPDjVgiAiXV-ch9jbOo=B04dSce3w3QRsVfsxMgAYpzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all

2015-06-16 9:58 GMT+02:00 Alvaro Gamez <alvaro.gamez@hazent.com>:

> 2015-06-15 16:20 GMT+02:00 <rdkehn@yahoo.com>:
>
>> > diff --git a/Makefile b/Makefile
>> > index d3f80c4..67eb50c 100644
>> > --- a/Makefile
>> > +++ b/Makefile
>> > @@ -272,6 +272,7 @@ HOSTLN := $(shell which $(HOSTLN) || type -p
>> $(HOSTLN) || echo ln)
>> >  HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
>> >  HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY)
>> || echo objcopy)
>> >  HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) ||
>> echo ranlib)
>> > +SED := $(shell which sed || type -p sed) -i -e
>> >
>> >  export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
>> >  export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
>> > diff --git a/package/Makefile.in b/package/Makefile.in
>> > index c02d31f..f256b05 100644
>> > --- a/package/Makefile.in
>> > +++ b/package/Makefile.in
>> > @@ -217,7 +217,6 @@ endif
>> >  INSTALL := $(shell which install || type -p install)
>> >  FLEX := $(shell which flex || type -p flex)
>> >  BISON := $(shell which bison || type -p bison)
>> > -SED := $(shell which sed || type -p sed) -i -e
>> >  UNZIP := $(shell which unzip || type -p unzip) -q
>> >
>> >  APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
>> >
>> >
>>
>> I reproduced Alvaro's observation and your patch does resolve the
>> issue.
>>
>> Tested-by: Doug Kehn <rdkehn@yahoo.com>
>>
>> Regards,
>> ...doug
>>
>>
> I've just tested it too and can confirm that this fixes the problem and my
> particular use case with buildroot-submodule.
>
> Tested-by: Alvaro G. M. <alvaro.gamez@hazent.com>
>
>
I just wanted to query about the status of this patch. I haven't found it
on patchwork, probably because it wasn't sent as a PATCH email on itself,
but it was tested by Doug and me.

I can confirm it still applies and works as intended. If you need me to, I
can git-email it.

Best regards


-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160216/b528d529/attachment.html>
