From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Oct 2012 11:41:54 +0200
Subject: [Buildroot] external toolchains and sysroot
In-Reply-To: <50813429.3010107@6wind.com>
References: <508118F0.3030202@6wind.com> <20121019093805.GA2382@mail.sceen.net>
 <50812162.7090809@6wind.com> <20121019095730.GA6397@mail.sceen.net>
 <20121019100213.GA7355@mail.sceen.net> <50813429.3010107@6wind.com>
Message-ID: <20121021114154.3d23d89b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 19 Oct 2012 13:06:17 +0200, Jean-Mickael Guerin wrote:

> Not exactly: let the toolchain use its own sysroot, and use -I /-L to 
> look up in the staging directory. Original sysroot is read-only & 
> shared, staging belongs to your build directory.
> 
> In another words my point is that the copy of sysroot is useless,
> using --sysroot=<my copy of built-in sysroot path, computed from the 
> toolchain's compiler> cannot be safer than let it use the built-in
> syroot. Removing this copy will save time, space, and compatible
> whatever the directory layout of the toolchain.

I am the one who wrote the external toolchain support as it is now.
Initially, things were working as you suggested, i.e keep the sysroot
in its original place, and use -I/-L to point to the headers and
libraries that Buildroot adds. It /mostly/ works, but causes for some
packages horrible problems with libtool.

I don't have the time right now to dig into the archives, but this is a
problem we worked on around December 2008, and it has allowed the
external toolchain support to work nicely and properly since then.

If you have problems with external toolchain support, don't hesitate to
point me to the toolchain you're using, and how to reproduce your
problem. I am fairly sure it is not related to the fact that we're
copying the sysroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
