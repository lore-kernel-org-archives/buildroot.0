From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:47:23 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: explicitly
	--enable-microhttpd
Message-ID: <20160229214740.8AD168033C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1a4b2809e8f7668e920152fdf3b26d59cbd1c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: fix commit title.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0681561..87fdbd7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -126,6 +126,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
+SYSTEMD_CONF_OPTS += --enable-microhttpd
 else
 SYSTEMD_CONF_OPTS += --disable-microhttpd
 endif
