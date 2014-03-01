From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Mar 2014 20:06:13 +0100
Subject: [Buildroot] [PATCH 0/17 v2] Add new virtual-package
	infrastructure
In-Reply-To: <cover.1393695127.git.yann.morin.1998@free.fr>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJtEhxwAMb6r1ngWguB-yagGayBpyBvKE4ePiyCv7cy1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Sat, Mar 1, 2014 at 6:32 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Hello All!
>
> Here is a quick series implementing a new infrastructure for virtual
> packages.
>
> Basically, all a virtual package has to do in its .mk is:
>
>     $(eval $(virtual-package))
>
> There is no need to:
>   - define the dependency against the provider,
>   - define _SOURCE=""  (empty)
>
> But it requires the config options for the virtual package be named
> after the package, eg.:
>
>     package | Selector option        | Provider option
>     --------+------------------------+-----------------------------
>     libegl  | BR2_PACKAGE_HAS_LIBEGL | BR2_PACKAGE_PROVIDES_LIBEGL
>     jpeg    | BR2_PACKAGE_HAS_JPEG   | BR2_PACKAGE_PROVIDES_JPEG
>
> So the series:
>   - starts with renaming some config options in the current virtual
>     packages
>   - then introduces the new virtual-package infra and the associated
>     documentation in the manual
>   - and finally converts the virtual packages over to the new infra.
>
> Special thanks to ?ric for his initial work on the manual, which
> prompted the idea for this new infra! That's partly for this that I
> kept his initial change to the manual almost unmolested.
>
>
> Changes v1 -> v2:
>   - include ?ric's virtual package tutorial to the manual  (?ric)
>   - split the renaimg of config options from the actual conversion to
>     the virtual-package infra
>   - rebase on top of master after post-release merge
>   - add host-virtual-package (will be needed by a pending lua-related
>     series by Fran?ois)
>
>
> Regards,
> Yann E. MORIN.
>
>
> ----------------------------------------------------------------
> Yann E. MORIN (16):
>       package/libgles: rename the _HAS and _PROVIDES variables
>       package/libegl: rename the _HAS and _PROVIDES variables
>       package/libopenmax: rename the _HAS and _PROVIDES variables
>       package/libopenvg: rename the _HAS and _PROVIDES variables
>       package/luainterpreter: rename the _HAS and _PROVIDES variables
>       package/lua: rename config options
>       packages: add infrastructure for virtual packages
>       manual: update the virtual package section with the new infra-structure
>       package/powervr: convert to the virtual-package infrastructure
>       package/libgles: convert to the virtual-package infrastructure
>       package/libegl: convert to the virtual-package infrastructure
>       package/libopenmax: convert to the virtual-package infrastructure
>       package/libopenvg: convert to the virtual-package infrastructure
>       package/luainterpreter: convert to the virtual-package infrastructure
>       package/jpeg: convert to the virtual-package infrastructure
>       package/cryptodev: convert to the virtual-package infrastructure
>
> eric.le.bihan.dev at free.fr (1):
>       manual: add virtual package tutorial
>

[Samuel: for the whole series, with the minor fix in patch 9/17]
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
