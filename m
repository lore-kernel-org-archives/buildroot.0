From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 15:13:06 +0200
Subject: [Buildroot] nano package fail to build; cannot include curses.h
In-Reply-To: <CAF8i9mMsfvAknQ-hOxgf8gUqx_6-8WvPFtZW=agV_fZi1Ek3QA@mail.gmail.com>
References: <CAF8i9mNJroNYDMzHDOjwpWX6uwNOY=BN3Yj+RwmgfFqnB2OpLA@mail.gmail.com>
 <20200509120149.0540a23c@windsurf.home>
 <CAF8i9mMsfvAknQ-hOxgf8gUqx_6-8WvPFtZW=agV_fZi1Ek3QA@mail.gmail.com>
Message-ID: <20200509151306.7c58cf1d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello William,

On Sat, 9 May 2020 09:04:03 -0400
William Tambe <tambewilliam@gmail.com> wrote:

> diff --git a/configs/iron_defconfig b/configs/iron_defconfig
> new file mode 100644
> index 0000000000..29cc533f7d
> --- /dev/null
> +++ b/configs/iron_defconfig
> @@ -0,0 +1,15 @@
> +BR2_iron=y
> +BR2_STATIC_LIBS=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/iron-toolchain/"
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-elf"

Usually, toolchains named $(ARCH)-elf are bare metal toolchains, i.e
toolchains that don't have a C library with support for an operating
system. Are you sure this toolchain is using glibc ?

In any case, since we don't have access to your toolchain, we have no
way to reproduce/investigate. On other architectures, nano builds fine.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
