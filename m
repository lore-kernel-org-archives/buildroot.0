From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 May 2014 23:03:41 +0200
Subject: [Buildroot] [PATCH 6 of 7] makedevs: change version from
 'undefined' to 'buildroot-$(BR2_VERSION)'
In-Reply-To: <7b8eb2bf5c64030a872b.1399822730@argentina>
References: <patchbomb.1399822724@argentina>
 <7b8eb2bf5c64030a872b.1399822730@argentina>
Message-ID: <20140511210341.GJ3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-11 17:38 +0200, Thomas De Schampheleire spake thusly:
> The sources of the makedevs package are shipped with Buildroot, rather than
> downloaded from an external location. As a result, no explicit version is
> defined, causing build messages and build directory to show 'undefined' as
> version.
> 
> This patch sets the version for makedevs to 'buildroot-$(BR2_VERSION), which
> would for example expand to 'buildroot-2014.05'.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr> 

Regards,
Yann E. MORIN.

> ---
>  package/makedevs/makedevs.mk |  2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
> --- a/package/makedevs/makedevs.mk
> +++ b/package/makedevs/makedevs.mk
> @@ -8,6 +8,8 @@
>  MAKEDEVS_SOURCE =
>  HOST_MAKEDEVS_SOURCE =
>  
> +MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
> +
>  define MAKEDEVS_BUILD_CMDS
>  	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
>  		package/makedevs/makedevs.c -o $(@D)/makedevs

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
