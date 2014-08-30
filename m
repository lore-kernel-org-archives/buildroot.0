From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Aug 2014 14:08:35 +0200
Subject: [Buildroot] [PATCH 1/5] package/libiqrf: fix static link
In-Reply-To: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
References: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140830140835.4eed7e45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat, 30 Aug 2014 11:52:23 +0200, Samuel Martin wrote:
> - libiqrf depends on pthread, so add a patch fixing the build-system that way
> - disable shared object build when BR2_PREFER_STATIC_LIB is set
> 
> Fixes:
>   http://autobuild.buildroot.net/results/210/2108f37e4a41af0b527c78e646e82f1cafa0353d/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  ...e-static-library-and-find-required-thread.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/libiqrf/libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch

Thanks for those patches. Could you submit them to the respective
upstream projects?

Regarding patches 3 and 5 (polarssl and taglib), shouldn't the upstream
package be patched to use instead the standardized -DBUILD_SHARED_LIBS
CMake variable?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
