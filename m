From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 15:07:26 +0100
Subject: [Buildroot] [PATCH alternative 2] dropbear: add support for
 custom arguments through config file
In-Reply-To: <989a4f7aa922a740098b.1388666082@argentina>
References: <989a4f7aa922a740098b.1388666082@argentina>
Message-ID: <20140102150726.3bc9af1f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 02 Jan 2014 13:34:42 +0100, Thomas De Schampheleire wrote:
> The default port 22 used by dropbear for its SSH connections is not always
> desired. Dropbear accepts an option '-p' to set the port, but doing this was
> not possible from the buildroot-provided init script.
> 
> One way to fix this is by adding a custom S50dropbear in a project-specific
> rootfs overlay. However, this approach has the big disadvantage that bug
> fixes or improvements in the default init script (i.e. in newer buildroot
> releases) are not available (unless you manually port these changes each
> time you upgrade buildroot).
> 
> Another solution is to modify the default init script from a
> project-specific post-build script. However, this is fragile because you'd
> have to sed some line but this line may change in later buildroot releases.
> 
> Yet another solution is to change the default port at build time, by
> patching the options.h header file in the dropbear sources. This was
> proposed with a patch [1] before, but not accepted.
> 
> This patch implements another solution, hinted from the discussion in [1]:
> the default init script now sources a config file /etc/default/dropbear, in
> which the user can set the variable DROPBEAR_ARGS. This is similar to the
> S81named init script in the bind package. The config file would be added to
> a project-specific rootfs overlay, a custom skeleton, or created from a
> post-build script.
> This approach has the advantage of being simple and non-intrusive, without
> any code duplication or fragile script modifications.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2013-November/083165.html
> 
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/dropbear/S50dropbear |  10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
