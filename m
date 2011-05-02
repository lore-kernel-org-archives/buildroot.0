From: Hu, Yanli <Yanli.Hu@philips.com>
Date: Mon, 2 May 2011 17:25:22 +0200
Subject: [Buildroot] PREEMPT_RT patched kernel halts at the end of booting
	up process
Message-ID: <8BADEE91F16E11498AEB9FD8D502C1E66CA265DED7@NLCLUEXM06.connect1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've been using buildroot kernel on a AT91RM9200 board and it has been working well. Recently I applied kernel PREEMPT_RT patch to get better interrupt latency and rebuilt the kernel. The kernel halted at the very end of the booting up process:

.......
Looking up port of RPC 100003/2 on 192.168.0.80
Looking up port of RPC 100005/1 on 192.168.0.80
VFS: Mounted root (nfs filesystem) on device 0:11.
Freeing init memory: 92K

I used statically linked "hello world" application to replace /sbin/init and it was not called. Everything else was kept the same as the previous kernel. Even if I disabled the PREEMPT_RT feature in the patched the kernel, the kernel still halted at the same place. I couldn't figure out why.  Any help is greatly appreciated.

--yhu

________________________________
The information contained in this message may be confidential and legally protected under applicable law. The message is intended solely for the addressee(s). If you are not the intended recipient, you are hereby notified that any use, forwarding, dissemination, or reproduction of this message is strictly prohibited and may be unlawful. If you are not the intended recipient, please contact the sender by return e-mail and destroy all copies of the original message.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110502/08db0d9b/attachment.html>
