From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:47 -0000
Subject: [Buildroot] [git commit] utils/scanpypi: sort alphabetically list
 of required packages
Message-ID: <20191202083931.5CF40813A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d28d0203af466ea6aa1c82d9ef765ce9ea4a577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

That change will alphabetically set list order
of required packages in Config.in file automatically.

Example below:

before: ['python-pyserial', 'python-pyaes', 'python-ecdsa']
after:  ['python-ecdsa', 'python-pyaes', 'python-pyserial']

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
