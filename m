From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri,  2 Jun 2017 17:00:13 -0700
Subject: [Buildroot] [PATCH 2/2] ncurses: Copy terminfo for
	'screen-256color' terminal
In-Reply-To: <20170603000013.5402-1-andrew.smirnov@gmail.com>
References: <20170603000013.5402-1-andrew.smirnov@gmail.com>
Message-ID: <20170603000013.5402-2-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tmux uses 256 color version of 'screen' terminfo by deafult, so copy
corresponding file to support that usecase.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index d8ad9dd..94c8c9a 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -52,6 +52,7 @@ NCURSES_TERMINFO_FILES = \
 	p/putty \
 	p/putty-vt100 \
 	s/screen \
+	s/screen-256color \
 	v/vt100 \
 	v/vt100-putty \
 	v/vt102 \
-- 
2.9.4
