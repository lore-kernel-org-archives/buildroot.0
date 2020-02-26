From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 16:30:18 +0100
Subject: [Buildroot] [PATCH 2/3] package/python-iptables: try known libc
 instead of find_library()
In-Reply-To: <20200226142617.4170-2-frank.vanbever@essensium.com>
References: <20200226142617.4170-1-frank.vanbever@essensium.com>
 <20200226142617.4170-2-frank.vanbever@essensium.com>
Message-ID: <20200226163018.7f0196b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frank,

On Wed, 26 Feb 2020 15:26:16 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> ctypes.uitl.find_library() depends on gcc and friends to detect the location of

Typo: uitl -> util.

> a given shared library. Given that these are not available on the target and
> that python-iptables depends on this functionality we need to work around this.
> The SONAMEs of the libc are well known so we try the known ones for glibc,
> uClibc and musl.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12271
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>

I think the solution is nice and good, well done. I remember thinking
about the issue a while ago, but couldn't come up with a simple way of
detecting the C library file name from the target. Testing this limited
hardcoded set of SONAMEs seems like a reasonable approach.

> +Upstream: https://github.com/ldx/python-iptables/pull/300

It has even been merged upstream, so this could even be replaced by a
link to the upstream commit now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
