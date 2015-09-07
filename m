From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Sep 2015 11:44:30 +0100
Subject: [Buildroot] [PATCH 1/5] package/at: updated version from 3.1.13
 to 3.1.16
In-Reply-To: <1441614610-10073-1-git-send-email-francesco.nwokeka@gmail.com>
References: <1441614610-10073-1-git-send-email-francesco.nwokeka@gmail.com>
Message-ID: <55ED6A8E.6010003@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francesco Nwokeka,

On 09/07/2015 09:30 AM, Francesco Nwokeka wrote:
> Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
> ---
>  package/at/at.hash | 9 +++++----
>  package/at/at.mk   | 2 +-
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/at/at.hash b/package/at/at.hash
> index 481c937..86f523b 100644
> --- a/package/at/at.hash
> +++ b/package/at/at.hash
> @@ -1,4 +1,5 @@
> -# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.13-2%2Bdeb7u1.dsc
> -sha1	9873e0c38403ef58364912d0b505fd20798fd400  at_3.1.13.orig.tar.gz
> -sha256	3a8b90868d615d21a92f4986ea9a823886329af8fae8dd7ab4eed9b273bca072  at_3.1.13.orig.tar.gz
> -md5	1da61af6c29e323abaaf13ee1a8dad79  at_3.1.13.orig.tar.gz
> +# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.16-1.dsc
> +
> +sha1    5ad64a471d0ed9985541e918e096f69dc2963cf0 123174 at_3.1.16.orig.tar.gz
> +sha256  cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1 at_3.1.16.orig.tar.gz
> +md5 d05da75d9b75d93917ffb16ab48b1e19 at_3.1.16.orig.tar.gz
> diff --git a/package/at/at.mk b/package/at/at.mk
> index 1504e32..8865360 100644
> --- a/package/at/at.mk
> +++ b/package/at/at.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -AT_VERSION = 3.1.13
> +AT_VERSION = 3.1.16
>  AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
>  AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at
>  # missing deps for parsetime.l
> 

after applying your patch, I can't build at:

>>> at 3.1.16 Patching

Applying 0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
using patch:
patching file configure.ac
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file configure.ac.rej
Patch failed!  Please fix
0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch!

This is because you need to "remove unneeded"/tweak patches at the same
time you are bumping the version.

You patch series should be testable at any step of the series.

Also, when you send a new patch with superseded an old one, please mark
the old one as "superseded" in Patchwork.

Regards,

Vincent.
