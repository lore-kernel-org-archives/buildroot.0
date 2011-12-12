From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Dec 2011 10:25:50 +0100
Subject: [Buildroot] [git commit] Makefile: ensure CONFIG_SITE isn't set
Message-ID: <20111212092717.0B5488F931@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12c9f7dd6dee9c6029b4f9a12d6aac1516911ab4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes lib/lib64 issue when building on OpenSUSE.

Reported-by: Guillaume Gardet <guillaume.gardet@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 84cea1c..242265f 100644
--- a/Makefile
+++ b/Makefile
@@ -192,6 +192,7 @@ unexport CPP
 unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
+unexport CONFIG_SITE
 
 GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
