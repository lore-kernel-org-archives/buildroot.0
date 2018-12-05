From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Dec 2018 17:31:03 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
Message-ID: <20181205173103.1eb30a7b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Wed, 5 Dec 2018 17:08:20 +0100, Andreas Naumann wrote:

> In an answer to v4 of this series I mentioned the issue I had with empty 
> RPATH in some host-lib. After digging some more I found this happens 
> during the prepare-sdk step (which I call in my wrapper script). Before 
> this step, your suggested readelf output reports the correct pathes, 
> however after, RPATH is empty. I compared this to a "standard" SDK, 
> there RPATH is set to $ORIGIN/../lib or something similar.

So are you saying the issue still exists, and to reproduce, I simply
need to do:

 $ make
 $ make prepare-sdk

of a build with BR2_PER_PACKAGE_DIRECTORIES=y ?

> Actually, an unrelated question arises: Why does the SDK need to build 
> world, which includes all filesystem images, first? Should it not be 
> sufficient to depend on $(PACKAGES) or now host-finalize only?

Yes, it would be sufficient to build packages + host-finalization I
believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
