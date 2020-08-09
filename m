From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  9 Aug 2020 21:38:12 +0200
Subject: [Buildroot] [PATCH v2 0/5] Bootlin toolchains integration into
 Buildroot
Message-ID: <20200809193818.1139805-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series integrate the Bootlin toolchains (from
https://toolchains.bootlin.com) as toolchain profiles in Buildroot, so
that they can easily be used.

Since there is ~150 toolchains, it is not practical to add them
manually, so this patch series adds a script that generates the
toolchain-external-bootlin/ package using the information provided at
https://toolchains.bootlin.com/downloads/releases/toolchains/.

In addition to adding the toolchain package itself, we also add one
test case for each toolchain, to verify that its integration in
Buildroot is working fine.

This series is also available at:

  https://github.com/tpetazzoni/buildroot/commits/bl-toolchains

Since the first version, I have taken into account the changes
suggested by Titouan, see PATCH 1 for the details. The other patches
are either unchanged, or the changes are just the result of the script
generating a slightly different output due to changes in the script
itself.

Best regards,

Thomas Petazzoni

Thomas Petazzoni (5):
  support/scripts/gen-bootlin-toolchains: add new script to support
    Bootlin toolchains
  support/testing/tests/toolchain/test_external: support non-ELF
    toolchains
  toolchain/toolchain-external/toolchain-external-bootlin: add
    auto-generated files
  toolchain/toolchain-external/toolchain-external-bootlin: finalize
    package addition
  support/testing/test/toolchain/test_external_bootlin: new test cases

 support/scripts/gen-bootlin-toolchains        |  475 +++
 .../testing/tests/toolchain/test_external.py  |   14 +-
 .../tests/toolchain/test_external_bootlin.py  | 2354 +++++++++++
 toolchain/toolchain-external/Config.in        |    6 +
 .../toolchain-external-bootlin/Config.in      |    9 +
 .../Config.in.options                         | 3587 +++++++++++++++++
 .../toolchain-external-bootlin.hash           |  308 ++
 .../toolchain-external-bootlin.mk             |  927 +++++
 8 files changed, 7675 insertions(+), 5 deletions(-)
 create mode 100755 support/scripts/gen-bootlin-toolchains
 create mode 100644 support/testing/tests/toolchain/test_external_bootlin.py
 create mode 100644 toolchain/toolchain-external/toolchain-external-bootlin/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk

-- 
2.26.2
