From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:21:18 +0200
Subject: [Buildroot] [PATCH] imagemagick: Disable OpenMP
In-Reply-To: <1408553365-26770-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1408553365-26770-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20140821152118.73fc9544@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Wed, 20 Aug 2014 18:49:25 +0200, Beno?t Th?baudeau wrote:
> By default (i.e. without adding libgomp.so* to
> BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS), if an external toolchain with libgomp
> support is used, then libgomp is installed to staging/ , but not to target/ .
> Consequently, with such a toolchain, imagemagick's configure detected libgomp as
> supported and enabled its usage for the build stage, but then it failed to run
> on the target because libgomp was missing. This is the bug #7322.
> 
> Disable OpenMP for imagemagick as a temporary workaround, until a better long
> term solution is agreed on and implemented.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
