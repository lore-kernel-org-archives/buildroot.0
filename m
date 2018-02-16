From: Tjeerd Bakker <tjeerd.bakker38@gmail.com>
Date: Fri, 16 Feb 2018 09:17:12 +0100
Subject: [Buildroot] Build error for lz4 package on x86-64 (buildroot
 2017.02.10)
Message-ID: <CAKH+9mwNZHORzcWssYX3fKeRCke7YN9xNPwZ4AMH9B-UZhmO-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Since the latest LTS release 2017.02.10, lz4 fails to build on x86-64, it
gives an include error for gnu/stubs-32.h. This is caused by commit
https://git.buildroot.org/buildroot/commit/?id=
6f1c11f79a64387c1f1749550804f8aae0cfa7a7,
which causes lz4 to try to build 32 bit binaries because of the "all" make
target in the LZ4_BUILD_CMDS. Replacing the "all" target with "lib
lz4programs" fixes this. (Actually, this excludes the 'm32' target in
programs/Makefile).

I'm new to buildroot development. Should I create a patch in Patchwork, or
a pull request in Github?

Thank you,

Tjeerd
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180216/99cbd389/attachment.html>
