From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 12:05:13 +0100
Subject: [Buildroot] [PATCH 3/3] oprofile: cleanup the style of the
	OPROFILE_BINARIES definition
In-Reply-To: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419851113-11865-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to repeat OPROFILE_BINARIES += many times to add more
values to the variable. Just define it once with all the values, as we
do everywhere else in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/oprofile.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

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
-- 
2.1.0
