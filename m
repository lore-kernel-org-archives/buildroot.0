From: Nigel Sollars <nsollars@gmail.com>
Date: Sat, 5 May 2012 13:08:33 -0400
Subject: [Buildroot] Bash 4.2 build failure
Message-ID: <CAG6aBkV10njzsnmc1cQH1T0TbmDiv_BJsKZLnWKE657My6bZuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I downloaded bash 4.2 on my panda for a native build, made sure all 28
patches had been applied.  I did some google / web searching around on this
and did the suggested to make sure ULibC was being used vs Glibc, which for
me did not work, as it keeps bombing at the same point,

gcc -L./builtins -L./lib/readline -L./lib/readline -L./lib/glob
-L./lib/tilde -L./lib/malloc -L./lib/sh  -rdynamic  -g -O2 -o bash shell.o
eval.o y.tab.o general.o make_cmd.o print_cmd.o  dispose_cmd.o
execute_cmd.o variables.o copy_cmd.o error.o expr.o flags.o jobs.o subst.o
hashcmd.o hashlib.o mailcheck.o trap.o input.o unwind_prot.o pathexp.o
sig.o test.o version.o alias.o array.o arrayfunc.o assoc.o braces.o
bracecomp.o bashhist.o bashline.o  list.o stringlib.o locale.o findcmd.o
redir.o pcomplete.o pcomplib.o syntax.o xmalloc.o  -lbuiltins -lglob -lsh
-lreadline -lhistory -ltermcap -ltilde -lmalloc /usr/lib/libintl.so
/usr/lib/libc.a   -ldl
/usr/lib/libc.a(getenv.os): In function `getenv':
getenv.c:(.text+0x0): multiple definition of `getenv'
./lib/sh/libsh.a(getenv.o):/opt/devel/src/bash-4.2/lib/sh/getenv.c:52:
first defined here
/lib/libc.so.0: warning: gethostbyname_r is obsolescent, use getnameinfo()
instead.
/lib/libc.so.0: warning: gethostbyaddr_r is obsolescent, use getaddrinfo()
instead.
collect2: ld returned 1 exit status
make: *** [bash] Error 1

Has anyone found a way around this one?,

Thanks in advance

Nige



-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120505/c7a090a3/attachment-0001.html>
