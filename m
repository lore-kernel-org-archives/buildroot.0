From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 4 Feb 2019 16:17:01 +0100
Subject: [Buildroot] [PATCH v2 3/3] docs/website/js/buildroot.js: Fix
 unterminated statements
In-Reply-To: <20190204142731.8429-3-aduskett@gmail.com>
References: <20190204142731.8429-1-aduskett@gmail.com>
 <20190204142731.8429-3-aduskett@gmail.com>
Message-ID: <CA+_SqVYxry9bLjgXZxN6so3YHQMscZT-oLBtF5bkzmknwSv9qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2019 at 3:27 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Some statements are missing their semicolons.
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
> index 1b08f9b4df..48fafa67ac 100644
> --- a/docs/website/js/buildroot.js
> +++ b/docs/website/js/buildroot.js
> @@ -19,7 +19,7 @@ function load_activity(feedurl, divid) {
>              let div = document.createElement("p");
>              let link = document.createElement("a");
>              let d = new Date(entry.published);
> -            let data = '[' + d.toLocaleDateString() + '] ' + entry.title
> +            let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
>              let text = document.createTextNode(data);
>              link.appendChild(text);
>              link.title = entry.title;
> @@ -58,7 +58,7 @@ let clipboard = new Clipboard('.btn');
>
>  $(function () {
>    $('[data-toggle="tooltip"]').tooltip()
> -})
> +});
>
>  clipboard.on('success', function(e) {
>      e.clearSelection();
> @@ -83,7 +83,7 @@ $(function() {
>  jQuery(document).ready(function($) {
>      let url = window.location.href;
>      // Get the basename of the URL
> -    url = url.split(/[\\/]/).pop()
> +    url = url.split(/[\\/]/).pop();
>      $('.nav a[href="/' + url + '"]').parent().addClass('active');
>
>      load_activity("http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-busybox-ft2.xml", "mailing-list-activity");
> --
> 2.17.2 (Apple Git-113)
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
