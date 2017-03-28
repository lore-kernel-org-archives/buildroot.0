From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:46:36 +0200
Subject: [Buildroot] [PATCH] leptonica: fix static build issue
In-Reply-To: <1490646278-27878-1-git-send-email-gilles.talis@gmail.com>
References: <1490646278-27878-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20170328214636.63fd053a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Mar 2017 22:24:38 +0200, Gilles Talis wrote:
> leptonica configure script does not use pkg-config to find the TIFF library,
> so it doesn't know about the transitive dependencies of the TIFF library.
> Switching to PKG_CHECK_MODULES() to discover the library solves the issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8dd2bcc41e861bdd324dd081e39925964d1ac428
> http://autobuild.buildroot.net/results/ec7366d69b00625b652915fa58e3143f1bdcaf62
> http://autobuild.buildroot.net/results/0cd74312a39e3bc59d15789a4c0a891f0f417b8c
> http://autobuild.buildroot.net/results/35f9a0f2db30dd62733142f0fcfa72699452583f
> http://autobuild.buildroot.net/results/f7ea889b2fb96ff7de492e282820c800187573cb
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  ...ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch | 42 ++++++++++++++++++++++
>  package/leptonica/leptonica.mk                     |  6 ++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 package/leptonica/0001-configure.ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch

Applied to master, thanks. Please submit the patch upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
