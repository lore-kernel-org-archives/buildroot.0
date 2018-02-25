From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:19:09 +0100
Subject: [Buildroot] [PATCH] asterisk: security bump to version 14.7.6
In-Reply-To: <20180223083710.31207-1-peter@korsgaard.com>
References: <20180223083710.31207-1-peter@korsgaard.com>
Message-ID: <20180225221909.02d31b09@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Feb 2018 09:37:10 +0100, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> AST-2018-002: Crash when given an invalid SDP media format description
> 
> By crafting an SDP message with an invalid media format description Asterisk
> crashes when using the pjsip channel driver because pjproject's sdp parsing
> algorithm fails to catch the invalid media format description.
> 
> AST-2018-003: Crash with an invalid SDP fmtp attribute
> 
> By crafting an SDP message body with an invalid fmtp attribute Asterisk
> crashes when using the pjsip channel driver because pjproject's fmtp
> retrieval function fails to check if fmtp value is empty (set empty if
> previously parsed as invalid).
> 
> AST-2018-004: Crash when receiving SUBSCRIBE request
> 
> When processing a SUBSCRIBE request the res_pjsip_pubsub  module stores the
> accepted formats present in the Accept headers of the request.  This code
> did not limit the number of headers it processed despite having a fixed
> limit of 32.  If more than 32 Accept headers were present the code would
> write outside of its memory and cause a crash.
> 
> AST-2018-005: Crash when large numbers of TCP connections are closed suddenly
> 
> A crash occurs when a number of authenticated INVITE messages are sent over
> TCP or TLS and then the connection is suddenly closed.  This issue leads to
> a segmentation fault.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
