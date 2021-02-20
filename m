From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 17:42:46 +0100
Subject: [Buildroot] [git commit] utils/scanpypi: use python3 explicitly
Message-ID: <20210220162127.342B68140F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee8b6808169e1e61b4318b44fbc706ec888c605d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

scanpypi is python3 compatible. In addition, it executes the setup.py
of Python modules to extract the relevant information. Since these are
more and more commonly using python3 constructs, using "python" to run
scanpypi causes problems on systems that have python2 installed as
python, when trying to parse setup.py scripts with python3 constructs.

Fixes part of #13516.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 51bc249f9e..47c7c00c60 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 """
 
 Utility for building Buildroot packages for existing PyPI packages
