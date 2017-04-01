From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:50:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/sdl_sound: fix build with physfs
In-Reply-To: <20170330043123.GA25980@tungsten.ozlabs.ibm.com>
References: <20170330043123.GA25980@tungsten.ozlabs.ibm.com>
Message-ID: <20170401155000.4ba77e63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Mar 2017 15:31:23 +1100, Sam Bobroff wrote:
> A buildroot package for physfs has recently been added, and if it is
> detected by sdl_sound's configure it enables code in the simple
> player which fails to build (if the player is enabled).
> 
> (The build problem is due to physfs renaming a macro which has not been
> reflected in sdl_sound.)
> 
> So, add the physfs dependency to the package information and correct
> the build problem with a patch taken from Arch Linux, where they seem
> to have already found and fixed this issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ae5839b978244c434dd86d49b672c437a7b19a66
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
>  package/sdl_sound/0003-renamed-physfs-export.patch | 32 ++++++++++++++++++++++
>  package/sdl_sound/sdl_sound.mk                     |  7 +++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 package/sdl_sound/0003-renamed-physfs-export.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
