From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 23:43:51 +0100
Subject: [Buildroot] [PATCH 0/2] Add support for Alix2d3 board from PC
In-Reply-To: <90ABB7C23E864360A0612B7183D96248@blueridge.com>
References: <90ABB7C23E864360A0612B7183D96248@blueridge.com>
Message-ID: <20130116234351.03dc493c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mukesh Sharma,

On Wed, 16 Jan 2013 15:24:23 -0500, Mukesh Sharma wrote:

> I am reading this thread and also I am new to buildroot. I wanted to
> know how board support was finally decided to be implemented in
> Buildroot - specifically with respect to Alix2d3 board. As I don't
> see any Alix board related directories in the repository.

The topic of board support has quite significantly evolved since July
2010, date of the e-mails you are referring to. The patches you refer
to stored files in target/device/, which has been removed since then,
it created board-specific Config.in options, something we have
deprecated since then, and worse it added an entirely new rootfs
skeleton for the board, something we really don't want to do.

So, if you have an Alix2d3 board and you want to resurrect those
patches to make them suitable for inclusion in mainline Buildroot
(which would be really great), then, you need to:

 * Generate a kernel configuration file that works for the platform,
   generate a minimal defconfig for it (make savedefconfig in the
   kernel), and copy it in board/pcengines/alix2d3/linux-x.y.config.

 * Take the specificities of the rootfs skeleton proposed by Darius at
   the system (apparently, he mentioned that the only differences were
   the Grub configuration files), put them in board/pcengines/alix2d3/,
   and create a short post-build script that copy those files into the
   root filesystem at the right location.

 * Produce a minimal (make savedefconfig) Buildroot configuration that
   builds a working Busybox-only system for this board.

Do not hesitate to get back to us if you need help to do this. As soon
as you have a working Buildroot system, we can fairly easily guide you
through the steps to makes the appropriate patches for Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
