From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:37:56 +0200
Subject: [Buildroot] [PATCH] package/live555: security bump to version
 2019.03.06
In-Reply-To: <20190401195203.4143-1-peter@korsgaard.com>
References: <20190401195203.4143-1-peter@korsgaard.com>
Message-ID: <20190401223756.1ef2b2e6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  1 Apr 2019 21:52:03 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2019-6256: A Denial of Service issue was discovered in the LIVE555
>   Streaming Media libraries as used in Live555 Media Server 0.93.  It can
>   cause an RTSPServer crash in handleHTTPCmd_TunnelingPOST, when
>   RTSP-over-HTTP tunneling is supported, via x-sessioncookie HTTP headers in
>   a GET request and a POST request within the same TCP session.  This occurs
>   because of a call to an incorrect virtual function pointer in the
>   readSocket function in GroupsockHelper.cpp.
> 
> - CVE-2019-7314: liblivemedia in Live555 before 2019.02.03 mishandles the
>   termination of an RTSP stream after RTP/RTCP-over-RTSP has been set up,
>   which could lead to a Use-After-Free error that causes the RTSP server to
>   crash (Segmentation fault) or possibly have unspecified other impact.
> 
> - CVE-2019-9215: n Live555 before 2019.02.27, malformed headers lead to
>   invalid memory access in the parseAuthorizationHeader function.
> 
> The normal live555 web site is temporarily unavailable, so use an
> alternative _SITE / drop upstream hash.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/live555/live555.hash | 4 +---
>  package/live555/live555.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
