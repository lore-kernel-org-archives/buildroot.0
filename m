From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Feb 2017 14:02:03 +0000
Subject: [Buildroot] [Bug 9651] libxcb-1.12b built Error
In-Reply-To: <bug-9651-163@https.bugs.busybox.net/>
References: <bug-9651-163@https.bugs.busybox.net/>
Message-ID: <bug-9651-163-tRC4rM9xBN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9651

--- Comment #1 from Skamlinux <kalman.staudinger@gmail.com> ---
root# cd buildroot
root# make
>>> host-libxcb 1.12 Building
PATH="/root/buildroot/output/host/bin:/root/buildroot/output/host/sbin:/root/buildroot/output/host/usr/bin:/root/buildroot/output/host/usr/sbin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/root/my-applications/bin:/usr/games"
PKG_CONFIG="/root/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/root/buildroot/output/host/usr/lib/pkgconfig:/root/buildroot/output/host/usr/share/pkgconfig"
 /usr/bin/make -j3  -C /root/buildroot/output/build/host-libxcb-1.12/
make[1]: Entering directory `/root/buildroot/output/build/host-libxcb-1.12'
Making all in src
make[2]: Entering directory `/root/buildroot/output/build/host-libxcb-1.12/src'
make[2]: warning: -jN forced in submake: disabling jobserver mode.
  GEN      xproto.c
  GEN      bigreq.c
  GEN      xc_misc.c

Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.

Traceback (most recent call last):
  File "./c_client.py", line 3294, in <module>
    from xcbgen.state import Module
  File
"/root/buildroot/output/host/usr/lib/python2.7/site-packages/xcbgen/state.py",
line 5, in <module>
    from xml.etree.cElementTree import parse
  File
"/root/buildroot/output/host/usr/lib/python2.7/xml/etree/cElementTree.py", line
3, in <module>
    from _elementtree import *
ImportError:
/root/buildroot/output/host/usr/lib/python2.7/lib-dynload/_elementtree.so:
undefined symbol: PyUnicodeUCS2_FromFormat
make[2]: *** [bigreq.c] Error 1
make[2]: *** Waiting for unfinished jobs....

Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.

Traceback (most recent call last):
  File "./c_client.py", line 3294, in <module>
    from xcbgen.state import Module
  File
"/root/buildroot/output/host/usr/lib/python2.7/site-packages/xcbgen/state.py",
line 5, in <module>
    from xml.etree.cElementTree import parse
  File
"/root/buildroot/output/host/usr/lib/python2.7/xml/etree/cElementTree.py", line
3, in <module>
    from _elementtree import *
ImportError:
/root/buildroot/output/host/usr/lib/python2.7/lib-dynload/_elementtree.so:
undefined symbol: PyUnicodeUCS2_FromFormat
make[2]: *** [xc_misc.c] Error 1

Failed to load the xcbgen Python package!
Make sure that xcb/proto installed it on your Python path.
If not, you will need to create a .pth file or define $PYTHONPATH
to extend the path.
Refer to the README file in xcb/proto for more info.

Traceback (most recent call last):
  File "./c_client.py", line 3294, in <module>
    from xcbgen.state import Module
  File
"/root/buildroot/output/host/usr/lib/python2.7/site-packages/xcbgen/state.py",
line 5, in <module>
    from xml.etree.cElementTree import parse
  File
"/root/buildroot/output/host/usr/lib/python2.7/xml/etree/cElementTree.py", line
3, in <module>
    from _elementtree import *
ImportError:
/root/buildroot/output/host/usr/lib/python2.7/lib-dynload/_elementtree.so:
undefined symbol: PyUnicodeUCS2_FromFormat
make[2]: *** [xproto.c] Error 1
make[2]: Leaving directory `/root/buildroot/output/build/host-libxcb-1.12/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/root/buildroot/output/build/host-libxcb-1.12'
make: *** [/root/buildroot/output/build/host-libxcb-1.12/.stamp_built] Error 2
root#

-- 
You are receiving this mail because:
You are on the CC list for the bug.
