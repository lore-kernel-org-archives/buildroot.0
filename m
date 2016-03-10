From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:49:46 +0100
Subject: [Buildroot] [git commit] core: use $(CURDIR) to set TOPDIR
Message-ID: <20160310225021.2A92781D31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e049994086e64ad28aeccb524473752118e1fd8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This changes saves a shell call and uses a variable automatically set
by make [1].

[1] http://www.gnu.org/software/make/manual/make.html#Quick-Reference

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f2822a2..98c8dc7 100644
--- a/Makefile
+++ b/Makefile
@@ -69,7 +69,7 @@ endif
 .NOTPARALLEL:
 
 # absolute path
-TOPDIR := $(shell pwd)
+TOPDIR := $(CURDIR)
 CONFIG_CONFIG_IN = Config.in
 CONFIG = support/kconfig
 DATE := $(shell date +%Y%m%d)
