From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Dec 2012 22:55:05 +0100
Subject: [Buildroot] [PATCH 7/8] oprofile: add license information
In-Reply-To: <1354270483-32356-8-git-send-email-spdawson@gmail.com>
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
 <1354270483-32356-8-git-send-email-spdawson@gmail.com>
Message-ID: <50BE7139.4000405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/11/12 11:14, spdawson at gmail.com wrote:
> From: Simon Dawson<simond@trainfx.com>
>
> Signed-off-by: Simon Dawson<simond@trainfx.com>
> ---
>   package/oprofile/oprofile.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
> index 54c46dd..17d225a 100644
> --- a/package/oprofile/oprofile.mk
> +++ b/package/oprofile/oprofile.mk
> @@ -6,6 +6,8 @@
>
>   OPROFILE_VERSION = 0.9.7
>   OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
> +OPROFILE_LICENSE = GPLv2

  Only a few files specify the license, but the ones that do specify
"or later" - including the man page. So it should be GPLv2+.

  (libjvmti, libjvmpi and libopagent libraries are LGPLv2.1+, for which no
license file is included. However, since we don't install to staging, this
is probably not relevant.)


  Regards,
  Arnout

> +OPROFILE_LICENSE_FILES = COPYING
>   OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
>   OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
>   OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
