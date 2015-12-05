From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Dec 2015 17:41:49 +0100
Subject: [Buildroot] [PATCH 1/4] docs/website: fixing html tidy errors
 and warnings
In-Reply-To: <1449213674-11333-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1449213674-11333-1-git-send-email-angelo.compagnucci@gmail.com>
 <1449213674-11333-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <566313CD.7020100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-12-15 08:21, Angelo Compagnucci wrote:
> This patch makes tidy html checker happy.

 Can you specify a bit more clearly how you got here? Like, the command line of
htmltidy that generated errors, the number of errors it gave, and the number of
errors still left after this patch. I've tried to run tidy and after this series
it still gives a few hundred errors...

 Please also specify which type of errors you corrected.

 Also, if you've used some script to automate some of the changes, please write
down how you did that.

 The reason for all of the above is that the patch is much too large to
understand what really happens, so you need to provide as much detail as
possible in the commit log.

> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  docs/website/docs.html     | 20 ++++++++---------
>  docs/website/download.html | 39 ++++++++++++++++----------------
>  docs/website/header.html   | 16 +++++++-------
>  docs/website/index.html    | 24 ++++++++++----------
>  docs/website/news.html     | 55 +++++++++++++++++++++++-----------------------
>  docs/website/sponsors.html | 26 ++++++++++++----------
>  docs/website/support.html  | 10 ++++-----
>  7 files changed, 96 insertions(+), 94 deletions(-)
> 
> diff --git a/docs/website/docs.html b/docs/website/docs.html
> index 9cee36d..4335796 100644
> --- a/docs/website/docs.html
> +++ b/docs/website/docs.html
> @@ -16,15 +16,15 @@
>  	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
>  	    <div class="flipper">
>  	      <div class="front">
> -		<a href="/manual.html"><img src="images/browser.png" width="180" alt=""></a>
> +		<a href="/manual.html"><img src="images/browser.png" width="180" alt="" /></a>

 Does tidy or some other coding style require a space before the /> ? It looks
strange to me...

>  	      </div>
>  	      <div class="back">
[snip]
> @@ -90,21 +90,21 @@
>  	  <div class="panel panel-success">
>  	    <div class="panel-heading">Repository</div>
>  	    <div class="panel-body">
> -	      <P>The buildroot repository can be browsed online through cgit at
> +	      <p>The buildroot repository can be browsed online through cgit at
>  		<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
>  		To grab a copy of the repository use</p>
>  
>  
>  	      <div class="input-group" style="width: 100%;">
>  		<input class="form-control" style="width: 85%;" id="giturl"
> -		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly></input>
> +		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly 	/>

 Er, space-tab-/> looks *really* strange.

>  		<span class="input-group-button">
>  		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
>  			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
> -		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
> +		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13" />
>  		  </button>
>  		</span>
> -	      </div><br>
> +	      </div><br/>

 And here you don't have a space before />.

>  
>  	      <p>
>  		Or if you're behind a firewall blocking git:
> @@ -116,34 +116,35 @@
>  		<span class="input-group-button">
>  		  <button class="btn pull-right" type="button" data-clipboard-target="#giturlhttps"
>  			  data-toggle="tooltip" data-placement="bottom" data-trigger="click" title="Copied!">
> -		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
> +		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13" />
>  		  </button>
>  		</span>
> -	      </div><br>
> +	      </div><br/>
>  
>  	      <p>
>  
>  		Please use the native git protocol if at all possible, as it's a lot
> -		more efficient than HTTP.
> +		more efficient than HTTP.</p>

 It's strange to have the <p> on a separate line and the </p> directly after the
final character of the paragraph. But since patch 4/4 changes that again, it
doesn't matter.

[snip]
> diff --git a/docs/website/news.html b/docs/website/news.html
> index 89c5062..f1961bf 100644
> --- a/docs/website/news.html
> +++ b/docs/website/news.html
[snip]
> @@ -2593,7 +2592,7 @@
>      <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
>      <div class="timeline-panel">
>        <div class="timeline-heading">
> -	<h4 class="timeline-title"><new Logo/h4>
> +	<h4 class="timeline-title">new Logo</h4>

 This is an actual bugfix so should be in a separate high-priority patch.

>  	    <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 March 2009</small></p>
>        </div>
>        <div class="timeline-body">
> diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
> index db50e37..801bca9 100644
> --- a/docs/website/sponsors.html
> +++ b/docs/website/sponsors.html
> @@ -14,7 +14,7 @@
>  	    <div class="panel-body">
>  	      <div class="col-sm-4">
>  		<a href="http://google.com">
> -		  <img class="img-responsive center-block" src="images/google-logo.png"/>
> +		  <img class="img-responsive center-block" src="images/google-logo.png" alt="google logo"/>

 I think it's better if the alt text doesn't describe what is missing, but
really replaces the image. So in this case: "Google".

 It would be good to view it without images to verify that it looks OK.

>  		</a>
>  	      </div>
>  	      <div class="col-sm-8">
> @@ -33,8 +33,8 @@
>  	  <div class="panel panel-default">
>  	    <div class="panel-body">
>  	      <div class="col-sm-4">
> -		<a href="http://mind.be">
> -		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
> +		<a href="http://www.mind.be">

 What's wrong with http://mind.be? And why don't you treat Google the same way? :-)

> +		  <img class="img-responsive center-block" src="images/mind-logo.png" alt="mind logo"/>

 "Mind", or even better "Essensium/Mind" (lot's of space here).

>  		</a>
>  	      </div>
>  	      <div class="col-sm-8">
> @@ -68,7 +68,7 @@
>  	    <div class="panel-body">
>  	      <div class="col-sm-12">
>  		<a href="http://www.mind.be">
> -		  <img class="img-responsive center-block" src="images/mind-logo.png"/>
> +		  <img class="img-responsive center-block" src="images/mind-logo.png" alt="minid logo"/>

 "Mind". Definitely not "minid".

>  		</a>
>  	      </div>
>  	      <div class="col-sm-12" style="font-size: 12px;">
> @@ -87,7 +87,7 @@
>  	    <div class="panel-body">
>  	      <div class="col-sm-12">
>  		<p><a href="http://www.google.com">
> -		    <img class="img-responsive center-block" src="images/google-logo.png"/></a></p>
> +		    <img class="img-responsive center-block" src="images/google-logo.png" alt="google logo"/></a></p>

 Google

>  	      </div>
>  	      <div class="col-sm-12">
>  		<p><a href="http://www.google.com">Google</a> provided the
> @@ -103,7 +103,7 @@
>  	    <div class="panel-body">
>  	      <div class="col-sm-12">
>  		<p><a href="http://www.imgtec.com/">
> -		    <img class="img-responsive center-block" src="images/imgtec-logo.png"/></a></p>
> +		    <img class="img-responsive center-block" src="images/imgtec-logo.png" alt="imgtec logo"/></a></p>

 Imagination Technologies

etc. etc.

[snip]
> @@ -217,5 +217,7 @@
>      </div>
>    </div>
>  </div>
> +</div>
> +</div>

 Wow, divide and conquer I guess? :-)

>  
>  <!--#include file="footer.html" -->
> diff --git a/docs/website/support.html b/docs/website/support.html
> index 2f16efe..6f3fb06 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -16,7 +16,7 @@
>  	    <div class="panel-body">
>  	      <div class="row">
>  		<div class="col-sm-1">
> -		  <img class="img-responsive" src="images/irc.png" style="max-width:50px; margin-bottom:10px;">
> +		  <img class="img-responsive" src="images/irc.png" alt="irc icon" style="max-width:50px; margin-bottom:10px;" />

 "IRC"

>  		</div>
>  		<div class="col-sm-11">
>  		  <p>The Buildroot IRC channel is <a href="irc://freenode.net/#buildroot">
> @@ -36,7 +36,7 @@
>  	    <div class="panel-body">
>  	      <div class="row">
>  		<div class="col-sm-1">
> -		  <img class="img-responsive" src="images/email.png" style="max-width:50px; margin-bottom:10px;">
> +		  <img class="img-responsive" src="images/email.png" alt="mailing list icon" style="max-width:50px; margin-bottom:10px;" />

  Not much space here, so "Mail".


>  		</div>
>  		<div class="col-sm-11">
>  		  <p>The <a href="/lists/buildroot/">mailing list</a> is for discussion and
> @@ -56,8 +56,8 @@
>  		    before.</p>
>  
>  		  <form method="get" action="http://search.gmane.org/">
> -		    <input type="text" name="query">
> -		    <input type="hidden" name="group" value="gmane.comp.lib.uclibc.buildroot">
> +		    <input type="text" name="query" />
> +		    <input type="hidden" name="group" value="gmane.comp.lib.uclibc.buildroot" />
>  		    <button type="submit" class="btn btn-default">Submit</button>
>  		  </form>
>  		</div>
> @@ -72,7 +72,7 @@
>  	    <div class="panel-body">
>  	      <div class="row">
>  		<div class="col-sm-1">
> -		  <img class="img-responsive" src="images/bug-buddy.png" style="max-width:50px; margin-bottom:10px;">
> +		  <img class="img-responsive" src="images/bug-buddy.png" alt="bug tracker icon" style="max-width:50px; margin-bottom:10px;" />

 Again not much space, so "Bugs".


 Regards,
 Arnout

>  		</div>
>  		<div class="col-sm-11">
>  		  <p>If you encounter any problem while using Buildroot, you can use the
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
