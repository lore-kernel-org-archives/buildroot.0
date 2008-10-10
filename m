From: Jerry.Zhang <jerry.scofield@gmail.com>
Date: Fri, 10 Oct 2008 14:54:45 +0800
Subject: [Buildroot] "make menuconfig" error
Message-ID: <8c09713c0810092354j5ec58b17y47ac9a8e2fddf5fb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, everyone!

Very nice to meet you here!

Host: ubuntu 8.04
gcc:  4.2.3
GNU make 3.81

I was trying to compile the buildroot.        After I issue the "make
menuconfig", some errors pops out.
The output is as belows. It seems that it could not find the headers
(ctype.h, stdlib.h, stdio.h, string.h, unistd.h, time.h)
Could anyone  just tell me why ? How should i handle this ??

  root at Hawk:/home/jerry/projectroot/buildroot# make menuconfig
make CC="/usr/bin/gcc" -C package/config conf mconf
make[1]: Entering directory
`/home/jerry/projectroot/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE -DKBUILD_NO_NLS -g -O2  -c
conf.c -o conf.o
conf.c:6:19: error: ctype.h: No such file or directory
conf.c:7:20: error: stdlib.h: No such file or directory
conf.c:8:19: error: stdio.h: No such file or directory
conf.c:9:20: error: string.h: No such file or directory
conf.c:10:20: error: unistd.h: No such file or directory
conf.c:11:18: error: time.h: No such file or directory
conf.c:12:22: error: sys/stat.h: No such file or directory
In file included from lkc.h:9,
                 from conf.c:15:
expr.h:181: error: expected declaration specifiers or '...' before 'FILE'
In file included from conf.c:15:
lkc.h:56: error: expected ')' before '*' token
lkc.h:60: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*'
token
lkc.h:95: error: expected specifier-qualifier-list before 'size_t'
conf.c: In function 'strip':
conf.c:55: warning: incompatible implicit declaration of built-in function
'strlen'
conf.c:57: warning: incompatible implicit declaration of built-in function
'memmove'
conf.c: In function 'check_stdin':
conf.c:68: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:71: warning: incompatible implicit declaration of built-in function
'exit'
conf.c: In function 'conf_askvalue':
conf.c:81: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:111: error: 'stdout' undeclared (first use in this function)
conf.c:111: error: (Each undeclared identifier is reported only once
conf.c:111: error: for each function it appears in.)
conf.c:112: error: 'stdin' undeclared (first use in this function)
conf.c: In function 'conf_string':
conf.c:186: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:200: error: 'NULL' undeclared (first use in this function)
conf.c:204: warning: incompatible implicit declaration of built-in function
'strlen'
conf.c: In function 'conf_sym':
conf.c:219: warning: incompatible implicit declaration of built-in function
'printf'
conf.c: In function 'conf_choice':
conf.c:309: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:319: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:362: error: 'stdout' undeclared (first use in this function)
conf.c:363: error: 'stdin' undeclared (first use in this function)
conf.c:397: warning: incompatible implicit declaration of built-in function
'strlen'
conf.c: In function 'conf':
conf.c:434: warning: incompatible implicit declaration of built-in function
'printf'
conf.c: In function 'check_conf':
conf.c:486: warning: incompatible implicit declaration of built-in function
'printf'
conf.c: In function 'main':
conf.c:500: error: storage size of 'tmpstat' isn't known
conf.c:518: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:520: warning: incompatible implicit declaration of built-in function
'exit'
conf.c:534: error: 'NULL' undeclared (first use in this function)
conf.c:538: warning: incompatible implicit declaration of built-in function
'fprintf'
conf.c:538: error: 'stderr' undeclared (first use in this function)
conf.c:539: warning: incompatible implicit declaration of built-in function
'exit'
conf.c:544: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:545: warning: incompatible implicit declaration of built-in function
'exit'
conf.c:554: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:557: warning: incompatible implicit declaration of built-in function
'exit'
conf.c:562: warning: incompatible implicit declaration of built-in function
'printf'
conf.c:569: warning: incompatible implicit declaration of built-in function
'exit'
conf.c:579: warning: assignment makes pointer from integer without a cast
conf.c:608: warning: assignment makes pointer from integer without a cast
conf.c:610: warning: incompatible implicit declaration of built-in function
'fprintf'
conf.c:621: warning: incompatible implicit declaration of built-in function
'fprintf'
conf.c:626: warning: incompatible implicit declaration of built-in function
'fprintf'
make[1]: *** [conf.o] Error 1
make[1]: Leaving directory
`/home/jerry/projectroot/buildroot/package/config'
make: *** [package/config/mconf] Error 2


Looking forward to your help~~

Thanks a lot.

Jerry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081010/bc4194d0/attachment.htm 
