From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 4 Feb 2019 16:16:47 +0100
Subject: [Buildroot] [PATCH v2 2/3] docs/website/js/buildroot.js: Fix
 possible type coercion
In-Reply-To: <20190204142731.8429-2-aduskett@gmail.com>
References: <20190204142731.8429-1-aduskett@gmail.com>
 <20190204142731.8429-2-aduskett@gmail.com>
Message-ID: <CA+_SqVYst91ryXojPq1br0D9C1gxzKeOzPS+5C0hk6xssxkPdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2019 at 3:27 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> With javascript, when comparing variables, using === instead of ==
> is preferred.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Acked-by: <angelo@amarulasolutions.com>
Tested-by: <angelo@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>   - Updated to apply to latest master commit.
>
>  docs/website/js/buildroot.js | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
> index 3e6ff0d20b..1b08f9b4df 100644
> --- a/docs/website/js/buildroot.js
> +++ b/docs/website/js/buildroot.js
> @@ -11,7 +11,7 @@ function load_activity(feedurl, divid) {
>          if (result==null) return;
>          for (let i = 0; i < result.feed.entry.length; i++) {
>              let entry = result.feed.entry[i];
> -            if (entry.title.indexOf("git commit") != -1)
> +            if (entry.title.indexOf("git commit") !== -1)
>                  continue;
>              loaded += 1;
>              if (loaded > nb_display)
> @@ -44,7 +44,7 @@ function google_analytics() {
>      let ga = document.createElement('script');
>      ga.type = 'text/javascript';
>      ga.async = true;
> -    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
> +    ga.src = ('https:' === document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
>      let s = document.getElementsByTagName('script')[0];
>      s.parentNode.insertBefore(ga, s);
>  }
> @@ -67,7 +67,7 @@ clipboard.on('success', function(e) {
>
>  $(function() {
>    $('a[href*=\\#]:not([href=\\#])').click(function() {
> -    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
> +    if (location.pathname.replace(/^\//,'') === this.pathname.replace(/^\//,'') && location.hostname === this.hostname) {
>          let target = $(this.hash);
>        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
>        if (target.length) {
> --
> 2.17.2 (Apple Git-113)
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
