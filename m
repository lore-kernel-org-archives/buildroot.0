From: Dimitrios Siganos <dimitris@siganos.org>
Date: Mon, 11 Feb 2013 20:52:22 +0000
Subject: [Buildroot] kernel drivers
In-Reply-To: <1360613608.96975.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1360613608.96975.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <51195A06.8000505@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoran,

Your question is not really buildroor specific, it is more linux kernel
specific. You need to learn how to write linux drivers. I can recommend
this open source book:
http://lwn.net/Kernel/LDD3

There are two options:

* Incorporate it into linux kernel sources (this can be linked in
statically or it can be a module). You choose linked in or module from
linux menuconfig, which at buildroot level you involve like this:
make linux-menuconfig

* The other way is to have your driver sources outside of the kernel and
build it as a module. This is the easiest way to start with. Have a look
at the package 'lttng-modules' for a simple example of this method.

But make sure you read the relevant chapters in LDD first.

Regards,
Dimitris

On 11/02/13 20:13, Zoran Djordjevic wrote:
> My question is mostly theoretical, so I will be much obliged if I'll be
> pointed at some links, although
> (as Buildroot user) I am interested in the way I can do things with
> Buildroot. What I would like to
> know is how can I incorporate some new kernel driver (having it's
> source) into kernel build? First, where
> should I put it in kernel source tree, then can I compile it
> independently, without rebuilding whole kernel
> (I imagine modules can do the job)?
> How can I compile it as a module or to be more precise, do I write
> driver in some special way to be a module?
> (I see that Buildroot offers some driver to be choosed for module
> compiling or to be part of monolitic kernel).
>  
> Regards
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
