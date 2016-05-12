From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 16:29:36 +0200
Subject: [Buildroot] [PATCH 0/9] Fixes for go language support
In-Reply-To: <cover.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
Message-ID: <20160512162936.3538cf40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 00:08:46 +0000, Geoff Levand wrote:

> Geoff Levand (9):
>       package/go-bootstrap: Add toolchain dependency
>       package/go-bootstrap: Set CGO_ENABLED=0
>       package/go-bootstrap: Set CC to host CC
>       package/go: Add BR2_TOOLCHAIN_HAS_THREADS
>       package/go: Fix powerpc64 config typo
>       package/go: Enable MIPS support
>       package/go: Add HOST_GO_TOOLDIR
>       package/go: Build special host binaries
>       package/flannel: Set go env variables

I've applied a few patches, and made comments on a few others. However,
there's one key issue with this series: it mixes new features (like
"Enable MIPS support") with build/bug fixes, without saying which patch
is a build/bug fix and which patch is a feature addition. For example,
I have no idea if "package/go: Add HOST_GO_TOOLDIR" or "package/go:
Build special host binaries" are needed to fix the build issues or not.

Also, as I said as a reply to one of the patches, please add references
to the autobuilder failures.

Could you resend a new series, on top of the latest master (since I've
applied some of your patches), which contains as the first patches the
build/bug fixes and then as the last patches the feature
additions/improvements? The former will be committed in the master
branch, while the latter will be committed in the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
