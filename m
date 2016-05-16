From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 16 May 2016 23:08:12 +0200
Subject: [Buildroot] QtMultimedia and gstreamer-1.0
In-Reply-To: <573A2BF3.1080701@gmail.com>
References: <5738116B.9050904@gmail.com> <20160515100303.003752e2@gmx.net>
 <5738333D.8010707@gmail.com> <20160515140511.5973b7ce@gmx.net>
 <57386743.1030708@gmail.com> <20160516221806.0df441c0@gmx.net>
 <573A2BF3.1080701@gmail.com>
Message-ID: <573A36BC.90807@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 16/05/2016 22:22, Marco Trapanese ha scritto:
> I will try to ldd files under /usr/lib/qt/plugins/


I attach to this email the output for:

ldd libgstmediaplayer.so

please, how to read the results?
Two questions:

1) "checking sub-depends for '/blabla.so' " means it found the 
sub-depends, doesn't it?

2) what does "checking sub-depends for 'not found'" mean???

It doesn't found libQt5OpenGL:

> libQt5OpenGL.so.5 => not found (0x00000000)

I guess due to the missing of "opengl" module.
I'm rebuilding Qt5... let's see if it fixes.



-------------- next part --------------
	libc.so.1 => /lib/libc.so.1 (0x76e91000)
	libpthread.so.1 => /lib/libpthread.so.1 (0x76e6e000)
	libdl.so.1 => /lib/libdl.so.1 (0x76e5a000)
	ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x76f0a000)
	libc.so.1 => /lib/libc.so.1 (0x76eb4000)
	ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x76f2d000)
	ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x76f46000)
	libdl.so.1 => /lib/libdl.so.1 (0x76f32000)
	libc.so.1 => /lib/libc.so.1 (0x76eb9000)
	libc.so.1 => /lib/libc.so.1 (0x76ec2000)
	ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x76f3b000)
	ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x76f22000)
checking sub-depends for '/usr/lib/libqgsttools_p.so.1'
checking sub-depends for '/usr/lib/libgstaudio-1.0.so.0'
checking sub-depends for '/usr/lib/libgstvideo-1.0.so.0'
checking sub-depends for '/usr/lib/libgstpbutils-1.0.so.0'
checking sub-depends for '/usr/lib/libgstapp-1.0.so.0'
checking sub-depends for '/usr/lib/libgstbase-1.0.so.0'
checking sub-depends for '/usr/lib/libgstreamer-1.0.so.0'
checking sub-depends for '/usr/lib/libgobject-2.0.so.0'
checking sub-depends for '/usr/lib/libglib-2.0.so.0'
checking sub-depends for '/usr/lib/libintl.so.8'
checking sub-depends for '/usr/lib/libQt5MultimediaWidgets.so.5'
checking sub-depends for '/usr/lib/libQt5Multimedia.so.5'
checking sub-depends for '/usr/lib/libQt5Widgets.so.5'
checking sub-depends for '/usr/lib/libQt5Gui.so.5'
checking sub-depends for '/usr/lib/libQt5Network.so.5'
checking sub-depends for '/usr/lib/libQt5Core.so.5'
checking sub-depends for '/lib/librt.so.1'
checking sub-depends for '/lib/libdl.so.1'
checking sub-depends for '/usr/lib/libGLESv2.so'
checking sub-depends for '/lib/libpthread.so.1'
checking sub-depends for '/usr/lib/libstdc++.so.6'
checking sub-depends for '/lib/libm.so.1'
checking sub-depends for '/lib/libgcc_s.so.1'
checking sub-depends for '/lib/libc.so.1'
checking sub-depends for '/usr/lib/libgsttag-1.0.so.0'
checking sub-depends for '/usr/lib/libgmodule-2.0.so.0'
checking sub-depends for '/usr/lib/libffi.so.6'
checking sub-depends for '/usr/lib/libpcre.so.1'
checking sub-depends for 'not found'
checking sub-depends for '/usr/lib/libpulse.so.0'
checking sub-depends for '/usr/lib/libpng16.so.16'
checking sub-depends for '/usr/lib/libz.so.1'
checking sub-depends for '/usr/lib/libicui18n.so.57'
checking sub-depends for '/usr/lib/libicuuc.so.57'
checking sub-depends for '/usr/lib/libicudata.so.57'
checking sub-depends for '/usr/lib/libpcre16.so.0'
checking sub-depends for '/usr/lib/libgthread-2.0.so.0'
checking sub-depends for '/usr/lib/libEGL.so'
checking sub-depends for '/usr/lib/libkhrn_client.so'
checking sub-depends for '/usr/lib/libbcm_host.so'
checking sub-depends for '/usr/lib/libvchostif.so'
checking sub-depends for '/usr/lib/libvchiq_arm.so'
checking sub-depends for '/usr/lib/libvcos.so'
checking sub-depends for '/usr/lib/libvcfiled_check.so'
checking sub-depends for '/usr/lib/pulseaudio/libpulsecommon-8.0.so'
checking sub-depends for '/usr/lib/libjson-c.so.2'
checking sub-depends for '/usr/lib/libsndfile.so.1'
checking sub-depends for '/usr/lib/libdbus-1.so.3'
checking sub-depends for '/lib/libatomic.so.1'
	libqgsttools_p.so.1 => /usr/lib/libqgsttools_p.so.1 (0x00000000)
	libgstaudio-1.0.so.0 => /usr/lib/libgstaudio-1.0.so.0 (0x00000000)
	libgstvideo-1.0.so.0 => /usr/lib/libgstvideo-1.0.so.0 (0x00000000)
	libgstpbutils-1.0.so.0 => /usr/lib/libgstpbutils-1.0.so.0 (0x00000000)
	libgstapp-1.0.so.0 => /usr/lib/libgstapp-1.0.so.0 (0x00000000)
	libgstbase-1.0.so.0 => /usr/lib/libgstbase-1.0.so.0 (0x00000000)
	libgstreamer-1.0.so.0 => /usr/lib/libgstreamer-1.0.so.0 (0x00000000)
	libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0x00000000)
	libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0x00000000)
	libintl.so.8 => /usr/lib/libintl.so.8 (0x00000000)
	libQt5MultimediaWidgets.so.5 => /usr/lib/libQt5MultimediaWidgets.so.5 (0x00000000)
	libQt5Multimedia.so.5 => /usr/lib/libQt5Multimedia.so.5 (0x00000000)
	libQt5Widgets.so.5 => /usr/lib/libQt5Widgets.so.5 (0x00000000)
	libQt5Gui.so.5 => /usr/lib/libQt5Gui.so.5 (0x00000000)
	libQt5Network.so.5 => /usr/lib/libQt5Network.so.5 (0x00000000)
	libQt5Core.so.5 => /usr/lib/libQt5Core.so.5 (0x00000000)
	librt.so.1 => /lib/librt.so.1 (0x00000000)
	libdl.so.1 => /lib/libdl.so.1 (0x00000000)
	libGLESv2.so => /usr/lib/libGLESv2.so (0x00000000)
	libpthread.so.1 => /lib/libpthread.so.1 (0x00000000)
	libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x00000000)
	libm.so.1 => /lib/libm.so.1 (0x00000000)
	libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x00000000)
	libc.so.1 => /lib/libc.so.1 (0x00000000)
	libgsttag-1.0.so.0 => /usr/lib/libgsttag-1.0.so.0 (0x00000000)
	libgmodule-2.0.so.0 => /usr/lib/libgmodule-2.0.so.0 (0x00000000)
	libffi.so.6 => /usr/lib/libffi.so.6 (0x00000000)
	libpcre.so.1 => /usr/lib/libpcre.so.1 (0x00000000)
	libQt5OpenGL.so.5 => not found (0x00000000)
	libpulse.so.0 => /usr/lib/libpulse.so.0 (0x00000000)
	libpng16.so.16 => /usr/lib/libpng16.so.16 (0x00000000)
	libz.so.1 => /usr/lib/libz.so.1 (0x00000000)
	libicui18n.so.57 => /usr/lib/libicui18n.so.57 (0x00000000)
	libicuuc.so.57 => /usr/lib/libicuuc.so.57 (0x00000000)
	libicudata.so.57 => /usr/lib/libicudata.so.57 (0x00000000)
	libpcre16.so.0 => /usr/lib/libpcre16.so.0 (0x00000000)
	libgthread-2.0.so.0 => /usr/lib/libgthread-2.0.so.0 (0x00000000)
	/lib/ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x00000000)
	libEGL.so => /usr/lib/libEGL.so (0x00000000)
	libkhrn_client.so => /usr/lib/libkhrn_client.so (0x00000000)
	libbcm_host.so => /usr/lib/libbcm_host.so (0x00000000)
	libvchostif.so => /usr/lib/libvchostif.so (0x00000000)
	libvchiq_arm.so => /usr/lib/libvchiq_arm.so (0x00000000)
	libvcos.so => /usr/lib/libvcos.so (0x00000000)
	libvcfiled_check.so => /usr/lib/libvcfiled_check.so (0x00000000)
	libpulsecommon-8.0.so => /usr/lib/pulseaudio/libpulsecommon-8.0.so (0x00000000)
	libjson-c.so.2 => /usr/lib/libjson-c.so.2 (0x00000000)
	libsndfile.so.1 => /usr/lib/libsndfile.so.1 (0x00000000)
	libdbus-1.so.3 => /usr/lib/libdbus-1.so.3 (0x00000000)
	libatomic.so.1 => /lib/libatomic.so.1 (0x00000000)
	not a dynamic executable
