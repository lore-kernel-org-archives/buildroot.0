From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 1 Dec 2019 11:25:27 +0100
Subject: [Buildroot] [PATCH/next 3/3] package/solarus: disable tests
In-Reply-To: <20191201092823.1288313-3-fontaine.fabrice@gmail.com>
References: <20191201092823.1288313-1-fontaine.fabrice@gmail.com>
 <20191201092823.1288313-3-fontaine.fabrice@gmail.com>
Message-ID: <980c972f-aa2e-6b6a-1966-007759952138@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 01/12/2019 ? 10:28, Fabrice Fontaine a ?crit?:
> Set -DSOLARUS_TESTS=OFF to disable tests (option added in version 1.6.1
> with:
> https://gitlab.com/solarus-games/solarus/commit/1829189c6050e36086b12c3806932e8657265467)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/solarus/solarus.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
> index c17483d339..19de91f614 100644
> --- a/package/solarus/solarus.mk
> +++ b/package/solarus/solarus.mk
> @@ -20,7 +20,9 @@ SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis openal physfs sdl2 \
>  	$(if $(BR2_PACKAGE_LUA_5_1),lua)
>  
>  # Disable launcher GUI (requires Qt5)
> -SOLARUS_CONF_OPTS = -DSOLARUS_GUI=OFF
> +SOLARUS_CONF_OPTS = \
> +	-DSOLARUS_GUI=OFF \
> +	-DSOLARUS_TESTS=OFF
>  
>  ifeq ($(BR2_PACKAGE_LUAJIT),y)
>  SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON
> 
