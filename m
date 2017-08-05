From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Aug 2017 15:42:33 +0200
Subject: [Buildroot] [PATCH] pkg-cmake.mk: set pkg-config env. vars. in
 the host configure environment
In-Reply-To: <20170805130605.25877-1-s.martin49@gmail.com>
References: <20170805130605.25877-1-s.martin49@gmail.com>
Message-ID: <20170805154233.3df3e56f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Aug 2017 15:06:05 +0200, Samuel Martin wrote:
> Cmake may run pkg-config to find the dependencies when configuring a
> package. Because of the value of PATH, and it will use the Buildroot's
> pkg-config wrapper, which, by default, is configured (via some
> environment variables) to find the target dependencies.
> 
> So, this change makes sure the pkg-config environment variables are
> properly set for finding host dependencies when configuring a
> host-package.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Is this fixing a particular autobuild failure ?

Is this fixing a specific bug ?

I do remember someone reporting CMake related issues when building host
packages. Perhaps it was an e-mail. In such a case, there should be a
reference to this e-mail, or bug, or autobuild failure.

Currently, it's not clear whether your patch is fixing an actual
problem (and should be applied to master) or is just nice to have
(should be applied to next).

Of course, I do know that this patch is important and should be applied
to master, but it would be good to have a clearer commit log from that
respect.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
