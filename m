From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:32:49 +0200
Subject: [Buildroot] [PATCH 1 of 5] cifs-utils: correct license GPLv3 ->
 GPLv3+
In-Reply-To: <32bd9d0979ff201fc926.1381319909@argentina>
References: <patchbomb.1381319908@argentina>
 <32bd9d0979ff201fc926.1381319909@argentina>
Message-ID: <52558531.3070609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 13:58, Thomas De Schampheleire wrote:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> Note: some files are GPLv2+, others are GPLv3+. There are a few headers also
> declared as LGPL. I think the right approach is to set GPLv3+ here.

  Correct. This is the typical situation when a project changes from v2 
to v3: not all files are updated, so there's a mix in the source code.

  For the LGPL files: LGPL carries a specific clause that specifies that 
you can make copies under the GPL (same version) instead of the LGPL. 
There's actually a requirement that you should update all license texts, 
but that's exactly what we do here by just installing the GPLv3 license 
(and we're anyway talking about distribution of binaries).

  Bottom line:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

>
>   package/cifs-utils/cifs-utils.mk |  2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
> --- a/package/cifs-utils/cifs-utils.mk
> +++ b/package/cifs-utils/cifs-utils.mk
> @@ -7,7 +7,7 @@
>   CIFS_UTILS_VERSION = 6.1
>   CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
>   CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
> -CIFS_UTILS_LICENSE = GPLv3
> +CIFS_UTILS_LICENSE = GPLv3+
>   CIFS_UTILS_LICENSE_FILES = COPYING
>
>   define CIFS_UTILS_NO_WERROR
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
