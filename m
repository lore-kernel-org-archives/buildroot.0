From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 17:09:41 +0200
Subject: [Buildroot] [PATCH] tinyxml2: fix build in static libs
 configuration
In-Reply-To: <1493838254-3658-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1493838254-3658-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20170504170941.72731f38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Samuel Martin here, for CMake related discussion below.

On Thu,  4 May 2017 00:34:14 +0530, Rahul Bedarkar wrote:
> tinyxml2 can build both static and shared libraries. By default, only
> shared library is built. Shared/static builds are controlled using
> separate cmake flags BUILD_SHARED_LIBS and BUILD_STATIC_LIBS.
> 
> In static libs configuration, we internally pass -DBUILD_SHARED_LIBS=OFF
> cmake flag to build system which disables both shared and static builds
> of library, resulting in failures while linking executable with library.
> 
> So pass -DBUILD_STATIC_LIBS=ON cmake flag in case of static libs
> configuration.
> 
> fixes:
>   http://autobuild.buildroot.net/results/d30/d301bcbe5db26068b35eaa94bd816ae8cf8ef2e1
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  package/tinyxml2/tinyxml2.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

I think we need to refactor things more globally here though. Why is
pkg-cmake.mk passing BUILD_SHARED_LIBS and not BUILD_STATIC_LIBS ? Why
are some packages passing BUILD_SHARED_LIBS even if it's already passed
by pkg-cmake.mk ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
