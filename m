From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 08:57:02 +0200
Subject: [Buildroot] [PATCH next 1/4] support/gnuconfig: update to
 2019-05-28
In-Reply-To: <33f72710-e524-fa9a-cd43-73a2e339da83@mind.be>
References: <20190528082938.5997-1-thomas.petazzoni@bootlin.com>
 <20190528082938.5997-2-thomas.petazzoni@bootlin.com>
 <87imtu7wm1.fsf@dell.be.48ers.dk>
 <20190528220741.432e8d92@windsurf.home>
 <33f72710-e524-fa9a-cd43-73a2e339da83@mind.be>
Message-ID: <20190529085702.22a67ca0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 May 2019 23:31:55 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  This variable is only used to pass --build arguments during configure, so we
> could use = instead of := and use the installed one from $(HOST_DIR).
> 
>  However, we can also completely remove it. There should never be any reason to
> pass --build to configure - especially if you're using *exactly* the same value
> as the default.

Yes: --build is autodetected by the configure script, by running
config.guess, and it will anyway be our config.guess, since we
overwrite the one provided by the package in a post-patch hook by our
config.guess.

> This was pulled in as part of a7e49eb2af which added 7000 lines
> of code. If there ever was any reason to do this, nobody remembers :-)

Indeed :)

>  Note that we still need it for libnspr because that uses $host for build, so we
> have to override the --host given by the configure commands, so we need to know
> what --host should be. But there we can definitely use the downloaded and
> installed config.guess.

Right.

Thanks for the feedback, I'll try to follow-up with a proposal.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
