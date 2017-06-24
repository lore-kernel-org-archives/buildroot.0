From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 17:20:28 +0200
Subject: [Buildroot] [PATCH v2 05/13] package/minetest: add gettext
 optional dependency
In-Reply-To: <20170612205410.20230-5-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-5-romain.naour@gmail.com>
Message-ID: <20170624172028.58c971c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 22:54:02 +0200, Romain Naour wrote:

>  MINETEST_CONF_OPTS = \
>  	-DDEFAULT_RUN_IN_PLACE=OFF \
> -	-DENABLE_GETTEXT=OFF \
>  	-DENABLE_SOUND=OFF \
>  	-DENABLE_GLES=OFF \
>  	-DENABLE_FREETYPE=OFF \
> @@ -40,6 +39,13 @@ else
>  MINETEST_CONF_OPTS += -DBUILD_SERVER=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +MINETEST_DEPENDENCIES += gettext
> +MINETEST_CONF_OPTS += -DENABLE_GETTEXT=ON
> +else
> +MINETEST_CONF_OPTS += -DENABLE_GETTEXT=OFF
> +endif

What is this ENABLE_GETTEXT=ON/OFF option doing exactly?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
