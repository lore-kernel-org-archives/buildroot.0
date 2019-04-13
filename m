From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 18:24:22 +0200
Subject: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config
 in cross file
In-Reply-To: <20190403183202.19682-1-joerg.krause@embedded.rocks>
References: <20190403183202.19682-1-joerg.krause@embedded.rocks>
Message-ID: <20190413182422.7e8f5f22@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

+Peter Seiderer in Cc.

On Wed,  3 Apr 2019 20:32:01 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Since version 0.49.0 the Meson build system has native support for
> looking for `libgcrypt-config` if no pkg-config file is found. As the
> latest version 1.8.4 of libgcrypt does not provide a .pc file, using
> `libgcrypt-config` is the only way for detecting the required libraries
> when linking agains libgrypt.
> 
> The `libgcrypt-config` entry is necessary for updating package mpd,
> which switched from the Autotools to the Meson build system when bumping
> from version 0.20 to 0.21.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

As I said in my previous reply, I'm not too happy with this
libgcrypt-config variable creeping into the global cross-compilation
file. Can we instead look at extending what Peter Seiderer is doing in
http://patchwork.ozlabs.org/patch/1081486/ and allow some per-package
additions to the per-package cross-compilation file ? Peter's patch
does it for CFLAGS/CXXFLAGS/LDFLAGS, we could perhaps do the same with
arbitrary program paths ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
