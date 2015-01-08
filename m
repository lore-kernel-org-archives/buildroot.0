From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 19:20:23 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.40.0
In-Reply-To: <1420738156-32009-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420738156-32009-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150108192023.411b8c9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  8 Jan 2015 14:29:16 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2014-8150 - When libcurl sends a request to a server via a HTTP
> proxy, it copies the entire URL into the request and sends if off.
> If the given URL contains line feeds and carriage returns those will be
> sent along to the proxy too, which allows the program to for example
> send a separate HTTP request injected embedded in the URL.
> 
> CVE-2014-8151 - libcurl stores TLS Session IDs in its associated Session
> ID cache when it connects to TLS servers. In subsequent connects it
> re-uses the entry in the cache to resume the TLS connection faster than
> when doing a full TLS handshake. The actual implementation for the
> Session ID caching varies depending on the underlying TLS backend.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcurl/libcurl.hash | 2 +-
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
