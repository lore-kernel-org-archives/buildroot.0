From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 22:12:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/polkit: add linux-pam as a
 dependency if linux-pam is selected
In-Reply-To: <20200315205610.2227486-1-aduskett@gmail.com>
References: <20200315205610.2227486-1-aduskett@gmail.com>
Message-ID: <20200315211204.GL19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-15 13:56 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Without linux-pam built first, polkit will throw a configuration error:
> configure: error: Could not find pam/pam-devel, please install the needed packages.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/polkit/polkit.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
> index bc9e3580ab..efd788a05c 100644
> --- a/package/polkit/polkit.mk
> +++ b/package/polkit/polkit.mk
> @@ -24,6 +24,7 @@ POLKIT_CONF_OPTS = \
>  	--disable-libsystemd-login
>  
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +POLKIT_DEPENDENCIES += linux-pam
>  POLKIT_CONF_OPTS += --with-authfw=pam
>  else
>  POLKIT_CONF_OPTS += --with-authfw=shadow
> -- 
> 2.24.1
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
