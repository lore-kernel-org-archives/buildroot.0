From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 06 Feb 2017 22:15:39 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss:
	add	Kodi-specific patches
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
 <20170204114451.20935-2-bernd.kuhls@t-online.de>
 <20170204230821.GA3805@free.fr>
 <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20170205212408.GC3562@free.fr>
 <i6vmmdxipi.ln2@ID-313208.user.individual.net>
Message-ID: <rk5nmdxipi.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 06 Feb 2017 20:25:38 +0100 schrieb Bernd Kuhls:

> Hi Yann,
> 
> Am Sun, 05 Feb 2017 22:24:09 +0100 schrieb Yann E. MORIN:
> 
>> Instead, I believe their code could be simplified (and fixed) using
>> this:
>> 
>>    73 $(SYSDIR)/libdvdcss-$(ARCH).so: $(WRAPPER) $(WRAPPER_DEF)
>>    74     [ -d libdvdcss ] || mkdir libdvdcss
>>    75     cd libdvdcss; $(AR) x $(DVDCSS_A)
> 
> afaics line 75 still needs libdvdcss.a because thats the content of $(DVDCSS_A):
> https://github.com/xbmc/xbmc/blob/Krypton/lib/libdvd/Makefile.in#L11
> 
>> Could you test this, please?
> 
> I will try, but I am unsure that your proposal will work.

Hi Yann,

tried and failed.

Regards, Bernd
