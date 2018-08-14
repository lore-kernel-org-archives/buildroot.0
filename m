From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 13:33:37 +0200
Subject: [Buildroot] [RFC PATCH 1/2] scancpan: support more licenses
In-Reply-To: <20180813131135.32651-2-chrismcc@gmail.com>
References: <20180813131135.32651-1-chrismcc@gmail.com>
 <20180813131135.32651-2-chrismcc@gmail.com>
Message-ID: <20180814133337.5b9338b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

So, taking Arnout/Yann feedback into account.

On Mon, 13 Aug 2018 06:11:34 -0700, Christopher McCrory wrote:

> diff --git a/utils/scancpan b/utils/scancpan
> index da8e7b91ac..2070e2a233 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -692,8 +692,19 @@ while (my ($distname, $dist) = each %dist) {
>                      : $dist->{license};
>          # BR requires license name as in http://spdx.org/licenses/
>          $license =~ s|apache_2_0|Apache-2.0|;
> +        $license =~ s|apache_1_1|Apache-1.1|;
> +        $license =~ s|apache|Apache-2.0|;

In this case, scancpan should not conclude that Apache-2.0 is used,
because "apache" is not specific enough. Instead, it should emit a
warning.

>          $license =~ s|artistic_2|Artistic-2.0|;
> +        $license =~ s|artistic|Artistic-1.0|;
> +        $license =~ s|lgpl_2_1|LGPL-2.1|;
> +        $license =~ s|lgpl_3_0|LGPL-3.0|;
> +        $license =~ s|lgpl|LGPL-2.1|;

Same.

> +        $license =~ s|bsd|BSD|;

Same.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
