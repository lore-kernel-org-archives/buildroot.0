From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 14:30:02 +0200
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.5.1
In-Reply-To: <20190906154656.10935-1-peter@korsgaard.com>
References: <20190906154656.10935-1-peter@korsgaard.com>
Message-ID: <20190907143002.36666576@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Sep 2019 17:46:55 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> AST-2019-004: Crash when negotiating for T.38 with a declined stream
> When Asterisk sends a re-invite initiating T.38 faxing, and the endpoint
> responds with a declined media stream a crash will then occur in Asterisk.
> https://downloads.asterisk.org/pub/security/AST-2019-004.pdf
> 
> AST-2019-005: Remote Crash Vulnerability in audio transcoding
> When audio frames are given to the audio transcoding support in Asterisk the
> number of samples are examined and as part of this a message is output to
> indicate that no samples are present. A change was done to suppress this
> message for a particular scenario in which the message was not relevant. This
> change assumed that information about the origin of a frame will always exist
> when in reality it may not.
> https://downloads.asterisk.org/pub/security/AST-2019-005.pdf
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
