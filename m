From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 14 Mar 2017 10:33:58 +0100
Subject: [Buildroot] binutils now adds sysroot for ld -rpath search
Message-ID: <1489484038.1572.7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

some news!

After a discussion with Brad King on the CMake issue tracker [1] about
how the linker should handle -rpath we agreed that ld should add the
sysroot when searching for files (but not when setting the RPATH header
value).

I picked up a five years old patch from the binutils mailing list [2]
which already proposed the change, but was not submitted then.

I resend the patch [3] and this time Alan Modra accepted the change. He
submitted two patches [4,5] which will add the sysroot to -rpath?for
absolute paths.

[1] https://gitlab.kitware.com/cmake/cmake/issues/16682
[2] https://sourceware.org/ml/binutils/2012-09/msg00156.html
[3] https://sourceware.org/ml/binutils/2017-03/msg00134.html
[4] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h
=316a1245fe31e327223ca66797b789eaf9544c2c
[5] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h
=118aa6cf395aec093fe12d7fb2d05441791a93fa

Best regards,
J?rg Krause
