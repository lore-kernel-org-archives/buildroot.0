From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:55:30 +0200
Subject: [Buildroot] [PATCH 0 of 5] toolchain-external: improve support for
 custom toolchains
Message-ID: <patchbomb.1316588130@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds the ability to download and unpack a custom external
toolchain (instead of expecting the user to do that), and adds a configuration
option to copy extra external libraries to the target.

(Note that if you apply this on top of my scp/hg support patches, you should take
care in package/Makefile.package.in about a potentially double geturischeme
definition.)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Makefile.package.in              |  10 +++++++++-
 package/tar/tar.mk                       |   3 +++
 toolchain/toolchain-external/Config.in   |  21 ++++++++++++++++++++-
 toolchain/toolchain-external/ext-tool.mk |  21 +++++++++++++++++----
 4 files changed, 49 insertions(+), 6 deletions(-)
