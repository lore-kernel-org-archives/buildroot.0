From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:01:07 +0100
Subject: [Buildroot] [PATCH 1/2] package/gpm: Install libgpm.so to fix
 gpm detection in package links
In-Reply-To: <1455988141-6929-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455988141-6929-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221150107.6f92dca4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 18:09:00 +0100, Bernd Kuhls wrote:
> The unversioned library was missing in the build system, part of the fix
> was backported from upstream, the final patch was sent upstream.
> 
> Fixes linking against gpm by the links package which fails to detect
> gpm support when libgpm.so is not present.
> 
> Configure log from links without this patch:
> checking for gpm.h... yes
> checking for Gpm_Open in -lgpm... no
> checking for Gpm_GetLibVersion... no
> 
> Configure log from links with this patch:
> checking for gpm.h... yes
> checking for Gpm_Open in -lgpm... yes
> checking for Gpm_GetLibVersion... yes
> checking for Gpm_Event wdx and wdy... yes
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../gpm/0002-Install-unversioned-solibrary.patch   | 41 ++++++++++++++++++++++
>  ...e.in-Really-install-unversioned-solibrary.patch | 31 ++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 package/gpm/0002-Install-unversioned-solibrary.patch
>  create mode 100644 package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
