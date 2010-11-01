From: kenroger@cisco.com (Kenneth Rogers -X (kenroger - Apex Systems,
	Inc. at Cisco))
Date: Mon, 1 Nov 2010 12:06:03 -0500
Subject: [Buildroot] adding a package,
	make stops with no rule to make target `/.stamp_downloaded'
Message-ID: <D59C59453D0EDC43832490B6DADFAECF021F110E@XMB-RCD-214.cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to add a package to the buildroot we're using, it's version 
2010.02 and I don't think I can easily change that part.

I read the directions and copied the webkit package to try to make a 
webkitdfb package.

Here's the output from make:

make
rm -rf 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/buildroot-config
mkdir -p /home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build
cp -dpRf package/config/buildroot-config 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/buildroot-config
cd 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/boost_1_42_0 
&&  /home/kenroger/svn/chameleon-platform/trunk/buildroot/bin/bjam -d2 
--prefix=/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/usr/local 
--build-dir=. --layout=system  --with-thread --with-system --with-regex 
--with-python  --with-filesystem --with-iostreams --with-date_time 
--toolset=gcc  '-sBUILD=release shared multi/single' -sNO_COMPRESSION=1  
link=shared runtime-link=shared install install
warning: Building Boost.Regex with the optional Unicode/ICU support 
disabled.
note: Please refer to the Boost.Regex documentation for more information
note: this is a strictly optional feature.
....patience...
....patience...
....found 17274 targets...
cd 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/boost_1_42_0 
&& cp *.pc 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/lib/pkgconfig/
mkdir -p 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/target/usr/local/lib/
cp 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/usr/local/lib/libboost_*.so* 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/target/usr/local/lib/
touch 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/boost_1_42_0/.installed
cp -dpr 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/Python-2.6.4/libpython2.6.so.* 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/usr/lib
(\
         cd 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/usr/lib 
; \
         rm -f libpython2.6.so ; \
         ln -s `basename  \`ls libpython*.so.*\`` libpython2.6.so \
         )
/usr/bin/make -j4 -C 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/wireless_tools.29 
\
        
  PREFIX="/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/target/usr" \
         CC=/usr/local/cisco-x86/toolchain/current/bin/i686-cm-linux-gcc 
CFLAGS=" -O0  --sysroot 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/" \
         install-iwmulticall    \

make[1]: Entering directory 
`/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/wireless_tools.29'
install -m 755 -d 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/target/usr/sbin/
install -m 755 iwmulticall 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/target/usr/sbin//iwconfig
( cd 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/target/usr/sbin/ 
; \
       ln -f -s iwconfig iwlist ; \
       ln -f -s iwconfig iwspy ; \
       ln -f -s iwconfig iwpriv ; \
       ln -f -s iwconfig iwgetid )
make[1]: Leaving directory 
`/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/wireless_tools.29'
/usr/bin/make -j4 -C 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/wireless_tools.29 
\
        
  PREFIX="/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/usr" \
         CC=/usr/local/cisco-x86/toolchain/current/bin/i686-cm-linux-gcc 
CFLAGS=" -O0  --sysroot 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/" \
         install-hdr
make[1]: Entering directory 
`/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/wireless_tools.29'
install -m 755 -d 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/usr/include/
install -m 644 iwlib.h 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/usr/include/
install -m 644 wireless.h 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging/usr/include/
make[1]: Leaving directory 
`/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/build/wireless_tools.29'
find 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging 
-type f -name "*.la" -exec rm {} \;
find 
/home/kenroger/svn/chameleon-platform/trunk/buildroot/output/staging 
-name "*.la" -exec rm {} \;
make: *** No rule to make target `/.stamp_downloaded', needed by 
`webkitdfb-source'.  Stop.


Here's the webkitdfb.mk file:
#############################################################
#
# webkitdfb
#
#############################################################
WEBKITDFB_VERSION = r51967
WEBKITDFB_SOURCE = WebKit-$(WEBKITDFB_VERSION)-dfb.tar.bz2
WEBKITDFB_SITE = http://directfb.org/downloads/Libs/

WEBKITDFB_INSTALL_STAGING = YES
WEBKITDFB_INSTALL_TARGET = YES
WEBKITDFB_LIBTOOL_PATCH = NO

WEBKITDFB_DEPENDENCIES = host-flex host-gperf icu libxml2 libxslt    \
             libgtk2 sqlite enchant libsoup

WEBKITDFB_CONF_OPT = --with-target=directfb

WEBKITDFB_CONF_OPT += --disable-video
WEBKITDFB_CONF_ENV += icu_config=$(STAGING_DIR)/usr/bin/icu-config
WEBKITDFB_CONF_ENV += 
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/local/lib/pkgconfig"

define WEBKITDFB_AUTOGEN_PATCH
$(SED) 's%ACLOCAL_FLAGS=.*%ACLOCAL_FLAGS="-I autotools -I 
$(STAGING_DIR)/usr/share/aclocal"%' $(WEBKITDFB_DIR)/autogen.sh
$(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing 
--copy"/' $(WEBKITDFB_DIR)/autogen.sh
$(SED) 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake 
--copy"/' $(WEBKITDFB_DIR)/autogen.sh
cp package/webkitdfb/gtk-doc.make $(WEBKITDFB_DIR)/
# Don't run the configure step yet
cd $(WEBKITDFB_DIR); $(HOST_CONFIGURE_OPTS) 
AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
endef

WEBKITDFB_POST_EXTRACT_HOOKS += WEBKITDFB_AUTOGEN_PATCH

$(eval $(call AUTOTARGETS,package,webkitdfb))


Any ideas?

Thanks,
Ken R.
