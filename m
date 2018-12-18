From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Dec 2018 20:38:10 +0100
Subject: [Buildroot] [PATCH 3/4] openssh: use BR2_SYSTEM_DEFAULT_PATH as
 default PATH
In-Reply-To: <20181218005116.17435-4-mmayer@broadcom.com>
References: <20181218005116.17435-1-mmayer@broadcom.com>
 <20181218005116.17435-4-mmayer@broadcom.com>
Message-ID: <20181218193810.GE24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-17 16:51 -0800, Markus Mayer spake thusly:
> We use the configuration option BR2_SYSTEM_DEFAULT_PATH to set the
> default PATH in OpenSSH sessions.

Ditto, add a blurb that the value is already quoted blah-blah-blah... ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/openssh/openssh.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 07f3e0d663f6..4ee7727fb9e8 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -11,6 +11,7 @@ OPENSSH_LICENSE_FILES = LICENCE
>  OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
>  OPENSSH_CONF_OPTS = \
>  	--sysconfdir=/etc/ssh \
> +	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
>  	--disable-lastlog \
>  	--disable-utmp \
>  	--disable-utmpx \
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
