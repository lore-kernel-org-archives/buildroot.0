From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 11 Feb 2014 12:40:38 +0100
Subject: [Buildroot] [pkg-perl infra V7 1/6] pkg-perl: new infrastructure
In-Reply-To: <1392116205-12810-2-git-send-email-francois.perrad@gadz.org>
References: <1392116205-12810-1-git-send-email-francois.perrad@gadz.org>
 <1392116205-12810-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LX2DVZ_nQNYF_fpPAwKGUtt-k+SyPjUK6j4LC2vi=TONw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Tue, Feb 11, 2014 at 11:56 AM, Francois Perrad <fperrad@gmail.com> wrote:
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in           |   10 +++
>  package/Makefile.in |    4 +-
>  package/pkg-perl.mk |  181 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 194 insertions(+), 1 deletion(-)
>  create mode 100644 package/pkg-perl.mk
>
> diff --git a/Config.in b/Config.in
> index bcfefc7..be3e202 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -225,6 +225,16 @@ config BR2_LUAROCKS_MIRROR
>
>           See http://luarocks.org
>
> +config BR2_CPAN_MIRROR
> +       string "CPAN mirror"
> +       default "http://search.cpan.org/CPAN"
> +       help
> +         CPAN has multiple software mirrors scattered around the world.
> +         This option allows you to select a mirror.
> +
> +         The list of mirrors is available at:
> +         http://search.cpan.org/mirror
> +
>  endmenu
>

Did you see my comment about this config option, in V5 of your series?
For reference, here is what I said:
----------
For users not familiar with Perl, this option in a general buildroot
menu is confusing: "What the heck is CPAN?".
I would suggest to add a reference to Perl here, for example in the
title: "CPAN mirror (perl packages)"
and in the help text: "CPAN (Comprehensive Perl Archive Network) is a
repository of perl packages. It has multiple ... "
-----------


Best regards,
Thomas
