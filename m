From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:07 +0200
Subject: [Buildroot] [PATCH 3/9] fs/skeleton: fix /etc/services entries for
	POP2/POP3
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some servers (including cyrus-imapd and qpopper) need an entry named
pop3, not pop-3, to work.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 fs/skeleton/etc/services |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/skeleton/etc/services b/fs/skeleton/etc/services
index b287b63..da37240 100644
--- a/fs/skeleton/etc/services
+++ b/fs/skeleton/etc/services
@@ -70,10 +70,10 @@ csnet-ns	105/udp		cso-ns
 #3com-tsmux	106/udp		poppassd
 rtelnet		107/tcp				# Remote Telnet
 rtelnet		107/udp
-pop-2		109/tcp		postoffice	# POP version 2
-pop-2		109/udp
-pop-3		110/tcp				# POP version 3
-pop-3		110/udp
+pop2		109/tcp		postoffice	# POP version 2
+pop2		109/udp
+pop3		110/tcp				# POP version 3
+pop3		110/udp
 sunrpc		111/tcp		portmapper	# RPC 4.0 portmapper TCP
 sunrpc		111/udp		portmapper	# RPC 4.0 portmapper UDP
 auth		113/tcp		authentication tap ident
-- 
1.7.4.1
