From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  2 Feb 2018 13:56:10 -0200
Subject: [Buildroot] [PATCH 0/4] Add TPM2 software family
Message-ID: <20180202155614.26938-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds packages for the Trusted Computing Group's (TCG) TPM2
Software Stack (TSS). These packages supersede the ones provided by the
ancient "trousers" and "tpm" packages but can coexist with them.

Patch #1 adds tpm2-tss, the libries implementing the TPM2 specification:

    https://github.com/tpm2-software/tpm2-tss

Patch #2 adds tpm2-abrmd, the Access Broker & Resource Manager:

    https://github.com/tpm2-software/tpm2-abrmd

Patch #3 adds tpm2-tools, a set of CLI tools based on tpm2-tss:

    https://github.com/tpm2-software/tpm2-tools

Patch #4 adds me to the watchers of tpm2-{abrmd,tools,tss} in DEVELOPERS

These packages were tested on a device with an Intel C3000 processr.

Carlos Santos (4):
  tpm2-tss: new package
  tpm2-abrmd: new package
  tpm2-tools: new package
  DEVELOPERS: add myself for tpm2-{abrmd,tools,tss}.

 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  3 +
 package/tpm2-abrmd/Config.in                       | 26 ++++++++
 package/tpm2-abrmd/S30devtpmperms                  | 37 +++++++++++
 package/tpm2-abrmd/S80tpm2-abrmd                   | 74 ++++++++++++++++++++++
 package/tpm2-abrmd/etc.default.tpm2-abrmd          |  1 +
 package/tpm2-abrmd/tpm2-abrmd.hash                 |  3 +
 package/tpm2-abrmd/tpm2-abrmd.mk                   | 36 +++++++++++
 .../tpm2-tools/0001-Fix-build-with-LibreSSL.patch  | 64 +++++++++++++++++++
 package/tpm2-tools/Config.in                       | 17 +++++
 package/tpm2-tools/tpm2-tools.hash                 |  3 +
 package/tpm2-tools/tpm2-tools.mk                   | 13 ++++
 package/tpm2-tss/Config.in                         | 32 ++++++++++
 package/tpm2-tss/tpm2-tss.hash                     |  3 +
 package/tpm2-tss/tpm2-tss.mk                       | 14 ++++
 15 files changed, 329 insertions(+)
 create mode 100644 package/tpm2-abrmd/Config.in
 create mode 100755 package/tpm2-abrmd/S30devtpmperms
 create mode 100755 package/tpm2-abrmd/S80tpm2-abrmd
 create mode 100644 package/tpm2-abrmd/etc.default.tpm2-abrmd
 create mode 100644 package/tpm2-abrmd/tpm2-abrmd.hash
 create mode 100644 package/tpm2-abrmd/tpm2-abrmd.mk
 create mode 100644 package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
 create mode 100644 package/tpm2-tools/Config.in
 create mode 100644 package/tpm2-tools/tpm2-tools.hash
 create mode 100644 package/tpm2-tools/tpm2-tools.mk
 create mode 100644 package/tpm2-tss/Config.in
 create mode 100644 package/tpm2-tss/tpm2-tss.hash
 create mode 100644 package/tpm2-tss/tpm2-tss.mk

-- 
2.14.3
