From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Aug 2018 07:55:40 +0200
Subject: [Buildroot] [PATCH 3/3] scancpan: support more licenses
In-Reply-To: <20180820111623.23173-4-chrismcc@gmail.com>
References: <20180820111623.23173-1-chrismcc@gmail.com>
 <20180820111623.23173-4-chrismcc@gmail.com>
Message-ID: <CAGhdn57fx0e6VJziC91mmYrkkdyTG-Nh-q7Bb74=pwwE58UhBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-20 13:16 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>

Reviewed-by: Francois Perrad <francois.perrad@gadz.org>

---
>  utils/scancpan | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/utils/scancpan b/utils/scancpan
> index c83730fa13..5db4decc5e 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -702,9 +702,16 @@ while (my ($distname, $dist) = each %dist) {
>                      ? join q{ or }, @{$dist->{license}}
>                      : $dist->{license};
>          # BR requires license name as in http://spdx.org/licenses/
> +        $license =~ s|apache_1_1|Apache-1.1|;
>          $license =~ s|apache_2_0|Apache-2.0|;
> +        $license =~ s|artistic|Artistic-1.0|;
>          $license =~ s|artistic_2|Artistic-2.0|;
> +        $license =~ s|lgpl_2_1|LGPL-2.1|;
> +        $license =~ s|lgpl_3_0|LGPL-3.0|;
> +        $license =~ s|gpl_2|GPL-2.0|;
> +        $license =~ s|gpl_3|GPL-3.0|;
>          $license =~ s|mit|MIT|;
> +        $license =~ s|mozilla_1_1|Mozilla-1.1|;
>          $license =~ s|openssl|OpenSSL|;
>          $license =~ s|perl_5|Artistic or GPL-1.0+|;
>          my $license_files = join q{ }, keys %{$license_files{$distname}};
> --
> 2.14.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/b661fc66/attachment.html>
