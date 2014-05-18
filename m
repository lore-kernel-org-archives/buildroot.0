From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 May 2014 10:26:42 +0200
Subject: [Buildroot] How to disable patches for libtool
In-Reply-To: <SNT146-W8595A45AC23B3F05582F95A8300@phx.gbl>
References: <SNT146-W8595A45AC23B3F05582F95A8300@phx.gbl>
Message-ID: <20140518102642.04683fb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephen Thomas,

It would be nice if you could send a plain text only version of your
e-mail.

On Sun, 18 May 2014 00:04:26 +0100, Stephen Thomas wrote:

> I have been playing around with buildroot and have managed to hack something that uses graphite in GCC as this speeds up compilation and can produce slightly smaller code.

Nice! I haven't looked at some of the new gcc things such as graphite,
gold and al.

> I have hacked a couple of things, which I am a bit ashamed to admit. First I hardcoded the config for binutils to only build the gold tools, and in gcc and binutils I disabled the search for the isl and cloog libraries. However, one problem that I cannot hack around is the need to add an isl package. The changes were as follows in the gcc.mk file: HOST_GCC_COMMON_DEPENDENCIES = \-       host-binutils \        host-gmp \+       host-isl \        host-mpfr \+       host-mpc \+       host-cloog \+       host-binutils \

I am not sure why you consider adding a package for ISL is a hack. If
gcc depends on it, we surely need to create a package for it.

> But the problem that I cannot get around is how to patch the file ltmain.sh in isl version 0.13. I have a patch that patches this file and this causes the one from the buildroot to fail. So all I do is just touch the build/isl-0.13/.stamp_patched file or whatever and I can continue the build. But is there a way to not have this file patched from the buildroot? I have looked into the packages and I didn't see this done anywhere. If it has been would someone please be kind enough to point me in the right direction?

You could always use <pkg>_LIBTOOL_PATCH = NO in this package to tell
Buildroot to not apply its libtool patches. Though it would be nice to
see exactly what your own ltmain.sh patch is doing, and why it
conflicts with our own libtool patch.

Do you intend to submit your patches at some point? It would be nice to
see such improvements make their way into the mainline Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
