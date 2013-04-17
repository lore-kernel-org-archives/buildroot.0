From: Shawn J. Goff <shawn7400@gmail.com>
Date: Wed, 17 Apr 2013 17:30:40 -0400
Subject: [Buildroot] [PATCH] libcurl: specify capath
In-Reply-To: <87ehe8j513.fsf@dell.be.48ers.dk>
References: <1366223881-6367-1-git-send-email-shawn7400@gmail.com>
 <87ehe8j513.fsf@dell.be.48ers.dk>
Message-ID: <CAGiDA6KghsuQ1JiY61ThiDVqnCWFDbeKu7Jea3SsBxYAw2ctBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 17, 2013 at 4:06 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Shawn" == Shawn J Goff <shawn7400@gmail.com> writes:
>
>  Shawn> From: "Shawn J. Goff" <shawn7400@gmail.com>
>  Shawn> Since openssl's path is '/etc/ssl/' (specified in our openssl package),
>  Shawn> we should also make sure that's what curl is using.
>
>  Shawn> Previously, it's hasn't been specified, which means it changes depending
>  Shawn> on the host system where it's compiled.
>
> Out of interest, how does it get this info?
>

"...it checks a few known paths to see where it might find the default
ca-cert for that system."
from http://curl.haxx.se/mail/lib-2009-08/0223.html

>  Shawn> Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
>  Shawn> ---
>  Shawn>  package/libcurl/libcurl.mk | 2 +-
>  Shawn>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  Shawn> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
>  Shawn> index a631953..75c9601 100644
>  Shawn> --- a/package/libcurl/libcurl.mk
>  Shawn> +++ b/package/libcurl/libcurl.mk
>  Shawn> @@ -16,7 +16,7 @@ LIBCURL_INSTALL_STAGING = YES
>  Shawn>  # probably almost never used. See
>  Shawn>  # http://curl.haxx.se/docs/manpage.html#--ntlm.
>  Shawn>  LIBCURL_CONF_OPT = --disable-verbose --disable-manual \
>  Shawn> -       --enable-hidden-symbols --disable-ntlm-wb
>  Shawn> +       --enable-hidden-symbols --disable-ntlm-wb --with-ca-path=/etc/ssl/certs
>
> It would make more sense to move this under the BR2_PACKAGE_OPENSSL
> conditional.
It would. Another patch is coming.
