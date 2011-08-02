From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 02 Aug 2011 20:33:14 +0200
Subject: [Buildroot] [PATCH 0 of 5] toolchain-external: support downloading
 custom toolchains + related misc. fixes
Message-ID: <patchbomb.1312309994@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series originates from the need to be able to use a custom external (buildroot) toolchain, downloaded from an scp location. Support for scp is not included in this series (it was submitted previously, but needs to be retriggered) but the prerequisites relevant for toolchain-external are.

While I was at it, a few CodeSourcery typos were fixed as well.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
For the patches related to host-tar, I would like to get some feedback regarding the best way to handle this. I found an earlier thread (http://lists.busybox.net/pipermail/buildroot/2011-March/042191.html - alsa-utils and nctp troubles with 2011.02) where the tar issue was left to rest because it was attributed to an old distribution. However, RedHat/CentOS still ship these old versions of tar, so I think the problem remains. The proposed changes do work and fix my problems, but may need refinement (as described in the patch comment).

 package/Makefile.package.in              |  9 ++++++++-
 package/tar/tar.mk                       |  3 +++
 toolchain/toolchain-external/Config.in   |  6 +++---
 toolchain/toolchain-external/ext-tool.mk |  8 ++++----
 4 files changed, 18 insertions(+), 8 deletions(-)
