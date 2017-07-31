From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 22:37:19 +0200
Subject: [Buildroot] [PATCH 1/1] libcodec2: Update to version 0.6.
 Change to cmake-package
In-Reply-To: <20170705114236.14906-1-olivier.schonken@gmail.com>
References: <20170705114236.14906-1-olivier.schonken@gmail.com>
Message-ID: <20170731223719.40a55064@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 13:42:36 +0200, Olivier Schonken wrote:
> The 0.6 version of libcodec2 switched buildsystem from autotools to cmake.
> The patches in the libcodec2 directory were removed because they were
> only relevant to the autotools build.  For the cmake package unittests
> are disabled by default.
> The download site was changed to http://files.freedv.org/codec2.
> An option was added to be able to install examples to target.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  ...ative-compiler-to-build-generate_cookbook.patch | 153 ---------------------
>  .../0002-Add-option-to-disable-unit-tests.patch    |  50 -------
>  package/libcodec2/Config.in                        |  11 +-
>  package/libcodec2/libcodec2.hash                   |   2 +-
>  package/libcodec2/libcodec2.mk                     |  15 +-
>  5 files changed, 20 insertions(+), 211 deletions(-)
>  delete mode 100644 package/libcodec2/0001-Use-the-native-compiler-to-build-generate_cookbook.patch
>  delete mode 100644 package/libcodec2/0002-Add-option-to-disable-unit-tests.patch

I've applied to master, after:

 - Bumping to 0.7, which solves the libdir issue in the .pc file

 - Adding a patch that fixes (again) the .pc file, because now they got
   includedir wrong.

Olivier, could you submit the patch fixing includedir to the upstream
project ?

I've verified that freeswitch module codec2 builds fine with this
version bump.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
