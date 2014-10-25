From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:01:07 +0200
Subject: [Buildroot] [PATCH] autobuild-run: Do not build python3 with
 this external toolchain
In-Reply-To: <1413904638-51774-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1413904638-51774-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141025120107.7e5250d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 21 Oct 2014 16:17:18 +0100, Vicente Olivert Riera wrote:
> It fails to build python3 with an error like this one:
> 
> Failed to build these modules:
> _posixsubprocess
> 
> Which comes from this previous error:
> 
> /br/output/build/python3-3.4.1/Modules/_posixsubprocess.c:246:33: error:
> 'SYS_getdents64' undeclared (first use in this function)
> 
> The failure is caused because this toolchain uses eglibc-2.18 which
> lacks the definition of the SYS_getdents64 macro for MIPS64 n64.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/8fd/8fd1fdf5f02365278a280d50adce98303fcc9a2a/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  scripts/autobuild-run |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
