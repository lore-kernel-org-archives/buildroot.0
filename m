From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Aug 2012 15:09:50 +0200
Subject: [Buildroot] [PATCH] support/graph-depends: fix out-of-tree usage
In-Reply-To: <1344803227-9472-1-git-send-email-yann.morin.1998@free.fr>
References: <1344803227-9472-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120814150950.6388ad71@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 22:27:07 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> graph-depends calls make to get the list of packages, and the
> dependencies of each package.
> 
> When called out-of-tree, the Makefile is a wrapper that calls
> the real Makefile, so make will spit out a line like:
>   make -C /path/to/buildroot O=/path/to/build-dir show-targets
> 
> which graph-depends wrongly believes is part of the target list.
> 
> Be silent when calling make, as we really only want the target
> and dependency lists.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
