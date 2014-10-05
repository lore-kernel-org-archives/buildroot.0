From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:40:10 +0200
Subject: [Buildroot] [PATCH 1/1] uclibc/ffmpeg: Fix fminf-related build
 error
In-Reply-To: <1411479699-16331-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411479699-16331-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005234010.17ab13c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 23 Sep 2014 15:41:39 +0200, Bernd Kuhls wrote:
> The build error I saw while bumping ffmpeg to 2.3.1 was caused by uClibc, not
> ffmpeg:
> http://news.gmane.org/find-root.php?message_id=20140804213955.42443190%40debian
> 
> ffmpeg-0001-fminf.patch can be removed in favour of uclibc-0063-fminf.patch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg-0001-fminf.patch          |   47 ---------
>  package/uclibc/0.9.33.2/uclibc-0063-fminf.patch |  127 +++++++++++++++++++++++
>  2 files changed, 127 insertions(+), 47 deletions(-)
>  delete mode 100644 package/ffmpeg/ffmpeg-0001-fminf.patch
>  create mode 100644 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch

Even though this looks like the right fix, it is a bit annoying,
because it means that ffmpeg will no longer build with a large number
of external uClibc toolchains (built with Buildroot versions older than
the one that would have this commit included, built with Crosstool-NG,
made available by third-parties, etc.).

Do you think we could have a solution that combines keeping the ffmpeg
fminf() patch, and adding the uClibc patch? Having the uClibc patch is
good because it fixes a real issue in uClibc. Keeping the ffmpeg
fminf() patch ensures that our ffmpeg package builds with other uClibc
toolchains than just the latest Buildroot uClibc toolchain.

What do you think?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
