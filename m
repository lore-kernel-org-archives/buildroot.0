From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  2 Jan 2013 21:36:03 +0100
Subject: [Buildroot] [PATCH] graph-depends: add to exclusion list
In-Reply-To: <201301022128.33543.yann.morin.1998@free.fr>
References: <201301022128.33543.yann.morin.1998@free.fr>
Message-ID: <1357158963-3251-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the root-password internal target to the exclusion list.

Fixes failures like:
    Getting dependencies for [... 'target-root-passwd' ...]
    Error getting dependencies [... 'target-root-passwd' ...]

Which is easily singled out with:
    $ make target-root-passwd-show-depends
    make[1]: *** No rule to make target `target-root-passwd-show-depends'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 556f11d..1163d79 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -167,6 +167,7 @@ TARGET_EXCEPTIONS = [
     "target-finalize",
     "erase-fakeroots",
     "target-generic-hostname",
+    "target-root-passwd",
 ]
 
 # In full mode, start with the result of get_targets() to get the main
-- 
1.7.2.5
