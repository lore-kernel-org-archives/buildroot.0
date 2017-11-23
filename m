From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 21:10:21 +0100
Subject: [Buildroot] [PATCH v2 3/4] lttng-tools: fix build errors and
 warnings for musl/uClibc-ng
In-Reply-To: <20171122225637.26521-3-eeppeliteloop@gmail.com>
References: <20171122225637.26521-1-eeppeliteloop@gmail.com>
 <20171122225637.26521-3-eeppeliteloop@gmail.com>
Message-ID: <20171123211021.0a06bee2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Nov 2017 17:56:36 -0500, Philippe Proulx wrote:
> Add 0001-Fix-detect-dlmopen-and-disable-corresponding-tests-i.patch to
> detect if dlmopen() exists and disable parts of the build accordingly if
> not. This fixes a bug when building with musl or uClibc-ng.
> 
> Add 0002-Fix-src-common-pipe.h-include-sys-types.h-for-ssize_.patch to
> fix an #include bug when building with musl.
> 
> Add 0003-Fix-warning-src-bin-lttng-utils.c-cast-incompatible-.patch to
> remove compilation warnings.
> 
> All three new patches are in upstream's master branch as of this date
> and will be part of an eventual release.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
> Changes v1 -> v2:
>   - New patch in v2, which was part of a single patch which also
>     bumped the package's version. Now this patch only includes the fixes
>     and another patch bumps the version.

Why was this patch 3/4 in the series? It should have been the first
patch: it's the one fixing a build issue, and the one we want to apply
on master. So I've applied just this patch to master.

Also, there was no reference to the autobuilder failure being fixed, so
I've added that as well.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
