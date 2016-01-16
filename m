From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:07 +0100
Subject: [Buildroot] [PATCH 0/80 v1] pakages: use menuconfig to group
	sub-options (branch yem/menuconfig)
Message-ID: <cover.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series cleans up the layout of the menuconfig UI. Although it looks
to be pretty long (80 patches), it really only boils down to mainly three
different changes :

  - patches 1-27: changes use of 'config'+'menu' into a 'menuconfig'
    (the Kconfig keywords) to automatically arrange the sub-options into
    sub-menus;

  - patches 28-31: document that packages with 5 or more options should
    use sub-menus (with 'menuconfig') to store their sub-options;

  - patches 32-79: change a lot of packages according to the new rule.

A few interspersed, minor changes also provide further cleanups.


Using 'menuconfig' (like bar, below) instead of 'config'+'menu' (like
foo, below) provides a nicer layout (but that's just my taste!):

    [*] foo
        foo sub-menu --->
    [*] bar --->


Finally, moving 5-or-more sub-options to sub-menus also provides for a
nicer layout. Of course, I choose 5 arbitrarily; we can refine this
value, but 5 looked obvious to me.

This series however does not undo the 'menuconfig' of packages with less
than 5 sub-options, when such 'menuconfig' (or 'config'+'menu') were
already present before the series. This is left for another series later
on (this one is already big enough).


Last note: I did try to hunt for all packages, but it is not possible
to either:
  - review all Config.in, or
  - see all packages in the menuconfig UI (because of arch dependencies
    for example)

So, I may have missed a few... These can be fixed later.


Many thanks to Arnout for reviewing the series twice! :-)


Changes RFC -> v1:
  - don't turn some 'menu' into 'comment' when useless  (Arnout)
  - treat the 'angular' module separately  (Arnout)
  - follow our wrapping rules in the manual  (Arnout)
  - re-format the multi-line gnuradio comment  (Arnout)
  - tyopes  (Arnout)
  - re-order the gstreamer{,1} use of menuconfig after it is documented
  - use menuconfig for linux-firmware as well
  - re-order the post-manual patches alphabetically
  - the Kconfig syntax fixup in at91bootstrap


Regards,
Yann E. MORIN.


The following changes since commit 640b75c8d73d713c908d6b288802c9e6bffe76ed:

  package/boost: add patch to fix undeclared isnan issue (2016-01-16 18:18:31 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/menuconfig

for you to fetch changes up to 9cc34f973a4ae3d610dfa15de50d23df7f1cc365:

  boot/at91bootstrap: choices must have a type (2016-01-16 23:16:37 +0100)

----------------------------------------------------------------
Yann E. MORIN (80):
      package/alsa-lib: use 'menuconfig' instead of 'config'+'menu'
      package/alsa-utils: use 'menuconfig' instead of 'config'+'menu'
      package/angularjs: use 'menuconfig' instead of 'config'+'menu'
      package/angularjs: simplify modules selection
      package/collectd: use 'menuconfig' instead of 'config'+'menu'
      package/gd: use 'menuconfig' instead of 'config'+'menu'
      package/gpsd: use 'menuconfig' instead of 'config'+'menu'
      package/jquery: include external plugins from jquery's Config.in
      package/libdrm: move tests programs to the bottom
      package/libdrm: use 'menuconfig' instead of 'config'+'menu'
      package/mono: use 'menuconfig' instead of 'config'+'menu'
      package/ncftp: use 'menuconfig' instead of 'config'+'menu'
      package/nfs-utils: use 'menuconfig' instead of 'config'+'menu'
      package/nodejs: use 'menuconfig' instead of 'config'+'menu'
      package/ola: use 'menuconfig' instead of 'config'+'menu'
      package/perl: use 'menuconfig' instead of 'config'+'menu'
      package/php: move list of extensions after interface selection
      package/php: use 'menuconfig' instead of 'config'+'menu'
      package/python: use 'menuconfig' instead of 'config'+'menu'
      package/python3: use 'menuconfig' instead of 'config'+'menu'
      package/python{,3}: move inclusion of external python modules
      package/sdl_image: use 'menuconfig' instead of 'config'+'menu'
      package/tcl: use 'menuconfig' instead of 'config'+'menu'
      package/tiff: use 'menuconfig' instead of 'config'+'menu'
      package/udpcast: use 'menuconfig' instead of 'config'+'menu'
      package/gstreamer: include plugins from gstreamer's real Config.in
      package/gstreamer1: include plugins from gstreamer1's real Config.in
      docs/manual: slightly compactify a paragraph
      docs/manual: add ordering of kconfig options' attributes
      docs/manual: add example about sub-options
      docs/manual: use 'menuconfig' when there are more than 5 sub-options
      package/boost: use 'menuconfig'
      package/cairo: use 'menuconfig'
      package/connman: use 'menuconfig'
      package/dejavu: use 'menuconfig'
      package/directfb: use 'menuconfig'
      package/dnsmasq: use 'menuconfig'
      package/dovecot: use 'menuconfig'
      package/dropbear: use 'menuconfig'
      package/e2fsprogs: use 'menuconfig'
      package/efl: use 'menuconfig'
      package/erlang: include Erlang libraries from erlang's Config.in
      package/flot: use 'menuconfig'
      package/gnuradio: use 'menuconfig'
      package/gnuradio: split long omment
      package/google-material-design-icons: use 'menuconfig'
      package/gstreamer: use 'menuconfig'
      package/gstreamer1: use 'menuconfig'
      package/igh-ethercat: use 'menuconfig'
      package/imlib2: use 'menuconfig'
      package/ipsec-tools: use 'menuconfig'
      package/lftp: use 'menuconfig'
      package/libiio: use 'menuconfig'
      package/lighttpd: use 'menuconfig'
      package/linux-firmware: use 'menuconfig'
      package/lm-sensors: use 'menuconfig'
      package/lua{,jit}: move inclusion of external libraries/modules
      package/mtd: use 'menuconfig'
      package/ncurses: use 'menuconfig'
      package/ndisc6: use 'menuconfig'
      package/netsnmp: use 'menuconfig'
      package/ntp: use 'menuconfig'
      package/openobex: use 'menuconfig'
      package/openocd: use 'menuconfig'
      package/poco: use 'menuconfig'
      package/quagga: use 'menuconfig'
      package/sdl: use 'menuconfig'
      package/sdl: include SDL external libraries from sdl's Config.in
      package/sdl_*: remove redundant dependency
      package/squashfs: use 'menuconfig'
      package/sqlite: use 'menuconfig'
      package/transmission: use 'menuconfig'
      package/valgrind: use 'menuconfig'
      package/wpa-supplicant: use 'menuconfig'
      boot/at91bootstrap3: use 'menuconfig'
      boot/barebox: use 'menuconfig'
      boot/grub: use 'menuconfig'
      boot/mxs-bootlets: use 'menuconfig'
      boot/uboot: use 'menuconfig'
      boot/at91bootstrap: choices must have a type

 boot/at91bootstrap/Config.in                   |   2 +-
 boot/at91bootstrap3/Config.in                  |   2 +-
 boot/barebox/Config.in                         |   3 +-
 boot/grub/Config.in                            |  10 +-
 boot/mxs-bootlets/Config.in                    |   2 +-
 boot/uboot/Config.in                           |   3 +-
 docs/manual/adding-packages-directory.txt      |  73 ++++++-
 package/Config.in                              | 252 -------------------------
 package/alsa-lib/Config.in                     |   6 +-
 package/alsa-utils/Config.in                   |   5 +-
 package/angularjs/Config.in                    |  21 +--
 package/angularjs/angularjs.mk                 |  21 ++-
 package/boost/Config.in                        |   2 +-
 package/cairo/Config.in                        |   2 +-
 package/collectd/Config.in                     |  21 +--
 package/connman/Config.in                      |   2 +-
 package/dejavu/Config.in                       |   2 +-
 package/directfb/Config.in                     |   2 +-
 package/dnsmasq/Config.in                      |   2 +-
 package/dovecot/Config.in                      |   2 +-
 package/dropbear/Config.in                     |   2 +-
 package/e2fsprogs/Config.in                    |   3 +-
 package/efl/Config.in                          |   2 +-
 package/erlang/Config.in                       |  17 +-
 package/flot/Config.in                         |   4 +-
 package/gd/Config.in                           |   6 +-
 package/gnuradio/Config.in                     |   9 +-
 package/google-material-design-icons/Config.in |   2 +-
 package/gpsd/Config.in                         |  25 +--
 package/gstreamer/Config.in                    |  12 --
 package/gstreamer/gstreamer/Config.in          |  12 +-
 package/gstreamer1/Config.in                   |  11 --
 package/gstreamer1/gstreamer1/Config.in        |  11 +-
 package/igh-ethercat/Config.in                 |   2 +-
 package/imlib2/Config.in                       |   3 +-
 package/ipsec-tools/Config.in                  |   2 +-
 package/jquery/Config.in                       |  17 +-
 package/lftp/Config.in                         |   2 +-
 package/libdrm/Config.in                       |  14 +-
 package/libiio/Config.in                       |   2 +-
 package/lighttpd/Config.in                     |   2 +-
 package/linux-firmware/Config.in               |   2 +-
 package/lm-sensors/Config.in                   |   3 +-
 package/lua/Config.ext                         |  49 +++++
 package/lua/Config.in                          |   4 +-
 package/luajit/Config.ext                      |   1 +
 package/luajit/Config.in                       |   4 +-
 package/mono/Config.in                         |   8 +-
 package/mtd/Config.in                          |   3 +-
 package/ncftp/Config.in                        |   6 +-
 package/ncurses/Config.in                      |   2 +-
 package/ndisc6/Config.in                       |   2 +-
 package/netsnmp/Config.in                      |   2 +-
 package/nfs-utils/Config.in                    |   6 +-
 package/nodejs/Config.in                       |   6 +-
 package/ntp/Config.in                          |   2 +-
 package/ola/Config.in                          |  14 +-
 package/openobex/Config.in                     |   2 +-
 package/openocd/Config.in                      |   4 +-
 package/perl/Config.in                         |  48 ++++-
 package/php/Config.ext                         |  20 +-
 package/php/Config.in                          |   6 +-
 package/poco/Config.in                         |   4 +-
 package/python/Config.ext                      |  98 ++++++++++
 package/python/Config.in                       |   6 +-
 package/python3/Config.ext                     |   1 +
 package/python3/Config.in                      |   6 +-
 package/quagga/Config.in                       |   2 +-
 package/sdl/Config.in                          |  11 +-
 package/sdl_gfx/Config.in                      |   1 -
 package/sdl_image/Config.in                    |   7 +-
 package/sdl_mixer/Config.in                    |   1 -
 package/sdl_net/Config.in                      |   1 -
 package/sdl_sound/Config.in                    |   1 -
 package/sdl_ttf/Config.in                      |   1 -
 package/sqlite/Config.in                       |   2 +-
 package/squashfs/Config.in                     |   2 +-
 package/tcl/Config.in                          |   7 +-
 package/tiff/Config.in                         |   4 +-
 package/transmission/Config.in                 |   3 +-
 package/udpcast/Config.in                      |   6 +-
 package/valgrind/Config.in                     |   2 +-
 package/wpa_supplicant/Config.in               |   2 +-
 83 files changed, 486 insertions(+), 471 deletions(-)
 create mode 100644 package/lua/Config.ext
 create mode 120000 package/luajit/Config.ext
 create mode 100644 package/python/Config.ext
 create mode 120000 package/python3/Config.ext

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
