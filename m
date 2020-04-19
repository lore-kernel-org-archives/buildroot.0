From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:42:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/exfatprogs: new package
In-Reply-To: <20200417201405.109657-1-james.hilliard1@gmail.com>
References: <20200417201405.109657-1-james.hilliard1@gmail.com>
Message-ID: <20200419154200.16478711@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 14:14:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> exFAT filesystem userspace utilities
> 
> We need a patch to fix:
> error: unknown type name ?ssize_t?
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - added host-exfatprogs
>   - add patch fixing error: unknown type name ?ssize_t?
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  package/Config.in.host                        |  1 +
>  ...rogs-add-missing-include-sys-types.h.patch | 49 +++++++++++++++++++
>  package/exfatprogs/Config.in                  |  6 +++
>  package/exfatprogs/Config.in.host             |  6 +++
>  package/exfatprogs/exfatprogs.hash            |  3 ++
>  package/exfatprogs/exfatprogs.mk              | 16 ++++++
>  8 files changed, 83 insertions(+)
>  create mode 100644 package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
>  create mode 100644 package/exfatprogs/Config.in
>  create mode 100644 package/exfatprogs/Config.in.host
>  create mode 100644 package/exfatprogs/exfatprogs.hash
>  create mode 100644 package/exfatprogs/exfatprogs.mk

I've applied, after improving the Config.in help text to explain that
this package is to be used in relation with the upstream kernel exfat
driver, as well as after fixing the license information. I've also
updated the package/exfat-utils Config.in help to make it clear it is
related to the FUSE-based exfat driver in package/exfat.

Do not hesitate to let me know if the wording I have used in exfatprogs
and exfat-utils is not clear.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
