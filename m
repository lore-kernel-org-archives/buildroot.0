From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 25 Mar 2018 00:59:51 -0300
Subject: [Buildroot] [PATCH 0/2] tpm2-* fix build errors
Message-ID: <20180325035953.25906-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Properly detect the support for SSP.
- Fix CodeSourcery NIOSII toolchain configuration, which incorrectly selected
  BR2_TOOLCHAIN_HAS_SSP.
- Fix compilation error in tpm2-tools due to uninitialized variable.

Notice that the first two changes CAN NOT be sent as separete patches because
the first one would break any build using CodeSourcery NIOSII toolchain.

Carlos Santos (2):
  toolchain: fix detection of SSP support
  tpm2-tools: fix compilation error due to uninitialized variable

 ...y-fix-type-may-be-used-uninitialized-warn.patch | 36 ++++++++++++++++++++++
 toolchain/helpers.mk                               |  2 +-
 .../Config.in                                      |  1 -
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch

-- 
2.14.3
