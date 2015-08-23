From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 16:36:53 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150823163653.3989f210@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Sat, 22 Aug 2015 02:13:07 +0200, Yann E. MORIN wrote:
> This package requires registration before it can be downloaded, which
> means downloads can not be automated. As far as I could see, that's the
> only package we have in that case.
> 
> It installs a kernel module, but it is not possible to check whether it
> also builds it or just installs a blob. It seems however that there are
> source files in that module:
>     http://lists.busybox.net/pipermail/buildroot/2015-February/119752.html
> 
> But since we can't download without registration, it's impossible to
> check if using the kernel-module infra would work.
> 
> We also have no license for it.
> 
> This package does not belong to Buildroot. Remove it.

I completely disagree with this. We are using this package for a real
project, and we got one report from one user also using it (the user
reported the fact that a firmware loading mechanism must be enabled in
the system for the package to work).

We did contact Bluegiga (the upstream for this package) about the
annoyance caused by the registration process needed to download the
tarball. However, for licensing/legal reasons, they apparently have no
other choice, and they are well aware of the annoyance caused by this
process.

The wf111 package bundles a kernel module (built from source) and some
binary only user-space tools. For the embedded Linux systems that use
the Bluegiga WF111 chip, it makes things a lot easier to have the wf111
integrated in Buildroot, rather than having to build it separately.

In addition, the registration process is free and can be done by anyone
interested by the package. It is indeed annoying, but not that worst
that any of the proprietary licensed package that we have, which all
very often have weird and complicated build systems that require lots
of tricks.

So, I completely disagree with this removal proposal, especially since
there is absolutely no real problem caused by this package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
