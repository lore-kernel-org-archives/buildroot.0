From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 4 Feb 2019 16:16:29 +0100
Subject: [Buildroot] [PATCH v2 1/3] docs/website/js/buildroot.js: switch
 var to let
In-Reply-To: <20190204142731.8429-1-aduskett@gmail.com>
References: <20190204142731.8429-1-aduskett@gmail.com>
Message-ID: <CA+_SqVb_dpJZtO8mAC=QY1sTUeo87CowauUwAvza_i4bbmHhGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2019 at 3:27 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> In javascript, let is preferred for local, var is preferred for global.
> Change any local variables from "var" to "let"
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Acked-by: <angelo@amarulasolutions.com>
Tested-by: <angelo@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>   - Updated to apply to latest master commit.
>
>  docs/website/js/buildroot.js | 40 ++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
> index fa5ad9a78e..3e6ff0d20b 100644
> --- a/docs/website/js/buildroot.js
> +++ b/docs/website/js/buildroot.js
> @@ -1,51 +1,51 @@
>  function load_activity(feedurl, divid) {
> -    var container = document.getElementById(divid);
> +    let container = document.getElementById(divid);
>      $.ajax({
>        url: "https://cors.io/?" + feedurl
>      })
>      .done(function(data){
> -        var x2js = new X2JS();
> -        var result = x2js.xml_str2json(data);
> -        var loaded = 0;
> -        var nb_display = 8;
> +        let x2js = new X2JS();
> +        let result = x2js.xml_str2json(data);
> +        let loaded = 0;
> +        let nb_display = 8;
>          if (result==null) return;
> -        for (var i = 0; i < result.feed.entry.length; i++) {
> -            var entry = result.feed.entry[i];
> +        for (let i = 0; i < result.feed.entry.length; i++) {
> +            let entry = result.feed.entry[i];
>              if (entry.title.indexOf("git commit") != -1)
>                  continue;
>              loaded += 1;
>              if (loaded > nb_display)
>                  break;
> -            var div = document.createElement("p");
> -            var link = document.createElement("a");
> -            var d = new Date(entry.published);
> -            var data = '[' + d.toLocaleDateString() + '] ' + entry.title
> -            var text = document.createTextNode(data);
> +            let div = document.createElement("p");
> +            let link = document.createElement("a");
> +            let d = new Date(entry.published);
> +            let data = '[' + d.toLocaleDateString() + '] ' + entry.title
> +            let text = document.createTextNode(data);
>              link.appendChild(text);
>              link.title = entry.title;
>              link.href = entry.link._href;
>              div.appendChild(link);
>              container.appendChild(div);
>          }
> -        var empty = nb_display - loaded;
> -        for (var i = 0; i < empty; i++) {
> +        let empty = nb_display - loaded;
> +        for (let i = 0; i < empty; i++) {
>              container.appendChild(document.createElement("p"));
>          }
>      });
>  }
>
>  function google_analytics() {
> -    var _gaq = _gaq || [];
> +    let _gaq = _gaq || [];
>      _gaq.push(['_setAccount', 'UA-21761074-1']);
>      _gaq.push(['_setDomainName', 'none']);
>      _gaq.push(['_setAllowLinker', true]);
>      _gaq.push(['_trackPageview']);
>
> -    var ga = document.createElement('script');
> +    let ga = document.createElement('script');
>      ga.type = 'text/javascript';
>      ga.async = true;
>      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
> -    var s = document.getElementsByTagName('script')[0];
> +    let s = document.getElementsByTagName('script')[0];
>      s.parentNode.insertBefore(ga, s);
>  }
>
> @@ -54,7 +54,7 @@ function showTooltip(elem, msg) {
>      elem.setAttribute('aria-label', msg);
>  }
>
> -var clipboard = new Clipboard('.btn');
> +let clipboard = new Clipboard('.btn');
>
>  $(function () {
>    $('[data-toggle="tooltip"]').tooltip()
> @@ -68,7 +68,7 @@ clipboard.on('success', function(e) {
>  $(function() {
>    $('a[href*=\\#]:not([href=\\#])').click(function() {
>      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
> -      var target = $(this.hash);
> +        let target = $(this.hash);
>        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
>        if (target.length) {
>          $('html,body').animate({
> @@ -81,7 +81,7 @@ $(function() {
>  });
>
>  jQuery(document).ready(function($) {
> -    var url = window.location.href;
> +    let url = window.location.href;
>      // Get the basename of the URL
>      url = url.split(/[\\/]/).pop()
>      $('.nav a[href="/' + url + '"]').parent().addClass('active');
> --
> 2.17.2 (Apple Git-113)
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
