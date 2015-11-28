From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 28 Nov 2015 15:31:36 -0200
Subject: [Buildroot] Missing 'sys/queue.h' on musl
Message-ID: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Musl does not provide a 'sys/queue.h' implementation [1].

This is causing problems with some packages that depends on it, like
f2fs-tools [2] and others packages that are already fixed like libtirpc [3].

Adding an implementation of 'sys/queue.h' as a patch (like in [3]) is a
proper way to fix this problem?

What about creating a package with the 'sys/queue.h' implementation and
installing it in the staging directory. Then we would just need to make all
packages that need it depend on it when compiling with musl. Is this a good
solution?

Any other suggestion?

[1]
http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_sys.2Fqueue.h_not_included_.3F
[2]
http://autobuild.buildroot.net/results/24bad2d06ab40024dacf136bee722072d587f84e
[3]
http://git.buildroot.net/buildroot/commit/?id=633d3320c16b5a3c6c4df82e89b9748daa9fd1fb

Best regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151128/86af57a1/attachment.html>
