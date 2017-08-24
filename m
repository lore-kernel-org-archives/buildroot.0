From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:07:21 +0200
Subject: [Buildroot] [git commit] bcusdk: enable tpuarts support in eibd
Message-ID: <20170902130619.C6B458016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebbfdde0670163f5fe1955fe4b42c15d9cfe50a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit will enable tpuarts in eibd as well. tpuarts is as
important as FT1.2 support, which is already enabled by default.

This causes a 8 KB increase of the installed size in /usr/bin (728 KB
instead of 720 KB for /usr/bin), so not enough to justify a separate
configuration option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bcusdk/bcusdk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index f99dd70..ff5becd 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -14,6 +14,7 @@ BCUSDK_CONF_OPTS = \
 	--enable-onlyeibd \
 	--enable-ft12 \
 	--enable-pei16 \
+	--enable-tpuarts \
 	--enable-eibnetip \
 	--enable-eibnetipserver \
 	--enable-eibnetiptunnel \
