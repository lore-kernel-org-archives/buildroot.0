From: David Lambert <dave@lambsys.com>
Date: Fri, 30 Mar 2007 22:17:30 -0500
Subject: [Buildroot] Error with Busybox
In-Reply-To: <20070329103458.GA870@aon.at>
References: <460A9989.6030108@mbdsys.com>
	<20070328210731.GE24135@aon.at>	<460B80C7.5040804@mbdsys.com>
	<20070329103458.GA870@aon.at>
Message-ID: <460DD2CA.5000209@lambsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
>
> This is most likely not the first error.
>   
I am getting a similar problem. My error log with make V=1 is:

miscutils/taskset.c:17: error: expected ')' before '*' token
miscutils/taskset.c: In function 'taskset_main':
miscutils/taskset.c:47: error: 'cpu_set_t' undeclared (first use in this
function)
miscutils/taskset.c:47: error: (Each undeclared identifier is reported
only once
miscutils/taskset.c:47: error: for each function it appears in.)
miscutils/taskset.c:47: error: expected ';' before 'mask'
miscutils/taskset.c:48: warning: ISO C90 forbids mixed declarations and code
miscutils/taskset.c:68: warning: implicit declaration of function 'CPU_ZERO'
miscutils/taskset.c:68: error: 'new_mask' undeclared (first use in this
function)
miscutils/taskset.c:69: error: 'CPU_SETSIZE' undeclared (first use in
this function)
miscutils/taskset.c:71: warning: implicit declaration of function 'CPU_SET'
miscutils/taskset.c:78: warning: implicit declaration of function
'sched_getaffinity'
miscutils/taskset.c:78: error: 'mask' undeclared (first use in this
function)
miscutils/taskset.c:81: warning: implicit declaration of function
'__from_cpuset'
miscutils/taskset.c:81: warning: format '%s' expects type 'char *', but
argument 4 has type 'int'
miscutils/taskset.c:86: warning: implicit declaration of function
'sched_setaffinity'
make[2]: *** [miscutils/taskset.o] Error 1
make[1]: *** [miscutils] Error 2
make[1]: Leaving directory
`/home/dlambert/Breakaway/ARM/buildroot/build_arm/busybox'
make: ***
[/home/dlambert/Breakaway/ARM/buildroot/build_arm/busybox/busybox] Error 2

Compilation exited abnormally with code 2 at Fri Mar 30 22:14:47

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
>   
