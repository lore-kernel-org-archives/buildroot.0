From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 15:22:30 +0100
Subject: [Buildroot] [git commit] Makefile: unexport 'PLATFORM' and 'OS'
 environment variables
Message-ID: <20190205142323.301B480FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3e535a839a893d4721240278fada4652544b60c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some package builds may fail when environment variables are present with the
same names as make variables in a package. This is a bigger problem for
environment variables with generic names, like 'PLATFORM' and 'OS'.

'PLATFORM' is for example a problem for host-acl.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 355a404e04..50a9f623b2 100644
--- a/Makefile
+++ b/Makefile
@@ -419,6 +419,8 @@ unexport TERMINFO
 unexport MACHINE
 unexport O
 unexport GCC_COLORS
+unexport PLATFORM
+unexport OS
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
