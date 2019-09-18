From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 09:04:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/libglib2: Do not depend on
 util-linux
In-Reply-To: <debc69b9-9872-1364-e704-6eb5acd8058d@mind.be>
References: <20190916191605.86764-1-aduskett@gmail.com>
 <20190916191605.86764-2-aduskett@gmail.com>
 <20190917220216.3f719f37@windsurf>
 <debc69b9-9872-1364-e704-6eb5acd8058d@mind.be>
Message-ID: <20190918090438.2c522789@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Sep 2019 23:50:33 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Applied to master, thanks. This may cause problems for people who
> > currently needed libmount, but do not have anything else in their
> > configuration that selects util-linux libmount option. Their next
> > Buildroot build will silently no longer have libmount support.  
> 
>  Begging to differ: when bumping Buildroot version, you should *always* use a
> full config, not a defconfig. So libmount will remain selected.

Indeed, with a full config, it will be preserved. But I'm pretty sure
lots of people have a defconfig, and use that across a Buildroot
upgrade.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
