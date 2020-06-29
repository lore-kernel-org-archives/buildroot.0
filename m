From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 22:59:12 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/qemu: add spice support
In-Reply-To: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
References: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
Message-ID: <20200629225912.6934261e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Jun 2020 15:50:00 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> update to add qemu spice support
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/qemu/Config.in | 9 +++++++++
>  package/qemu/qemu.mk   | 8 +++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 33d4cccd7b..3de73b69ec 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -127,6 +127,15 @@ config BR2_PACKAGE_QEMU_SDL
>  comment "SDL frontend needs a toolchain w/ dynamic library"
>  	depends on BR2_STATIC_LIBS
>  
> +config BR2_PACKAGE_QEMU_SPICE
> +	bool "Enable Spice frontend"
> +	depends on BR2_PACKAGE_SPICE

I am wondering why for this one we are adding a sub-option and not
using automatic detection of BR2_PACKAGE_SPICE=y in the .mk file, like
you've done for VNC and usb-redir.

On the other hand, we do have already a bunch of sub-options to
configure Qemu. We're not very consistent here :/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
