From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Mar 2020 22:47:46 +0100
Subject: [Buildroot] [git commit] package/python-jinja2: fix async removal
 paths
Message-ID: <20200309140908.C09CA7FB4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b21a07b868321230854fb4794a90dcb64d7ce46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/dd5/dd5f151b2c9872476ab63c529468d0b37a0374f5/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
