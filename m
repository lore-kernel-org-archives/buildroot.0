From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:37 +0200
Subject: [Buildroot] [PATCH 0/30] matchbox: huge cleanups (branch
	yem/matchbox)
Message-ID: <cover.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at cleaning up the matchbox packages.

Currently, the matchbox pckages are in a dire situation, where some
package do not even have a corresponding BR2_PACKAGE_FOO option, but are
nonetheless build dependencies ones of others.

Also, some support code has been bit-rotting and is not even buildable
today, ike support for compositing, which simply FTBFS.

Finally, some dependencies are incorrect. For example, there are build
dependencies not expressed in the Kconfig (not even counting the missing
Kconfig entries for packages), or are entirely wrong.

So, this series aims at fixing all of this. And add a little bit of
extra features we're currently missing. Not everything that is possible
with matchbox has been handled, though, like support for NLS.

The series is split into multiple parts;

  - patches 1-9 make all packages real packages, i.e. with proper
    Kconfig options. No functionality change.

  - patches 10-13 do a little eye-candy cleanups. No functionality
    change.

  - patches 14-17 fixes dependencies. No functionality change done on
    purpose, except because of added proper dependency tracking.

  - patch 18 stands out alone, a bit of eye-candy to add prompts for
    previously prompt-less packages. No functionality change.

  - patches 19-30 are not really sorted. They ar ea mix of fixes,
    eye-candy and the few new features.

This has been build-tested only, with about every combinations possible
excercised, for ARM. No run-time testing has been done, though.

Enjoy! ;-)

Regards,
Yann E. MORIN.


The following changes since commit d3230923e62f57cdefa90b5ffb9760f39c94718e:

  package/shairport-sync: bump to version 2.2.3 (2015-04-22 15:07:55 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/matchbox

for you to fetch changes up to 3de1b4334c76469f95d791d578f769831ab2f3a5:

  package/matchbox-panel: fix WiFi monitoring (2015-04-22 19:45:03 +0200)

----------------------------------------------------------------
Yann E. MORIN (30):
      package/matchbox: make matchbox-lib a real package
      package/matchbox: make matchbox-wm a real package
      package/matchbox-wm: drop useless commented options
      package/matchbox: make matchbox-panel a real package
      package/matchbox: make matchbox-desktop a real package
      package/matchbox: make matchbox-common a real package
      package/matchbox: make matchbox-fakekey a real package
      package/matchbox: make matchbox-keyboard a real package
      package/matchbox: make match-startup-monitor a real package
      package/matchbox: remove superfluous conditional includes
      package/matchbox: point to new home
      package/matchbox: get rid of intermediate non-package matchbox
      package/matchbox: fix option prompts
      package/matchbox-common: fix dependencies
      package/matchbox-common: break dependency chain for display
      package/matchbox-fakekey: add missing dependency
      package/matchbox-startup-monitor: add misisng dependency
      package/matchbox: finally add prompts to all sub-packages
      package/matchbox: enable support for the Xsession manager
      package/matchbox: cleanup handling of support for compositing
      package/matchbox: make it a menu
      package/matchbox: forcibly disable support for compositing
      package/matchbox: drop useless dependencies
      package/matchbox-keyboard: enforce disabling support for cairo
      package/matchbox-common: explicitly disable PDA folders when not selected
      package/matchbox: wrap long lines
      package/matchbox: xlib-libXcursor is an optional dependency
      package/matchbox-panel: add option to use ACPI for the battery applet
      package/matchbox-panel: add support for dnotify
      package/matchbox-panel: fix WiFi monitoring

 .../{matchbox-wm => }/0001-defaulttheme.patch      |  0
 package/matchbox/Config.in                         | 45 +++++--------------
 package/matchbox/matchbox-common/Config.in         | 14 ++++++
 .../matchbox/matchbox-common/matchbox-common.mk    |  2 +
 package/matchbox/matchbox-desktop/Config.in        |  5 +++
 package/matchbox/matchbox-fakekey/Config.in        |  5 +++
 package/matchbox/matchbox-keyboard/Config.in       |  7 +++
 .../matchbox-keyboard/matchbox-keyboard.mk         |  4 +-
 package/matchbox/matchbox-lib/Config.in            |  4 ++
 package/matchbox/matchbox-lib/matchbox-lib.mk      |  3 +-
 package/matchbox/matchbox-panel/Config.in          | 28 ++++++++++++
 package/matchbox/matchbox-panel/matchbox-panel.mk  | 18 ++++++--
 .../matchbox/matchbox-startup-monitor/Config.in    |  5 +++
 package/matchbox/matchbox-wm/matchbox-wm.mk        | 41 ------------------
 .../matchbox-wm.hash => matchbox.hash}             |  0
 package/matchbox/matchbox.mk                       | 50 ++++++++++++++++++++--
 16 files changed, 148 insertions(+), 83 deletions(-)
 rename package/matchbox/{matchbox-wm => }/0001-defaulttheme.patch (100%)
 create mode 100644 package/matchbox/matchbox-common/Config.in
 create mode 100644 package/matchbox/matchbox-desktop/Config.in
 create mode 100644 package/matchbox/matchbox-fakekey/Config.in
 create mode 100644 package/matchbox/matchbox-keyboard/Config.in
 create mode 100644 package/matchbox/matchbox-lib/Config.in
 create mode 100644 package/matchbox/matchbox-panel/Config.in
 create mode 100644 package/matchbox/matchbox-startup-monitor/Config.in
 delete mode 100644 package/matchbox/matchbox-wm/matchbox-wm.mk
 rename package/matchbox/{matchbox-wm/matchbox-wm.hash => matchbox.hash} (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
