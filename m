From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Feb 2019 11:07:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: add optional iptables
 dependency
In-Reply-To: <20190203180416.32140-1-fontaine.fabrice@gmail.com>
References: <20190203180416.32140-1-fontaine.fabrice@gmail.com>
Message-ID: <20190204100750.GB17819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-02-03 19:04 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 15db1969e5..f9df66b039 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -64,6 +64,13 @@ else
>  SYSTEMD_CONF_OPTS += -Delfutils=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_IPTABLES),y)
> +SYSTEMD_DEPENDENCIES += iptables
> +SYSTEMD_CONF_OPTS += -Dlibiptc=true
> +else
> +SYSTEMD_CONF_OPTS += -Dlibiptc=false
> +endif
> +
>  # Both options can't be selected at the same time so prefer libidn2
>  ifeq ($(BR2_PACKAGE_LIBIDN2),y)
>  SYSTEMD_DEPENDENCIES += libidn2
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
