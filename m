From: dboml at free.fr <dboml@free.fr>
Date: Tue, 30 Oct 2012 09:56:46 +0100 (CET)
Subject: [Buildroot] libglib and vim doesn't compile with -g3 -O0
In-Reply-To: <209834601.226906150.1351587308354.JavaMail.root@zimbra49-e8.priv.proxad.net>
Message-ID: <1643678760.226910251.1351587406802.JavaMail.root@zimbra49-e8.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 
In the goal to remote cross debug my app to avoid gdb error , i rebuild BR with -g3 and -O0. 

But libglib and vim doesn't compile. 
I've modify by hand makefiles to remove -g3 and -O0 and it is ok. 

Is it normal? 
Is there a way to doesn't put all package to -g3 and -O0 and i can remote cross debug (i use eclipse with out of the tree project)? 

thanks for any help. 

For information my gdb error before rebuild BR with -g3 -O0: 
remote shell: 
[root at plc ~]# gdbserver :2345 /root/plc;exit 
Process /root/plc created; pid = 5622 
Listening on port 2345 
Remote debugging from host 192.168.10.235 
gdbserver: ../sysdeps/unix/sysv/linux/getpagesize.c:32: __getpagesize: Assertion `_rtld_global_ro._dl_pagesize != 0' failed. 
Aborted 
logout 

GDB trace: 
021,586 2-environment-cd /media/sf_trunk/plc 
021,587 2^done 
021,589 (gdb) 
021,593 3-gdb-set breakpoint pending on 
021,593 3^done 
021,594 (gdb) 
021,597 4-gdb-set detach-on-fork on 
021,598 4^done 
021,598 (gdb) 
021,601 5-enable-pretty-printing 
021,601 5^done 
021,602 (gdb) 
021,604 6-gdb-set python print-stack none 
021,605 6^done 
021,605 (gdb) 
021,608 7-gdb-set print object on 
021,608 7^done 
021,608 (gdb) 
021,612 8-gdb-set print sevenbit-strings on 
021,612 8^done 
021,612 (gdb) 
021,614 9-gdb-set host-charset UTF-8 
021,615 9^done 
021,616 (gdb) 
021,618 10-gdb-set target-charset UTF-8 
021,618 10^done 
021,618 (gdb) 
021,622 11-gdb-set target-wide-charset UTF-32 
021,622 11^done 
021,623 (gdb) 
021,625 12source /media/sf_trunk/plc/gdbinit 
021,625 &"source /media/sf_trunk/plc/gdbinit\n" 
021,630 12^done 
021,630 (gdb) 
021,634 13-gdb-set target-async off 
021,634 13^done 
021,634 (gdb) 
021,638 14-gdb-set auto-solib-add on 
021,638 14^done 
021,638 (gdb) 
021,646 15-file-exec-and-symbols --thread-group i1 /media/sf_trunk/plc/Debug/plc 
021,705 15^done 
021,705 (gdb) 
021,709 16-target-select remote 192.168.10.20:2345 
021,743 =thread-group-started,id="i1",pid="5622" 
021,744 =thread-created,id="1",group-id="i1" 
021,746 17-list-thread-groups --available 
021,773 &"warning: Unable to find dynamic linker breakpoint function.\nGDB will be unable to debug shared library initializers\nand track explicitly loaded dynamic code." 
021,773 &"\n" 
021,793 *stopped,frame={addr="0x4006ad10",func="??",args=[]},thread-id="1",stopped-threads="all",cor\ 
e="0" 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121030/bd2ce552/attachment.html>
