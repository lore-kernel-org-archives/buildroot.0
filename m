From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:25 -0300
Subject: [Buildroot] [PATCH 07/26] haveged: don't test if the binary exists
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-8-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/haveged/S21haveged | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
index 3e6ce8678f..4b6e6ced4e 100755
--- a/package/haveged/S21haveged
+++ b/package/haveged/S21haveged
@@ -1,7 +1,5 @@
 #!/bin/sh
 
-[ -x /usr/sbin/haveged ] || exit 0
-
 case "$1" in
 	start)
 		printf "Starting haveged: "
-- 
2.14.3
