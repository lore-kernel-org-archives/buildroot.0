From: Shawn Goff <shawnjgoff@gmail.com>
Date: Mon, 29 Oct 2012 18:30:01 -0400
Subject: [Buildroot] Topics for the Buildroot Developers meeting
In-Reply-To: <20121029194314.7545a446@skate>
References: <20121029194314.7545a446@skate>
Message-ID: <CABYt4-a-3ozfyg-6dRg35vSAv-u8czNyi4cZ=QngtAND0jhcyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the discussion page:
> Make it possible to do a 'target-clean', as a replacement of uninstall. Will this even work at all? Proposed by Arnout Vandecappelle

This would be amazing.

I had a quick chat in #ptxdist today, and it seems that's what they do
- they have separate stages, including a compile, install, and
targetinstall. The install installs the package into a
project-specific directory, and targetinstall creates an ipkg and
installs the package's relevant files to the root filesystem. When you
need to remove a package, you unselect it from the config and rebuild
the rootfs.
