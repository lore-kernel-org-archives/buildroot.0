From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Oct 2015 09:11:37 +0200
Subject: [Buildroot] [PATCHv4] gdb: prevent building the documentation
In-Reply-To: <1441875400-16473-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441875400-16473-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151001091137.4bc06d8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, Romain,

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

Seems like this is not yet working completely for all situations:

   http://autobuild.buildroot.org/results/244/2442e697d8a300496434fd42fcb1ee3941d13e06/build-end.log

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
