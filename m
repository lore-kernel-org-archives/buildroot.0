From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 18:49:26 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/zstd: build multithreaded
 library if supported
In-Reply-To: <20201204095703.4714-1-patrickdepinguin@gmail.com>
References: <20201204095703.4714-1-patrickdepinguin@gmail.com>
Message-ID: <20210102184926.2e28fd81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri,  4 Dec 2020 10:57:01 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> libzstd.so is built without multi-threading support by default.
> The 'HAVE_THREAD' flag is not respected by lib/Makefile, only by
> programs/Makefile.
> 
> Use the %-mt recipe in lib/Makefile to enable multithreading.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Your patch is fixing this for the target variant of zstd, but to me it
seems like the host variant also builds the library and programs
separately, so it is probably affected by the same issue, isn't it ?

Also, in your PATCH 2/2 you mention that zstd also supports cmake and
meson. Would switching to cmake-package or meson-package simplify a bit
this issue and generally what zstd.mk looks like ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
