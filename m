From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 16 Nov 2018 00:52:14 -0200
Subject: [Buildroot] [PATCH next 0/3] Update TPM2 packages
Message-ID: <20181116025217.27928-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series should be applied in a single commit, since the upgrade of
tpm2-tss breaks tpm2-abrmd and tpm2-tools if they are not upgraded too.
A single large patch, however, would be much harder to review.

Carlos Santos (3):
  tpm2-tss: bump to version 2.1.0
  tpm2-abrmd: bump to version 2.0.3
  tpm2-tools: bump to version 3.1.3

 package/tpm2-abrmd/Config.in                  |  7 +-
 package/tpm2-abrmd/S80tpm2-abrmd              |  2 +-
 package/tpm2-abrmd/tpm2-abrmd.hash            |  2 +-
 package/tpm2-abrmd/tpm2-abrmd.mk              |  2 +-
 .../0001-Fix-build-with-LibreSSL.patch        | 64 -------------------
 ...-type-may-be-used-uninitialized-warn.patch | 14 ++--
 package/tpm2-tools/Config.in                  |  7 +-
 package/tpm2-tools/tpm2-tools.hash            |  2 +-
 package/tpm2-tools/tpm2-tools.mk              |  2 +-
 .../0001-ESYS-Fix-build-with-LibreSSL.patch   | 48 ++++++++++++++
 ....cpp-add-missing-inclusion-of-sys-se.patch | 33 ----------
 package/tpm2-tss/Config.in                    |  5 +-
 package/tpm2-tss/tpm2-tss.hash                |  4 +-
 package/tpm2-tss/tpm2-tss.mk                  |  9 +--
 14 files changed, 70 insertions(+), 131 deletions(-)
 delete mode 100644 package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
 create mode 100644 package/tpm2-tss/0001-ESYS-Fix-build-with-LibreSSL.patch
 delete mode 100644 package/tpm2-tss/0001-tcti-tcti_socket.cpp-add-missing-inclusion-of-sys-se.patch

-- 
2.19.1
