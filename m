From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 12:07:31 +0200
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
 static
In-Reply-To: <5383119E.9@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
 <1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
 <20140526113727.6ac42e12@free-electrons.com>
 <5383119E.9@zacarias.com.ar>
Message-ID: <20140526120731.729c0a2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 26 May 2014 07:04:14 -0300, Gustavo Zacarias wrote:

> > While on principle I'm probably fine with the patch, I kinda disagree
> > that it fixes the autobuilder issues. Because the same autobuilder
> > issue will appear with an external toolchain that has both libstdc++.so
> > and libstdc++.a.
> 
> This is a way to fix it for internal toolchains, i can build up to mpd
> static with audiofile support with this, but it's not complete, that's
> for sure.

Yeah, I read on the rest of your patches, and the patch changing
--static to -static indeed makes it clear that it fixes the problem for
external toolchains. IMO, switching from --static to -static is the
real fix: the build process should not be confused by the presence of
libstdc++.so even if we're doing a pure static build.

Also, about reverting back from --static to -static, would it be useful
to contact Andy Kennedy to have more details about why he made the
change? His commit log lacks the details on why he changed from -static
to --static.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
