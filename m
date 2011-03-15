From: Richard Guy Briggs <rgb@tricolour.net>
Date: Tue, 15 Mar 2011 10:26:24 -0400
Subject: [Buildroot] [PATCH 0 of 3] Add support for local package
 downloads (file://)
In-Reply-To: <patchbomb.1300174025@localhost6.localdomain6>
References: <patchbomb.1300174025@localhost6.localdomain6>
Message-ID: <20110315142624.GW7248@embryo.tricolour.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 15, 2011 at 08:27:05AM +0100, Thomas De Schampheleire wrote:
> This patch series add support for file:// URLs for both the package
> infrastructure, as for the BR2_PRIMARY_SITE and BR2_BACKUP_SITE options. URLs
> starting with file:// will be handled by a plain 'cp' instead of wget. A new
> SITE_METHOD 'file' is added. Documentation is updated as well.

Hi Thomas,

This looks like a more thorough implementation of what I started and
attached to bug 3343.

I'd recommend taking Thomas' patches over mine!

Mine also had starting points for scp and rsync as well.

> Note that this is mainly useful in situations where developers working on a
> project are sharing the same filesystem (e.g. disk, NFS, ...), as typically
> is the case in corporate environments. In that case, one may add one or more
> local project-specific packages, and even use a central storage location as
> 'proxy' for package downloads (using BR2_PRIMARY_SITE with a file:// URL).

This was my motivation too.  It also was found to be helpful for quicker
prototyping and debugging.

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  docs/buildroot.html         |  29 +++++++++++++++++------------
>  package/Makefile.package.in |  14 +++++++++++---
>  2 files changed, 28 insertions(+), 15 deletions(-)

	slainte mhath, RGB

--
Richard Guy Briggs               --  ~\    -- ~\            <hpv.tricolour.net>
<www.TriColour.net>                --  \___   o \@       @       Ride yer bike!
Ottawa, ON, CANADA                  --  Lo_>__M__\\/\%__\\/\%
Vote! -- <greenparty.ca>_____GTVS6#790__(*)__(*)________(*)(*)_________________
