From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Apr 2018 18:43:19 +0200
Subject: [Buildroot] [PATCH] systemd: add compatibility symlink for
 'shutdown'
In-Reply-To: <20180413121830.31570-1-anssi.hannula@bitwise.fi>
References: <20180413121830.31570-1-anssi.hannula@bitwise.fi>
Message-ID: <20180413164319.GA2307@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anssi, All,

On 2018-04-13 15:18 +0300, Anssi Hannula spake thusly:
> In addition to the 'halt', 'poweroff', 'reboot' symlinks pointing to
> systemctl, add 'shutdown'.
> 
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 3bc322c..9600fe9 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -329,6 +329,7 @@ define SYSTEMD_INSTALL_INIT_HOOK
>  	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
>  	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
>  	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
> +	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/shutdown
>  	ln -fs ../../../lib/systemd/system/multi-user.target \
>  		$(TARGET_DIR)/etc/systemd/system/default.target
>  endef
> -- 
> 2.8.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
