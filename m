From: Erico Nunes <erico.nunes@datacom.ind.br>
Date: Fri, 23 Jan 2015 18:58:14 -0200
Subject: [Buildroot] [PATCH 2/3] python-markupsafe: allow build as host
	package
In-Reply-To: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>
References: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <1422046695-2354-2-git-send-email-erico.nunes@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-markupsafe is a dependency for python-jinja2, which can be used
during build time as a host tool to generate code based on templates.
This package is being added host package support mostly to allow
host-python-jinja2 to build.
This has been tested to build and work correctly as a host tool as well.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
---
 package/python-markupsafe/python-markupsafe.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 9c7eb14..c815728 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -12,3 +12,4 @@ PYTHON_MARKUPSAFE_LICENSE = BSD-3c
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
