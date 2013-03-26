From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 26 Mar 2013 17:01:46 +0000 (UTC)
Subject: [Buildroot] No core dump when killed with ABRT, SEGV, etc.
References: <kisi6i$srj$1@ger.gmane.org> <87obe685rt.fsf@dell.be.48ers.dk>
Message-ID: <kisk9q$s50$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-03-26, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> Grant> I get a proper core dump if a program actually causes a segfault, but
> Grant> I can't figure out how to force a coredump by killing a running
> Grant> process.
>
> Grant> On my desktop machines with glibc, this generates a core dump:
>
> Grant> tty1:
>
> Grant>    $ ulimit -c 9999999
> Grant>    $ <start program>
>
> Grant> tty2:    
> Grant>    $ kill -ABRT <pid>
>  
> Grant> On my buildroot system, there's no core dump.  The program is aborted
> Grant> as expected, but it doesn't dump a core file.  If the same program
> Grant> tries to actually dereference a NULL pointer there is a core dump.
>
> Grant> Why doesn't killing a process with SIGABRT or SIGSEGV cause a core
> Grant> dump?
>
> Are you using busybox init? If so, ensure you have
> FEATURE_INIT_COREDUMPS enabled and a /.init_enable_core file in your
> rootfs:

I don't have that set, but I don't think it would matter.

I'm starting the program from the command line in a tty as show above
after running the ulimit command to enable core dumps.  When I do
that, I get a core dump if the program itself causes a segfault, but
not if the program is killed with ABRT or SEGV signals.

The FEATURE_INIT_COREDUMPS just does the equivalent of the ulimit -c
command, right?   Am I misunderstanding what FEATURE_INIT_COREDUMPS
does?

-- 
Grant Edwards               grant.b.edwards        Yow! ... bleakness
                                  at               ... desolation ... plastic
                              gmail.com            forks ...
