From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:24:48 +0100
Subject: [Buildroot] [git commit] utils: fix flake8 warning
Message-ID: <20210123200520.1174581807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9277978e28479449e517152105ae2e8a6d03151a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 40bb37bd70d refactored get-developers, and now the 'os' module is
no longer needed, but still imported:

    utils/get-developers:6:1: F401 'os' imported but unused
    1     F401 'os' imported but unused

Drop it now.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
