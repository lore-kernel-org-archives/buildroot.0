From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 17:03:59 +0100
Subject: [Buildroot] [PATCH] package/rust: disable ninja
In-Reply-To: <20210217232411.290242-1-romain.naour@gmail.com>
References: <20210217232411.290242-1-romain.naour@gmail.com>
Message-ID: <20210220160359.GK2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-02-18 00:24 +0100, Romain Naour spake thusly:
> Ninja has recently be enabled as the default build system to build
> llvm fork for rust compiler [1]. But we can still use Make if
> "ninja = false" is provided in config.toml.
> 
> Ninja support can be enabled by a following patch.
> 
> [1] https://github.com/rust-lang/rust/commit/30b7dac745b1555cd96f41977f7d24435cbe7fa2
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1019386205
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Applied to master, thanks.

If you have time, it would be great to investigate switching the cmake
backend to ninja.

Regards,
Yann E. MORIN.

> ---
>  package/rust/rust.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 798450e04e..a38a3d64f5 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -65,6 +65,8 @@ define HOST_RUST_CONFIGURE_CMDS
>  		echo 'channel = "stable"'; \
>  		echo '[target.$(RUSTC_TARGET_NAME)]'; \
>  		echo 'cc = "$(TARGET_CROSS)gcc"'; \
> +		echo '[llvm]'; \
> +		echo 'ninja = false'; \
>  	) > $(@D)/config.toml
>  endef
>  
> -- 
> 2.29.2
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
