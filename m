From: Erico Nunes <erico.nunes@datacom.ind.br>
Date: Fri, 23 Jan 2015 18:58:15 -0200
Subject: [Buildroot] [PATCH 3/3] python-jinja2: allow build as host package
In-Reply-To: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>
References: <1422046695-2354-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <1422046695-2354-3-git-send-email-erico.nunes@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jinja2 is a general purpose templating language for python and can be
required during build time for python scripts that generate code.

While currently there are no in-tree buildroot packages which depend on
host-python-jinja2, I'm currently having to deal with a proprietary
software build system that requires it.

I have tested that it builds and works correctly as a host python
package for a Buildroot host-python and someone else might require it,
so I'm proposing its inclusion.
It depends on host support for python-marksafe which was submitted in a
previous patch from this patchset.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
---
 package/python-jinja2/python-jinja2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 01f743b..3a79f78 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -13,3 +13,4 @@ PYTHON_JINJA2_LICENSE_FILES = LICENSE
 PYTHON_JINJA2_DEPENDENCIES = python-markupsafe
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
