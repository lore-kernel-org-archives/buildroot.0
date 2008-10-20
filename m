From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Mon, 20 Oct 2008 01:05:38 -0700 (PDT)
Subject: [Buildroot]  Unnecessary redefining of PKG_CONFIG_*
Message-ID: <20064991.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have done a quick search in the package subdir and found that PKG_CONFIG_
variables are being redefined in a number of packages:

package/java/classpath/classpath.mk:		--disable-debug
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
package/java/jamvm/jamvm.mk:		--disable-debug
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
package/gqview/gqview.mk:GQVIEW_CONF_OPT =
PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
package/audio/libogg/libogg.mk:	
PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig"
\
package/audio/libogg/libogg.mk:		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
package/audio/libvorbis/libvorbis.mk:	
PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig"
\
package/audio/libvorbis/libvorbis.mk:		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
package/midori/midori.mk:		PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
package/pango/pango.mk:		ac_use_included_regex=no gl_cv_c_restrict=no
PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
package/pango/pango.mk:		--enable-explicit-deps=no --disable-debug
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
package/matchbox/matchbox.mk:	CFLAGS="$(TARGET_CFLAGS)
-I$(STAGING_DIR)/usr/include"
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
package/docker/docker.mk:					PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
package/docker/docker.mk:				
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
package/sylpheed/sylpheed.mk:SYLPHEED_CONF_ENV =
PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
package/editors/vim/vim.mk:		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
package/editors/vim/vim.mk:	
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
package/editors/vim/vim.mk:		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
package/editors/vim/vim.mk:		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
package/pcmanfm/pcmanfm.mk:PCMANFM_CONF_ENV =
PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig

Anyone know why? I think we should clean this up and one against this?  
I am happy to do pango as I build this on a regular basis however the other
packages I could do and wait for feedback......
Any opinions?
Daniel Laird
-- 
View this message in context: http://www.nabble.com/Unnecessary-redefining-of-PKG_CONFIG_*-tp20064991p20064991.html
Sent from the BuildRoot mailing list archive at Nabble.com.
