From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:29 -0300
Subject: [Buildroot] [PATCH 11/26] netplug: don't test if the binary exists
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-12-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/netplug/S29netplug | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
index d3df9ddff5..03422499d6 100755
--- a/package/netplug/S29netplug
+++ b/package/netplug/S29netplug
@@ -32,8 +32,6 @@ elif [ ! -f /etc/network/interfaces ]; then
 	exit 0
 fi
 
-[ -x /sbin/netplugd ] || exit 0
-
 if [ -f /etc/sysconfig/netplugd ]; then
     . /etc/sysconfig/netplugd
 fi
-- 
2.14.3
