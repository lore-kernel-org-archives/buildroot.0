From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 11:08:26 +0200
Subject: [Buildroot] [git commit] mpir: fix build failure on MIPS
Message-ID: <20170501090836.C2EE182818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e947766891c0473d0406afcf1e9a77e25292020a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/3de0ef545a7303ec6564ecf1a1da3dd539957ed4/

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
[Thomas: remove bogus PowerPC stuff, fix n64 specification, rework
commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpir/mpir.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 430d587..b7f3829 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -12,4 +12,12 @@ MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
 
+ifeq ($(BR2_MIPS_NABI32),y)
+MPIR_CONF_OPTS += ABI=n32
+endif
+
+ifeq ($(BR2_MIPS_NABI64),y)
+MPIR_CONF_OPTS += ABI=64
+endif
+
 $(eval $(autotools-package))
