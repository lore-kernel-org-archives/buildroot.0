From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri,  8 Nov 2019 17:10:43 +0100
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: sort alphabetically list of
 required packages
Message-ID: <20191108161043.342378-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That change will alphabetically set list order
of required packages in Config.in file automatically.

Example below:

before: ['python-pyserial', 'python-pyaes', 'python-ecdsa']
after:  ['python-ecdsa', 'python-pyaes', 'python-pyserial']

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 utils/scanpypi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index b48eda49aa..796ce1d60c 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -612,6 +612,7 @@ class BuildrootPackage():
         bool_line = '\tbool "{name}"\n'.format(name=self.buildroot_name)
         lines.append(bool_line)
         if self.pkg_req:
+            self.pkg_req.sort()
             for dep in self.pkg_req:
                 dep_line = '\tselect BR2_PACKAGE_{req} # runtime\n'.format(
                     req=dep.upper().replace('-', '_'))
-- 
2.24.0
