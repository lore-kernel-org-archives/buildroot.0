From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:28:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: disable for musl
 toolchains
In-Reply-To: <1471991636-29161-2-git-send-email-romain.naour@gmail.com>
References: <1471991636-29161-1-git-send-email-romain.naour@gmail.com>
 <1471991636-29161-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20161025232842.2e3a9c3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 00:33:56 +0200, Romain Naour wrote:
> lvm2 doesn't build with musl toolchains due to several assignment of read-only
> variable like stdin, stdout and stderr.
> Also, it use mallinfo function which is not available with musl.
> 
> These issues has been reported upstream [2] but some of them remains
> even with the latest stable release 2.02.163.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3d4df873a3d4fa199e03d8aa8694eafeac474e5a
> [...]
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
> [2] https://www.redhat.com/archives/linux-lvm/2016-February/msg00024.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/cryptsetup/Config.in    | 6 ++++--
>  package/dmraid/Config.in        | 6 ++++--
>  package/docker-engine/Config.in | 1 +
>  package/lvm2/Config.in          | 6 ++++--
>  package/udisks/Config.in        | 5 +++--
>  5 files changed, 16 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
