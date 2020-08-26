From: Mukund Mcpeake <mukundmcpeake@danwin1210.me>
Date: Wed, 26 Aug 2020 13:53:00 +0000
Subject: [Buildroot] sources.buildroot.net is blacklisting Tor users
In-Reply-To: <874kopzi6a.fsf@dell.be.48ers.dk>
References: <efb1add7-afb7-7679-badc-d2a70e1791c3@danwin1210.me>
 <874kopzi6a.fsf@dell.be.48ers.dk>
Message-ID: <a46720c5-ee14-427d-3f9d-7f91e35ddadc@danwin1210.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard:
>>>>>> "Mukund" == Mukund Mcpeake via buildroot <buildroot@busybox.net> writes:
> 
>  > Hi Buildroot,
>  > Your server at http://sources.buildroot.net/ is responding with an HTTP
>  > 403 error when accessed via wget over Tor.  I suspect that this is
>  > because you've misconfigured Cloudflare; Cloudflare's default Tor
>  > behavior is to serve a CAPTCHA to users whose HTTP client isn't Tor
>  > Browser.  This default may make sense for standard websites, but for
>  > servers that serve downloads that scripts will need to retrieve, the
>  > default will be problematic.  My understanding is that you can fix this
>  > by configuring the maximum whitelisting level (I believe it's called
>  > "Essentially Off") for the "T1" country code in Cloudflare's UI for the
>  > sources.buildroot.net domain.
> 
> The security level has been changed to "essential off". Also
> notice that sources.buildroot.org (not .net) is the same server, but not
> behind Cloudflare, so you can also use that instead.

Thanks, I can confirm that it works with wget over Tor now.  The quick
fix is very much appreciated.
