From: Ron Eggler <reggler@semios.com>
Date: Sat, 14 Dec 2013 22:46:27 +0000
Subject: [Buildroot] gets() undeclared???
Message-ID: <1729491.ttgRZG5klY@regdesktophome>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to compile for a buildroot assembled package for an arm926t system (Atmel 
AT91SAM9G20)E10) for the e10 from synapse and what used to work once, now errors out 
like this:

/usr/bin/gcc -std=gnu99  -I.     -O2 -I/usr/local/src/E10-buildroot/br1202-
main/output/host/include -I/usr/local/src/E10-buildroot/br1202-
main/output/host/usr/include -MT clean-temp.o -MD -MP -MF .deps/clean-temp.Tpo -c -o 
clean-temp.o clean-temp.c
In file included from clean-temp.h:22:0,
                 from clean-temp.c:23:
./stdio.h:477:1: error: 'gets' undeclared here (not in a function)
 _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
 ^
mv -f .deps/c-ctype.Tpo .deps/c-ctype.Po
mv -f .deps/c-stack.Tpo .deps/c-stack.Po
make[4]: *** [clean-temp.o] Error 1
make[4]: *** Waiting for unfinished jobs....
mv -f .deps/gl_avltree_oset.Tpo .deps/gl_avltree_oset.Po
make[4]: Leaving directory `/usr/local/src/E10-buildroot/br1202-main/output/build/host-
m4-1.4.16/lib'
make[3]: *** [all] Error 2
make[3]: Leaving directory `/usr/local/src/E10-buildroot/br1202-main/output/build/host-
m4-1.4.16/lib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/usr/local/src/E10-buildroot/br1202-main/output/build/host-
m4-1.4.16'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/local/src/E10-buildroot/br1202-main/output/build/host-
m4-1.4.16'
make: *** [/usr/local/src/E10-buildroot/br1202-main/output/build/host-
m4-1.4.16/.stamp_built] Error 2
root at regDesktopHome:/usr/local/src/E10-buildroot/br1202-main# 

I don't get it, why would gets be undeclared? How can I get this fixed please?

Thanks,

Ron

-- 
*ron eggler | semios | senior software engineer*
320 - 887 Great Northern Way | Vancouver, BC | V5T 4T5
T | 604 229 2044 ext 105[1]
C | 778 230 9442[2]
E | reggler at semios.com[3]
smart farming[4]
twitter[5] linkedin[6]

--------
[1] tel:604%20229%202044%20ext%20105
[2] tel:778%20230%209442
[3] mailto:reggler at semios.com
[4] http://www.semios.com
[5] https://twitter.com/semios
[6] http://www.linkedin.com/company/semiosbio-technologies-inc?goback=%2Enmp_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1&trk=company_logo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131214/b998c450/attachment.html>
