From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 23:48:35 +0200
Subject: [Buildroot] [PATCH] package/opengl: ensure consistency between
 the various providers
In-Reply-To: <1487106796-15403-1-git-send-email-yann.morin.1998@free.fr>
References: <1487106796-15403-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170326234835.4c7c6a7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 22:13:16 +0100, Yann E. MORIN wrote:
> Some GL providers will provide libegl and libgles, but not libgl, while
> other will provide libgl but not libegl not libgles. This can be the
> case with:
>   - mesa3d       -> libgl
>   - rpi-userland -> libegl and libgles
> 
> Since we can not protect against this situation in the Config.in files
> (especially because providers may be out-of-tree), we can only check for
> the validity after the fact.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/6f1/6f197c643972e92f0b27b3afac7da7b4b1115f7e/
>     http://autobuild.buildroot.org/results/6c6/6c6e0a236bde7b892a69119a49422119f3efaa97/
>     http://autobuild.buildroot.org/results/5a2/5a2a1503b7d19c0ca5b0e9093aa24ed9c020e812/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/opengl/opengl.mk | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

This patch has received numerous comments, so I'll mark it as Changes
Requested in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
