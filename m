From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 00:40:19 +0200
Subject: [Buildroot] PATCH [1/2] try2: make Makefile.autotools.in not	to
	use hardcoded x11r7 name when patching
In-Reply-To: <46FD8D6A.40605@promwad.com>
References: <46FD70EC.2010104@promwad.com> <20070928203604.GW20951@aon.at>
	<46FD8D6A.40605@promwad.com>
Message-ID: <20070928224019.GG20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 02:25:30AM +0300, Ivan Kuten wrote:
>> This may be obvious from the context, but is @D guaranteed to exist?
>
>Not sure - need take a look.
>
>2nd try, introducing DIR_PREFIX:

Excellent, thanks!

I come to think that a _DIR_SUFFIX for the patch-dir may
be needed also (if we have an occurrance in the tree already, that is.
No need to introduce this prematurely). I'm currently not aware of such
packages, though.

One nice example that, if it is handled properly by the autotools.in is
package/gmp or mpfr for that matter.

This package shows nicely what the autotools.in should provide in the
long run:
- downloading a PATCH_FILE to the dl/
- patching package/$name/$name$version
  or 
  patching package/$name/$version
  or 
  patching package/$name/$($(name)_patch_regex)
  or the like
- in configure, honor PREFERRED_LIB_FLAGS et al
- $(STRIP) the target, perhaps. Distinguish between binaries and libs
- optionally install headers if BR2_HAVE_HEADERS
- package-specific additional {C,LD,CPP,...}FLAGS
- package-specific additional configure-opts
- knowledge if both staging and target or only one of these should be
  populated with libs/binaries
