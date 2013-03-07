From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  7 Mar 2013 17:57:01 +0100
Subject: [Buildroot] [PATCH v2 2/5] cmake: remove target package macro
In-Reply-To: <20130306185646.42e08b5c@skate>
References: <20130306185646.42e08b5c@skate>
Message-ID: <1362675421-23710-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dummy target package is not needed anymore since commit 79bfcd556027901.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

Changed in v2: reworded according to Thomas' comment.

 package/cmake/cmake.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d0db502e..cfe8ab4 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -25,5 +25,4 @@ define HOST_CMAKE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
1.7.10.4
