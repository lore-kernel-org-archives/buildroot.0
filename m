From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:34 -0300
Subject: [Buildroot] [PATCH 16/26] openntpd: don't test if the binary exists
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-17-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/openntpd/S49ntp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
index c211ac835e..7ce46eba28 100755
--- a/package/openntpd/S49ntp
+++ b/package/openntpd/S49ntp
@@ -1,6 +1,5 @@
 #!/bin/sh
 
-[ -x /usr/sbin/ntpd ] || exit 0
 [ -f /etc/ntpd.conf ] || exit 0
 
 case "$1" in
-- 
2.14.3
