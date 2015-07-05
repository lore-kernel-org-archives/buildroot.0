From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 17:18:21 +0200
Subject: [Buildroot] [PATCH] wine: fix sane related build failure
In-Reply-To: <1436094900-3217-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1436094900-3217-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150705171821.1493689a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Jul 2015 13:15:00 +0200, Thomas Petazzoni wrote:
> If sane is installed system-wide on the build machine, then the
> sane-config binary found is the one of the system, which returns
> incorrect library paths for cross-compilation.
> 
> To fix this, this commit adds a patch to wine to make it support a
> SANE_CONFIG environment variable, and then adjusts wine.mk to
> explicitly pass the path to $(STAGING_DIR)/usr/bin/sane-config.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/8bd/8bdc1eed55075313403aa8a6c9af6a427bce198e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/wine/0003-sane-config-fix.patch | 21 +++++++++++++++++++++
>  package/wine/wine.mk                    |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 package/wine/0003-sane-config-fix.patch

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
