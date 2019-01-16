From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Jan 2019 07:52:54 +0200
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
In-Reply-To: <20190115224239.26125-1-ps.report@gmx.net>
References: <20190115224239.26125-1-ps.report@gmx.net>
Message-ID: <20190116055253.gzqzf645ahdubv7q@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Jan 15, 2019 at 11:42:38PM +0100, Peter Seiderer wrote:
> +# fixes the following build failures:
> +#
> +# - musl
> +#   ./libcrypto.so: undefined reference to `getcontext'
> +#   ./libcrypto.so: undefined reference to `setcontext'
> +#   ./libcrypto.so: undefined reference to `makecontext'
> +#
> +# - uclibc:
> +#   crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name ?ucontext_t?
> +#
> +ifneq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_TOOLCHAIN_USES_UCLIBC),)

I find the equivalent positive logic condition easier to read:

  ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_TOOLCHAIN_USES_UCLIBC),y)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
