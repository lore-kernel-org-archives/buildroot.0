From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 09:50:21 +0200
Subject: [Buildroot] [PATCH] pkg-cmake: Skip compilation in installation
 step
In-Reply-To: <1429733516-4466-1-git-send-email-cedric.marie@openmailbox.org>
References: <1429733516-4466-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <20150423095021.16ba5083@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric Marie,

On Wed, 22 Apr 2015 22:11:56 +0200, C?dric Marie wrote:
> With CMake build system, the "make install" command always compiles
> before installing, to make sure that everything is up-to-date.
> 
> In Buildroot environment, this is quite useless, because the package
> has always already been compiled, either at first build, or when
> invoking "make <package>-rebuild".
> In all cases, when it comes to staging or target installation step, the
> package has just been compiled.
> 
> Using "make install/fast" - in order to skip the compilation step - is
> therefore more appropriate, more consistent with what other build
> systems do, and saves time when you need to rebuild your package.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
> ---
>  package/pkg-cmake.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
