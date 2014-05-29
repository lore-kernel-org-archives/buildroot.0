From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 29 May 2014 15:04:52 +0200
Subject: [Buildroot] [PATCH 2/3] gettext: remove support for
 gettext-tools on target
In-Reply-To: <1401360028-10423-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401360028-10423-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401360028-10423-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LU=u7YjJ821h1fV2ioa7AMg_bHNXX8WnWe_vgHUSbrnLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 29, 2014 at 12:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit removes the BR2_PACKAGE_GETTEXT_TOOLS option, which could
> be used to install gettext tools on the target. This is not needed,
> because Buildroot is not designed to provide a full development
> environment on the target, and gettext translation files should be
> processed on the build machine, using the host gettext tools.
>
> Remove this option will allow to optimize the build time of gettext on
> the target, by only building the gettext runtime libraries.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in.legacy           | 12 ++++++++++++
>  package/gettext/Config.in  | 14 --------------
>  package/gettext/gettext.mk |  4 ----
>  3 files changed, 12 insertions(+), 18 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 00661db..10e495b 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -99,6 +99,18 @@ comment "----------------------------------------------------"
>  endif
>
>  ###############################################################################
> +comment "Legacy options removed in 2014.08"
> +
> +config BR2_PACKAGE_GETTEXT_TOOLS
> +       bool "gettext-tools on target support removed"

I would rewrite this as any of the following:

support for gettext-tools on target has been removed
gettext-tools target support has been removed
gettext-tools target option has been removed

Best regards,
Thomas
