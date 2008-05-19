From: Arun Reddy <reddyac@gmail.com>
Date: Sun, 18 May 2008 23:52:55 -0700
Subject: [Buildroot] Nonrepresentable section on output?
Message-ID: <326f33790805182352y30741a34m6acf04ab1f434823@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I am continuing with my ARM build and I have encountered a "nonrepresentable
section on output" regarding ld as follows:

/root/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.3/../../../../arm-linux-uclibc/bin/ld:
bash: hidden symbol `__udivsi3' in
/root/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.3/libgcc.a(_udivsi3.o)
is referenced by DSO
/root/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.3/../../../../arm-linux-uclibc/bin/ld:
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[1]: *** [bash] Error 1
make: *** [/root/buildroot/build_arm/bash-3.2/bash] Error 2

I looked online and found that this error is fairly common. It looks like
the "ld" loader is invoked explicitly instead of being frontended with gcc.
I read that if you replace ld with gcc -shared, then links against that
library will not get the "Nonrepresentable section on output"

My question is, is this a problem that anyone on the list has encountered?
If replacing ld with gcc -shared is the solution, do you know which Makefile
will I need to modify to do this? Thank you for your help!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080518/816b84f2/attachment.htm 
