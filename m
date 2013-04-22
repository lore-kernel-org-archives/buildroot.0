From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 17:49:45 +0200
Subject: [Buildroot] [PATCH 3/7] arc: Add support for ARC-specific
 binutils
In-Reply-To: <1366630651-6857-4-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-4-git-send-email-mjonker@synopsys.com>
Message-ID: <20130422174945.1c8ba842@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Mon, 22 Apr 2013 13:37:27 +0200, Mischa Jonker wrote:
> ARC support is not upstream yet...
> 
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>

This looks good, but it doesn't build here: it fails because 'makeinfo'
is not available.

WARNING: `makeinfo' is missing on your system.  You should only need it if
         you modified a `.texi' or `.texinfo' file, or any other file
         indirectly affecting the aspect of the manual.  The spurious
         call might also be the consequence of using a buggy `make' (AIX,
         DU, IRIX).  You might want to install the `Texinfo' package or
         the `GNU make' package.  Grab either from any GNU archive site.
[...]
make[2]: *** [all] Error 2
make[1]: *** [/home/test/outputs/arc/build/host-binutils-2.19-arc/.stamp_built] Error 2
make: *** [all] Error 2

makeinfo is no longer a mandatory dependency of Buildroot, and
therefore we've removed it from our autobuilder chroots. binutils 2.22
builds fine without it, it seems like binutils 2.19 will need a few
more tricks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
