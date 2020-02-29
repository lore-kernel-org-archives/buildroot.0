From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 28 Feb 2020 18:11:55 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: fix async removal
 paths
Message-ID: <20200229011155.10706-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/dd5/dd5f151b2c9872476ab63c529468d0b37a0374f5/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jinja2/python-jinja2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 189b75d18f..64b4c60c9b 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -20,7 +20,7 @@ HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 # Hence remove both files after package extraction.
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 define PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
-	rm $(@D)/jinja2/asyncsupport.py $(@D)/jinja2/asyncfilters.py
+	rm $(@D)/src/jinja2/asyncsupport.py $(@D)/src/jinja2/asyncfilters.py
 endef
 
 PYTHON_JINJA2_POST_EXTRACT_HOOKS = PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
-- 
2.20.1
