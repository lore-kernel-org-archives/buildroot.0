From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Fri, 18 Jul 2014 18:46:04 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: add patch to fix build failure
	with es5.x
In-Reply-To: <20140715180419.0ad269fd@free-electrons.com>
References: <1405439655-5843-1-git-send-email-hadrien.boutteville@gmail.com>
 <20140715180419.0ad269fd@free-electrons.com>
Message-ID: <53C94F4C.6070500@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 15 Jul 2014 18:04:19 +0200, Thomas Petazzoni wrote:
> Dear Hadrien Boutteville,
> 
> On Tue, 15 Jul 2014 17:54:15 +0200, Hadrien Boutteville wrote:
> 
>> +--- a/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c
>> ++++ b/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c
>> +@@ -177,7 +177,7 @@
>> + #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0))
>> + #define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->manager : NULL
>> + #else
>> +-#define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->output->manager : NULL
>> ++#define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->src->manager : NULL
> 
> Isn't this going to break with some kernel versions? I believe an
> additional condition on LINUX_VERSION_CODE might be needed, no?

Indeed, I'm sending a new version.

Thanks,

Hadrien
