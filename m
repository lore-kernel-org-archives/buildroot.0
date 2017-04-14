From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 22:30:09 +0200
Subject: [Buildroot] [PATCH] package/hiredis: fix install step for
 static build only
In-Reply-To: <20170414130225.16408-1-romain.naour@gmail.com>
References: <20170414130225.16408-1-romain.naour@gmail.com>
Message-ID: <20170414223009.78b495bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 15:02:25 +0200, Romain Naour wrote:
> The previous patch [1] didn't take into acount the static build only
> scenario. It try to install unconditionally a shared library.
> 
> Handle the install step like for bzip2 package.
> 
> Install the shared library only if BR2_SHARED_LIBS or
> BR2_SHARED_STATIC_LIBS is set and install the static library only
> if BR2_STATIC_LIBS or BR2_SHARED_STATIC_LIBS is set.
> 
> [1] 96daacb720cffe1f83259462bef9d3da92925cd9
> 
> Fixes:
> http://autobuild.buildroot.net/results/6be/6be8024dd664af83fcf49ede29c8ad59a37f73d1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/hiredis/hiredis.mk | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
