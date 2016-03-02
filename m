From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 13:47:14 -0800
Subject: [Buildroot] [PATCH 0/4] Add go language support
In-Reply-To: <20160302214959.419006f6@free-electrons.com>
References: <cover.1456946494.git.geoff@infradead.org>
 <20160302214959.419006f6@free-electrons.com>
Message-ID: <1456955234.13916.34.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Wed, 2016-03-02 at 21:49 +0100, Thomas Petazzoni wrote:
> However, we already have some pending Go-related packages in our
> patch
> queue. What I would like to see is a single patch series adding Go
> support, which is approved by the different developers interested in Go
> support in Buildroot.

Thanks for trying to coordinating things.

> The other Go patch series are:
> 
>   http://lists.busybox.net/pipermail/buildroot/2016-February/151550.html
>   (from Ludovic Guegan)

I took a quick look at this.  Patch 1, which builds the go
complier, has the bootstrap and final compiler built in the
same package.  I think it better to split the bootstrap out
into its own package as I have done since then the two packages
are each then simpler and I think easier to maintain.

Also, this implementation does not build cross compilers
correctly, nor does it install the go pkg and tools, nor does
it enable CGO_ENABLED for C language linkage support.

All in all, think my patches seem more complete in adding
go compiler support.

I think the other patches in Ludovic's series can be considered
independent of the go compiler.  Patch 4 which adds pkg-golang.mk
is something needed.  I had planned to look into this.

>  http://patchwork.ozlabs.org/patch/542108//
>   (from Christian Stewart)

I did see this is now out of date, building go compiler version
1.4.2.  It also doesn't seem to install the go tools.  To bring
these up to date would need almost a complete re-write since
the current compiler now requires a bootstrap compiler.  I
think my patches superseed this series.

My proposal is to use my patches to provide the basic go compiler
support.  Ludovic's other patches provide additional language
support, and seem as though they could be useful, but they are
additions to the basic compiler support, and I think can be
considered independently.

Is my proposal acceptable?  Let's work to move forward.

-Geoff
