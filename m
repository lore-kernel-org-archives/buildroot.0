From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:15:37 +0200
Subject: [Buildroot] [PATCH 1/2] scancpan: generate a conventional
 comment
In-Reply-To: <20181010101446.30160-1-francois.perrad@gadz.org>
References: <20181010101446.30160-1-francois.perrad@gadz.org>
Message-ID: <20181010141537.50976f7d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 12:14:45 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  utils/scancpan | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/utils/scancpan b/utils/scancpan
> index e16a18303..2e7e94627 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -696,6 +696,7 @@ while (my ($distname, $dist) = each %dist) {
>          say {$fh} qq{config BR2_PACKAGE_${brname}};
>          say {$fh} qq{\tbool "${fsname}"};
>          say {$fh} qq{\tdepends on !BR2_STATIC_LIBS} if $need_dlopen{$distname};
> +        say {$fh} qq{\t# runtime} if scalar @{$deps_runtime{$distname}} > 0;

Sorry about not being clear, but the usual syntax for this comment is:

	select BR2_PACKAGE_FOO # runtime

Use 'git grep "# runtime"', you'll see numerous instances of it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
