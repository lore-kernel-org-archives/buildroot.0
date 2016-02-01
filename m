From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 1 Feb 2016 10:07:17 +0100
Subject: [Buildroot] [PATCH 16/16 v3] core/pkg-virtual: ignore from
 legal-info output
In-Reply-To: <bee63e49a6e51196ca55bab2698c8e69d38e2512.1454004518.git.yann.morin.1998@free.fr>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <bee63e49a6e51196ca55bab2698c8e69d38e2512.1454004518.git.yann.morin.1998@free.fr>
Message-ID: <56AF2045.1080200@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN wrote:
> Virtual packages really have nothing to save for legal-info, so we just
> ignore them.
>
> Currently, packages are only extracted if they define _LICENSE_FILES.
> Follow-up patches will always extract and patch non-ignored packages, so
> we would potentially see spurious "extracting" and "patching" messages
> for virtual packages on the console, which would be a bit strange.
> Ignoring virtual packages will get us a cleaner log.

This comment is incorrect after patch 11 ("core/legal-info: also save
patches").

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
>
> ---
> Changes v1 -> v2:
>    - use the new _LEGAL_IGNORE variable  (Thomas, Luca, Peter)
> ---
>   docs/manual/adding-packages-virtual.txt | 3 +++
>   package/pkg-virtual.mk                  | 2 ++
>   2 files changed, 5 insertions(+)
>
> diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
> index a5f17a2..11a497d 100644
> --- a/docs/manual/adding-packages-virtual.txt
> +++ b/docs/manual/adding-packages-virtual.txt
> @@ -56,6 +56,9 @@ The +.mk+ for the virtual package should just evaluate the +virtual-package+ mac
>   The ability to have target and host packages is also available, with the
>   +host-virtual-package+ macro.
>
> +.Note:
> +Virtual packages are automatically ignored when generating the +legal-info+ output.
> +

A minor nit: to make it clearer, I would append "by setting
FOO_LEGAL_IGNORE" to this sentence.

-- 
Luca
