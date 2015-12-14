From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 14 Dec 2015 07:47:31 +0000
Subject: [Buildroot] revert GLIBC_MINOR bump in uClibc-ng 1.0 branch
In-Reply-To: <20151214060418.GA8958@waldemar-brodkorb.de>
References: <20151214060418.GA8958@waldemar-brodkorb.de>
Message-ID: <1450079251.4735.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Mon, 2015-12-14 at 07:04 +0100, Waldemar Brodkorb wrote:
> Hi Thomas, Khem, Alexey,
> 
> recently Khem tried to use systemd with openembedded and uClibc-ng.
> Most of the needed stuff is ready and will be committed soon.
> 
> There is one open issue I want to discuss with you.
> The GLIBC_MINOR bump in commit
> 4a05ed87ceb946608100642121c32e642b58cd0d is breaking SSP detection
> in GCC. This was discovered in Buildroot and fixed.
> It seems there is a major problem to fix it in OpenEmbedded, so
> Khem is asking for revert of this commit for the next release.
> 
> What do you think about it?
> 
> Isn't the boost problem solved anyway in another way?

I think it is by that commit https://git.busybox.net/buildroot/commit/?id=b7aee38fe2d6409caa2b12d2b6a1e6acdf19014f

> May be we just learned what it means to bump this number and
> can revert it back to the old value. We should still try
> to get a patch into gcc to avoid any misdetection regarding
> SSP for the next major gcc release.

Well even though we may easily revert that GLIBC_MINOR bump
IMHO it's better cure problems in tools that improperly use
that define.

I mean if we revert that bump we will simply hide those issues
again and there's a chance these issues will never be fixed.

OTOH it's sad but from what I may see with hardware getting
more and more powerful uClibc is getting less and less used.
People switch to either full glibc or musl. In that light
we may want indeed just to solve our local problems keeping
external tools as they are.

In other words I don't really have any strong pro et contra.

-Alexey
