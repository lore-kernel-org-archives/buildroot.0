From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jun 2016 10:55:34 +0200
Subject: [Buildroot] [PATCH 2/2] autofs: fix build for old glibc
 toolchains
In-Reply-To: <1466306712-11768-2-git-send-email-gustavo@zacarias.com.ar>
References: <1466306712-11768-1-git-send-email-gustavo@zacarias.com.ar>
 <1466306712-11768-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160619105534.47c4dcc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Jun 2016 00:25:12 -0300, Gustavo Zacarias wrote:
> Autofs 5.1.2 switched to clock_gettime() unconditionally but didn't
> check for the need of librt (glibc < 2.17) for it. Fixes:
> http://autobuild.buildroot.net/results/0ab/0abd5476b39a6bd192b5e610006ed585ffb2e139/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...fs-build-check-for-clock_gettime-in-librt.patch | 62 ++++++++++++++++++++++
>  package/autofs/autofs.mk                           |  2 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 package/autofs/0002-autofs-build-check-for-clock_gettime-in-librt.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
