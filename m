From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Aug 2015 10:43:02 +0200
Subject: [Buildroot] [PATCH] boost: fix build on ARC
In-Reply-To: <4881796E12491D4BB15146FE0209CE646578420F@DE02WEMBXB.internal.synopsys.com>
References: <1440008812-13384-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <4881796E12491D4BB15146FE0209CE646578420F@DE02WEMBXB.internal.synopsys.com>
Message-ID: <20150821104302.12c70b92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Thu, 20 Aug 2015 08:26:52 +0000, Alexey Brodkin wrote:

> Even though it's good to have this patch for fixing Boost building I'm not sure
> what this hack causes in runtime. Remember I mentioned these checks for
> GLIBC version are spread all around their sources.

It fixes that particular problem. There may indeed be other problems,
which we can only resolve by having ARC users running Boost based
applications.

> Anyways I see it is already applied so let's live with it for now.
> And I assume once:
>  [1] ARC switches from GitHub based uClibc  to uClibc-ng in Buildroot
>  [2] uClibc-ng bumps to 1.0.6
> we'll get rid of that patch, correct?

Yes, of course, once the _GLIBC_MINOR bump is in a released version of
uClibc-ng, and we have rebuilt the external toolchains, we will drop
this patch from Boost. Do not hesitate to send such a patch series when
time comes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
