From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:41:06 +0200
Subject: [Buildroot] [PATCH v2] package/libv4l: bump version to 1.18.0
In-Reply-To: <20191021184510.4212-1-ps.report@gmx.net>
References: <20191021184510.4212-1-ps.report@gmx.net>
Message-ID: <20191021214106.7bf713f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 20:45:10 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove 0001-fixup-lfs-mismatch-in-preload-libraries.patch
>   (Upstream applied [1])
> - remove 0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
>   (Upstream applied [2])
> - remove 0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
>   (Upstream applied [3])
> - remove 0004-v4l2-compliance-needs-fork.patch
>   (Upstream applied [4])
> 
> Despite all patches (specially the ones touching configure.ac/Makefile.am)
> removed keep LIBV4L_AUTORECONF = YES to get utils/qv4l linker flags
> right (seems the original debian based libtool sets a wrong
> link_all_deplibs parameter), see [5] for details.
> 
> [1] https://git.linuxtv.org/v4l-utils.git/commit/?id=9f0354c3320f3cc62983f726bfed66e1d0c21f83
> [2] https://git.linuxtv.org/v4l-utils.git/commit/?id=a3367e92f4b06667a36fb9485f22f7df52891a2f
> [3] https://git.linuxtv.org/v4l-utils.git/commit/?id=692c2f0f35dd663e84d363867f2841d387726154
> [4] https://git.linuxtv.org/v4l-utils.git/commit/?id=577ab225929c4e8dce7d2b911eeed38469a559bb
> [5] http://lists.busybox.net/pipermail/buildroot/2019-October/261558.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add rational and comment for keeping LIBV4L_AUTORECONF
> ---
>  ...up-lfs-mismatch-in-preload-libraries.patch | 44 -----------
>  ...VIOCSCLOCKID-related-compile-failure.patch | 35 ---------
>  ...Build-sdlcam-only-if-jpeg-is-enabled.patch | 31 --------
>  .../0004-v4l2-compliance-needs-fork.patch     | 76 -------------------
>  package/libv4l/libv4l.hash                    |  5 +-
>  package/libv4l/libv4l.mk                      |  4 +-
>  6 files changed, 5 insertions(+), 190 deletions(-)
>  delete mode 100644 package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
>  delete mode 100644 package/libv4l/0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
>  delete mode 100644 package/libv4l/0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
>  delete mode 100644 package/libv4l/0004-v4l2-compliance-needs-fork.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
