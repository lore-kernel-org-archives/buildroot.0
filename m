From: Erico Nunes <erico.nunes@datacom.ind.br>
Date: Fri, 23 Jan 2015 18:58:13 -0200
Subject: [Buildroot] [PATCH 1/3] python-jinja2: add python-markupsafe as
	dependency
Message-ID: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_PYTHON_JINJA2 selects the BR2_PACKAGE_PYTHON_MARKUPSAFE
option but doesn't depend on it in python-jinja2.mk.

This turned in an error in an attempt to build python-jinja2 for host:
"No local packages or download links found for markupsafe"

Adding the python-markupsafe fixes this error and also ensures that it
builds before python-jinja2 in any case.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
---
 package/python-jinja2/python-jinja2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 49625e3..01f743b 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -10,5 +10,6 @@ PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3c
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
+PYTHON_JINJA2_DEPENDENCIES = python-markupsafe
 
 $(eval $(python-package))
-- 
1.9.1
