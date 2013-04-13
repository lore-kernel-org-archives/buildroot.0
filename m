From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 16:25:05 +0200
Subject: [Buildroot] Extending buildroot functionality for creating
 board support packages (BSP) out of buildroot tree
In-Reply-To: <trinity-fb9dabe2-fdca-4333-b79a-0d5257710847-1365761929883@3capp-gmx-bs44>
References: <1463068659.1518019.1365760690328.JavaMail.root@openwide.fr>
 <trinity-fb9dabe2-fdca-4333-b79a-0d5257710847-1365761929883@3capp-gmx-bs44>
Message-ID: <20130413162505.635dec45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Fri, 12 Apr 2013 12:18:49 +0200 (CEST), universeII at gmx.de wrote:

> If I understand you correctly this means that I have to hold a
> complete copy of the kernel tree where I do the modifications? The
> requirement for me is that I have to store only the modified and new
> files in a different directory tree (under version control). So rsync
> does not work for me and I have to write a small script which is
> invoked by buildroot and copies my local files to the right
> directories in the kernel tree.

While we certainly aim at supporting a custom external tree for the
Linux kernel sources to help using Buildroot during kernel development,
we will certainly never support your use case of a partial kernel tree
that contains only the modified and new files. This is just a very
uncommon (and in my opinion completely wrong) way of handling source
code changes. You should instead be using a git tree to do your kernel
developments, and point LINUX_OVERRIDE_SRCDIR to it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
