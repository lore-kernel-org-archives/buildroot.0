From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 15:02:21 +0200
Subject: [Buildroot] [PATCH] lirc-tools: fix build issue related to
 clock_gettime()
In-Reply-To: <1471614629-30038-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471614629-30038-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160820150221.00136379@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 15:50:29 +0200, Thomas Petazzoni wrote:
> In some older versions of glibc, clock_gettime() is in librt, so we need
> to link with librt when clock_gettime() is used. This commit adds a
> lirc-tools patch to make sure we link with librt when needed.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/2770360880c9b265c8e019141925e56c35ba22dc/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...onfigure-check-for-clock_gettime-in-librt.patch | 54 ++++++++++++++++++++++
>  package/lirc-tools/lirc-tools.mk                   |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 package/lirc-tools/0004-configure-check-for-clock_gettime-in-librt.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
