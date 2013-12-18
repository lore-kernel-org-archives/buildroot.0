From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 12:01:05 +0100
Subject: [Buildroot] [PATCH v6 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <1387362302-12198-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1387362302-12198-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1387362302-12198-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <CAAXf6LVsYsv9wE-Tz0=_LBx1ZrAes=W0ksXw1WpBcn2Hk9ExLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan, Peter,

On Wed, Dec 18, 2013 at 11:25 AM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> Updating the documentation to reflect that multiple directories can
> now be specified for BR2_GLOBAL_PATCH_DIR. Along with giving an
> example use case of how to use multiple global patch directories.
>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
>
> ---
> Changes v4 -> v6:
>   - Minor wording that was missed from feedback received by
>     Thomas D in v4.
>
> Changes v4 -> v5:
>   - Fixed minor wording issue and spelling (suggested by Thomas D)
>
> Changes v3 -> v4:
>   - Fixed minor spelling mistakes and wording (suggested by Arnout)
>   - Reword section about order that patches are applied along with
>     making it clearer about when to use BR2_GLOBAL_PATCH_DIR
>     (suggested by Arnout)
>
> Changes v2 -> v3:
>   - None
>
> Changes v1 -> v2:
>   - Fixed minor spelling mistakes and wording (suggested by Thomas D)
> ---
>  docs/manual/customize-packages.txt |   92 ++++++++++++++++++++++++++++++++----
>  docs/manual/patch-policy.txt       |   20 +++++---
>  2 files changed, 96 insertions(+), 16 deletions(-)
>
[..]
> +
> +The exception to +BR2_GLOBAL_PATCH_DIR+ being the preferred method for
> +specifying custom patches is +BR2_LINUX_KERNEL_PATCH+.
> ++BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches that
> +are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCHES+ are applied
> +after patches available in +BR2_GLOBAL_PATCH_DIR+, as it is done
> +from a post-patch hook of the Linux package

I'd add a dot here at the end of the sentence, but this is maybe
something Peter can do while committing?

Other than that, finally: ;)

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Best regards,
Thomas
