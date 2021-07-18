From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 09:48:15 +0200
Subject: [Buildroot] [PATCH 2/2] package/libuci: ignore CVE-2019-15513
In-Reply-To: <20210717214854.1150900-2-fontaine.fabrice@gmail.com>
References: <20210717214854.1150900-1-fontaine.fabrice@gmail.com>
 <20210717214854.1150900-2-fontaine.fabrice@gmail.com>
Message-ID: <20210718074815.GA12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-17 23:48 +0200, Fabrice Fontaine spake thusly:
> Commit 19e29ffc15dbd958e8e6a648ee0982c68353516f is older than LIBUCI_VERSION

This was a bit crpytic for me, so I rewrote the commit log to explain
that the CVE was fixed in that commit.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuci/libuci.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
> index ae70b6f2af..5288b08406 100644
> --- a/package/libuci/libuci.mk
> +++ b/package/libuci/libuci.mk
> @@ -13,6 +13,9 @@ LIBUCI_CPE_ID_VENDOR = openwrt
>  LIBUCI_INSTALL_STAGING = YES
>  LIBUCI_DEPENDENCIES = libubox
>  
> +# Commit 19e29ffc15dbd958e8e6a648ee0982c68353516f is older than LIBUCI_VERSION

Ditto.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +LIBUCI_IGNORE_CVES += CVE-2019-15513
> +
>  ifeq ($(BR2_PACKAGE_LUA_5_1),y)
>  LIBUCI_DEPENDENCIES += lua
>  LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
