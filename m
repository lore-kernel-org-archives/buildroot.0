From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 26 Mar 2013 16:25:54 +0000 (UTC)
Subject: [Buildroot] No core dump when killed with ABRT, SEGV, etc.
Message-ID: <kisi6i$srj$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get a proper core dump if a program actually causes a segfault, but
I can't figure out how to force a coredump by killing a running
process.

On my desktop machines with glibc, this generates a core dump:

tty1:

   $ ulimit -c 9999999
   $ <start program>

tty2:    
   $ kill -ABRT <pid>
 
On my buildroot system, there's no core dump.  The program is aborted
as expected, but it doesn't dump a core file.  If the same program
tries to actually dereference a NULL pointer there is a core dump.

Why doesn't killing a process with SIGABRT or SIGSEGV cause a core
dump?

-- 
Grant Edwards               grant.b.edwards        Yow! I am covered with
                                  at               pure vegetable oil and I am
                              gmail.com            writing a best seller!
