From: Mukund Mcpeake <mukundmcpeake@danwin1210.me>
Date: Wed, 26 Aug 2020 01:10:00 +0000
Subject: [Buildroot] sources.buildroot.net is blacklisting Tor users
Message-ID: <efb1add7-afb7-7679-badc-d2a70e1791c3@danwin1210.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot,

Your server at http://sources.buildroot.net/ is responding with an HTTP
403 error when accessed via wget over Tor.  I suspect that this is
because you've misconfigured Cloudflare; Cloudflare's default Tor
behavior is to serve a CAPTCHA to users whose HTTP client isn't Tor
Browser.  This default may make sense for standard websites, but for
servers that serve downloads that scripts will need to retrieve, the
default will be problematic.  My understanding is that you can fix this
by configuring the maximum whitelisting level (I believe it's called
"Essentially Off") for the "T1" country code in Cloudflare's UI for the
sources.buildroot.net domain.

Any chance you could fix this?  A lot of security-conscious users
(myself included) route their build systems through Tor in order to
minimize the threat of targeted attacks on our builds.

Thanks!
