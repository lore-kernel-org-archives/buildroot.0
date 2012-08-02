From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:55:01 -0000
Subject: [Buildroot] [git commit branch/next] graph-depends: ignore a few
	more uninteresting targets
Message-ID: <20120802195252.C99838D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8278ed43ef159d8b9dfe1be2d41ad5bcd8241dcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 4d82282..da050da 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -128,6 +128,8 @@ if mode == FULL_MODE:
     for tg in targets:
         # Skip uninteresting targets
         if tg == 'target-generic-issue' or \
+                tg == 'target-generic-getty-busybox' or \
+                tg == 'target-generic-do-remount-rw' or \
                 tg == 'target-finalize' or \
                 tg == 'erase-fakeroots' or \
                 tg == 'target-generic-hostname':
