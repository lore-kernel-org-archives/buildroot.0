From: =?UTF-8?B?QW5kcmV5IEtyYXNoZW5pbm5pa292?= <akrashenin@mail.ru>
Date: Tue, 11 Mar 2014 15:27:42 +0400
Subject: [Buildroot] =?utf-8?q?Compile_c++_application_for_buildroot-2014?=
 =?utf-8?q?=2E02=2E?=
Message-ID: <1394537262.565151178@f123.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I have buildroot-2014.02, menuconfig with c++ support.
I use internal toolchain. I use eclipse juno.
My linux is Linux akrashenin 3.8.0-35-generic #50-Ubuntu SMP Tue Dec 3 01:25:33 UTC 2013 i686 athlon i686 GNU/Linux.
Linking c++ application don't work.

Application source code:
#include <iostream>
using namespace std;

int main() {
??? cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
??? return 0;
}

Console output:
23:05:07 **** Build of configuration Debug for project pthread_join_2014 ****
make all 
Building file: ../src/pthread_join_2014.cpp
Invoking: Cross G++ Compiler
bfin-linux-g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"src/pthread_join_2014.d" -MT"src/pthread_join_2014.d" -o "src/pthread_join_2014.o" "../src/pthread_join_2014.cpp"
Finished building: ../src/pthread_join_2014.cpp
?
Building target: pthread_join_2014
Invoking: Cross G++ Linker
bfin-linux-g++? -o "pthread_join_2014"? ./src/pthread_join_2014.o?? 
/root/buildroot-2014.02/output/host/usr/bin/../lib/gcc/bfin-buildroot-linux-uclibc/4.4.7/../../../../bfin-buildroot-linux-uclibc/bin/ld: pthread_join_2014: ?? ??????? ?????? ?___gtdf2? ?? /root/buildroot-2014.02/output/host/usr/bin/../lib/gcc/bfin-buildroot-linux-uclibc/4.4.7/libgcc.a(_gt_df.o) ????????? ?? DSO (is referenced DSO)
/root/buildroot-2014.02/output/host/usr/bin/../lib/gcc/bfin-buildroot-linux-uclibc/4.4.7/../../../../bfin-buildroot-linux-uclibc/bin/ld: final link failed: ???????????? ????????
collect2: ld returned 1 exit status
make: *** [pthread_join_2014] ?????? (mistake) 1


What is problem?


Yours faithfully A.Krasheninnnikov
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140311/ea557ffd/attachment.html>
