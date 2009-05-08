From: Steffen Schulz <pepe_ml@gmx.net>
Date: Fri, 8 May 2009 17:33:35 +0200
Subject: [Buildroot] X11 and buildroot..
In-Reply-To: <87fxffai13.fsf@macbook.be.48ers.dk>
References: <20090506124243.GB2496@cbg.dyndns.org>
	<87y6tadzww.fsf@macbook.be.48ers.dk>
	<20090507082927.GB16268@cbg.dyndns.org>
	<20090508101307.GA18388@cbg.dyndns.org>
	<87skjfanin.fsf@macbook.be.48ers.dk>
	<20090508120723.GA28830@cbg.dyndns.org>
	<87fxffai13.fsf@macbook.be.48ers.dk>
Message-ID: <20090508153335.GA2400@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 090508 at 14:45, Peter Korsgaard wrote:
>  Steffen> I guess from --sysroot and i686-linux-uclibc-gcc we can
>  Steffen> infer that it is done for the target? I'll be happy to try
>  Steffen> to fix it myself if you can give me an example how it is
>  Steffen> supposed to be done.
> 
> Yes, it's for the target. From a quick look it seems like you should
> be able to compile mesa/x86/gen_matypes.c with $(HOSTCC) before
> running make, then the Makefile shouldn't try to build it with the
> target compiler and will just run the host binary.

Modifying the respective Makefile to use HOSTCC and removing CFLAGS
(because of --sysroot) fixes the issue. I also just saw Bug 323
https://bugs.busybox.net/show_bug.cgi?id=323

It uses different variables but I can confirm that it works, too.

Note that Mesa also needs a g++ in the target(see attached patch).
We have no way of defining dependencies like the missing mkfontscale on
the host, right? Should probably be added..

Thanks for the prompt help, I'll speak up if I find more issues.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: mesaCppDependency.patch
Type: text/x-diff
Size: 520 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090508/3b68bb76/attachment.bin>
