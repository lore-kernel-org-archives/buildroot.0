From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 27 Nov 2019 17:26:03 -0800
Subject: [Buildroot] [PATCH v4 0/6] package/polkit: bump to version 0.116
Message-ID: <20191128012609.3632661-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

In this patch series I have bumped polkit to version 0.116.
I have also added the following:
  - Two tests of which ensure that polkit is working properly on systems running
    both init.d and systemd.
  - Service files for both systemd and init.d
  - A polkitd user upon which the polkitd daemon rely.
  - Setting permissions to the proper directories for the polkit user.

Adam Duskett (6):
  package/polkit: bump to version 0.116
  package/polkit: support different authentication frameworks
  package/polkit: add systemd service file.
  package/polkit: add init service file
  polkit-rules-test-systemd: new test
  polkit-rules-test-initd: new test

 DEVELOPERS                                    |   4 +
 .../0001-make-netgroup-support-optional.patch | 232 ++++++++++++++++++
 package/polkit/Config.in                      |  23 +-
 package/polkit/S50polkit                      |  15 ++
 package/polkit/polkit.hash                    |   2 +-
 package/polkit/polkit.mk                      |  39 ++-
 package/polkit/polkit.service                 |   7 +
 package/systemd/Config.in                     |  14 +-
 package/udisks/Config.in                      |  27 +-
 .../package/br2-external/polkit/Config.in     |   2 +
 .../package/br2-external/polkit/external.desc |   1 +
 .../package/br2-external/polkit/external.mk   |   1 +
 .../package/polkit-rules-test-initd/Config.in |   6 +
 .../polkit-rules-test-initd/hello-polkit.c    |   6 +
 .../hello-polkit.policy                       |  14 ++
 .../hello-polkit.rules                        |   6 +
 .../polkit-rules-test-initd.mk                |  31 +++
 .../polkit-rules-test-systemd/Config.in       |   6 +
 .../polkit-rules-test-systemd.mk              |  20 ++
 .../systemd-timesyncd-restart.rules           |   7 +
 .../tests/package/test_polkit_initd.py        |  53 ++++
 .../tests/package/test_polkit_systemd.py      |  51 ++++
 22 files changed, 546 insertions(+), 21 deletions(-)
 create mode 100644 package/polkit/0001-make-netgroup-support-optional.patch
 create mode 100644 package/polkit/S50polkit
 create mode 100644 package/polkit/polkit.service
 create mode 100644 support/testing/tests/package/br2-external/polkit/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.desc
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.c
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.policy
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/hello-polkit.rules
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-initd/polkit-rules-test-initd.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/polkit-rules-test-systemd.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test-systemd/systemd-timesyncd-restart.rules
 create mode 100644 support/testing/tests/package/test_polkit_initd.py
 create mode 100644 support/testing/tests/package/test_polkit_systemd.py

-- 
2.23.0
