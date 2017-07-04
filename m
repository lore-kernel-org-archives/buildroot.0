From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:42 +0200
Subject: [Buildroot] [PATCH 002/100] flex: remove bogus comment
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment that explains why we were defining HOST_FLEX_DEPENDENCIES
instead of inheriting from FLEX_DEPENDENCIES no longer makes sense,
since we remove such automatic inheritance of host dependencies from
target dependencies a while ago.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/flex/flex.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index aa6c026..905621e 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -12,7 +12,6 @@ FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GETTEXT_IF_LOCALE),gettext) host-m4
 FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
-# we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES = host-m4
 
 define FLEX_DISABLE_PROGRAM
-- 
2.9.4
