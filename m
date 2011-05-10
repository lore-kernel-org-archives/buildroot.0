From: Matias Garcia <mgarcia@rossvideo.com>
Date: Tue, 10 May 2011 09:25:11 -0400
Subject: [Buildroot] [PATCH] external toolchain: add arbitrary arguments
 to sysroot discovery and toolchain wrapper
In-Reply-To: <20110508190400.43407143@surf>
References: <4DC46EC4.2060000@rossvideo.com>  <20110508190400.43407143@surf>
Message-ID: <1305033911.7239.3.camel@matias-lnx-host>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2011-05-08 at 19:04 +0200, Thomas Petazzoni wrote:
> Hello Mathias,
> 
> On Fri, 06 May 2011 17:57:24 -0400
> Matias Garcia <mgarcia@rossvideo.com> wrote:
> 
> > CodeSourcery uses non-standard arguments to determine which sysroot
> > to use and to set other optimizations (e.g. which floating point ABI
> > to use). This patch allows one to pass an arbitrary argument to the
> > sysroot discovery in ext-tool.mk and adds the same option to the
> > argument list in ext-toolchain-wrapper.c. I have not tested it with
> > an empty option. Use at your own risk as this is my first open-source
> > patch ever... (Am I supposed to write 'signed-off by...'?)
> 
> While the goal is correct, I don't like this implementation. The
> toolchain wrapper should just make use of the flags in
> BR2_TARGET_OPTIMIZATION configuration option, and not only -march,
> -mtune, -mabi, etc. options which are currently being used.

I thought of that first, but I figured BR2_TARGET_OPTIMIZATION may be
used for flags you wouldn't want sent to the linker (for example) in
EVERY circumstance. In other words, I thought the wrapper ought to be
for sysroot selection primarily. If you disagree, I'd be glad to change
it.

Any other comments?

What's the usual procedure for submitting patches? I didn't find one on
the website. I also see most people have a file summary at the top.

Cheers,
Matias

> 
> Regards,
> 
> Thomas
