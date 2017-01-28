From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:08:09 +1300
Subject: [Buildroot] [PATCH v2 1/2] Fix reverse dependencies of
 util-linux
In-Reply-To: <1482765755-29455-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1482765755-29455-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20170128210809.382261e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Dec 2016 20:52:34 +0530, Rahul Bedarkar wrote:
> Commit 006a328ad6be ("util-linux: fix build with ncurses") removed
> dependency on BR2_USE_WCHAR, but failed to update the reverse
> dependencies of util-linux.
> 
> This commit fixes all such reverse dependencies by removing dependency
> on BR2_USE_WCHAR as it is not required by package itself.
> 
> Fixes: 006a328ad6be ("util-linux: fix build with ncurses")
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
> Changes v1 -> v2:
>   - Moved packages, that directly needs wchar or when wchar dependency
>     is pulled from other dependencies, into separate patch 2/2 of this
>     series.
>   - All packages except circus, python-pyzmq are build tested for qemu
>     x86 with wchar disabled or br-arm-basic config.
>   - circus, python-pyzmq depend on python which essentially depends on
>     wchar, so these couldn't build test.
>   - gummiboot is failing with i386 related configs without this patch
>     as well because stdint.h is not found. That failure isn't related
>     to wchar.
>   - docker-engine with btrfs support is failing because execinfo.h is
>     not found. It doesn't seem to be related as well.
>   - BR2_INIT_SYSTEMD depends on glibc toolchain. We explicitly selects
>     BR2_USE_WCHAR for glibc based toolchains. So couldn't build test
>     this package.

I've applied both patches, thanks! If you could watch the autobuilders
in the next few days and see if any new wchar related issue appears, it
would be nice. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
