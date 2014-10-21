From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 18:34:03 +0200
Subject: [Buildroot] [PATCH 4/4] systemd: add input group
In-Reply-To: <1413901599-27312-4-git-send-email-gustavo@zacarias.com.ar>
References: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
 <1413901599-27312-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021163403.GE3912@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-21 11:26 -0300, Gustavo Zacarias spake thusly:
> It's used by 50-default-udev.rules for input-class devices.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index fd19bff..75a32f4 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -179,6 +179,7 @@ define SYSTEMD_USERS
>  	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
>  	systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
>  	systemd-network -1 systemd-network -1 * - - - Network Manager
> +	- - input -1 * - - - Input device group
>  endef
>  
>  define SYSTEMD_DISABLE_SERVICE_TTY1
> -- 
> 2.0.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
