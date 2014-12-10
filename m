From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Tue,  9 Dec 2014 18:13:57 -0800
Subject: [Buildroot] [PATCH v2 1/1] mtr: bump to version 0.86 and use github
	call
In-Reply-To: <1418177455-27127-1-git-send-email-vsergeev@kumunetworks.com>
References: <1418177455-27127-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <1418177637-28038-1-git-send-email-vsergeev@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
---
 package/mtr/mtr.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index aa4d883..75cadc1 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MTR_VERSION = 0.85
-MTR_SITE = ftp://ftp.bitwizard.nl/mtr
+MTR_VERSION = v0.86
+MTR_SITE = $(call github,traviscross,mtr,$(MTR_VERSION))
+MTR_AUTORECONF = YES
 MTR_CONF_OPTS = --without-gtk --without-glib
 MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
 MTR_LICENSE = GPLv2
-- 
2.1.3
