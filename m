From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Tue, 18 Jun 2013 16:27:30 +0200
Subject: [Buildroot] [PATCH] libqmi: new package
In-Reply-To: <20130618140601.18787f92@skate>
References: <51C034FB.3010605@fh-kl.de> <20130618140601.18787f92@skate>
Message-ID: <51C06E52.3070801@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 18.06.2013 14:06, Thomas Petazzoni wrote:
> 
> On Tue, 18 Jun 2013 12:22:51 +0200, Patrick Ziegler wrote:
> 
>> +config BR2_PACKAGE_LIBQMI
>> +	bool "libqmi"
>> +	select BR2_PACKAGE_LIBGLIB2
> 
> You need to propagate the "depends on" that libglib2 has, i.e WCHAR.
> 
>> +	help
>> +	  libqmi is a glib-based library for talking to WWAN modems and devices
>> +	  which speak the Qualcomm MSM Interface (QMI) protocol.
> 
> Upstream URL missing.
> 
>> +LIBQMI_VERSION = 1.4.0
>> +LIBQMI_SITE    = http://cgit.freedesktop.org/libqmi/snapshot/
>> +LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.gz
> 
> This is the default, so you could remove this line.
> 
>> +LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
>> +LIBQMI_LICENSE_FILES = COPYING
>> +LIBQMI_INSTALL_STAGING = YES
>> +LIBQMI_AUTORECONF = YES
> 
> It would be good to have a comment that explains why autoreconf is
> needed, i.e "The tarball is a Git snapshot, doesn't contain the
> genrated configure script and Makefile" or something like this.
> 
>> +LIBQMI_DEPENDENCIES += libglib2
> 
> You could use a = here.
> 

thanks for having a look on this patch.

While I was searching for the best upstream URL, I've found a better source tarball that doesn't need autoreconf.
I will update my patch and resend.

Best regards

Patrick

-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
