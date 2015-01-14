From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 16:33:58 -0300
Subject: [Buildroot] [PATCH 3/7] rsyslog: rename sysv initscript to
	S01logging
In-Reply-To: <20150114203051.513c370c@free-electrons.com>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>	<1421191022-5509-3-git-send-email-gustavo@zacarias.com.ar>
 <20150114203051.513c370c@free-electrons.com>
Message-ID: <54B6C4A6.6010204@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/14/2015 04:30 PM, Thomas Petazzoni wrote:
> To be honest, I wasn't really sure whether the right approach to handle
> this issue was to rename the init script as you did, or to have rsyslog
> explicitly remove S01logging when Busybox is enabled.
> 
> Since the rest of patch series was doing some cleanup on the renamed
> S01logging, I decided to take your approach, but I must say I wasn't
> entirely sure on how to handle this.
> 
> Comments from others are welcome, I don't consider the proposed
> solution to be set in stone.

It's the best deterministic option we've got, rsyslog builds after
busybox (famous dependency trickery) but then again there's no clear
winner with sysklogd (the default shell dilemma).
We could throw an option for logger, but i think that would be crowding
things a little.
I'm not opposed to it or other solutions though.
Regards.
