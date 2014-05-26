From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 May 2014 08:02:44 -0300
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
 static
In-Reply-To: <20140526120731.729c0a2f@free-electrons.com>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>	<1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>	<20140526113727.6ac42e12@free-electrons.com>	<5383119E.9@zacarias.com.ar>
 <20140526120731.729c0a2f@free-electrons.com>
Message-ID: <53831F54.4060703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/26/2014 07:07 AM, Thomas Petazzoni wrote:

> Yeah, I read on the rest of your patches, and the patch changing
> --static to -static indeed makes it clear that it fixes the problem for
> external toolchains. IMO, switching from --static to -static is the
> real fix: the build process should not be confused by the presence of
> libstdc++.so even if we're doing a pure static build.
> 
> Also, about reverting back from --static to -static, would it be useful
> to contact Andy Kennedy to have more details about why he made the
> change? His commit log lacks the details on why he changed from -static
> to --static.

In tests for the internal toolchain audiofile builds but mpd fails to
link with that change alone (+host-gcc-final static works, actually with
host-gcc-fnial static alone it works).
For an external toolchain it works with the -static change.
Regards.
