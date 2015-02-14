From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:02:44 +0100
Subject: [Buildroot] [PATCH] mplayer: fix compilation with new versions
 of libgif
In-Reply-To: <1423933969-34169-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1423933969-34169-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150214220244.15cce061@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sat, 14 Feb 2015 17:12:49 +0000, Vicente Olivert Riera wrote:
> mplayer fails to compile with the following error message:
> 
> libmpdemux/demux_gif.c: In function 'demux_open_gif':
> libmpdemux/demux_gif.c:260:3: error: too few arguments to function
> 'DGifOpen'
>    gif = DGifOpen(demuxer->stream, my_read_gif);
> 
> Backport an upstream patch to support newer versions of libgif in
> mplayer. Unfortunately this patch is incomplete and mplayer stills
> failing to compile with a new error message:
> 
> libvo/vo_gif89a.c: In function 'uninit':
> libvo/vo_gif89a.c:374:3: error: too few arguments to function
> 'EGifCloseFile'
>    EGifCloseFile(new_gif); // also frees gif storage space.
> 
> So I have written a new patch and submitted it upstream to finally fix
> the problem.
> 
> Upstream commit:
> 
>   https://github.com/pigoz/mplayer-svn/commit/a0ddaef5457e222dade386901bf448c5e3ac7b89
> 
> New submitted patch:
> 
>   https://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2015-February/072848.html
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/a51/a510a0ab2cb827bb91b4fdec43055f2bfda239b1/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../0005-Support-newer-GIFLIB-versions.patch       |  268 ++++++++++++++++++++
>  .../0006-Support-newer-GIFLIB-versions-part2.patch |   44 ++++
>  2 files changed, 312 insertions(+), 0 deletions(-)
>  create mode 100644 package/mplayer/0005-Support-newer-GIFLIB-versions.patch
>  create mode 100644 package/mplayer/0006-Support-newer-GIFLIB-versions-part2.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
