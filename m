From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 3 Nov 2020 22:17:55 +0100
Subject: [Buildroot] [git commit] systemd: clear telinit path
Message-ID: <20201103210517.62F9F86D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bc9350963dddb80a0bf4cfd9ad32807223eae67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we don't enable sysv any support, it makes no sense to set the
path to telinit either.

The path we were setting was anyway wrong: we set a path into
TARGET_DIR, but this path is only used at runtime, on the target, where
TARGET_DIR doesn't exist (it should have been /usr/sbin/telinit).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 50416cceb6..63885993db 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -36,7 +36,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dsplit-usr=false \
 	-Dsystem-uid-max=999 \
 	-Dsystem-gid-max=999 \
-	-Dtelinit-path=$(TARGET_DIR)/sbin/telinit \
+	-Dtelinit-path= \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dkmod-path=/usr/bin/kmod \
