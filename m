From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Jun 2014 23:01:31 +0200
Subject: [Buildroot] [PATCH] hdparm: prevent package makefile from
 stripping the hdparm binary
In-Reply-To: <1402519589-29908-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402519589-29908-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140611210131.GA27579@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-11 22:46 +0200, Thomas Petazzoni spake thusly:
> Packages shouldn't strip executables by themselves, so that Buildroot
> controls whether stripping should occur or not. This also fixes the
> build on Blackfin FLAT where stripping actually doesn't work because
> stripping FLAT binaries is not supported.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/7d4/7d4e59c96928a06db5091235bf2eacf462ba8a21/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/hdparm/hdparm.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
> index 1a200fb..0ca3c39 100644
> --- a/package/hdparm/hdparm.mk
> +++ b/package/hdparm/hdparm.mk
> @@ -12,7 +12,8 @@ HDPARM_LICENSE_FILES = LICENSE.TXT
>  define HDPARM_BUILD_CMDS
>  	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
>  		CFLAGS="$(TARGET_CFLAGS)" \
> -		LDFLAGS="$(TARGET_LDFLAGS)"
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		STRIP=/bin/true
>  endef
>  
>  define HDPARM_INSTALL_TARGET_CMDS
> -- 
> 2.0.0
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
