From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Dec 2013 11:11:46 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <20131223095752.GF11794@sapphire.tkos.co.il>
References: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20131223095040.GE11794@sapphire.tkos.co.il>
 <52B8083F.80005@free-electrons.com>
 <20131223095752.GF11794@sapphire.tkos.co.il>
Message-ID: <20131223111146.062adc71@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 23 Dec 2013 11:57:52 +0200, Baruch Siach wrote:

> > Hum, right, it got copied from bluez-utils, I'll remove it
> 
> Also, it seems that libglib2 doesn't need threads, only wchar.

libglib2 does need thread support:

config BR2_PACKAGE_LIBGLIB2
        bool "libglib2"
        select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
        select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
        select BR2_PACKAGE_LIBFFI
        select BR2_PACKAGE_PCRE_UCP if BR2_PACKAGE_PCRE
        select BR2_PACKAGE_ZLIB
        depends on BR2_USE_WCHAR # gettext
        depends on BR2_TOOLCHAIN_HAS_THREADS

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
