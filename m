From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:46:00 +0200
Subject: [Buildroot] [PATCH v2] package/kmsxx: add patch to fix LTO
 support
In-Reply-To: <20160827102613.16952-1-arnout@mind.be>
References: <20160827102613.16952-1-arnout@mind.be>
Message-ID: <20160827144600.4bfbb05f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 12:26:13 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The LTO support in the kmsxx package uses the host gcc-ar and gcc-ranlib
> instead of the ones from the cross-toolchain. Add a patch that tries to
> find the right one based on CMAKE_C_COMPILER.
> 
> Fixes:
> http://autobuild.buildroot.net/results/16a/16a38a4277dd1152a5955d62cb92f85447791ef3
> 
> Possibly also fixes:
> http://autobuild.buildroot.net/results/f3c/f3c48da3a9706cd366c0e0a96c3cd0ff959f2a78
> (it fails later, possibly because an incompatible host ar)
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v2: Use 'gcc-ranlib' instead of '/usr/bin/gcc-ranlib' (Thomas)
> ---
>  ...001-Fix-LTO-support-for-cross-compilation.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/kmsxx/0001-Fix-LTO-support-for-cross-compilation.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
