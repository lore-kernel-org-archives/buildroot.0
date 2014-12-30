From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Dec 2014 00:25:28 +0100
Subject: [Buildroot] [git commit] oprofile: cleanup the style of the
	OPROFILE_BINARIES definition
Message-ID: <20141230235848.A3C1E807E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36e6053a23fbd360ab750818441a918faf00b445
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need to repeat OPROFILE_BINARIES += many times to add more
values to the variable. Just define it once with all the values, as we
do everywhere else in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/oprofile.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 0c884b9..1322d9d 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -12,10 +12,12 @@ OPROFILE_CONF_OPTS = \
 	--disable-account-check \
 	--enable-gui=no \
 	--with-kernel=$(STAGING_DIR)/usr
-OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
-OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv
-OPROFILE_BINARIES += utils/op-check-perfevents libabi/opimport
-OPROFILE_BINARIES += pe_counting/ocount
+
+OPROFILE_BINARIES = \
+	utils/ophelp pp/opannotate pp/oparchive pp/opgprof \
+	pp/opreport opjitconv/opjitconv \
+	utils/op-check-perfevents libabi/opimport \
+	pe_counting/ocount
 
 # No perf_events support in kernel for avr32
 ifneq ($(BR2_avr32),y)
