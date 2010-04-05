From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Tue, 06 Apr 2010 00:24:49 +0300
Subject: [Buildroot] [git commit master] matchbox: convert to autotools,
 fix build with start-notification, libxft
In-Reply-To: <20100405092238.EDD8888D31@busybox.osuosl.org>
References: <20100405092238.EDD8888D31@busybox.osuosl.org>
Message-ID: <4BBA5521.40900@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/2010 11:47 AM, Will Wagner wrote:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=f94830d0e5a409b2e2dc30a4e002c180fe09ec4e
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Will Wagner<will_wagner@carallon.com>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>

There is one more problem...
matchbox-desktop fails to load its modules.
Modules are installed to /usr/lib/matchbox/desktop
but it doesn't try to load them from here.

strace output:
write(1, "matchbox-desktop: loading /usr/li"..., 63) = 63
open("/usr/lib/tasks.so", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/home/paulius/buildroot/output/build/staging_dir/usr/lib/tasks.so", 
O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/tasks.so", O_RDONLY)         = -1 ENOENT (No such file or directory)
open("/lib/tasks.so", O_RDONLY)         = -1 ENOENT (No such file or directory)
open("/usr/lib/tasks.so", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/X11R6/lib/tasks.so", O_RDONLY) = -1 ENOENT (No such file or directory)
write(2, "File not found"..., 14)       = 14
write(1, "matchbox-desktop: loading /usr/li"..., 68) = 68
open("/usr/lib/dotdesktop.so", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/home/paulius/buildroot/output/build/staging_dir/usr/lib/dotdesktop.so", 
O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/dotdesktop.so", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/dotdesktop.so", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/dotdesktop.so", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/X11R6/lib/dotdesktop.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
write(2, "File not found"..., 14)       = 14
write(2, "matchbox-desktop: failed to load "..., 51) = 51

> Patch is too large, so refusing to show it
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
