From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 21:22:53 +0200
Subject: [Buildroot] [PATCH 1/3] package/runc: use BR_PATH to find
 pkg-config
In-Reply-To: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160708212253.04137369@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 20:39:35 +0200, Romain Naour wrote:
> When BR2_PACKAGE_LIBSECCOMP is set, go will try to find libseccomp
> library using pkg-config. But pkg-config is not in the PATH when go
> is called during the runc build.
> 
> Set the correct PATH in RUNC_MAKE_ENV.
> 
> Fixes:
> http://autobuild.buildroot.net/results/fea/fea069fec671b32bffd3d133898d71d45abab552
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Christian Stewart <christian@paral.in>
> ---
>  package/runc/runc.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
