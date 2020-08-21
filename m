From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Aug 2020 18:35:28 +0200
Subject: [Buildroot] [PATCH 0/2] package/python-rpi-gopi: really fix for
 gcc-10, plus runtime test (branch yem/fixes)
Message-ID: <cover.1598027701.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

A previous patch was applied, that indeed made the gc-10 build succeed
(because, -fno-common). However, that patch only looked at quiescing
the build errors, and thus broke runtime, see #13166;

    ImportError: /usr/lib/python3.8/site-packages/RPi/_GPIO.cpython-38-aarch64-linux-gnu.so: undefined symbol: high

To avoid this situation, add a (limited) runtime test.


Regards,
Yann E. MORIN.


The following changes since commit 09e5e3dbdd4eade0190bb2bd303115dbb4336f9b

  package/igd2-for-linux: fix build with gcc 10 (2020-08-21 00:20:34 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to 748705989a4a29b9a0a1bc565d1adf83a8a70f45

  support/tests: add runtime test for python-rpi-gpio (2020-08-21 18:29:42 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/python-rpi-gpio: fix gcc-10 compatibility patch
      support/tests: add runtime test for python-rpi-gpio

 .../0001-fix-build-with-gcc-10.x.patch             | 66 ++++++++++++++++------
 .../tests/package/sample_python_rpi_gpio.py        |  6 ++
 .../testing/tests/package/test_python_rpi_gpio.py  | 11 ++++
 3 files changed, 65 insertions(+), 18 deletions(-)
 create mode 100644 support/testing/tests/package/sample_python_rpi_gpio.py
 create mode 100644 support/testing/tests/package/test_python_rpi_gpio.py

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
