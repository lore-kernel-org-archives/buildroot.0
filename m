From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Thu, 24 May 2012 09:10:51 -0600
Subject: [Buildroot] connman requirement for resolver in toolchain
In-Reply-To: <20120517102649.6a6dc5ab@skate>
References: <1337223711.1915.3.camel@galileo.gfxmuse.org>
 <20120517102649.6a6dc5ab@skate>
Message-ID: <1337872251.4288.13.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2012-05-17 at 10:26 +0200, Thomas Petazzoni wrote:
> If you are building your uClibc toolchain externally with Crosstool-NG,
> then it is up to you to adjust the uClibc configuration. You can either:
> 
>  *) Choose to make it identical to the uClibc configuration that
>     Buildroot uses for its internal backend, which gives you a good
>     certainty that packages will build
> 
>  *) Choose to progressively adjust your uClibc configuration to match
>     the particular requirements of the specific packages you're using.

I'm doing the latter.  I've diffed my uClibc config with the one for the
matching release in Buildroot and have enabled what I think is relevant
for resolver support, re: I configured uClibc with the resolver and nsl
stubs.  However, buildroot still doesn't allow me to configure connman.

I looked at connman's Config.in and it looks like this:

comment "connman needs a toolchain with resolver support"
    depends on !(BR2_UCLIBC_VERSION_SNAPSHOT ||
BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc ||
BR2_TOOLCHAIN_CTNG_eglibc

So if I'm using an external toolchain with uClibc it doesn't allow me to
configure connman, correct?  Is the uClibc resolver stub considered
unsufficient for use with connman?  Do I need to switch to glibc?

Also, it appears that BR2_TOOLCHAIN_CTNG_eglibc appears twice in that
dependency test.  Typo?

This is from the 2012.02 tarball release.  No patches.

Thanks.
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
