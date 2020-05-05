From: Shyam Saini <mayhs11saini@gmail.com>
Date: Tue,  5 May 2020 09:22:42 -0400
Subject: [Buildroot] [V4 PATCH 0/1] cukinia: new package
Message-ID: <20200505132243.16773-1-shyam.saini@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After an initial proposal[1] to include Cukinia back in 2017, the
project has since gained in versatility and established a growing userbase.

Following Angelo Compagnucci's call[2] earlier on the mailing list,
here is a second and updated submission.

 [1] https://patchwork.ozlabs.org/project/buildroot/patch/20170425135814.8787-1-alexandre.leblanc at savoirfairelinux.com/
 [2] http://lists.busybox.net/pipermail/buildroot/2020-April/281338.html

Changelog:
V3->V4
 - Use cukinia version 0.5.1 with some bug fixes
 - Change sha256 hash for cukinia tar.gz package

V2->V3
 - Adjust Config.in as per Thomas's suggestion
 - Use simplest cukinia.conf file i.e, just check root user

V1->V2
 - It is not recommended to run it at boot time so remove init SZZcukinia script
   file and, remove BR2_PACKAGE_CUKINIA_BOOT option and all related configs 
 - Extend cukinia.conf file to include more example use cases.
 - Add cukinia.hash file and likewise add CUKINIA_LICENSE_FILES optionA.

Shyam Saini (1):
  cukinia: new package

 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/cukinia/Config.in    | 15 +++++++++++++++
 package/cukinia/cukinia.conf |  4 ++++
 package/cukinia/cukinia.hash |  4 ++++
 package/cukinia/cukinia.mk   | 20 ++++++++++++++++++++
 6 files changed, 47 insertions(+)
 create mode 100644 package/cukinia/Config.in
 create mode 100644 package/cukinia/cukinia.conf
 create mode 100644 package/cukinia/cukinia.hash
 create mode 100644 package/cukinia/cukinia.mk

-- 
2.20.1
