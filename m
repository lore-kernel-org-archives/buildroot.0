From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 28 May 2020 07:07:17 +0200
Subject: [Buildroot] [PATCH 1/1] reaver: upgrade to v1.6.6
In-Reply-To: <20200527211338.27439-1-guillaume.bressaix@gmail.com>
References: <20200527211338.27439-1-guillaume.bressaix@gmail.com>
Message-ID: <CAEyMn7ZZpLjwmjjiOwseah6j4SJtsJ+-Pd_CV1Nv39k6Kqencw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

Am Mi., 27. Mai 2020 um 23:14 Uhr schrieb Guillaume W. Bres
<guillaume.bressaix@gmail.com>:
>
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

>
> ---
>
> Upgrade to latest release.
> Patch does not apply anymore, but I doubt it's still needed
> because internal code has been improved. Tested on RPi0w.

The patch is in fact in the new upstream version.

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/reaver/0001-fix-271.patch | 32 -------------------------------
>  package/reaver/reaver.hash        |  2 +-
>  package/reaver/reaver.mk          |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/reaver/0001-fix-271.patch
>
> diff --git a/package/reaver/0001-fix-271.patch b/package/reaver/0001-fix-271.patch
> deleted file mode 100644
> index 9f6b395120..0000000000
> --- a/package/reaver/0001-fix-271.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From c7040da3a9ff98cd8063b9d5b5a7721374186391 Mon Sep 17 00:00:00 2001
> -From: rofl0r <retnyg@gmx.net>
> -Date: Fri, 22 Feb 2019 17:38:24 +0000
> -Subject: [PATCH] fix #271
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/t6x/reaver-wps-fork-t6x/commit/c7040da3a9ff98cd8063b9d5b5a7721374186391]
> ----
> - src/wps/wps_attr_parse.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/wps/wps_attr_parse.c b/src/wps/wps_attr_parse.c
> -index 30b0e79..d681b70 100644
> ---- a/src/wps/wps_attr_parse.c
> -+++ b/src/wps/wps_attr_parse.c
> -@@ -443,12 +443,12 @@ int wps_parse_msg(const struct wpabuf *msg, struct wps_parse_attr *attr)
> -                        * Mac OS X 10.6 seems to be adding 0x00 padding to the
> -                        * end of M1. Skip those to avoid interop issues.
> -                        */
> --                      int i;
> --                      for (i = 0; i < end - pos; i++) {
> -+                      uintptr_t i, left = end - pos;
> -+                      for (i = 0; i < left; i++) {
> -                               if (pos[i])
> -                                       break;
> -                       }
> --                      if (i == end - pos) {
> -+                      if (i == left) {
> -                               wpa_printf(MSG_DEBUG, "WPS: Workaround - skip "
> -                                          "unexpected message padding");
> -                               break;
> diff --git a/package/reaver/reaver.hash b/package/reaver/reaver.hash
> index fad81fe326..30947ac5c5 100644
> --- a/package/reaver/reaver.hash
> +++ b/package/reaver/reaver.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256 e6761d2d4ef9cb2b45fe0a60d6b94048ce4442e4ac209904fe89506ff1e94c44 reaver-1.6.5.tar.gz
> +sha256 73189782b208d12b8dddc4f29d32e1f72b1f3609e573c9ea9510deebec394583 reaver-1.6.6.tar.gz
>  sha256 bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a docs/LICENSE

Just a side note: When changing the hash you also could adopt to the
new code style:
"The format of this file is one line for each file for which to check
the hash, each line with the following three fields separated by two
spaces:"

> diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
> index 093ac935af..2b5f82960b 100644
> --- a/package/reaver/reaver.mk
> +++ b/package/reaver/reaver.mk
> @@ -6,7 +6,7 @@
>
>  # Older repos for this project will not cross-compile easily
>  # while this one works right away
> -REAVER_VERSION = 1.6.5
> +REAVER_VERSION = 1.6.6
>  REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,v$(REAVER_VERSION))
>  REAVER_LICENSE = GPL-2.0+
>  REAVER_LICENSE_FILES = docs/LICENSE
> --
> 2.20.1

Thank you.

-- 
Heiko
