From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 18 Apr 2012 13:29:21 +0200
Subject: [Buildroot] [PATCH 1/3] Fix systemd failure with lock files
In-Reply-To: <cover.1334748542.git.maxime.ripard@free-electrons.com>
References: <cover.1334748542.git.maxime.ripard@free-electrons.com>
Message-ID: <acb90f809d4410dd78028afde9e9884bc780f14a.1334748542.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd introduced a new policy described here:
http://lists.freedesktop.org/archives/systemd-devel/2011-March/001823.html

Add the "lock" group to buildroot to allow systemd to set this in place
at boot time

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 fs/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/group b/fs/skeleton/etc/group
index 311a455..cd4ca79 100644
--- a/fs/skeleton/etc/group
+++ b/fs/skeleton/etc/group
@@ -9,6 +9,7 @@ wheel:x:10:root
 audio:x:29:
 utmp:x:43:
 staff:x:50:
+lock:x:54:
 haldaemon:x:68:
 dbus:x:81:
 netdev:x:82:
-- 
1.7.5.4
