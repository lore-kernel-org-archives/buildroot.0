From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2015 15:49:13 +0200
Subject: [Buildroot] [PATCHv3] gdb: prevent building the documentation
In-Reply-To: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150909154913.72954fbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 9 Sep 2015 13:12:19 +0100, Vicente Olivert Riera wrote:
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

Maybe we could do a similar thing for the binutils package (which is
the only other user of the host-texinfo package), and then remove the
host-texinfo package altogether. That's obviously a completely separate
set of changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
