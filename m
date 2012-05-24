From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 May 2012 19:42:38 +0200
Subject: [Buildroot] connman requirement for resolver in toolchain
In-Reply-To: <1337872251.4288.13.camel@feynman.coloradoengineeringinc.com>
 (Michael J. Hammel's message of "Thu, 24 May 2012 09:10:51 -0600")
References: <1337223711.1915.3.camel@galileo.gfxmuse.org>
 <20120517102649.6a6dc5ab@skate>
 <1337872251.4288.13.camel@feynman.coloradoengineeringinc.com>
Message-ID: <877gw1bhm9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael J Hammel <buildroot@graphics-muse.org> writes:

Hi,

 Michael> I'm doing the latter.  I've diffed my uClibc config with the
 Michael> one for the matching release in Buildroot and have enabled
 Michael> what I think is relevant for resolver support, re: I
 Michael> configured uClibc with the resolver and nsl stubs.  However,
 Michael> buildroot still doesn't allow me to configure connman.

 Michael> I looked at connman's Config.in and it looks like this:

 Michael> comment "connman needs a toolchain with resolver support"
 Michael>     depends on !(BR2_UCLIBC_VERSION_SNAPSHOT ||
 Michael> BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc ||
 Michael> BR2_TOOLCHAIN_CTNG_eglibc

 Michael> So if I'm using an external toolchain with uClibc it doesn't
 Michael> allow me to configure connman, correct?  Is the uClibc
 Michael> resolver stub considered unsufficient for use with connman?
 Michael> Do I need to switch to glibc?

You will need atleast uClibc 0.9.33. Connman was added before 0.9.33 was
released, so at that time you needed a snapshot version of uClibc. I've
recently updated this check in the next branch (and moved to connman
1.0) so you can actually select it with uClibc 0.9.33 / ctng toolchains:

http://git.buildroot.net/buildroot/commit/?h=next&id=96b109ad2a4ea0a4575526f0d0353d916b5122dd

Either cherrypick this commit, use the next branch or wait until I merge
next into the main branch in ~1 weeks time (E.G. right after I release
2012.05).

-- 
Bye, Peter Korsgaard
