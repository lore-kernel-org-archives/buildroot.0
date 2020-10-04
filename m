From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Oct 2020 23:19:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/sentry-cli: pass HOST_LDFLAGS
In-Reply-To: <20201004184157.1488521-1-fontaine.fabrice@gmail.com>
References: <20201004184157.1488521-1-fontaine.fabrice@gmail.com>
Message-ID: <20201004211921.GN11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-04 20:41 +0200, Fabrice Fontaine spake thusly:
> Pass HOST_LDFLAGS to avoid the following build failure due to missing
> RPATH:
> 
> *** ERROR: package host-sentry-cli installs executables without proper RPATH:
> ***   /srv/storage/autobuild/run/instance-3/output-1/host/bin/sentry-cli
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d52638baefec961ff693aecf833af7adfc482fe4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sentry-cli/sentry-cli.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
> index c4dbc5ebfd..7e53f16026 100644
> --- a/package/sentry-cli/sentry-cli.mk
> +++ b/package/sentry-cli/sentry-cli.mk
> @@ -11,7 +11,9 @@ SENTRY_CLI_LICENSE_FILES = LICENSE
>  
>  HOST_SENTRY_CLI_DEPENDENCIES = host-rustc host-zlib
>  
> -HOST_SENTRY_CLI_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
> +HOST_SENTRY_CLI_CARGO_ENV = \
> +	CARGO_HOME=$(HOST_DIR)/share/cargo \
> +	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
>  
>  HOST_SENTRY_CLI_CARGO_OPTS = \
>  	--release \
> -- 
> 2.28.0
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
