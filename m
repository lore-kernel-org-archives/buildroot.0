From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Apr 2015 10:01:08 +0200
Subject: [Buildroot] [PATCH 1/1] Added linux drivers backports project
In-Reply-To: <55301BBB.4090705@mind.be>
References: <1429134935-11241-1-git-send-email-petr.vorel@gmail.com>
 <1429134935-11241-2-git-send-email-petr.vorel@gmail.com>
 <55301BBB.4090705@mind.be>
Message-ID: <20150417100108.46fe9fc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 16 Apr 2015 22:29:47 +0200, Arnout Vandecappelle wrote:

>  I would say that this package fits better in the linux extensions menu. Even if
> you just consider this package as a set of kernel modules, I think that from a
> users perspective it fits better together with the kernel. But also, if you ever
> want to add the possibility to link the backported drivers in the kernel itself
> (which I believe is supported by backports), then you really need it to be a
> kernel extension.
> 
>  The opinion of other developers may differ, though.

While I do understand the reasoning, I'm not so sure about the
conclusion. The linux extension stuff is really for things that needed
to be tightly integrated with the kernel build process, because it
requires patching the kernel (xenomai, rtai, etc.).

Here, it is much more like lttng-modules, or linux-fusion,
cryptodev-linux, ktap, sysdig and so on: a bunch of external modules
that can be built with no problem as separate packages from the kernel.

So I would actually tend to prefer keeping linux-backports as a package
in package/, like the author did.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
