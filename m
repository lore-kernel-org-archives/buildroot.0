From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 15:18:40 +0100
Subject: [Buildroot] [git commit] utils/scanpypi: increase error message
 verbosity
Message-ID: <20171218141845.806417FE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d2c69dad50a0b9d770c1a1898db8a65d34813c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When package installation fails it is good to know what happened.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/scanpypi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 02384f2..939c26a 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -608,9 +608,9 @@ def main():
                 else:
                     raise
                 continue
-            except AttributeError:
-                print('Error: Could not install package {pkg}'.format(
-                    pkg=package.real_name))
+            except AttributeError as error:
+                print('Error: Could not install package {pkg}: {error}'.format(
+                    pkg=package.real_name, error=error))
                 continue
 
             # Package requirement are an argument of the setup function
