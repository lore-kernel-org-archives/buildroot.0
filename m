From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 May 2020 14:10:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump version to 1.8.0
In-Reply-To: <20200510103257.GA12594@coltrane>
References: <20200503063730.GA1839@coltrane>
 <20200509231926.543cdf35@windsurf.home>
 <20200510103257.GA12594@coltrane>
Message-ID: <20200510141013.33820f4a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Koen,

On Sun, 10 May 2020 12:32:58 +0200
Koen Martens <gmc@sonologic.nl> wrote:

> src/kj/exception.c++: In function ?void kj::{anonymous}::terminateHandler()?:
> src/kj/exception.c++:429:15: error: ?current_exception? is not a member of ?std?
>    auto eptr = std::current_exception();

The correct dependency for this is:

	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735

See package/boost and package/squid.

It is *almost* the same as
BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS, except that
toolchains with gcc >= 7.x are not affected.

Could you try with that ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
