From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Sep 2019 22:00:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/znc: switch to cmake
References: <20190928104106.28327-1-bernd.kuhls@t-online.de>
 <20190928104106.28327-2-bernd.kuhls@t-online.de>
 <20190928215036.4c90896a@windsurf>
Message-ID: <8oq46gx2u4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 28 Sep 2019 21:50:35 +0200 schrieb Thomas Petazzoni:

> Applied to master, thanks. Regarding the WANT_I18N option, what does it
> do exactly ? Indeed, the autotools package infrastructure was
> automatically passing --enable-nls or --disable-nls depending on the
> value of BR2_SYSTEM_ENABLE_NLS. So with your unconditional addition of
> WANT_I18N=OFF, I'm wondering if we have lost NLS support in znc when
> BR2_SYSTEM_ENABLE_NLS=y. Could you check this ?

Hi Thomas,

WANT_I18N enables the C/C++ define HAVE_I18N, but only if Boost.Locale 
and gettext were found:
https://github.com/znc/znc/blob/master/CMakeLists.txt#L222

HAVE_I18N was not used by autoconf so we did not lose any features when 
switching to cmake.

Regards, Bernd
