From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 May 2014 23:04:14 +0200
Subject: [Buildroot] [PATCH 7 of 7] mkpasswd: change version from
 'undefined' to 'buildroot-$(BR2_VERSION)'
In-Reply-To: <752fa92b51b8ef9eeaec.1399822731@argentina>
References: <patchbomb.1399822724@argentina>
 <752fa92b51b8ef9eeaec.1399822731@argentina>
Message-ID: <20140511210414.GK3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-11 17:38 +0200, Thomas De Schampheleire spake thusly:
> The sources of the mkpasswd package are shipped with Buildroot, rather than
> downloaded from an external location. As a result, no explicit version is
> defined, causing build messages and build directory to show 'undefined' as
> version.
> 
> This patch sets the version for mkpasswd to 'buildroot-$(BR2_VERSION), which
> would for example expand to 'buildroot-2014.05'.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mkpasswd/mkpasswd.mk |  2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
> --- a/package/mkpasswd/mkpasswd.mk
> +++ b/package/mkpasswd/mkpasswd.mk
> @@ -10,6 +10,8 @@
>  HOST_MKPASSWD_SOURCE =
>  HOST_MKPASSWD_LICENSE = GPLv2+
>  
> +HOST_MKPASSWD_VERSION = buildroot-$(BR2_VERSION)
> +
>  define HOST_MKPASSWD_BUILD_CMDS
>  	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
>  		package/mkpasswd/mkpasswd.c package/mkpasswd/utils.c \

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
