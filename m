From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 21:49:08 +0200
Subject: [Buildroot] [PATCH 0 of 9 v4] linux/uboot: add support for
 custom Mercurial repositories
In-Reply-To: <patchbomb.1378152469@argentina>
References: <patchbomb.1378152469@argentina>
Message-ID: <20130919214908.35f7f8ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 02 Sep 2013 22:07:49 +0200, Thomas De Schampheleire wrote:

> This series adds support for custom Mercurial repositories in uboot and linux
> packages.
> 
> This version is rebased with the 2013.08 master, there are only a few
> real changes.

Since it seems we have issues deciding what to do with the
Config.in.legacy handling for string options, I was thinking: can't we
just avoid the problem altogether? Instead of having separate Config.in
options for each of Git, Mercurial, SVN and so on, what about just
adding an option "BR2_TARGET_LINUX_CUSTOM_REPO_METHOD" which allows the
user to select git, hg, svn or cvs, and keep the other option names
unchanged. I admit it's a bit funky to keep options such as
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL to store the location of a
Mercurial repository, but well, since we can't make up your mind on the
Config.in.legacy stuff, maybe that's a way of at least getting your
feature merged.

I'm just thinking of a way to move forward, not sure it's the right
solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
