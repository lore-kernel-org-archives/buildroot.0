From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 5 Feb 2020 06:53:45 +0100
Subject: [Buildroot] [PATCH 2/2] docs/manual: describe the new
 <pkg>_IGNORE_CVES variable
In-Reply-To: <20200204215232.666841-3-thomas.petazzoni@bootlin.com>
References: <20200204215232.666841-1-thomas.petazzoni@bootlin.com>
 <20200204215232.666841-3-thomas.petazzoni@bootlin.com>
Message-ID: <CAAXf6LUUGD0FsEbzmnr9xQ96x7T+Yff4Mr-_47r0x_2TLPXhQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 4, 2020, 22:52 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/manual/adding-packages-generic.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/docs/manual/adding-packages-generic.txt
> b/docs/manual/adding-packages-generic.txt
> index baa052e31c..9a77923a92 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -488,6 +488,20 @@ not and can not work as people would expect it should:
>    locations, `/lib/firmware`, `/usr/lib/firmware`, `/lib/modules`,
>    `/usr/lib/modules`, and `/usr/share`, which are automatically excluded.
>
> +* +LIBFOO_IGNORE_CVES+ is a space-separated list of CVEs that tells
> +  Buildroot CVE tracking tools which CVEs should be ignored for this
> +  package. This is typically used when the CVE is fixed by a patch in
> +  the package, or when the CVE for some reason does not affect the
> +  Buildroot package. A Makefile comment must always preceed the
>

Precede

+  addition of a CVE to this variable. Example:
> +
> +----------------------
> +# 0001-fix-cve-2020-12345.patch
> +LIBFOO_IGNORE_CVES += CVE-2020-12345
> +# only when built with libbaz, which Buildroot doesn't support
> +LIBFOO_IGNORE_CVES += CVE-2020-54321
> +----------------------
> +
>  The recommended way to define these variables is to use the following
>  syntax:
>
> --
> 2.24.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200205/fc7d4f89/attachment.html>
