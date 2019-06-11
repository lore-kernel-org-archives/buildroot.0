From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 23:00:43 +0200
Subject: [Buildroot] [PATCH 1/2] infra/pkg-meson: allow packages to
 expand their CFLAGS/CXXFLAGS/LDFLAGS
In-Reply-To: <4a99ac5f8c5f10cfc9bb20b33423aceca4773fa0.1560286529.git.yann.morin.1998@free.fr>
References: <cover.1560286529.git.yann.morin.1998@free.fr>
 <4a99ac5f8c5f10cfc9bb20b33423aceca4773fa0.1560286529.git.yann.morin.1998@free.fr>
Message-ID: <20190611230043.6d986a3c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Jun 2019 22:55:43 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Some packages will want to pass extra CFLAGS, CXXFLAGS, or LDFLAGS.
> For example, they may want/have to pass $(TARGET_NLS_LIBS), like
> libglib2 when the toolchain is based on musl or uClibc (because meson
> does not have all the necessary infra internally to properly and reliably
> detect the presence of, or need for linking with, -lintl.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>

This looks highly similar to
http://patchwork.ozlabs.org/patch/1089760/, which seems more complete.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
