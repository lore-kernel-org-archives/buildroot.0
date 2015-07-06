From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 12:38:40 +0200
Subject: [Buildroot] [PATCH v7 22/22] cpio: new package
In-Reply-To: <1433251718-3167-23-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-23-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150706123840.61ff3672@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue,  2 Jun 2015 08:28:38 -0500, Clayton Shotwell wrote:
> Adding the cpio archive utility for the target and host. Patches have
> been pulled from ArchLinux and Debian to fix CVE issues and compile
> issues.
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

What is the motivation to have a host variant of cpio? cpio is already
part of the mandatory programs that Buildroot checks for at the
beginning of every build: it must be installed on the host system prior
to running Buildroot.

If the ArchLinux patches apply without any adaptation, have you
considered using:

CPIO_PATCH = \
	https://projects.archlinux.org/svntogit/packages.git/plain/trunk/cpio-2.11-stdio.in.patch?h=packages/cpio \
	...	

instead ?

> +CPIO_VERSION = 2.11
> +CPIO_SITE = http://ftp.gnu.org/gnu/cpio
> +CPIO_LICENSE = GPLv3

It's GNU stuff, so GPLv3+.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
