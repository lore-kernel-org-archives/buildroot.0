From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 30 Mar 2016 22:44:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: Fix musl build
In-Reply-To: <1453586622-21700-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453586622-21700-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459370663.1257.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sa, 2016-01-23 at 23:03 +0100, Bernd Kuhls wrote:
> Ported from
> http://git.alpinelinux.org/cgit/aports/tree/main/iptraf-ng/APKBUILD#n
> 28
> 
> Fixes
> http://autobuild.buildroot.net/results/72b/72b019ce5bb52b8b87d92cce67
> 5708f7b9f8a96e/
> http://autobuild.buildroot.net/results/f67/f67f1c2a627a6d535dd5c00e2e
> e131b5c5a99a0a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> ?package/iptraf-ng/iptraf-ng.mk | 1 +
> ?1 file changed, 1 insertion(+)
> 
> diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-
> ng/iptraf-ng.mk
> index 7313873..404db8b 100644
> --- a/package/iptraf-ng/iptraf-ng.mk
> +++ b/package/iptraf-ng/iptraf-ng.mk
> @@ -11,5 +11,6 @@ IPTRAF_NG_LICENSE_FILES = LICENSE
> ?IPTRAF_NG_DEPENDENCIES = ncurses
> ?
> ?IPTRAF_NG_MAKE_ENV = NCURSES_LDFLAGS="-lpanel -lncurses"
> +IPTRAF_NG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
> ?
> ?$(eval $(autotools-package))

Any reason why this patch is marked as "Changes requested" in patchwork
[1]? The patch does fix the musl build issue, therefor:

Tested-by: J?rg Krause <joerg.krause@embedded.rocks>

[1]?http://patchwork.ozlabs.org/patch/572189/
