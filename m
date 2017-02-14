From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 20:55:00 +0100
Subject: [Buildroot] [git commit] package/ccache: do not force colored
	diagnostics
Message-ID: <20170214195524.899F37FE9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cff741ebaf7123739398686ace186ed9974e71c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
this flag requires GCC v4.9 or later. Older versions complain about the
unrecognized command line option.

Using GCC_COLORS in the context of Buildroot is seldom useful, so we
just unexport GCC_COLORS altogether.

Reported-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index dcda8fe..4db971b 100644
--- a/Makefile
+++ b/Makefile
@@ -402,6 +402,7 @@ unexport QMAKESPEC
 unexport TERMINFO
 unexport MACHINE
 unexport O
+unexport GCC_COLORS
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
