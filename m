From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Mar 2021 23:32:07 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: enable B.A.T.M.A.N.
 V protocol by default
In-Reply-To: <20210314223207.13460-1-ps.report@gmx.net>
References: <20210314223207.13460-1-ps.report@gmx.net>
Message-ID: <20210314223207.13460-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As upstream enables CONFIG_BATMAN_ADV_BATMAN_V option since
2018.2 by defaullt ([1]) honor this in buildroot and do
the same (and remove the leagcy experimental comment accordingly).

[1] https://git.open-mesh.org/batman-adv.git/blob/HEAD:/CHANGELOG.rst#l174

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/batman-adv/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
index 9d3d7967b9..f3ac974296 100644
--- a/package/batman-adv/Config.in
+++ b/package/batman-adv/Config.in
@@ -25,11 +25,10 @@ config BR2_PACKAGE_BATMAN_ADV_NC
 	  https://www.open-mesh.org/projects/batman-adv/wiki/NetworkCoding
 
 config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
-	bool "enable B.A.T.M.A.N. V protocol (experimental)"
+	bool "enable B.A.T.M.A.N. V protocol"
+	default y
 	help
 	  Enables B.A.T.M.A.N. V network protocol.
-	  This is the next-gen protocol and is experimental at this
-	  time.
 
 	  https://www.open-mesh.org/projects/batman-adv/wiki/BATMAN_V
 
-- 
2.30.1
