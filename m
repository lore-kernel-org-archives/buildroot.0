From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Feb 2019 22:11:45 +0100
Subject: [Buildroot] [PATCH-for-master 0/2] misc fixes for 2019.02
Message-ID: <20190225211147.14947-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hello,

These are two unrelated fixes for 2019.02.

Neither of them is really critical:
- the meson change is not a real problem for most people. It is a problem for me
  because of a custom change we have where HOST_DIR is made read-only after the
  first full build, so that subsequent makes can only touch TARGET_DIR.

- the iproute2 fix is only relevant if you have an old toolchain with glibc
  older than 2.18. I have this case with the Marvell/Cavium Octeon toolchain
  (glibc 2.16).

But, they do fix issues for me, hence the 'for-master' suffix.
You are of course free to decide otherwise.

Best regards,
Thomas

Thomas De Schampheleire (2):
  package/meson: don't install cross-compilation.conf during
    target-finalize
  package/iproute2: backport patch to fix compilation under glibc < 2.18

 ...-ss-fix-compilation-under-glibc-2.18.patch | 39 +++++++++++++++++++
 package/meson/meson.mk                        |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 package/iproute2/0002-ss-fix-compilation-under-glibc-2.18.patch

-- 
2.19.2
