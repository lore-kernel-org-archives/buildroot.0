From: dishui <dishui@gmail.com>
Date: Mon, 13 Oct 2008 09:47:24 +0800
Subject: [Buildroot] uclibc toolchain get failed outside of buildroot
References: <200810111004414067835@gmail.com>,
 <48F0B478.1090508@arcor.de>
Message-ID: <200810130947234682195@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've resolved the problem, I did make uclibc-menuconfig before compilation, I don't know exactly which option works. 


2008-10-13 






> hi,all
> I have built buildroot and got the toolchain, I copied staging_dir to
> /usr/local/arm, and compiled application successfully. But if I rename
> buildroot, the compilation got failed, it showed "arm-linux-gcc: No
> such file or directory". In fact, I have exported the search path, I
> can TAB complete the arm-linux-gcc command. That means the toolchain
> can not work out of buildroot. How to fix it?
> I have tried to add sysroot and isysroot options, but got the same result.
I had a similar issue that I've just resolved when compiling uClibc for
i586.

I changed staging dir. But when building gcc, buildroot downloads and
compiles gmp and mpfr. These in my case were not in the path so I
couldn't compile. How to put them somewhere? I did modify the
gcc-uclibc-4.x.mk files to put them based on the staging dir (you'll
also need to update binutils.mk to suit).

Then so that GCC will correctly cross compile (I used GCC 4.3.2) I had
to export LD_RUN_PATH also to where these files were.

I've attached my patch from buildroot. Let me know if this helps you. It
provides in addition the latest GMP, MPFR and also binutils 2.19.50
(unofficial release)

Regards,
Jason.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081013/88f1ad21/attachment.htm 
