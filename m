From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 23:09:25 +0200
Subject: [Buildroot] [PATCH] parted: properly link with libiconv
In-Reply-To: <20171007230611.25347-1-arnout@mind.be>
References: <20171007230611.25347-1-arnout@mind.be>
Message-ID: <20171008230925.55777190@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 Oct 2017 01:06:11 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> parted uses libiconv but doesn't link with it. All the checks are there
> in configure, but the Makefile.am doesn't add it to the link. Add a
> patch to fix this.
> 
> Also add an optional dependency on libiconv, so it is reproducible.
> 
> While we're at it, regenerate the existing patches on top of v3.2, and
> make patch 0003 a properly git formatted one.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: srg.venema at gmail.com

This seems to do more harm than good: it now tries to link with -liconv
in all cases, even when it is not needed (for example with glibc).

  http://autobuild.buildroot.net/?reason=parted-3.2

I've reverted your patch for now.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
