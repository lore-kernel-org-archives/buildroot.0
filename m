From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 16:08:58 +0100
Subject: [Buildroot] [PATCH 1/3] gettext: do not get the libiconv dependency
	on the host
In-Reply-To: <1364137740-21652-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364137740-21652-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364137740-21652-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/e47a439c7dd763c6abc02f77730838036472e828/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 4757cf8..8dc701e 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -11,6 +11,7 @@ GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
 
 GETTEXT_CONF_OPT += \
 	--disable-libasprintf \
-- 
1.7.9.5
