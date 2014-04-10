From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 10 Apr 2014 22:25:46 +0200
Subject: [Buildroot] [PATCH 1/1] mongrel2: bump to version 1.9.0
In-Reply-To: <1396982421-17571-1-git-send-email-lionel.orry@gmail.com>
References: <1396982421-17571-1-git-send-email-lionel.orry@gmail.com>
Message-ID: <5346FE4A.6040805@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Lionel,

> The github helper does not retrieve a suitable tarball including the polarssl source code,
> thus the change on the download url.
>
> This version of mongrel2 should be compliant with latest ZeroMQ versions.
>
> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
> ---
>   .../mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch  | 12 ++++++------
>   package/mongrel2/mongrel2.mk                                 |  4 ++--
>   2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch b/package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch
> index 164d7f9..730d8eb 100644
> --- a/package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch
> +++ b/package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch
> @@ -23,8 +23,8 @@ index 6dce4a6..d48e05e 100644
>   --- a/Makefile
>   +++ b/Makefile
>   @@ -1,4 +1,4 @@
> --CFLAGS=-g -O2 -Wall -Wextra -Isrc -pthread -rdynamic -DNDEBUG $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
> -+override CFLAGS += -g -O2 -Wall -Wextra -Isrc -pthread -rdynamic -DNDEBUG $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
> +-CFLAGS=-g -O2 -Wall -Wextra -Isrc -Isrc/polarssl/include -pthread -rdynamic -DNDEBUG $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
> ++override CFLAGS += -g -O2 -Wall -Wextra -Isrc -Isrc/polarssl/include -pthread -rdynamic -DNDEBUG $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
>    LIBS=-lzmq -ldl -lsqlite3 $(OPTLIBS)
>    PREFIX?=/usr/local
>    
> @@ -34,8 +34,8 @@ index 398490c..53f2255 100644
>   +++ b/tools/config_modules/Makefile
>   @@ -1,5 +1,5 @@
>    PREFIX?=/usr/local
> --CFLAGS=-I../../src $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
> -+override CFLAGS += -I../../src $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
> +-CFLAGS=-I../../src -I../../src/polarssl/include $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
> ++override CFLAGS += -I../../src -I../../src/polarssl/include $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
>    LDFLAGS=$(OPTLIBS)
>    
>    MONGO_SRC = mongo-c-driver/src/bson.c \
> @@ -45,8 +45,8 @@ index f9f4556..6077b79 100644
>   +++ b/tools/filters/Makefile
>   @@ -1,5 +1,5 @@
>    PREFIX?=/usr/local
> --CFLAGS=-I../../src $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
> -+override CFLAGS += -I../../src $(OPTFLAGS) -fPIC -shared -nostartfiles -L../../build
> +-CFLAGS=-I../../src -I../../src/polarssl/include $(OPTFLAGS) -g -fPIC -shared -nostartfiles -L../../build
> ++ override CFLAGS += -I../../src -I../../src/polarssl/include $(OPTFLAGS) -g -fPIC -shared -nostartfiles -L../../build
>    LDFLAGS=$(OPTLIBS)
>    
>    all: null.so
> diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
> index e6a7be3..590a522 100644
> --- a/package/mongrel2/mongrel2.mk
> +++ b/package/mongrel2/mongrel2.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -MONGREL2_VERSION = v1.8.0
> -MONGREL2_SITE = $(call github,zedshaw,mongrel2,$(MONGREL2_VERSION))
> +MONGREL2_VERSION = v1.9.0
> +MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)/
>   MONGREL2_LICENSE = BSD-3c
>   MONGREL2_LICENSE_FILES = LICENSE
>   MONGREL2_DEPENDENCIES = sqlite zeromq

It builds fine against zeromq v3.2.4 as well as v4.0.1
Tested-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Regards,
Jerzy
