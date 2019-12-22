From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 13:53:32 +0100
Subject: [Buildroot] [PATCH] package/openocd: bump to version 104a5cb
In-Reply-To: <20191222135026.75c9cffa@windsurf>
References: <20191217232657.6582-1-fhunleth@troodon-software.com>
 <20191222135026.75c9cffa@windsurf>
Message-ID: <20191222135332.40d50d24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 13:50:26 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Frank,
> 
> On Tue, 17 Dec 2019 18:26:57 -0500
> Frank Hunleth <fhunleth@troodon-software.com> wrote:
> 
> > The OpenOCD project hasn't made a release since January 2017. Much work
> > has happened since then and now. This bumps the version to the latest
> > commit and removes a patch that has been applied upstream.
> > 
> > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>  
> 
> Overall, it certainly looks good to bump OpenOCD, since indeed the
> project is essentially no longer tagging any "official" release.
> 
> However, there a few changes that I'd like to see:
> 
>  - Sync with Fabrice Fontaine, who posted a patch that drops the
>    internal jimctl usage, and instead uses our jimtcl package.

In the mean time, the patch from Fabrice has been merged, so the
internal jimtcl of OpenOCD is no longer needed.

My following points remain valid, though.

> 
>  - Create a separate package for libjaylink, and use it in OpenOCD.
> 
>  - Thanks to the above two points, drop the OPENOCD_GITSUBMODULES = YES
>    variable.
> 
>  - Perhaps use the Git mirror at https://repo.or.cz/w/openocd.git,
>    which is accessible over https://, and therefore will work better
>    for some users behind corporate firewalls.
> 
> Could you rework your submission according to these suggestions?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
