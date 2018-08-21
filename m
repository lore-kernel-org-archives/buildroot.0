From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Aug 2018 07:46:43 +0200
Subject: [Buildroot] [PATCH 2/3] scancpan: skip Dist::Zilla
In-Reply-To: <20180820111623.23173-3-chrismcc@gmail.com>
References: <20180820111623.23173-1-chrismcc@gmail.com>
 <20180820111623.23173-3-chrismcc@gmail.com>
Message-ID: <CAGhdn56UxcQbJDXy8+9sbPQA==u4VzqS_RFQvKGeD9sva1y63g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-20 13:16 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  utils/scancpan | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/utils/scancpan b/utils/scancpan
> index 6c90588ed4..c83730fa13 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -603,6 +603,7 @@ sub fetch {
>              # we could use the host Module::CoreList data, because host
> perl and
>              # target perl have the same major version
>              next if ${$dep}{phase} eq q{develop};
> +           next if ${$dep}{phase} eq q{x_Dist_Zilla};
>

please, indent with only space (no hard tab).

Fran?ois


>              next if !($test && $top) && ${$dep}{phase} eq q{test};
>              my $distname = $mcpan->module( $modname )->{distribution};
>              if (${$dep}{phase} eq q{runtime}) {
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/b8016b9a/attachment.html>
