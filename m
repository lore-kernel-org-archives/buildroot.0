From: Celso Varella <celso.neto.cwi@datacom.com.br>
Date: Fri,  6 Jul 2018 11:36:11 -0300
Subject: [Buildroot] [PATCH 0/3] New packages to support UEFI Secure Boot
Message-ID: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 1: add efitools package
Patch 2: add gnu-efi host variante required by host-sbsigntools
Patch 3: add sbsigntools host and target package

Celso Varella (3):
  efitools: new package
  gnu-efi: add host variant
  sbsigntools: new package

 package/Config.in                                  |   2 +
 package/Config.in.host                             |   1 +
 ...kefile-remove-all-dependencies-from-sbsig.patch | 155 ++++++++++++++++++++
 ...ke.rules-remove-all-dependencies-from-sbs.patch | 159 +++++++++++++++++++++
 ...tion-of-mount-command-to-turn-compatible-.patch |  27 ++++
 package/efitools/Config.in                         |   9 ++
 package/efitools/efitools.hash                     |   3 +
 package/efitools/efitools.mk                       |  21 +++
 package/gnu-efi/gnu-efi.mk                         |  20 +++
 .../0001-configure-fix-AM_INIT_AUTOMAKE-call.patch |  32 +++++
 ...rove-error-handling-in-__fileio_read_file.patch |  68 +++++++++
 package/sbsigntools/Config.in                      |  20 +++
 package/sbsigntools/Config.in.host                 |   7 +
 package/sbsigntools/sbsigntools.hash               |  10 ++
 package/sbsigntools/sbsigntools.mk                 |  83 +++++++++++
 15 files changed, 617 insertions(+)
 create mode 100644 package/efitools/0001-Efitools-Makefile-remove-all-dependencies-from-sbsig.patch
 create mode 100644 package/efitools/0002-Efitools-Make.rules-remove-all-dependencies-from-sbs.patch
 create mode 100644 package/efitools/0003-remove-l-option-of-mount-command-to-turn-compatible-.patch
 create mode 100644 package/efitools/Config.in
 create mode 100644 package/efitools/efitools.hash
 create mode 100644 package/efitools/efitools.mk
 create mode 100644 package/sbsigntools/0001-configure-fix-AM_INIT_AUTOMAKE-call.patch
 create mode 100644 package/sbsigntools/0002-fileio-improve-error-handling-in-__fileio_read_file.patch
 create mode 100644 package/sbsigntools/Config.in
 create mode 100644 package/sbsigntools/Config.in.host
 create mode 100644 package/sbsigntools/sbsigntools.hash
 create mode 100644 package/sbsigntools/sbsigntools.mk

-- 
2.7.4
