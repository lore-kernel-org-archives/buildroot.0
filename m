From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Aug 2014 11:54:07 +0200
Subject: [Buildroot] [PATCHv2 0/2] Installation of getent, solving bug #7142
Message-ID: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a second version of the patches to fix bug #7142. As I
proposed, this new version takes a simplified approach: it creates an
autonomous getent package, which simply installs the toolchain's
getent program when the toolchain is glibc based, and otherwise
installed the wrapper script borrowed from uclibc sources. This new
solution avoids doing complicated stuff in the toolchain support, and
completely isolates all the logic in the getent package.

It is functionally identical to the previously proposed solution,
except for internal uClibc toolchains: in the previous solution, the
getent script from the uClibc sources was used, while with this
solution, it's a fixed version inside the getent package that is being
used. However, considering the very simple nature of the script, it's
unlikely to be changed frequently in uClibc sources, so this
difference shouldn't cause much troubles.

Thanks,

Thomas

Thomas Petazzoni (2):
  getent: new package
  ecryptfs-utils: add runtime dependency on getent

 package/Config.in                |  1 +
 package/ecryptfs-utils/Config.in |  2 ++
 package/getent/Config.in         | 10 +++++++++
 package/getent/getent            | 45 ++++++++++++++++++++++++++++++++++++++++
 package/getent/getent.mk         | 26 +++++++++++++++++++++++
 5 files changed, 84 insertions(+)
 create mode 100644 package/getent/Config.in
 create mode 100644 package/getent/getent
 create mode 100644 package/getent/getent.mk

-- 
2.0.0
