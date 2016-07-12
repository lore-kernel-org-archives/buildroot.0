From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:21 +0200
Subject: [Buildroot] [PATCH 0/7] new package: ti-sgx - SGX graphics
	acceleration for TI SoCs
Message-ID: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for SGX graphics acceleration for Texas Instuments SoCs
It's an alternative for the existing ti-gfx package but suppports newer
Linux 4.1 kernels and addtional processors (AM4xxx/AM5xxx).
The ti-gfx package is not obsolete as it supports older CPUs/kernels.
This patch is based on the ti-processor-sdk-02.00.00.00 and includes some
binary demos for testing.

Lothar Felten (7):
  ti-gfx: config help text: list supported processors
  new package: ti-sgx/ti-sgx-km kernel module SGX graphics accelerator
  new package: ti-sgx/ti-sgx-um binary libraries SGX graphics
    accelerator
  new package: ti-sgx/ti-sgx-libgbm libgbm for SGX graphics accelerator
  new package: ti-sgx/ti-sgx-demos SGX binary demos
  new package: ti-sgx top level package for SGX graphics accelerator
  add ti-sgx package to menu

 package/Config.in                               |  1 +
 package/ti-gfx/Config.in                        |  4 +-
 package/ti-sgx/Config.in                        | 71 +++++++++++++++++++++++++
 package/ti-sgx/ti-sgx-demos/Config.in           |  4 ++
 package/ti-sgx/ti-sgx-demos/ti-sgx-demos.hash   |  2 +
 package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk     | 20 +++++++
 package/ti-sgx/ti-sgx-km/Config.in              |  4 ++
 package/ti-sgx/ti-sgx-km/ti-sgx-km.hash         |  2 +
 package/ti-sgx/ti-sgx-km/ti-sgx-km.mk           | 48 +++++++++++++++++
 package/ti-sgx/ti-sgx-libgbm/Config.in          |  5 ++
 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash |  2 +
 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk   | 41 ++++++++++++++
 package/ti-sgx/ti-sgx-um/Config.in              |  4 ++
 package/ti-sgx/ti-sgx-um/S80ti-sgx              | 16 ++++++
 package/ti-sgx/ti-sgx-um/powervr.ini            |  5 ++
 package/ti-sgx/ti-sgx-um/ti-sgx-um.hash         |  2 +
 package/ti-sgx/ti-sgx-um/ti-sgx-um.mk           | 49 +++++++++++++++++
 package/ti-sgx/ti-sgx.mk                        |  8 +++
 18 files changed, 287 insertions(+), 1 deletion(-)
 create mode 100644 package/ti-sgx/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-demos/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-demos/ti-sgx-demos.hash
 create mode 100644 package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk
 create mode 100644 package/ti-sgx/ti-sgx-km/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-km/ti-sgx-km.hash
 create mode 100644 package/ti-sgx/ti-sgx-km/ti-sgx-km.mk
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.hash
 create mode 100644 package/ti-sgx/ti-sgx-libgbm/ti-sgx-libgbm.mk
 create mode 100644 package/ti-sgx/ti-sgx-um/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-um/S80ti-sgx
 create mode 100644 package/ti-sgx/ti-sgx-um/powervr.ini
 create mode 100644 package/ti-sgx/ti-sgx-um/ti-sgx-um.hash
 create mode 100644 package/ti-sgx/ti-sgx-um/ti-sgx-um.mk
 create mode 100644 package/ti-sgx/ti-sgx.mk

-- 
1.9.1
