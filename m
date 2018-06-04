From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 22:34:43 +0200
Subject: [Buildroot] [PATCH] shadowsocks-libev: new package
In-Reply-To: <20180604071626.17528-1-xuminready@gmail.com>
References: <20180604071626.17528-1-xuminready@gmail.com>
Message-ID: <20180604223443.3b130018@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jun 2018 00:16:26 -0700, Min Xu wrote:
> Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
> embedded devices and low-end boxes.
> 
> https://github.com/shadowsocks/shadowsocks-libev
> 
> A patch for BSD-3-Clause licence for libipset is added. It's from libipset's git repo.
> 
> Signed-off-by: Min Xu <xuminready@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-docs-add-BSD-3-Clause-licence.patch       | 52 ++++++++++++++++++++++
>  package/shadowsocks-libev/Config.in                | 12 +++++
>  package/shadowsocks-libev/shadowsocks-libev.hash   |  8 ++++
>  package/shadowsocks-libev/shadowsocks-libev.mk     | 15 +++++++
>  5 files changed, 88 insertions(+)
>  create mode 100644 package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
>  create mode 100644 package/shadowsocks-libev/Config.in
>  create mode 100644 package/shadowsocks-libev/shadowsocks-libev.hash
>  create mode 100644 package/shadowsocks-libev/shadowsocks-libev.mk

I've applied to master, after doing the following changes:

    [Thomas:
     - drop patch adding license file for libipset
     - drop --disable-documentation, it's passed by autotools-package
     - add entry in DEVELOPERS file
     - pass --disable-ssp because the SSP check uses AC_COMPILE_IFELSE()
       so with some toolchains, it think SSP support is available, while
       it's not. And anyway we want SSP to be controlled by Buildroot
       global options, not on a per-package basis.
     - add depends on BR2_USE_MMU, because the code uses fork().]

Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
