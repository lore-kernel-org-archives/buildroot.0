From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 10:42:15 +0100
Subject: [Buildroot] [git commit] package/libev: enable for host
Message-ID: <20191029100310.92DAA8CAA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee9e281da7fff355d21b586b0f425ac36b389531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable host support because host-sysrepo depends on host-libev and
host-sysrepo is needed for netopeer-keystored.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libev/libev.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 2b2d5db004..38b0530f62 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -18,3 +18,4 @@ endef
 LIBEV_POST_PATCH_HOOKS += LIBEV_DISABLE_EVENT_H_INSTALL
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
