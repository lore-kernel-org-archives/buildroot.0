From: Waldemar Brodkorb <wbx@uclibc-ng.org>
Date: Mon, 21 Jul 2014 18:55:51 +0200
Subject: [Buildroot] uClibc-ng
In-Reply-To: <148124bb-7b66-4363-b171-f0164dab3ced@email.android.com>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
 <148124bb-7b66-4363-b171-f0164dab3ced@email.android.com>
Message-ID: <20140721165551.GH4431@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas De Schampheleire wrote,

> Hi Waldemar,
> 
> Waldemar Brodkorb <wbx@uclibc-ng.org> schreef:
> >Hello Embedded Linux Hackers,
> >
> Interesting development!  One question: how do you see musl vs
> uclibc-ng in the future? At this moment uclibc supports more
> architectures, but this may change. Do you think both should/can
> coexist? What are the distinctive features of uclibc over musl,
> according to you?

I think both can coexist for a while. uClibc is more compatible to
glibc, so most of the software packages used on embedded systems are
working fine without patching. Musl is relatively new and there are
patches required to make some stuff work. Alpine Linux, Sabotage and
OpenADK have a lot of patches, fixing musl issues.

uClibc has support for non-MMU systems. uClibc can be configured at 
build time and can be made smaller than musl. Musl can be used to
have a complete static linked system, uClibc still requires
libgcc_so.so for some threading functions. uClibc is widely used
in the embedded Linux world, musl is a newcomer.

For musl you need to patch gcc. 4.9.x does not include support for
it.

It is just good to have a choice.
At the time all software packages working fine with musl and support
for it is added to gcc and all architectures and MMU-less systems
are supported, uClibc might be obsolete.

best regards
 Waldemar
