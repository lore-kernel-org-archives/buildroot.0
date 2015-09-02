From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Sep 2015 08:45:24 +0200
Subject: [Buildroot] [PATCH 1/2] dos2unix: add target support
In-Reply-To: <20150902054912.GU17874@tarshish> (Baruch Siach's message of
 "Wed, 2 Sep 2015 08:49:12 +0300")
References: <d04d05bf5fb09fd02747689fe348375cdff4fc6a.1441089817.git.baruch@tkos.co.il>
 <87a8t5q0r4.fsf@dell.be.48ers.dk> <20150902054912.GU17874@tarshish>
Message-ID: <87613tpbej.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

>> This looks odd - If wchar is only for gettext then we should allow
 >> non-locale builds without wchar. A quick test shows that dos2unix uses
 >> wchar several places, but this can be disabled if UCS= is passed on the
 >> make line (wchar_t is still referred in 3 error prints though).

 > It seems like most packages conditionally selecting BR2_PACKAGE_GETTEXT do not 
 > depend on BR2_USE_WCHAR. But then, how do you prevent gettext build when the 
 > toolchain has no wchar support? The autobuilder 
 > (http://autobuild.buildroot.net/?reason=gettext-0.19.5.1) shows no gettext 
 > build failure.

I believe it is because locale support (in uClibc) implies wchar
support, so BR2_NEEDS_GETTEXT_IF_LOCALE will only be true if locale
support (and hence wchar) is enabled.


 >> >  DOS2UNIX_VERSION = 7.0
 >> >  DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 >> > -DOS2UNIX_DEPENDENCIES = host-gettext
 >> >  DOS2UNIX_LICENSE = BSD-2c
 >> >  DOS2UNIX_LICENSE_FILES = COPYING.txt
 >> > +HOST_DOS2UNIX_DEPENDENCIES = host-gettext
 >> 
 >> If gettext is optional for target builds, why do we then force it for
 >> host builds?

 > Do we care about host packages binaries size?

No, not very much - But we do care about build time. If there's no need
to build host-gettext then we shouldn't do so.


 > In any case, this is a matter for another patch.

Agreed.

-- 
Venlig hilsen,
Peter Korsgaard 
