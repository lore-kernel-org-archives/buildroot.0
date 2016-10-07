From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 16:04:32 +0200
Subject: [Buildroot] [PATCH] libmicrohttpd: update to 0.9.51
In-Reply-To: <20161001100102.GA26989@waldemar-brodkorb.de>
References: <20161001100102.GA26989@waldemar-brodkorb.de>
Message-ID: <20161007160432.635dc932@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Oct 2016 12:01:02 +0200, Waldemar Brodkorb wrote:
> Bfin workaround is not required if the gcc bfin patch is applied.
> (gcc: enable _REENTRANT for bfin when -lpthread is used)
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I initially applied this patch, but immediately reverted it after I
realized it was breaking a valid situation: you're breaking the build
with the Blackfin external toolchains.

In addition to this, this patch is mixing a version bump, with removing
some work-arounds, which are unrelated to the version bump.

So I've marked this patch as Rejected in patchwork. Please resend a
patch that does just the version bump, and leaves the work-around in
place.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
