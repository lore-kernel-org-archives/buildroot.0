From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 17:41:00 +0200
Subject: [Buildroot] [PATCH 2/5] lua : don't install static library in
 target
In-Reply-To: <1342446352-31231-2-git-send-email-francois.perrad@gadz.org>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
 <1342446352-31231-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120716174100.78c8f90c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 15:45:49 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> ---
>  package/lua/lua.mk |    5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 2fc838b..ab9a1a2 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -79,11 +79,6 @@ define LUA_INSTALL_LIBRARY
>  	$(INSTALL) $(@D)/src/liblua.so.$(LUA_VERSION) \
>  		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
>  	ln -sf liblua.so.$(LUA_VERSION)
> $(TARGET_DIR)/usr/lib/liblua.so
> -	$(INSTALL) $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
> -endef
> -else
> -define LUA_INSTALL_LIBRARY
> -	$(INSTALL) $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
>  endef
>  endif

Well, even though not respected by all packages, the rule is normally
to install all .a, .h files and everything to the target, since the
target-finalize thing in the Makefile gets rid of .h and .a files when
BR2_HAVE_DEVFILES is not selected.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
