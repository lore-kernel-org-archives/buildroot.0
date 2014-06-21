From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Jun 2014 18:03:44 +0200
Subject: [Buildroot] [PATCH v3] package/pifmrds: new package
In-Reply-To: <1403366300-29035-1-git-send-email-yann.morin.1998@free.fr>
References: <1403366300-29035-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140621160344.GA21004@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-06-21 17:58 +0200, Yann E. MORIN spake thusly:
> From: Eric Limpens <limpens@gmail.com>
> 
> We needs three little patches:
>   - one to make the existing Makefile cross-compile friendly
>   - one to pass the LDFLAGS at link time
>   - one to add a missing include
> 
> Signed-off-by: Eric Limpens <limpens@gmail.com>
> [yann.morin.1998 at free.fr: add .mk header; cleanup and split the
>  Makefile patch, add missing include; add comments to all patches]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> diff --git a/package/pifmrds/Config.in b/package/pifmrds/Config.in
> new file mode 100644
> index 0000000..60d01b1
> --- /dev/null
> +++ b/package/pifmrds/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PIFMRDS
> +	bool "pifmrds"
> +	depends on BR2_arm
> +	depends on BR2_LARGEFILE #libsndfile
> +	select BR2_PACKAGE_LIBSNDFILE
> +	help
> +	  pifmrds, FM-RDS transmitter using the Raspberry Pi's PWM
> +
> +	  https://github.com/ChristopheJacquet/PiFmRds
> +
> +comment "pifmrds needs a toolchain w/ largefile"
> +	depends on !BR2_LARGEFILE

Sigh, I forgot to add 'depends on BR2_arm' here too...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
