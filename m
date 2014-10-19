From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Oct 2014 20:30:56 -0300
Subject: [Buildroot] [PATCH 2/3] skeleton/root/.bash_profile: don't set PATH
In-Reply-To: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413761457-25565-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even if the main shell is bash /etc/profile is also parsed so it's
redundant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/root/.bash_profile | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/system/skeleton/root/.bash_profile b/system/skeleton/root/.bash_profile
index 27bf149..0ee04a3 100644
--- a/system/skeleton/root/.bash_profile
+++ b/system/skeleton/root/.bash_profile
@@ -1,13 +1,5 @@
 # .bash_profile
 
-export PATH=\
-/bin:\
-/sbin:\
-/usr/bin:\
-/usr/sbin:\
-/usr/bin/X11:\
-/usr/local/bin
-
 umask 022
 
 if [ -f ~/.bashrc ]; then
-- 
2.0.4
