From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Fri, 4 Apr 2008 13:58:36 +0530
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
References: <20080331142838.8386C3C4EF@busybox.net><16477104.post@talk.nabble.com>
	<87zlsavzwx.fsf@macbook.be.48ers.dk>
Message-ID: <5BF78BCE8D9BF14A83F836BD9E3916BA0DDB2A@blrms.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


>Do you still have that problem now?
i have attached the output of my make world below. this happens even if
i type "make world" continuously like 5 times. As you said, if fakeroot
updates the timestamp of ncurses and zlib libraries, make target simply
runs targets $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION) &
$(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VERSION) irrespective of whether it
is actually needed.


> > Hebbar> ncurses: $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
> 
> > Hebbar> zlib: uclibc $(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VERSION)
> 
> > Hebbar> libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
> 
> No, this seems correct to me. We need the files installed in
TARGET_DIR, so they cannot depend on the files in STAGING_DIR.

I know this files need to be installed in target dir but i am little
confused about the target options points to $(TARGET_DIR)/ instead of
pointing to staging_dir

Thanks in advance

Regards
Gururaja

<snip>
<snip>
rm -rf /opt/buildroot/project_build_arm/uclibc/buildroot-config
mkdir -p /opt/buildroot/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config
/opt/buildroot/project_build_arm/uclibc/buildroot-config
mkdir -p /opt/buildroot/project_build_arm/uclibc/root/usr/include
cp -dpf /opt/buildroot/build_arm/ncurses-5.6/include/curses.h
/opt/buildroot/project_build_arm/uclibc/root/usr/include/ncurses.h
cp -dpf /opt/buildroot/build_arm/ncurses-5.6/include/ncurses_dll.h
/opt/buildroot/project_build_arm/uclibc/root/usr/include/ncurses_dll.h
cp -dpf /opt/buildroot/build_arm/ncurses-5.6/include/term.h
/opt/buildroot/project_build_arm/uclibc/root/usr/include/
cp -dpf /opt/buildroot/build_arm/ncurses-5.6/include/unctrl.h
/opt/buildroot/project_build_arm/uclibc/root/usr/include/
cp -dpf /opt/buildroot/build_arm/ncurses-5.6/include/termcap.h
/opt/buildroot/project_build_arm/uclibc/root/usr/include/
cp -dpf /opt/buildroot/build_arm/ncurses-5.6/lib/libncurses.a
/opt/buildroot/project_build_arm/uclibc/root/usr/lib/
(cd /opt/buildroot/project_build_arm/uclibc/root/usr/lib; \
         ln -fs libncurses.a libcurses.a; \
         ln -fs libncurses.a libtermcap.a; \
        )
(cd /opt/buildroot/project_build_arm/uclibc/root/usr/include; ln -fs
ncurses.h curses.h)
rm -f /opt/buildroot/project_build_arm/uclibc/root/lib/libncurses.so
(cd /opt/buildroot/project_build_arm/uclibc/root/usr/lib; ln -fs
../../lib/libncurses.so.5.6 libncurses.so)
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-str
ip --remove-section=.comment --remove-section=.note --strip-unneeded
/opt/buildroot/project_build_arm/uclibc/root/lib/libncurses.so.5.6
touch -c
/opt/buildroot/project_build_arm/uclibc/root/usr/lib/libncurses.a
mkdir -p /opt/buildroot/project_build_arm/uclibc/root/usr/include
/opt/buildroot/project_build_arm/uclibc/root/usr/lib
cp -dpf /opt/buildroot/build_arm/staging_dir/usr/include/zlib.h
/opt/buildroot/project_build_arm/uclibc/root/usr/include/
cp -dpf /opt/buildroot/build_arm/staging_dir/usr/include/zconf.h
/opt/buildroot/project_build_arm/uclibc/root/usr/include/
cp -dpf /opt/buildroot/build_arm/staging_dir/usr/lib/libz.a
/opt/buildroot/project_build_arm/uclibc/root/usr/lib/
rm -f /opt/buildroot/project_build_arm/uclibc/root/lib/libz.so
/opt/buildroot/project_build_arm/uclibc/root/usr/lib/libz.so
ln -sf libz.so.1.2.3
/opt/buildroot/project_build_arm/uclibc/root/usr/lib/libz.so
touch -c /opt/buildroot/project_build_arm/uclibc/root/usr/lib/libz.a
rm -rf /opt/buildroot/project_build_arm/uclibc/root/usr/include
find /opt/buildroot/project_build_arm/uclibc/root/usr/lib -name '*.a'
-delete
find /opt/buildroot/project_build_arm/uclibc/root/lib -name '*.a'
-delete
find /opt/buildroot/project_build_arm/uclibc/root/usr/lib -name '*.la'
-delete
find /opt/buildroot/project_build_arm/uclibc/root/lib -name '*.la'
-delete
<snip>
<snip>
<snip>
