From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 17:15:27 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] Makefile: unexport
 'PLATFORM' and 'OS' environment variables
Message-ID: <20190218161333.3D9947FDB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7539ab6c5bb02142079286003573a6bfbf1f67bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Some package builds may fail when environment variables are present with the
same names as make variables in a package. This is a bigger problem for
environment variables with generic names, like 'PLATFORM' and 'OS'.

'PLATFORM' is for example a problem for host-acl.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d3e535a839a893d4721240278fada4652544b60c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index c07ff3dae5..2ee7f92aa9 100644
--- a/Makefile
+++ b/Makefile
@@ -431,6 +431,8 @@ unexport TERMINFO
 unexport MACHINE
 unexport O
 unexport GCC_COLORS
+unexport PLATFORM
+unexport OS
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
