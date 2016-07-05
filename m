From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 16:01:10 +0200
Subject: [Buildroot] [PATCH 15/24 v2] packages: use the
 <PKG>_TARGET_FINALIZE_HOOKS
In-Reply-To: <8fc9a5924f5adb37bd30284049e7fcc38df66c79.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <8fc9a5924f5adb37bd30284049e7fcc38df66c79.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <20160705160110.070110d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:07:37 +0200, Yann E. MORIN wrote:
> Register package-specific target-finalize hooks with the
> newly-introduced <PKG>_TARGET_FINALIZE_HOOKS.
> 
> This incidentally fixes luarocks, which was registering target-finalize
> hooks even when it was not enabled.
> 
> To be noted, the skeleton package is not converted, because it is not
> optional, we always have it; so its hooks would always be registered
> anyway. Besides, the followup patches would render this conversion moot
> anyway, since those hooks would be spread across the various skeleton
> packages.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/google-breakpad/google-breakpad.mk |  6 ++----
>  package/libglib2/libglib2.mk               |  6 ++----
>  package/libgtk3/libgtk3.mk                 |  4 +---
>  package/luarocks/luarocks.mk               |  3 +--
>  package/perl/perl.mk                       |  4 +---
>  package/python/python.mk                   | 10 ++++------
>  package/python3/python3.mk                 | 10 ++++------
>  7 files changed, 15 insertions(+), 28 deletions(-)

Applied to master, thanks. Please send a followup patch changing the
TARGET_FINALIZE_HOOKS in the toolchain package, as suggested by Romain.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
