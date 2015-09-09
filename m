From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 9 Sep 2015 13:42:04 +0100
Subject: [Buildroot] [PATCHv3] gdb: prevent building the documentation
In-Reply-To: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CA+BsyQ4afVcfCq=J9-FiSwbqDiKBjUyA3sgekVZyAm73XOdRUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Force gdb to not build the documentation. This way we avoid depending on
> host-texinfo. This is a temporary fix until upstream accepts a proposed
> --disable-docs configure option.
>
> Since the documentation will not be build at all, we can remove the
> parts related to host-texinfo and MAKEINFO in the gdb.mk file.
>
> Fixes:
>
>   http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Tested host GDB clean rebuild for versions 7.8.x, 7.9.x and 7.10.x as
well as target GDB with and without BR2_PACKAGE_GDB_DEBUGGER - builds
fine in all cases.

Tested-by: Brendan Heading <brendanheading@gmail.com>

regards

Brendan
