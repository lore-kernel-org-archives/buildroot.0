From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:53:22 +0100
Subject: [Buildroot] [PATCH v3,
 2/3] package/solarus: allow building with lua 5.1
In-Reply-To: <20191215131358.3637959-2-fontaine.fabrice@gmail.com>
References: <20191215131358.3637959-1-fontaine.fabrice@gmail.com>
 <20191215131358.3637959-2-fontaine.fabrice@gmail.com>
Message-ID: <20191216225322.42c5b6ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Dec 2019 14:13:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build with lua 5.1 has been fixed since version 1.6.1 and
> https://gitlab.com/solarus-games/solarus/commit/611f81a90d42692e986c78c67090541ffd1c5973
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Romain Naour and Peter Korsgaard):
>  - Update commit title
>  - Move lua dependency under !BR2_PACKAGE_LUAJIT statement
> 
>  package/solarus/Config.in  |  9 ++++-----
>  package/solarus/solarus.mk | 10 +++++++++-
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/package/solarus/Config.in b/package/solarus/Config.in
> index 359ad15e02..290d5a756c 100644
> --- a/package/solarus/Config.in
> +++ b/package/solarus/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_SOLARUS
>  	bool "solarus"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT

I am not a big fan of this change, as it could break existing setups,
so instead I've used:

	select BR2_PACKAGE_LUAJIT if !BR2_PACKAGE_LUA_5_1

and of course re-adjusted the dependencies and comments accordingly.

I've applied to master with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
