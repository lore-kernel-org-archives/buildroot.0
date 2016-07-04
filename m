From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:30 +0200
Subject: [Buildroot] [PATCH 00/83 v2] packages: use menuconfig to group
	sub-options (branch yem/menuconfig)
Message-ID: <cover.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series cleans up the layout of the menuconfig UI. Although it looks
to be pretty long (83 patches), it really only boils down to mainly
three different changes :

  - patches 1-25: changes use of 'config'+'menu' into a 'menuconfig'
    (the Kconfig keywords) to automatically arrange the sub-options into
    sub-menus;

  - patches 26-27: document that packages with 5 or more options should
    use sub-menus (with 'menuconfig') to store their sub-options;

  - patches 28-83: change a lot of packages according to the new rule.

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


Changes v1 -> v2:
  - slight cleanups  (Thomas)

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


The following changes since commit d45b3064f11b532895c04a15f4c283eceea41220

  package/wireless_tools: Pretty fixes (2016-07-04 11:13:05 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 779b15791a114a8e6ee44e85122e1dd4baaf3196

  boot/uboot: use 'menuconfig' (2016-07-04 11:19:13 +0200)


----------------------------------------------------------------
Yann E. MORIN (83):
      boot/at91bootstrap: choices must have a type
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
      package/gr-osmosdr: use 'menuconfig'
      package/gstreamer: use 'menuconfig'
      package/gstreamer1: use 'menuconfig'
      package/igh-ethercat: use 'menuconfig'
      package/imlib2: use 'menuconfig'
      package/ipsec-tools: use 'menuconfig'
      package/lftp: use 'menuconfig'
      package/libgtk3: use 'menuconfig'
      package/libiio: use 'menuconfig'
      package/lighttpd: use 'menuconfig'
      package/linux-firmware: use 'menuconfig'
      package/lldpd: use 'menuconfig'
      package/lm-sensors: use 'menuconfig'
      package/lua{,jit}: move inclusion of external libraries/modules
      package/mtd: use 'menuconfig'
      package/ncurses: use 'menuconfig'
      package/ndisc6: use 'menuconfig'
      package/netsnmp: use 'menuconfig'
      package/ntp: use 'menuconfig'
      package/nvidia-driver: use 'menuconfig'
      package/openobex: use 'menuconfig'
      package/openocd: use 'menuconfig'
      package/poco: use 'menuconfig'
      package/qemu: use 'menuconfig'
      package/quagga: use 'menuconfig'
      package/sdl: use 'menuconfig'
      package/sdl: include SDL external libraries from sdl's Config.in
      package/sdl_*: remove redundant dependency
      package/squashfs: use 'menuconfig'
      package/sqlite: use 'menuconfig'
      package/transmission: use 'menuconfig'
      package/valgrind: use 'menuconfig'
      package/weston: use 'menuconfig'
      package/wpa-supplicant: use 'menuconfig'
      package/xenomai: use 'menuconfig'
      boot/at91bootstrap3: use 'menuconfig'
      boot/barebox: use 'menuconfig'
      boot/grub: use 'menuconfig'
      boot/mxs-bootlets: use 'menuconfig'
      boot/syslinux: use 'menuconfig'
      boot/uboot: use 'menuconfig'

 boot/at91bootstrap/Config.in                   |   2 +-
 boot/at91bootstrap3/Config.in                  |   2 +-
 boot/barebox/Config.in                         |   3 +-
 boot/grub/Config.in                            |  10 +-
 boot/mxs-bootlets/Config.in                    |   2 +-
 boot/syslinux/Config.in                        |   2 +-
 boot/uboot/Config.in                           |   3 +-
 docs/manual/adding-packages-directory.txt      |  53 +++++
 package/Config.in                              | 311 -------------------------
 package/angularjs/Config.in                    |  19 +-
 package/angularjs/angularjs.mk                 |  21 +-
 package/boost/Config.in                        |   2 +-
 package/cairo/Config.in                        |   2 +-
 package/collectd/Config.in                     |   3 +-
 package/connman/Config.in                      |   2 +-
 package/dejavu/Config.in                       |   2 +-
 package/directfb/Config.in                     |   2 +-
 package/dnsmasq/Config.in                      |   2 +-
 package/dovecot/Config.in                      |   2 +-
 package/dropbear/Config.in                     |   2 +-
 package/e2fsprogs/Config.in                    |   2 +-
 package/efl/Config.in                          |   2 +-
 package/erlang/Config.in                       |  17 +-
 package/flot/Config.in                         |   4 +-
 package/gd/Config.in                           |   6 +-
 package/gnuradio/Config.in                     |   9 +-
 package/google-material-design-icons/Config.in |   2 +-
 package/gpsd/Config.in                         |  25 +-
 package/gr-osmosdr/Config.in                   |   2 +-
 package/gstreamer/Config.in                    |  12 -
 package/gstreamer/gstreamer/Config.in          |  12 +-
 package/gstreamer1/Config.in                   |  11 -
 package/gstreamer1/gstreamer1/Config.in        |  11 +-
 package/igh-ethercat/Config.in                 |   2 +-
 package/imlib2/Config.in                       |   3 +-
 package/ipsec-tools/Config.in                  |   2 +-
 package/jquery/Config.in                       |  17 +-
 package/lftp/Config.in                         |   2 +-
 package/libdrm/Config.in                       |  14 +-
 package/libgtk3/Config.in                      |   2 +-
 package/libiio/Config.in                       |   2 +-
 package/lighttpd/Config.in                     |   2 +-
 package/linux-firmware/Config.in               |   2 +-
 package/lldpd/Config.in                        |   2 +-
 package/lm-sensors/Config.in                   |   3 +-
 package/lua/Config.ext                         |  51 ++++
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
 package/nvidia-driver/Config.in                |   2 +-
 package/ola/Config.in                          |  14 +-
 package/openobex/Config.in                     |   2 +-
 package/openocd/Config.in                      |   4 +-
 package/perl/Config.in                         |  48 +++-
 package/php/Config.ext                         |  20 +-
 package/php/Config.in                          |   6 +-
 package/poco/Config.in                         |   4 +-
 package/python/Config.ext                      | 155 ++++++++++++
 package/python/Config.in                       |   6 +-
 package/python3/Config.ext                     |   1 +
 package/python3/Config.in                      |   6 +-
 package/qemu/Config.in                         |   2 +-
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
 package/weston/Config.in                       |   2 +-
 package/wpa_supplicant/Config.in               |   2 +-
 package/xenomai/Config.in                      |   2 +-
 89 files changed, 532 insertions(+), 507 deletions(-)
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
