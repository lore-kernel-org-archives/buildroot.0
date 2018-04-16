From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:22 -0300
Subject: [Buildroot] [PATCH 04/26] dmraid: don't test if the binary exists
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-5-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/dmraid/S20dmraid | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dmraid/S20dmraid b/package/dmraid/S20dmraid
index fd2ad9e845..b3bfdcc84b 100644
--- a/package/dmraid/S20dmraid
+++ b/package/dmraid/S20dmraid
@@ -2,8 +2,6 @@
 
 set -e
 
-[ -x /usr/sbin/dmraid ] || exit 0
-
 # try to load module in case that hasn't been done yet
 modprobe dm-mod >/dev/null 2>&1
 
-- 
2.14.3
