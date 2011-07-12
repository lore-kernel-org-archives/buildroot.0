From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 13 Jul 2011 01:07:46 +0200
Subject: [Buildroot] [PATCH 2/2] source: print messages when all sources
	downloaded
In-Reply-To: <1310512066-11450-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1310512066-11450-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1310512066-11450-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When downloading all sources for later off-line build (eg. make source),
and the toolchain backend is crosstool-NG, the last messages the user
wil see is something like:
  [INFO ]  Retrieving needed toolchain components' tarballs: done in 98.02s (at 01:39)
  [INFO ]  Build completed at 20110713.000605
  [INFO ]  (elapsed: 1:39.21)
  [INFO ]  Finishing installation (may take a few seconds)...

which is pretty uninformative, here; crosstool-NG is just saying that
it just finished what it was asked for, that is download the sources,
but there is no separate message for that.

To avoid confusion, add an explicit message that makes it clear that
downloading the sources was sucessful, and nothing more.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 2f3802c..3021add 100644
--- a/Makefile
+++ b/Makefile
@@ -487,6 +487,9 @@ target-purgelocales:
 endif
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
+	@echo ""
+	@echo "*"
+	@echo "* Finished downloading the required packages' sources"
 
 _source-check:
 	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
-- 
1.7.2.5
