From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 14:14:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: Add optional
	dependency to libiconv
References: <1402313033-31085-1-git-send-email-bernd.kuhls@t-online.de>
 <20140609195850.2317401f@free-electrons.com>
Message-ID: <XnsA34990F24E603berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140609195850.2317401f at free-electrons.com:

> You need libiconv because your toolchain does not have locale support.
> Therefore, your Config.in should have something like:
> 
>      select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> 
> see all the other examples in Buildroot.

Hi,

libiconv is not a hard-dependency of tvheadend so I thought enabling libiconv 
in the !BR2_ENABLE_LOCALE case is not necessary here.

Regards, Bernd
