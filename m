From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:39:49 +0200
Subject: [Buildroot] [PATCH v2] package/cifs-utils: bump to version 6.10
In-Reply-To: <20200428192029.30349-1-ryanbarnett3@gmail.com>
References: <20200428192029.30349-1-ryanbarnett3@gmail.com>
Message-ID: <20200429223949.14fdc578@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 14:20:28 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> In the version bump to 6.10 the following changes were:
> 
>  * Fix hash file to two spaces format
>  * Add patch to respect DESTDIR and optionally install man pages for
>    mount.smb3 by utilizing CONFIG_MAN.
>  * Pass -std=gnu11 to fix compile issues found with the sourcery-arm
>    toolchain with C99 style code errors in smbinfo.c and defintion of
>    'struct sa' uisng gnu11 for C11 GNU extensions.
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> CC: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v1 -> v2:
>   - use only -std=c11 (suggested by Yann)
> ---
>  ...-installing-mount.smb3-and-optionall.patch | 41 +++++++++++++++++++
>  package/cifs-utils/cifs-utils.hash            |  4 +-
>  package/cifs-utils/cifs-utils.mk              |  7 +++-
>  3 files changed, 48 insertions(+), 4 deletions(-)
>  create mode 100644 package/cifs-utils/0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
