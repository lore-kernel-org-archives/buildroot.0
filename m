From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 09:23:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-18
In-Reply-To: <20140519063009.7B5A9100E3F@stock.ovh.net>
References: <20140519063009.7B5A9100E3F@stock.ovh.net>
Message-ID: <20140519092325.67fa8bd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 May 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d15a75c232715d1554b63d95e586f45318f4f9b1/

Still the libstdc++ static linking issue.

> microblazeel |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/277038de62d6262576a63b213374a33357a8333b/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=f4c093f2d08a44686f540959f28cb600c2c61fb3.

>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b11a1dc8ed48b7bee2fddea20938cd08a8a640c2/

Multiple OpenGL providers selected.

BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"
BR2_PACKAGE_PROVIDES_LIBGLES="mesa3d"

>     x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/3db246bce1f74a524eaf84102a2dfd47a6a1a7b6/

../src/.libs/libdirectfb.so: undefined reference to `std::__detail::_List_node_base::_M_unhook()@GLIBCXX_3.4.15'
../src/.libs/libdirectfb.so: undefined reference to `std::__detail::_List_node_base::_M_hook(std::__detail::_List_node_base*)@GLIBCXX_3.4.15'

Any idea?

>       bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/0cf071fb8ef0f6beedada87d4b6a116bb5d14bc2/

libiconv issue.

>       bfin |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/9519d7abb45c6a789874ec6bb84418c31a98916b/

"Fixed" by http://git.buildroot.net/buildroot/commit/?id=822d5d5f19cb8de7f0fdad9db9dee2aad6d13a62

>       bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ec73c304c72d345aa177e0c27c71371445a9d07f/

I looked into this one. Disabling the build of the shared library is
easy. But then there is a libiconv issue identical to the one in
dosfstools.

>       bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/401105b5e120176e78c2e5fcabe54ab0bde1bf40/

Fixed by http://git.buildroot.net/buildroot/commit/?id=b8242149e48d78a5b62f2d9743dfa421bc1b8c65.

>     mipsel |                   gnupg-1.4.16 | NOK | http://autobuild.buildroot.net/results/a8df874b051d5a0363718b5f57facfeb8e7aa321/

localename.c: In function '_nl_locale_name_thread_unsafe':
localename.c:2619:31: error: dereferencing pointer to incomplete type

I don't know.

>       bfin |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/91ea98f65deaa41a957038425378d78a3585306a/

GLOB_TILDE not available in Blackfin external toolchains.

>    powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/53f0088afb1d7e270703474fd9c5ff7eef9fd12c/

Fixed by adding an exception in the autobuilder script.

>        arc |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/af1ca869dbc7a71aa4cc89373d605ca8f790fcc9/

Fixed by http://git.buildroot.net/buildroot/commit/?id=6a4fa3fccaecb5d5c524453fcb8e6ad2edcbfef7

>       bfin |                 pciutils-3.2.1 | NOK | http://autobuild.buildroot.net/results/a27ce61967ef8f780887f7681c8b0edd91656be6/

A _ symbol prefix issue.

>        arm |                     php-5.5.12 | NOK | http://autobuild.buildroot.net/results/f0d2bcc11f04db9853d18f019993e28d03f8d8c0/

checking for sqlite3_open in -lsqlite3... no
configure: error: wrong sqlite lib version or lib not found
make: *** [/home/test/test/2/output/build/php-5.5.12/.stamp_configured] Error 1

I need to reproduce and give more details from the config.log.

>       mips |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/27a674c6a19a729fae5cc33de0360b2a061930c1/

checking for XDAMAGE... no
configure: error: Package requirements (xdamage) were not met:

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
