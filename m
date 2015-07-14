From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jul 2015 09:50:57 +0200
Subject: [Buildroot] [PATCH] core/download: don't be verbose in scp
Message-ID: <1436860257-31021-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we by default run scp with the -v option, which is highly
verbose (as -v is intended to be a debug option for scp).

Remove the option altogether to get back to a normal output by default.

Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/scp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/download/scp b/support/download/scp
index 3d6876f..f29686a 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -11,7 +11,6 @@ set -e
 # Environment:
 #   SCP       : the scp command to call
 
-verbose=-v
 while getopts :q OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
-- 
1.9.1
