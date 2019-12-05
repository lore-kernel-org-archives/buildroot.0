From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2019 10:30:48 +0100
Subject: [Buildroot] [git commit] utils/genrandconfig: test per-package
 directories
Message-ID: <20191205092342.898C787EAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6bbb785774af9d3925040ca61efcb388e832f74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the support for per-package directories has been merged, it
is time to get some exposure for it in the autobuilders, so let's
build 1 out of 15 builds with this feature enabled, at least as an
initial step.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index c221ebd670..5b60bc21d6 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -341,6 +341,10 @@ def gen_config(args):
     # Allow hosts with old certificates to download over https
     configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"\n")
 
+    # Per-package folder
+    if randint(0, 15) == 0:
+        configlines.append("BR2_PER_PACKAGE_DIRECTORIES=y\n")
+
     # Amend the configuration with a few things.
     if randint(0, 20) == 0:
         configlines.append("BR2_ENABLE_DEBUG=y\n")
