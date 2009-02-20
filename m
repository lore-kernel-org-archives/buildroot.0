From: Robert Urban <urban@unix-beratung.de>
Date: Fri, 20 Feb 2009 02:21:43 +0100
Subject: [Buildroot] problem building openswan using svn-buildroot
Message-ID: <499E05A7.2070403@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I'm getting the following error when trying to build openswan, as part of a
'make all':

/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
 -I/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/openswan-2.4.9/programs/pluto/linux26
-I/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/openswan-2.4.9/include
-I/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/openswan-2.4.9/lib/libcrypto
-I/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/openswan-2.4.9/linux/include
   -DPLUTO_SENDS_VENDORID -DUSE_KEYRR   -DKERNEL26_SUPPORT
-DKERNEL26_HAS_KAME_DUPLICATES  -DX509     -DPLUTO -DKLIPS
-DBUILDER=\"urban at noisy\" -DDEBUG -DGCC_LINT -DUSE_AES -DUSE_3DES -DIKE_ALG
-DKERNEL_ALG -DDB_CONTEXT -DAGGRESSIVE -DXAUTH -DMODECFG  -DNAT_TRAVERSAL
-DVIRTUAL_IP  -DI_KNOW_TRANSPORT_MODE_HAS_SECURITY_CONCERN_BUT_I_WANT_IT
 -DSHARED_SECRETS_FILE=\"/etc/ipsec.secrets\"
-DPOLICYGROUPSDIR=\"/etc/ipsec.d/policies\"
-DPERPEERLOGDIR=\"/var/log/pluto/peer\" -g -Wall -W -Wmissing-prototypes
-Wpointer-arith -Wbad-function-cast -Wcast-qual -Wmissing-declarations
-Wwrite-strings -Wstrict-prototypes  -UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE -Os
-pipe -Os
-I/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/staging_dir/usr/include
-I/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/staging_dir/include
--sysroot=/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/staging_dir/
-isysroot
/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/staging_dir
-mtune=i686 -march=i686 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -isysroot
/big/home/urban/Build/Buildroot/svn/buildroot/build_i686/staging_dir
-I/big/home/urban/Build/Buildroot/svn/buildroot/project_build_i686/uclibc/root/usr/include
-c connections.c
In file included from connections.c:48:
connections.h:199: error: expected specifier-qualifier-list before
?CIRCLEQ_ENTRY?
connections.c: In function ?host_pair_enqueue_pending?:
connections.c:118: error: ?const struct connection? has no member named
?host_pair?
connections.c:119: error: ?const struct connection? has no member named
?host_pair?
connections.c: In function ?host_pair_first_pending?:

I pulled the svn copy a few days ago...

My config can be found at:

	http://www.spielwiese.de/rob/Buildroot/config

and an excerpt of the build logfile (starting just after openswan sources
are copied) can be found here:

	http://www.spielwiese.de/rob/Buildroot/openswan.log

My build host is x86 Fedora Core 10 box, with all current updates.

anyone have any idea what might be wrong?

thanks,

Rob Urban
