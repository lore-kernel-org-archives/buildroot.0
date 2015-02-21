From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 14:05:44 +0100
Subject: [Buildroot] [PATCH] package/x11r7/libxcb: really disable docs
In-Reply-To: <54E86864.5010707@openwide.fr>
References: <1424516137-5016-1-git-send-email-romain.naour@openwide.fr>
 <54E86864.5010707@openwide.fr>
Message-ID: <20150221140544.489bae65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 21 Feb 2015 12:13:40 +0100, Romain Naour wrote:

> Can we add --with-doxygen=no to pkg-autotools.mk instead ?

As Yann said on IRC, it depends on the number of packages that would
benefit from it. And it seems only three packages would benefit from it:

package/libhid/libhid.mk:       --without-doxygen \
package/sofia-sip/sofia-sip.mk:SOFIA_SIP_CONF_OPTS = --with-doxygen=no
package/x11r7/libxcb/libxcb.mk:LIBXCB_CONF_OPTS = --with-doxygen=no
package/x11r7/libxcb/libxcb.mk:HOST_LIBXCB_CONF_OPTS = --with-doxygen=no

On the other hand --disable-doxygen-docs, or --disable-doxygen seem to
be used by many more packages:

package/cppunit/cppunit.mk:CPPUNIT_CONF_OPTS = --disable-doxygen
package/dbus-cpp/dbus-cpp.mk:DBUS_CPP_CONF_OPTS = --disable-examples --disable-tests --disable-doxygen-docs \
package/dbus-cpp/dbus-cpp.mk:   --disable-doxygen-docs --disable-ecore --disable-glib
package/dbus-glib/dbus-glib.mk: --disable-doxygen-docs \
package/dbus-glib/dbus-glib.mk: --disable-doxygen-docs \
package/dbus/dbus.mk:   --disable-doxygen-docs \
package/dbus/dbus.mk:   --disable-doxygen-docs \
package/libv4l/libv4l.mk:LIBV4L_CONF_OPTS = --disable-doxygen-doc
package/log4cxx/log4cxx.mk:     --disable-doxygen \
package/matchbox/matchbox-lib/matchbox-lib.mk:MATCHBOX_LIB_CONF_OPTS = --enable-expat --disable-doxygen-docs
package/ola/ola.mk:     --disable-doxygen-html \
package/ola/ola.mk:     --disable-doxygen-doc
package/openocd/openocd.mk:     --disable-doxygen-html \
package/openocd/openocd.mk:     --disable-doxygen-html \

Bottom line: my preference is to keep this at a per-package level.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
