From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 19:40:42 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <CAAXf6LWmH2xtBe_P-P+1HJhndDM1BhHZcgJzu9o7JrfwjtwWVg@mail.gmail.com>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina>
 <CAAXf6LXD_7jt42XAG_XgKWKi_+te40hgYNd4mTLbmCDMxfG0QA@mail.gmail.com>
 <20130918183414.45e6a247@skate>
 <CAAXf6LWmH2xtBe_P-P+1HJhndDM1BhHZcgJzu9o7JrfwjtwWVg@mail.gmail.com>
Message-ID: <20130918194042.302e9afe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 18 Sep 2013 19:30:11 +0200, Thomas De Schampheleire wrote:

> Currently there is one option PREFER_STATIC_LIB, with help text:
>           Where possible, build and use static libraries for the
> target.
>           This potentially increases your code size and should only be
>           used if you know what you do.
>           The default is to build dynamic libraries and use those on
>           the target filesystem.
> 
> However, my interpretation of the current usage of this symbol is that
> it is not PREFER_STATIC_LIB, but rather something like
> STATIC_LIB_ONLY. Because some packages are simply not available when
> this is set, instead of building the package with dynamic linking.
> 
> The current name PREFER_STATIC_LIB is also unfortunate in the case
> that dynamic linking is not available because the target does not
> support it, e.g. because of no MMU (thanks for mentioning this, I
> wasn't aware). A name STATIC_LIB_ONLY would also match better here.
> 
> Note that I'm not necessarily requesting we rename the symbol, but I
> find the current situation confusing.
> 
> Maybe we need an extra symbol, ARCH_NEEDS_STATIC_LIB or similar (or
> re-use a possible new !ARCH_HAS_MMU) in addition to a user choice
> PREFER_STATIC_LIB. When a package cannot be linked statically, we only
> check on ARCH_NEEDS_STATIC_LIB. If ARCH_NEEDS_STATIC_LIB is false, and
> PREFER_STATIC_LIB is true, then we build the package dynamically.

The situation definitely needs to be clarified. We have gradually
changed the semantic of BR2_PREFER_STATIC_LIB from "prefer static
libraries" (which doesn't make any sense: you were getting static
libraries for some packages, dynamic for some others) to "use only
static libraries".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
