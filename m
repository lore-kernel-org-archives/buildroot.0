From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:48:28 +0100
Subject: [Buildroot] [PATCH] pdbg: add patch fixing the build on Blackfin
In-Reply-To: <20171126152947.20153-1-thomas.petazzoni@free-electrons.com>
References: <20171126152947.20153-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171127094828.09316a00@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Nov 2017 16:29:47 +0100, Thomas Petazzoni wrote:
> This commit adds a patch to pdbg that fixes the build on the Blackfin
> architecture. The build failure was due to the recently introduced
> assembly code to embed the DTB into an object file. This code was not
> taking into account the fact that Blackfin has a non-empty
> __USER_LABEL_PREFIX__.
> 
> The patch has been submitted upstream.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/2bf6f56303453fd2ba7e86882168d406ded4cc80/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...fix-to-build-on-architecture-with-non-emp.patch | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/pdbg/0001-template.S-fix-to-build-on-architecture-with-non-emp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
