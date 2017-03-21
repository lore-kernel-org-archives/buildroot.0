From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 21 Mar 2017 18:11:48 +0200
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable wordexp
 functionality
In-Reply-To: <20170321170614.161e8eec@free-electrons.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
 <20170321170614.161e8eec@free-electrons.com>
Message-ID: <1490112708.19767.139.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-03-21 at 17:06 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Mar 2017 18:02:36 +0200, Andy Shevchenko wrote:
> 
> > The commit d7c54cb0c0cf ("bluez5_utils: not available with uClibc")
> > disables bluez5_utils (most of them) to be built with uClibc.
> > Looking to
> > the development of BlueZ user space support that commit basically
> > makes
> > the bluez5_utils package somewhat piece of junk.
> 
> Not sure I understand what you mean here.

Without new tools like bluetoothctl it's impossible to use Bluetooth
modules, such as BCM43341 based.

hcitool, hciattach, hciconfig, etc (see the list under DEPRECATED in
Makefile.tools in bluez5_utils sources) does *not* work with it.

> > Since bluez5_utils 5.44
> > deprecates all previously used tools and focuses on btmgmt and
> > bluetoothctl we need to restore status quo.
> 
> Same here, I don't understand.

See above.

> 
> > diff --git a/package/uclibc/uClibc-ng.config
> > b/package/uclibc/uClibc-ng.config
> > index 528bce965..91082975e 100644
> > --- a/package/uclibc/uClibc-ng.config
> > +++ b/package/uclibc/uClibc-ng.config
> > @@ -32,6 +32,7 @@ UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
> > ?UCLIBC_HAS_PRINTF_M_SPEC=y
> > ?# UCLIBC_HAS_REGEX_OLD is not set
> > ?# UCLIBC_HAS_FNMATCH_OLD is not set
> > +UCLIBC_HAS_WORDEXP=y
> > ?UCLIBC_HAS_NFTW=y
> > ?UCLIBC_HAS_FTW=y
> > ?UCLIBC_HAS_GNU_GLOB=y
> 
> Could you comment on the size impact of enabling this option?

I can do it (on x86).

>  I.e the
> size of uClibc without/with this option enabled, for example on ARM?

No, I have no ARM board to test this. Or you mean to built entire stack
what I'm using for some arbitrary ARM board?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
