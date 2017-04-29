From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:46:34 +0200
Subject: [Buildroot] [PATCH] mpv: bump version to 0.25.0
In-Reply-To: <20170424094218.60220-1-Vincent.Riera@imgtec.com>
References: <20170424094218.60220-1-Vincent.Riera@imgtec.com>
Message-ID: <20170429154634.03f88dd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Apr 2017 10:42:18 +0100, Vicente Olivert Riera wrote:
> Remove 0003-fix-build-with-have-gl.patch which is already included in
> this release.
> 
> Remove --{enable|disable}-standard-gl configure option because it
> doesn't exist.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/mpv/0003-fix-build-with-have-gl.patch | 39 ---------------------------
>  package/mpv/mpv.hash                          |  2 +-
>  package/mpv/mpv.mk                            |  6 ++---
>  3 files changed, 4 insertions(+), 43 deletions(-)
>  delete mode 100644 package/mpv/0003-fix-build-with-have-gl.patch

This patch causes numerous build failures:

  http://autobuild.buildroot.net/?reason=mpv-0.25.0

That didn't exist with the previous version 0.24.0:

  http://autobuild.buildroot.net/?reason=mpv-0.24.0

The problem is:

waf: error: no such option: --disable-xss

Perhaps simply removing --disable-xss is the solution, but someone
needs to investigate if it's the correct solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
