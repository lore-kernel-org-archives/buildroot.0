From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Jan 2014 21:11:44 +0100
Subject: [Buildroot] [git commit] manual: use current date/time for
	'generated on'
Message-ID: <20140104201238.B99449C3A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e2b7057c65f06426b7c9b37df8ee9a3d1e62fb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the manual uses the last modification date and time of
manual.txt in the generated manual.

This is confusing, especially for long-checked-out repositories where
the top-level manual.txt has not changed since the check out. Moreover,
the manual explicitly states 'generated on', which is confusing at best.

Use the current date and time instead.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 9ae658e..958afae 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -8,8 +8,8 @@ The Buildroot user manual
 Buildroot usage and documentation by Thomas Petazzoni. Contributions
 from Karsten Kruse, Ned Ludd, Martin Herren and others.
 
-Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {docdate}
-{doctime} from git revision {sys:git rev-parse --short HEAD}
+Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
+{localtime} from git revision {sys:git rev-parse --short HEAD}
 
 image::logo.png[]
 
