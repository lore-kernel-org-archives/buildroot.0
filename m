From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 28 Jan 2014 13:26:13 +0100
Subject: [Buildroot] [PATCH 2/2] mtd: Allow to select the host variant
In-Reply-To: <1390909161-2496-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1390909161-2496-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1390909161-2496-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <CAAXf6LXpeBr30NU4upeotjoQ8UR-WLbraXGFDCT9K8rbJTUO3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 28, 2014 at 12:39 PM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> If any of the post-image scripts wants to create mtd/ubi images,
> we need to expose an option for mtd-tools to be user-selectable.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  package/Config.in.host     | 1 +
>  package/mtd/Config.in.host | 6 ++++++
>  2 files changed, 7 insertions(+)
>  create mode 100644 package/mtd/Config.in.host
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 34e84bf..f2fe2c2 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -8,6 +8,7 @@ source "package/genimage/Config.in.host"
>  source "package/genpart/Config.in.host"
>  source "package/lpc3250loader/Config.in.host"
>  source "package/mtools/Config.in.host"
> +source "package/mtd/Config.in.host"

This should be above mtools.

[..]

Other than this one comment:
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
