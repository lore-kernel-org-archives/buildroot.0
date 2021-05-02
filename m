From: Dick Olsson <hi@senzilla.io>
Date: Sun, 02 May 2021 08:16:59 +0000
Subject: [Buildroot] [PATCH 0/5] Runtime tests for skaware packages
Message-ID: <hg0byCTnzKxhwKnnMblHN21zFaD13IslpvSAl1kvXt8@cp3-web-016.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

First, please note that there is a shebang line in test_s6.py that
depends on this to be applied first:

http://patchwork.ozlabs.org/project/buildroot/patch/QGtdA2cPWOwJPXUQeX3ZDbP2xoZ08eKz92Kd7zoEJqQ at cp7-web-039.plabs.ch/

This series introduce a few basic but solid runtime tests for the
most important skaware packages. These will be good to have before
packaging the s6 init system as discussed here:

http://lists.busybox.net/pipermail/buildroot/2021-May/309383.html


Dick Olsson (5):
  support/testing: add execline tests
  support/testing: add s6 tests
  support/testing: add s6-portable-utils tests
  support/testing: add s6-rc tests
  support/testing: add s6-networking tests

 .../testing/tests/package/test_execline.py    | 22 ++++++++
 support/testing/tests/package/test_s6.py      | 54 +++++++++++++++++++
 .../tests/package/test_s6_networking.py       | 35 ++++++++++++
 .../tests/package/test_s6_portable_utils.py   | 31 +++++++++++
 support/testing/tests/package/test_s6_rc.py   | 46 ++++++++++++++++
 5 files changed, 188 insertions(+)
 create mode 100644 support/testing/tests/package/test_execline.py
 create mode 100644 support/testing/tests/package/test_s6.py
 create mode 100644 support/testing/tests/package/test_s6_networking.py
 create mode 100644 support/testing/tests/package/test_s6_portable_utils.py
 create mode 100644 support/testing/tests/package/test_s6_rc.py

-- 
2.30.2
