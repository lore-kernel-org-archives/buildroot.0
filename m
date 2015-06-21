From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:37:37 +0200
Subject: [Buildroot] [PATCH 1/1] system: make /bin/sh symlink use
 relative path
In-Reply-To: <64CA5C49A43E314D9F7DAE05370E2F7B05F54E71@hed-dc01.hed.local>
References: <64CA5C49A43E314D9F7DAE05370E2F7B05F54E71@hed-dc01.hed.local>
Message-ID: <20150621093737.1565eed5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Starr,

On Tue, 16 Jun 2015 15:42:28 -0500, Matthew Starr wrote:
> The symlink created by buildroot for /bin/sh is the full path to
> a shell.  This does not match what busybox and other Linux
> distributions do with using relative path symlinks. When handling
> files on the host system this will point to the host system's shell
> if present and not the target shell.
> 
> This is fixed by changing the /bin/sh symlink to use relative a path
> since both files are in the same directory.
> 
> This was reported as Bug #8161 at bugs.busybox.net
> 
> Signed-off-by: Matthew Starr <mstarr@hedonline.com>
> ---
>  system/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied after fixing the minor nits suggested by Yann, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
