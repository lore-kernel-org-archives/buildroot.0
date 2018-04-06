From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:39:44 +0200
Subject: [Buildroot] [PATCH] iqvlinux: remove package
In-Reply-To: <20180404160009.16337-1-thomas.petazzoni@bootlin.com>
References: <20180404160009.16337-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180406213944.366e8f03@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 18:00:09 +0200, Thomas Petazzoni wrote:
> This package contains a kernel module from Intel, which could only be
> used together with Intel userspace tools provided under NDA, which
> also come with the same kernel module. The copy of the kernel module
> available on SourceForge is only provided only to comply with the
> GPLv2 requirement. Intel engineers were even surprised it even built
> and were not willing to make any effort to fix their tarball naming to
> contain a version number. Therefore, it does not make sense for
> Buildroot to provide such a package.
> 
> See https://sourceforge.net/p/e1000/bugs/589/ for the discussion.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in.legacy                                   | 18 ++++++
>  DEVELOPERS                                         |  1 -
>  package/Config.in                                  |  1 -
>  .../0001-Support-Linux-kernel-4.12-and-later.patch | 66 ----------------------
>  package/iqvlinux/Config.in                         | 21 -------
>  package/iqvlinux/iqvlinux.hash                     |  6 --
>  package/iqvlinux/iqvlinux.mk                       | 25 --------
>  7 files changed, 18 insertions(+), 120 deletions(-)
>  delete mode 100644 package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch
>  delete mode 100644 package/iqvlinux/Config.in
>  delete mode 100644 package/iqvlinux/iqvlinux.hash
>  delete mode 100644 package/iqvlinux/iqvlinux.mk

Applied to master after doing the following changes:

    [Thomas:
     - remove double "only" noticed by Carlos
     - fix typo packaged -> package noticed by Romain
     - fix check-package warning noticed by Ricardo]

Thanks to everyone who reviewed, and spotted my mistakes!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
