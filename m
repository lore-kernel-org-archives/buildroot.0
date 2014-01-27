From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 08:52:02 +0100
Subject: [Buildroot] [git commit] Makefile: Unexport TAR_OPTIONS
Message-ID: <20140127084947.00AC29C690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5437a65020f6882cc6cc3c25d781cdd5bd32e21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU tar > 1.13.17 interprets TAR_OPTIONS as an environment variable
containing options to be prepended to the set on the command line.

Since we use the same variable, if the user's environment already
contains TAR_OPTIONS, our use of the same variable name modifies
the environment and causes untars to misbehave when TAR_OPTIONS
causes a -xf to be prepended to the tar command line, likely
converting a subsequent flag into a spurious filename.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 9dfb1e0..067458b 100644
--- a/Makefile
+++ b/Makefile
@@ -261,6 +261,7 @@ unexport CPP
 unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
+unexport TAR_OPTIONS
 unexport CONFIG_SITE
 unexport QMAKESPEC
 unexport TERMINFO
