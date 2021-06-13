From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 13 Jun 2021 12:57:24 +0300
Subject: [Buildroot] [PATCH 1/1] package/seatd: disable -Werror
In-Reply-To: <20210612211502.594066-1-fontaine.fabrice@gmail.com>
References: <20210612211502.594066-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613125724.GB577852@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Jun 2021 23:15:02 +0200 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> Disable -Werror to avoid the following build failure which is raised
> since the addition of the package in commit
> daae31149017cbf8b03634cfc56da132f7e1ad83
> 
> ../seatd/seat.c: In function 'seat_activate_device':
> ../seatd/seat.c:374:48: error: unused parameter 'client' [-Werror=unused-parameter]
>   374 | static int seat_activate_device(struct client *client, struct seat_device *seat_device) {
>       |                                 ~~~~~~~~~~~~~~~^~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0ec925aab23d83c52684f5fea7a4395c93a674c4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/seatd/seatd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
> index 2abcefbfaa..bf582f0d1d 100644
> --- a/package/seatd/seatd.mk
> +++ b/package/seatd/seatd.mk
> @@ -13,7 +13,8 @@ SEATD_INSTALL_STAGING = YES
>  
>  SEATD_CONF_OPTS += \
>  	-Dman-pages=disabled \
> -	-Dexamples=disabled
> +	-Dexamples=disabled \
> +	-Dwerror=false
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
>  SEATD_CONF_OPTS += -Dlogind=enabled
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210613/db4ed2d4/attachment.asc>
