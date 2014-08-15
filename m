From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Aug 2014 21:15:30 +0200
Subject: [Buildroot] [PATCHv2 3/3] docs/manual: update documentation
 about gettext handling
In-Reply-To: <1408127999-2352-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408127999-2352-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408127999-2352-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVEOXAr_kc9X-9OwXRNe_OacDCB00_4kVj-Uo3hQPDO=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 15, 2014 at 8:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-gettext.txt | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
> index d265607..580787f 100644
> --- a/docs/manual/adding-packages-gettext.txt
> +++ b/docs/manual/adding-packages-gettext.txt
> @@ -8,10 +8,16 @@ library. Dependencies for this library are fairly complicated and
>  therefore, deserve some explanation.
>
>  The 'uClibc' C library doesn't implement gettext functionality;
> -therefore with this C library, a separate gettext must be compiled. On
> -the other hand, the 'glibc' C library does integrate its own gettext,
> -and in this case the separate gettext library should not be compiled,
> -because it creates various kinds of build failures.
> +therefore with this C library, a separate gettext must be compiled,
> +which will provide the libintl library.
> +
> +On the other hand, the 'glibc' C library does integrate its own
> +gettext library functions, so it is not necessary to build a separate
> +libintl library.
> +
> +However, certain packages will need some gettext utilities on the

I would remove 'will' here.

In addition to the above new comment, I already provided feedback on
this patch in June, but you must have missed it:
http://lists.busybox.net/pipermail/buildroot/2014-June/098211.html

Best regards,
Thomas
