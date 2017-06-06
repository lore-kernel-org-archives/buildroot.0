From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 13:18:41 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] ncurses: Copy terminfo
	for 'screen-256color' terminal
Message-ID: <20170606111918.EBD2B7F8B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=397bac28d7e2af2744908b0cca1c12a2e01395ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Tmux uses 256 color version of 'screen' terminfo by default, so copy
corresponding file to support that usecase.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6bd29da2b3cbf560a045334b27305486b0484a99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index f8ed4fc..b0f1724 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -51,6 +51,7 @@ NCURSES_TERMINFO_FILES = \
 	p/putty \
 	p/putty-vt100 \
 	s/screen \
+	s/screen-256color \
 	v/vt100 \
 	v/vt100-putty \
 	v/vt102 \
