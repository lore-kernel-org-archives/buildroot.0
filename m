From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:20:07 +0100
Subject: [Buildroot] [PATCH 1/2] package/cwiid: bump version
In-Reply-To: <20170219131834.27844-1-bernd.kuhls@t-online.de>
References: <20170219131834.27844-1-bernd.kuhls@t-online.de>
Message-ID: <20170301222007.649277fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 14:18:33 +0100, Bernd Kuhls wrote:
> kodi needs CWIID_MESG_BALANCE
> https://github.com/xbmc/xbmc/blob/Krypton/tools/EventClients/Clients/WiiRemote/CWIID_WiiRemote.cpp#L106
> 
> It was added after the last cwiid release, which took place 2009:
> https://github.com/abstrakraft/cwiid/commit/2174214bc2caca51aa49a47025ccb80b3f75e53f
> 
> Instead of adding another 20k-sized patch we switch to the upstream
> github repo and bump to its HEAD commit, dating back to 2010.
> 
> By doing this we can remove two patches which were applied upstream:
> 
> 0001-fix-link-options-for-as-needed-90.patch
> https://github.com/abstrakraft/cwiid/commit/6af678616531eb1f3d3d0a052313ef9d8125bac7
> 
> 0002-Update-for-BlueZ-changes.patch
> https://github.com/abstrakraft/cwiid/commit/c5dd7d4a9af5a7d8ead8ad26d9e5e0f8f8292d29
> 
> The remaining patches were renumbered.
> 
> This patch is needed for the upcoming Kodi version bump which also adds
> optional cwiid support.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-fix-link-options-for-as-needed-90.patch   | 166 ---------------------
>  ...inking-by-adding-the-missing-lbluetooth-.patch} |   0
>  package/cwiid/0002-Update-for-BlueZ-changes.patch  |  28 ----
>  ...0002-configure-make-wmgui-build-optional.patch} |   0
>  package/cwiid/cwiid.hash                           |   2 +-
>  package/cwiid/cwiid.mk                             |   5 +-
>  6 files changed, 3 insertions(+), 198 deletions(-)
>  delete mode 100644 package/cwiid/0001-fix-link-options-for-as-needed-90.patch
>  rename package/cwiid/{0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch => 0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch} (100%)
>  delete mode 100644 package/cwiid/0002-Update-for-BlueZ-changes.patch
>  rename package/cwiid/{0004-configure-make-wmgui-build-optional.patch => 0002-configure-make-wmgui-build-optional.patch} (100%)

Applied to master, thanks. Since you're interested by this package,
could you add yourself to the DEVELOPERS file as a developer for it?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
