From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 21:54:29 +0100
Subject: [Buildroot] [PATCH v5 2/4] bdwgc: Add new package
In-Reply-To: <1416869790-12988-3-git-send-email-paguilar@paguilar.org>
References: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>
 <1416869790-12988-3-git-send-email-paguilar@paguilar.org>
Message-ID: <20141126215429.6108bd30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pedro Aguilar,

On Mon, 24 Nov 2014 23:56:28 +0100, Pedro Aguilar wrote:
> bdwgc is a garbage collector for C and C++. The Boehm-Demers-Weiser
> conservative garbage collector can be used as a garbage collecting
> replacement for C 'malloc' or C++ 'new'.
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Applied to next, but after doing quite a number of changes:

    [Thomas:
     - drop the dependency on host-bdwgc, since it is not needed. Only
       host-guile will need host-bdwgc, but bdwgc itself doesn't need
       host-bdwgc.
     - add dependency on host-pkgconf, needed to detect libatomic_ops
     - add --with-libatomic-ops=yes to force bdwgc to use the system
       libatomic_ops, and not the internal one.
     - instead of using BDWGC_LIBTOOL_PATCH = NO (needed to avoid patching
       libtool because the libtool version used by bdwgc does not have a
       corresponding patch in Buildroot), use BDWGC_AUTORECONF = YES,
       which generates a proper libtool (without this, some -L/usr/lib
       flags are added by libtool).]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
