From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 22:47:47 +0100
Subject: [Buildroot] [PATCH v2 2/2] opentracing-cpp: make shared/static
 target a configurable option
In-Reply-To: <1514014802-23736-3-git-send-email-heyleke@gmail.com>
References: <1513849309-550-2-git-send-email-heyleke@gmail.com>
 <1514014802-23736-1-git-send-email-heyleke@gmail.com>
 <1514014802-23736-3-git-send-email-heyleke@gmail.com>
Message-ID: <20171230224747.29c32635@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Dec 2017 08:40:02 +0100, Jan Heylen wrote:
> From: Jan Heylen <jan.heylen@nokia.com>
> 
> Signed-off-by: Jan Heylen <jan.heylen@nokia.com>

As I said, please merge this into the previous patch.

> diff --git a/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch b/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
> new file mode 100644
> index 0000000..1323f3f
> --- /dev/null
> +++ b/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
> @@ -0,0 +1,73 @@
> +From 9462847f23a25524fdc2112cbc8de3f2c02a1669 Mon Sep 17 00:00:00 2001
> +From: Jan Heylen <jan.heylen@nokia.com>
> +Date: Fri, 22 Dec 2017 22:04:29 +0100
> +Subject: [PATCH] CMake: make shared/static target a configurable option
> +

Please add your Signed-off-by line here.


> +ifeq ($(BR2_STATIC_LIBS),y)
> +	OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +	OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +	OPENTRACING_CPP_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF
> +endif

Don't indent the OPENTRACING_CPP_CONF_OPTS lines.

The CMake package infrastructure is already passing
-DBUILD_SHARED_LIBS=OFF/ON, but not -DBUILD_STATIC_LIBS=ON/OFF. And a
number of packages are anyway passing -DBUILD_SHARED_LIBS=ON/OFF. Until
we clarify this, it's OK to have your package pass both options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
