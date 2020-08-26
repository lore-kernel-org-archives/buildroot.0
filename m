From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Aug 2020 14:49:01 +0200
Subject: [Buildroot] sources.buildroot.net is blacklisting Tor users
In-Reply-To: <efb1add7-afb7-7679-badc-d2a70e1791c3@danwin1210.me> (Mukund
 Mcpeake via buildroot's message of "Wed, 26 Aug 2020 01:10:00 +0000")
References: <efb1add7-afb7-7679-badc-d2a70e1791c3@danwin1210.me>
Message-ID: <874kopzi6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mukund" == Mukund Mcpeake via buildroot <buildroot@busybox.net> writes:

 > Hi Buildroot,
 > Your server at http://sources.buildroot.net/ is responding with an HTTP
 > 403 error when accessed via wget over Tor.  I suspect that this is
 > because you've misconfigured Cloudflare; Cloudflare's default Tor
 > behavior is to serve a CAPTCHA to users whose HTTP client isn't Tor
 > Browser.  This default may make sense for standard websites, but for
 > servers that serve downloads that scripts will need to retrieve, the
 > default will be problematic.  My understanding is that you can fix this
 > by configuring the maximum whitelisting level (I believe it's called
 > "Essentially Off") for the "T1" country code in Cloudflare's UI for the
 > sources.buildroot.net domain.

The security level has been changed to "essential off". Also
notice that sources.buildroot.org (not .net) is the same server, but not
behind Cloudflare, so you can also use that instead.

-- 
Bye, Peter Korsgaard
