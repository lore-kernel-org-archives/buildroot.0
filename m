From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:17:14 +0100
Subject: [Buildroot] [PATCH 10/12] package/x11r7/xserver_xorg-server:
 bump version to 1.18.0
In-Reply-To: <1450522892-14611-10-git-send-email-bernd.kuhls@t-online.de>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
 <1450522892-14611-10-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219141714.5da170a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

Adding Arnout in Cc, since he is our legacy handling expert :)

On Sat, 19 Dec 2015 12:01:30 +0100, Bernd Kuhls wrote:
> - added legacy handling for BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17

Is this really needed? In any case, without legacy handling, the thing
will automatically fall back to version 1.18, which is what we want. So
I'm questioning whether legacy handling is needed.

> - legacy handling for BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
>   is not needed because this option is not used by other packages

BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19 is a blind option, so
there is no point in adding legacy handling for it.

> +config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
> +	bool "xserver_xorg-server package was bumped to 1.18"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18

Doing a "select" on an item of a choice doesn't work. See the commit
from Arnout about this:
https://git.busybox.net/buildroot/commit/?id=94d403d709eb5d0c487630b2eb651932bb488470.

> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index 84f0298..3e31dc7 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -64,14 +64,14 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
>  config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
>  	int
>  	default 14 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
> -	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
> +	default 20 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20

I don't see where you are adding the definition of the option
BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20.

I'll mark this patch (and the nouveau patch) as Changes Requested in
patchwork. I don't really have any comments on the nouveau patch, but
since I assumed it depended on this one, I didn't apply it. Can you
resend both once the xserver bump issues are resolved ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
