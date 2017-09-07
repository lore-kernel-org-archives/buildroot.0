From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Sep 2017 15:10:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] openjpeg: security bump
	to version 2.2.0
Message-ID: <20170907130825.3A0DE80FBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a944b6a2d3ee42bc5b1629816c4aeec146841cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

CVE-2016-10504: Heap-based buffer overflow vulnerability in the
opj_mqc_byteout function in mqc.c in OpenJPEG before 2.2.0 allows remote
attackers to cause a denial of service (application crash) via a crafted bmp
file.

CVE-2016-10505: NULL pointer dereference vulnerabilities in the imagetopnm
function in convert.c, sycc444_to_rgb function in color.c,
color_esycc_to_rgb function in color.c, and sycc422_to_rgb function in
color.c in OpenJPEG before 2.2.0 allow remote attackers to cause a denial of
service (application crash) via crafted j2k files.

CVE-2016-10506: Division-by-zero vulnerabilities in the functions
opj_pi_next_cprl, opj_pi_next_pcrl, and opj_pi_next_rpcl in pi.c in OpenJPEG
before 2.2.0 allow remote attackers to cause a denial of service
(application crash) via crafted j2k files.

CVE-2016-10507: Integer overflow vulnerability in the bmp24toimage function
in convertbmp.c in OpenJPEG before 2.2.0 allows remote attackers to cause a
denial of service (heap-based buffer over-read and application crash) via a
crafted bmp file.

[Peter: extend commit message with security fixes info]
Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 37b2fe73cff726ac05cdb200e803f267a48721f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjpeg/openjpeg.hash | 2 +-
 package/openjpeg/openjpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index c0abd0c..0e51aae 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	4ce77b6ef538ef090d9bde1d5eeff8b3069ab56c4906f083475517c2c023dfa7  openjpeg-2.1.2.tar.gz
+sha256	6fddbce5a618e910e03ad00d66e7fcd09cc6ee307ce69932666d54c73b7c6e7b  openjpeg-2.2.0.tar.gz
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index ca22068..e671713 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.1.2
+OPENJPEG_VERSION = 2.2.0
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2c
 OPENJPEG_LICENSE_FILES = LICENSE
