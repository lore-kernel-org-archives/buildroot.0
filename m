From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Dec 2012 22:59:22 +0100
Subject: [Buildroot] [PATCH 8/8] screen: add license information
In-Reply-To: <1354270483-32356-9-git-send-email-spdawson@gmail.com>
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
 <1354270483-32356-9-git-send-email-spdawson@gmail.com>
Message-ID: <50BE723A.3040102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/11/12 11:14, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
> ---
>   package/screen/screen.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 8786322..50bb1a6 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -6,6 +6,8 @@
>
>   SCREEN_VERSION = 4.0.3
>   SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
> +SCREEN_LICENSE = GPLv2

  GPLv2+, actually.


  FYI, to verify the (GPL family) licenses, I always do:

ack-grep -a -i 'version [23]'

ack-grep -a -i 'gnu (lesser|library)'

  or

ack-grep -a -i 'gnu general'


  (sometimes piped into an additional grep filter if it's a large
package).

> +SCREEN_LICENSE_FILES = COPYING
>   SCREEN_DEPENDENCIES = ncurses
>   SCREEN_CONF_ENV = ac_cv_header_elf_h=no ac_cv_header_dwarf_h=no \
>   	CFLAGS="$(TARGET_CFLAGS) -DTERMINFO"

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
