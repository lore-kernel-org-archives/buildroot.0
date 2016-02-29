From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:53:18 +0100
Subject: [Buildroot] [PATCH/next 10/31] package/kodi: Remove dependency
 for BR2_STATIC_LIBS from sub packages
In-Reply-To: <1456006176-21308-11-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-11-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229235318.5dc72aa0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:15 +0100, Bernd Kuhls wrote:
> Kodi itself already depends on !BR2_STATIC_LIBS, there is no need to
> duplicate this as reverse dependencies in sub options which depend on
> Kodi.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)

Applied to next, thanks. We normally keep such duplicated dependencies,
in case the top-level option looses its dependency. But in the case of
Kodi, this seems highly unlikely, and the number of sub-options is
quite large, increase the number of useless comments to maintain for no
real benefit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
