From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 May 2019 20:59:11 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libubootenv: fix build
 with musl and static lib
In-Reply-To: <1558455512-31444-1-git-send-email-pjtexier@koncepto.io>
References: <1558455512-31444-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190521205911.5dca7351@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pierre-Jean,

On Tue, 21 May 2019 18:18:32 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Libubootenv is a shared library, so add missing dependency on !BR2_STATIC_LIBS.

I think instead src/CMakeLists.txt should be changed to not force
building a shared library.

> Also add BR2_TOOLCHAIN_USES_MUSL dependency to avoid 'unknown type name 'loff_t''.

And here I'm pretty sure musl provides loff_t, it's probably just a
missing #include.

> +comment "libubootenv application library needs a glibc or uClibc toolchain w/ dynamic library"

The correct comment would be:

comment "libubootenv needs a glibc or uClibc toolchain w/ dynamic library"

but I think it's better to fix the actual problems.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
