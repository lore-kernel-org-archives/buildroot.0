From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:32:10 +0200
Subject: [Buildroot] [PATCHv4] gdb: prevent building the documentation
In-Reply-To: <1441875400-16473-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441875400-16473-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150911193210.798bebce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 10 Sep 2015 09:56:40 +0100, Vicente Olivert Riera wrote:
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
> Tested-by: Brendan Heading <brendanheading@gmail.com>
> ---
> Changes v3 -> v4:
>   - Use a pre-configure-hook instead of post-patch-hook as the last one
>     is not called in the OVERRIDE_SRCDIR case (Arnout Vandecappelle)
> Changes v2 -> v3:
>   - Use the post-patch-hook also for host-gdb (Brendan Heading)
>   - Remove unnecessary GDB_FROM_GIT (Romain Naour)
> Changes v1 -> v2:
>   - Indent the sed command
>   - Use a post-patch-hook instead of pre-configure-hook
>   - Remove the parts related to host-texinfo and MAKEINFO
>   - Ammend the commit log to be more appropriate

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
