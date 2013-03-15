From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 12:46:24 +0100
Subject: [Buildroot] [PATCH] change default location for local.mk to
 $(CONFIG_DIR)
In-Reply-To: <CAAXf6LWABPZcHrftL3LFLVB4ApLdS19-kRME101DG+9rfrfK4Q@mail.gmail.com>
References: <1362653363-24915-1-git-send-email-jeremy.rosen@openwide.fr>
 <20130311222630.5a75029d@skate>
 <CAAXf6LWABPZcHrftL3LFLVB4ApLdS19-kRME101DG+9rfrfK4Q@mail.gmail.com>
Message-ID: <20130315124624.60f408f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 12 Mar 2013 09:26:51 +0100, Thomas De Schampheleire wrote:

> However, unlike other config files, I still think of local.mk as a
> local hack used by an individual developer, and not something you
> would put under version control, neither in git nor in
> project-specific patches.

I would say it depends. We may imagine that some people use git
submodules to achieve something like this:

 + project
 --+ buildroot
 --+ linux
 --+ uboot
 --+ application

with a suitable local.mk, under version control, that tells Buildroot
to look for the kernel source code in $(TOPDIR)/../linux, U-Boot
source code in $(TOPDIR)/../uboot, etc.

(in the above, buildroot, linux, uboot and application are separate Git
repositories that are put together into a global project Git
repositories using git submodules).

But J?r?my's patch doesn't prevent from doing that, since it just
changes the default value.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
