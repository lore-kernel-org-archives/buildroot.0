From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2011 21:02:40 +0100
Subject: [Buildroot] Conditional patches (php package)
In-Reply-To: <4D753524.5050306@daccii.it>
References: <4D753524.5050306@daccii.it>
Message-ID: <20110307210240.66796e0b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 07 Mar 2011 20:42:28 +0100
Daniele Salvatore Albano - Lavoro <info@daccii.it> wrote:

> i'm trying to add support for php 5.3(.5), mantaining the ability to 
> compile php 5.2(.17) for compatibility reasons.
> 
> The main problem is a patch that is in php 5.3.5 sources but not in 
> 5.2.17 sources so it needed to be applied conditionally.
> 
> The, only one, patch is 
> php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch 
> and it seems related to an extension (gmp in the name).
> 
> Can someone give me an hint?

The package infrastructure has the following behaviour :

 *) If there are patches named <pkg>-<pkgversion>*.patch, then they are
    applied, and only those are applied.

 *) Otherwise, patches named <pkg>*.patch are applied, as well as
    <pkg>-<pkgversion>/*.patch if the <pkg>-<pkgversion> directory
    exists.

See the $(BUILD_DIR)/%/.stamp_patched: target in
package/Makefile.package.in for more details.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
