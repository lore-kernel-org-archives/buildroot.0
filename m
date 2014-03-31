From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 31 Mar 2014 06:26:49 +0300
Subject: [Buildroot] [PATCH v3 00/10] xtensa: add
 -mtext-section-literals to xtensa ABI
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140331032649.GQ4579@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Sun, Mar 30, 2014 at 09:57:44PM +0400, Max Filippov wrote:
> Hi Thomas,
> 
> this series is the second part of fixes for building huge sources, like
> wireshark or mplayer: adding trampolines support to binutils allows
> assembling of such files, but with literals placed into separate section
> build fails at the linking step.
> 
> First patch allows building uclibc with -mtext-section-literals, it is
> posted to the uclibc list, but not reviewed/checked in yet.
> Second patch adds -mtext-section-literals flag to xtensa ABI.
> Remaining patches revert -mtext-section-literals additions to individual
> packages.

For patches 2-10:

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

baruch

> Changes v2 -> v3:
> - drop patch 3 and revert individual commits that added
>   -mtext-section-literals flag instead
> 
> Changes v1 -> v2:
> - add comment to XTENSA_ABI variable explaining -mtext-section-literals usage
> - remove -mtext-section-literals from individual package *.mk's
> 
> Max Filippov (10):
>   uclibc: add missing .literal_position directives
>   Makefile.in: add -mtext-section-literals to xtensa ABI
>   Revert "civetweb: fix build for xtensa"
>   Revert "ffmpeg: fix build for xtensa"
>   Revert "gst-ffmpeg: fix build for xtensa"
>   Revert "gst1-libav: fix build for xtensa"
>   Revert "lmbench: fix build for xtensa"
>   Revert "php: fix build for xtensa"
>   Revert "sqlcipher: fix build for xtensa"
>   Revert "xtensa: sqlite requires special compiler option"
> 
>  package/Makefile.in                                | 11 +++-
>  package/civetweb/civetweb.mk                       |  3 --
>  package/ffmpeg/ffmpeg.mk                           |  8 ---
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk         |  8 ---
>  package/gstreamer1/gst1-libav/gst1-libav.mk        |  8 ---
>  package/lmbench/lmbench.mk                         |  4 --
>  package/php/php.mk                                 |  4 --
>  package/sqlcipher/sqlcipher.mk                     |  4 --
>  package/sqlite/sqlite.mk                           |  4 --
>  ...-add-missing-.literal_position-directives.patch | 62 ++++++++++++++++++++++
>  10 files changed, 72 insertions(+), 44 deletions(-)
>  create mode 100644 package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0001-xtensa-add-missing-.literal_position-directives.patch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
