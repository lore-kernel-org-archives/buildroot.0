From: Koen Martens <gmc@sonologic.nl>
Date: Sat, 16 May 2020 09:52:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump version to 1.8.0
In-Reply-To: <20200510141013.33820f4a@windsurf.home>
References: <20200503063730.GA1839@coltrane>
 <20200509231926.543cdf35@windsurf.home>
 <20200510103257.GA12594@coltrane>
 <20200510141013.33820f4a@windsurf.home>
Message-ID: <20200516075227.GA31946@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 10, 2020 at 02:10:13PM +0200, Thomas Petazzoni wrote:
> On Sun, 10 May 2020 12:32:58 +0200
> Koen Martens <gmc@sonologic.nl> wrote:
> 
> > src/kj/exception.c++: In function ?void kj::{anonymous}::terminateHandler()?:
> > src/kj/exception.c++:429:15: error: ?current_exception? is not a member of ?std?
> >    auto eptr = std::current_exception();
> 
> The correct dependency for this is:
> 
> 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 
> See package/boost and package/squid.
> 
> It is *almost* the same as
> BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS, except that
> toolchains with gcc >= 7.x are not affected.
> 
> Could you try with that ?

Sure, did that and looks good! I'll resubmit the patch with that new
dependency. Thanks, I'd never have thought that up myself.

Cheers,

Koen
