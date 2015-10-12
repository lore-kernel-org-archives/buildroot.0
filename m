From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 22:35:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/tvheadend: add dbus as optional
 dependency
In-Reply-To: <1444680585-31135-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444680585-31135-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151012223519.3b352aed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 12 Oct 2015 22:09:44 +0200, Bernd Kuhls wrote:
> Dbus is an optional dependency for tvheadend:
> https://github.com/tvheadend/tvheadend/commit/9c7b6047d2e3040e14cdba89f46d8acb2a36a115
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/tvheadend.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index db4ee3a..b901c4e 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -18,6 +18,10 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
>  TVHEADEND_DEPENDENCIES += avahi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_DBUS),y)
> +TVHEADEND_DEPENDENCIES += dbus
> +endif

Can you use --enable-dbus-1 / --disable-dbus-1 ? This way, if the
BR2_PACKAGE_DBUS=y but the detection fails, the build will error out.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
