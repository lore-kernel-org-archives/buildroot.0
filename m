From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 12 Aug 2007 16:45:00 +0300
Subject: [Buildroot] configure fails on xserver_xorg-server-1.2.0 -
	X11/defs.ent
Message-ID: <46BF0EDC.8040104@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Error when configuring xserver_xorg-server-1.2.0:

cd /root/buildroot/build_arm/xserver_xorg-server-1.2.0/
...
./configure \
        --target=arm-linux \
        --host=arm-linux \
        --build=i386-pc-linux-gnu \
        --prefix=/usr \
        --exec-prefix=/usr \
        --sysconfdir=/etc \
        --disable-xprint --disable-xinerama --disable-xnest --disable-xvfb --disable-dmx --enable-dri --disable-xdmcp --disable-screensaver
...
checking to see if we can install the Xorg server as root... yes
checking if Xtrans should support UNIX socket connections... yes
checking if Xtrans should support TCP socket connections... yes
checking for library containing socket... none required
checking for library containing gethostbyname... none required
checking for getaddrinfo... yes
checking if IPv6 support should be built... yes
checking for struct sockaddr_in.sin_len... no
checking if Xtrans should support os-specific local connections... no
checking for authdes_seccreate... no
checking for authdes_create... no
checking if Secure RPC authentication ("SUN-DES-1") should be supported... no
checking for /usr/share/sgml/X11/defs.ent... configure: error: cannot check for file existence when cross compiling
make: *** [/root/buildroot/build_arm/xserver_xorg-server-1.2.0/.stamp_configured] Error 1

Some modification to configure.ac is needed to disable this check.

BR,
Ivan
