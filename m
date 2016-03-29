From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 16:38:22 +0200
Subject: [Buildroot] [PATCH] tcl: bump version to 8.6.5
In-Reply-To: <1458313886-11067-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1458313886-11067-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160329163822.17151d60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Mar 2016 15:11:26 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/tcl/tcl.hash | 2 +-
>  package/tcl/tcl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This update is causing a huge number of build failures:

  http://autobuild.buildroot.org/?reason=tcl-8.6.5

I tested, and reverting this version bump fixes the problem. It seems
to be a conflict between the version of sqlite bundled in tcl, and the
version of sqlite we have in Buildroot.

Could you look at the problem, or if you don't care much about tcl,
send a patch reverting the version bump?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
