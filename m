From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2015 23:11:52 +0100
Subject: [Buildroot] [git commit] dropbear: dropbear.service:
	/etc/default/dropbear is optional
Message-ID: <20151109222528.9C14781E68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04e401e20a8ef8db895f01238bd8d41bb2830cf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The environment file is for optional customization, so don't error out if it
isn't present.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.service |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
index 66ec9cf..620cdd7 100644
--- a/package/dropbear/dropbear.service
+++ b/package/dropbear/dropbear.service
@@ -19,7 +19,7 @@ if [ -L /etc/dropbear \
         mkdir -p "$(readlink /etc/dropbear)"; \
     fi; \
 fi'
-EnvironmentFile=/etc/default/dropbear
+EnvironmentFile=-/etc/default/dropbear
 ExecStart=/usr/sbin/dropbear -F -R $DROPBEAR_ARGS
 ExecReload=/bin/kill -HUP $MAINPID
 
