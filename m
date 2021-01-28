From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 17:43:56 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] utils: fix flake8 warning
Message-ID: <20210128200057.ED20683846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8f6453a55ed4ceff2dac61f9a6391053accfc45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Commit 40bb37bd70d refactored get-developers, and now the 'os' module is
no longer needed, but still imported:

    utils/get-developers:6:1: F401 'os' imported but unused
    1     F401 'os' imported but unused

Drop it now.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9277978e28479449e517152105ae2e8a6d03151a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/get-developers | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/get-developers b/utils/get-developers
index e027c26562..9182b2d85f 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -3,7 +3,6 @@
 import argparse
 import getdeveloperlib
 import sys
-import os
 
 
 def parse_args():
