From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 18:47:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix CVE-2020-12284
In-Reply-To: <20200506220914.655071-1-fontaine.fabrice@gmail.com>
References: <20200506220914.655071-1-fontaine.fabrice@gmail.com>
Message-ID: <20200509184742.05070570@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 May 2020 00:09:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cbs_jpeg_split_fragment in libavcodec/cbs_jpeg.c in FFmpeg 4.2.2 has a
> heap-based buffer overflow during JPEG_MARKER_SOS handling because of a
> missing length check.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...vcodec-cbs_jpeg-Check-length-for-SOS.patch | 33 +++++++++++++++++++
>  package/ffmpeg/ffmpeg.mk                      |  3 ++
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/ffmpeg/0001-avcodec-cbs_jpeg-Check-length-for-SOS.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
