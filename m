From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 23:07:09 +0200
Subject: [Buildroot] [PATCH] package/rtptools: fix build for toolchains
 missinf SUN RPC headers
In-Reply-To: <1460411195-6507-1-git-send-email-yann.morin.1998@free.fr>
References: <1460411195-6507-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160417230709.5e0d7f89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Apr 2016 23:46:35 +0200, Yann E. MORIN wrote:
> Use a configure check rather than checking explicitly for uClibc.
> 
> Make the patch a git patch at the same time.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/1cf/1cfe3e019a627e7c092dbd94e4b891179e35bedd/
>     http://autobuild.buildroot.org/results/5ba/5bad40610316392c3f213c3e2a27ac76abd88de6/
>     http://autobuild.buildroot.org/results/789/789ebdc6a96fc62ca5c98bdd6b90de20872ea221/
>     ... and numerous similar build failures
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../rtptools/0001-host2ip-no-nis-on-uClibc.patch   | 45 -------------
>  ...isable-NIS-support-for-toolchains-lacking.patch | 73 ++++++++++++++++++++++
>  package/rtptools/rtptools.mk                       |  1 +
>  3 files changed, 74 insertions(+), 45 deletions(-)
>  delete mode 100644 package/rtptools/0001-host2ip-no-nis-on-uClibc.patch
>  create mode 100644 package/rtptools/0001-host2ip.c-disable-NIS-support-for-toolchains-lacking.patch

Applied to master, thanks. Please submit the patch upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
