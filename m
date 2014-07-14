From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 13:11:40 +0200
Subject: [Buildroot] [git commit] nasm: remove unused target package
Message-ID: <20140714111212.C08129CE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86cfc0bf9c7aef15a71ca1b2d4ea3f1f0676906a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When nasm was added in da8d09b716, it got both the host and the target
variants even though it doesn't have a Config.in and the target variant isn't
used anywhere. Therefore, this patch removes the unused target variant.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nasm/nasm.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b9077eb..b87d6ef 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -10,5 +10,4 @@ NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2c
 NASM_LICENSE_FILES = LICENSE
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
