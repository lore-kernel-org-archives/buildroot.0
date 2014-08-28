From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Aug 2014 13:11:22 +0200
Subject: [Buildroot] [PATCH 4/4] libelf: Removes the package
In-Reply-To: <1409219230-17443-5-git-send-email-gregory.clement@free-electrons.com>
References: <1409219230-17443-1-git-send-email-gregory.clement@free-electrons.com>
 <1409219230-17443-5-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <20140828131122.2a0d4533@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory CLEMENT,

On Thu, 28 Aug 2014 11:47:10 +0200, Gregory CLEMENT wrote:
> The elfutils package provides a more recent version of the
> libelf. Some packages such as ltrace need this more recent
> version. Having two packages providing the same library leads to some
> conflicts or dependency problems. For instance at the end we had only
> one libelf.a when the 2 packages were selected.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  package/Config.in                               |     1 -
>  package/libelf/Config.in                        |     7 -
>  package/libelf/libelf-0.8.10-Elf64-fixups.patch | 12361 ----------------------
>  package/libelf/libelf.mk                        |    23 -
>  4 files changed, 12392 deletions(-)
>  delete mode 100644 package/libelf/Config.in
>  delete mode 100644 package/libelf/libelf-0.8.10-Elf64-fixups.patch
>  delete mode 100644 package/libelf/libelf.mk

When removing a package, the config option of the package should be
moved to Config.in.legacy to allow the user to be warned that he is
using a no longer available package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
