From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 15:16:54 +0100
Subject: [Buildroot] [PATCH alternative 1] dropbear: add support for
 port customization through config file
In-Reply-To: <dd980a2e00a9db7b2d4a.1388666061@argentina>
References: <dd980a2e00a9db7b2d4a.1388666061@argentina>
Message-ID: <20140102151654.006c6188@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 02 Jan 2014 13:34:21 +0100, Thomas De Schampheleire wrote:
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
> which the user can set some variables (currently DROPBEAR_PORT). This is in
> line with the S81named init script in the bind package. The config file
> would be added to a project-specific rootfs overlay, a custom skeleton, or
> created from a post-build script.
> This approach has the advantage of being simple and non-intrusive, without
> any code duplication or fragile script modifications.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2013-November/083165.html
> 
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/dropbear/S50dropbear |  9 +++++++--
>  1 files changed, 7 insertions(+), 2 deletions(-)

Since I've applied the other alternative, I've marked this one as
Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
