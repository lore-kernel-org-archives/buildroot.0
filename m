From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:35:05 +0100
Subject: [Buildroot] [PATCH] btrfs-progs: don't use <execinfo.h> with
 uClibc
In-Reply-To: <1487630635-28388-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487630635-28388-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170223223505.6f9ab5ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 23:43:55 +0100, Thomas Petazzoni wrote:
> This commit adds a patch to btrfs-progs that fixes the build of
> docker-engine, and possibly other packages including kerncompat.h from
> btrfs-progs.
> 
> For the btrfs-progs build itself, a --disable-backtrace option allows to
> indicate whether backtrace()/<execinfo.h> support should be used or
> not. However, once btrfs-progs is installed, it simply looks at whether
> __GLIBC__ is defined or not to decide to use backtrace() or not.
> 
> However, uClibc defines __GLIBC__ but does not provide backtrace()
> functionality. The additional patch tweaks the kerncompat.h to look at
> __UCLIBC__ and not use backtrace() functionality in this case.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/9dc9370a79c5c44e6c92be6a44334842c211d923/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/btrfs-progs/0002-kerncompat.h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
