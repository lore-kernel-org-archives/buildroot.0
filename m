From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:40 +0200
Subject: [Buildroot] [git commit] libcap: use $(HOST_DIR) as prefix instead
	of DESTDIR
Message-ID: <20170705141336.DDFC281D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4013858646c41f5f4074d81aa67386e28dbc5d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and also remove the /usr prefix.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap/libcap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 35a6a97..48c2cb3 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -63,8 +63,8 @@ define HOST_LIBCAP_BUILD_CMDS
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
-		RAISE_SETFCAP=no prefix=/usr lib=lib install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
+		RAISE_SETFCAP=no lib=lib install
 endef
 
 $(eval $(generic-package))
