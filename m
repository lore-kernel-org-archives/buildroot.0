From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2011 08:58:17 +0200
Subject: [Buildroot] [PATCH 25/26] linux: allow specification of a
 custom Git repository as a source
In-Reply-To: <201105301914.49620.vapier@gentoo.org>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
	<ef04a63e3f1cfe460abe9adce82ae84803ddd212.1306782275.git.thomas.petazzoni@free-electrons.com>
	<201105301914.49620.vapier@gentoo.org>
Message-ID: <20110531085817.5a7107eb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On Mon, 30 May 2011 19:14:47 -0400
Mike Frysinger <vapier@gentoo.org> wrote:

> when we already posted a patch to do this, we were shot down because people 
> wanted a general git solution that'd work for all packages (somehow).  is that 
> no longer the case ?

The proposal I'm making is different from the one you and others
submitted in that it reuses the generic package infrastructure to
perform the git download. This is exactly the reason why I "shot down"
previous attempts of implementing this.

Of course, contrary to normal packages for which we support a single
version at a time, defined in the package .mk file, the Linux kernel,
U-Boot and other very hardware-related components have configurable
versions. So even if the package infrastructure is used, each of the
Linux kernel, U-Boot and others have to carry their own set of Kconfig
knobs to select the Git repository and version. But I don't see any way
of doing this in a better way.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
