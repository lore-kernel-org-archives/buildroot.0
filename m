From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 23:22:02 +0200
Subject: [Buildroot] [PATCH] toolchain-external: CodeSourcery NiosII
 2015.11 affected by PR19405
In-Reply-To: <1455972166-12968-1-git-send-email-romain.naour@gmail.com>
References: <1455972166-12968-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160420232202.7ed0d4a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Feb 2016 13:42:46 +0100, Romain Naour wrote:
> See bug report https://sourceware.org/bugzilla/show_bug.cgi?id=19405
> 
> Fixes:
> http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: add a comment for each packages that selects Qt GUI (Peter)
>     add the link to the bug tracker (Peter)
> ---
>  package/grantlee/Config.in             | 6 ++++--
>  package/opencv/Config.in               | 4 ++++
>  package/opencv3/Config.in              | 5 +++--
>  package/pinentry/Config.in             | 4 ++++
>  package/poppler/Config.in              | 4 ++++
>  package/qt/Config.in                   | 7 +++++++
>  toolchain/toolchain-common.in          | 4 ++++
>  toolchain/toolchain-external/Config.in | 1 +
>  8 files changed, 31 insertions(+), 4 deletions(-)

Applied to master after doing the following changes:

    [Thomas:
     - rename BR2_TOOLCHAIN_BINUTILS_HAS_BUG_19405 to
       BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
     - propagate to the qwt package, which is now selecting
       BR2_PACKAGE_QT_GUI_MODULE.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
