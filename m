From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:59:59 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/sysrepo: bump to version
 1.3.21
In-Reply-To: <20191220135345.16045-4-heiko.thiery@gmail.com>
References: <20191220135345.16045-1-heiko.thiery@gmail.com>
 <20191220135345.16045-4-heiko.thiery@gmail.com>
Message-ID: <20191221225959.579c6830@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Dec 2019 14:53:45 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> This Sysrepo is a complete rewrite of the older versions.
> 
> Thus several changes are made in the package to support this new version.
> 
> - several cmake config options dropped
> - no systemd service scripts availble in upstream version
> - no sysrepod daemon available
> - drop patches that are no longer needed
> - add new patch
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>

Thanks for the patch. It indeed does simplify quite a few things.

>  SYSREPO_CONF_OPTS = \
> -	-DIS_DEVELOPER_CONFIGURATION=OFF \
> -	-DGEN_PYTHON2_TESTS=OFF \
> -	-DENABLE_TESTS=OFF \
> -	-DGEN_CPP_BINDINGS=OFF \
> -	-DGEN_LANGUAGE_BINDINGS=OFF \
> -	-DGEN_PYTHON_BINDINGS=OFF \
> -	-DBUILD_CPP_EXAMPLES=OFF \
> -	-DCALL_SYSREPOCTL_BIN=$(HOST_DIR)/bin/sysrepoctl \
> -	-DCALL_SYSREPOCFG_BIN=$(HOST_DIR)/bin/sysrepocfg \
> +	-DCMAKE_BUILD_TYPE=Release \

Any reason for passing this ? The cmake-package infrastructure already
passes it:

-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#'

so it's already in the $(HOST_DIR)/share/buildroot/toolchainfile.cmake
CMake toolchain file.

Have you encountered a specific issue that makes it needed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
