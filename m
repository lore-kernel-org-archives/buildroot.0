From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Sep 2013 23:03:11 +0200
Subject: [Buildroot] [PATCH] libroxml: bump version to 2.2.3
In-Reply-To: <1379351518-5771-1-git-send-email-blunderer@blunderer.org>
 (blunderer@blunderer.org's message of "Mon, 16 Sep 2013 10:11:58
 -0700")
References: <1379351518-5771-1-git-send-email-blunderer@blunderer.org>
Message-ID: <87zjrcfpio.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "blunderer" == blunderer  <blunderer@blunderer.org> writes:

 blunderer> From: Tristan Lelong <tristan.lelong@blunderer.org>

Looks good. Could you please resend with your Signed-off-by: tag?

http://buildroot.net/downloads/manual/manual.html#submitting-patches

 blunderer> ---
 blunderer>  package/libroxml/libroxml-werror.patch |    4 ++--
 blunderer>  package/libroxml/libroxml.mk           |    6 +++---
 blunderer>  2 files changed, 5 insertions(+), 5 deletions(-)

 blunderer> diff --git a/package/libroxml/libroxml-werror.patch b/package/libroxml/libroxml-werror.patch
 blunderer> index a99962f..6435b01 100644
 blunderer> --- a/package/libroxml/libroxml-werror.patch
 blunderer> +++ b/package/libroxml/libroxml-werror.patch
 blunderer> @@ -15,8 +15,8 @@ Index: a/Makefile
  
 blunderer>   # options
 blunderer>   override CPPFLAGS += -Iinc/
 blunderer> --override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Werror -Iinc/ $(DEFINES)
 blunderer> -+override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Iinc/ $(DEFINES)
 blunderer> +-override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Wno-unused-result -Werror -Iinc/ $(DEFINES)
 blunderer> ++override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Wno-unused-result -Iinc/ $(DEFINES)
 blunderer>   override LDFLAGS += 
  
 blunderer>   ifeq ("$(OS)", "Darwin")
 blunderer> diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
 blunderer> index 76ffa14..d602513 100644
 blunderer> --- a/package/libroxml/libroxml.mk
 blunderer> +++ b/package/libroxml/libroxml.mk
 blunderer> @@ -4,8 +4,8 @@
 blunderer>  #
 blunderer>  ################################################################################
 
 blunderer> -LIBROXML_VERSION = 2.2.2
 blunderer> -LIBROXML_SITE = http://libroxml.googlecode.com/files
 blunderer> +LIBROXML_VERSION = 2.2.3
 blunderer> +LIBROXML_SITE = http://download.libroxml.net/pool/v2.x/
 blunderer>  LIBROXML_INSTALL_STAGING = YES
 
 blunderer>  define LIBROXML_BUILD_CMDS
 blunderer> @@ -17,7 +17,7 @@ define LIBROXML_INSTALL_STAGING_CMDS
 blunderer>  endef
 
 blunderer>  define LIBROXML_INSTALL_TARGET_CMDS
 blunderer> -	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 blunderer> +	$(MAKE) DESTDIR=$(TARGET_DIR)/usr/ -C $(@D) install
 blunderer>  endef
 
 blunderer>  define LIBROXML_UNINSTALL_STAGING_CMDS
 blunderer> -- 
 blunderer> 618FE3EF

 blunderer> _______________________________________________
 blunderer> buildroot mailing list
 blunderer> buildroot at busybox.net
 blunderer> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
