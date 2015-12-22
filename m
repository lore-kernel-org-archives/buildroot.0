From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 11:07:08 +0100
Subject: [Buildroot] [git commit] Makefile: Add RANLIB to the list of
	critical variables to unexport
Message-ID: <20151222100713.D67BF82538@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=344c5a20cc91b121fed625b64bece320d032b531
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If RANLIB is set and we're trying to build binutils, binutils will pick
this up and potentially fail to build.

Signed-off-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index dc657d9..1d69192 100644
--- a/Makefile
+++ b/Makefile
@@ -321,6 +321,7 @@ unexport ARCH
 unexport CC
 unexport CXX
 unexport CPP
+unexport RANLIB
 unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
