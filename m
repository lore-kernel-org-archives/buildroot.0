From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 27 Jul 2010 22:46:17 +0200
Subject: [Buildroot] [PATCH 1/1] target-g++: fix build
In-Reply-To: <454b70d03afd45a9f78976b93051c61b80ab245d.1280262826.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280262826.git.thomas.petazzoni@free-electrons.com>
	<454b70d03afd45a9f78976b93051c61b80ab245d.1280262826.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201007272246.17707.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 27 July 2010 22:34:26 Thomas Petazzoni wrote:
> 
> Just as we did to fix target-gcc, pass CXX_FOR_TARGET when building
> target g++, and remove useless copies of g++ and c++.
> 
> Tested on ARM by compiling a simple C++ program using <iostream> on
> the target and running it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

> ---
>  toolchain/gcc/gcc-uclibc-4.x.mk |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
> index 9720ed3..6e767ac 100644
> --- a/toolchain/gcc/gcc-uclibc-4.x.mk
> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
> @@ -399,6 +399,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
>  		BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
>  		GCC_FOR_TARGET="$(TARGET_CC)" \
>  		CC_FOR_TARGET="$(TARGET_CC)" \
> +		CXX_FOR_TARGET="$(TARGET_CXX)" \
>  		$(GCC_SRC_DIR)/configure $(QUIET) \
>  		--prefix=/usr \
>  		--build=$(GNU_HOST_NAME) \
> @@ -445,8 +446,10 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
>  	# Remove broken specs file (cross compile flag is set).
>  	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
>  
> -	# Remove useless copies of gcc
> +	# Remove useless copies of gcc, c++, g++
>  	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc*
> +	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++*
> +	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++*
>  
>  	# Work around problem of missing syslimits.h
>  	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \



-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
