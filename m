From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:44:12 +0100
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <CAAkeqgXEXtnppmJVrfRgf_uC3CeX4TunJS-CQ+=sRG+ZBR+-Ag@mail.gmail.com>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
 <20171122041747.11363-1-yurovsky@gmail.com>
 <20171122213336.52a3e196@windsurf.lan>
 <CAAkeqgXEXtnppmJVrfRgf_uC3CeX4TunJS-CQ+=sRG+ZBR+-Ag@mail.gmail.com>
Message-ID: <20171122224412.1543e00d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Nov 2017 13:23:35 -0800, Andrey Yurovsky wrote:

> > Is host-mksquashfs always needed by host-rauc, or only under certain
> > conditions/configurations ?  
> 
> On the host side we use rauc to make a software update bundle. It does
> this by shelling out to mksquashfs in order to turn a directory of
> files (including a manifest) into a signed squashfs image.

Isn't that specific to your RAUC use case? I assume other people can
use RAUC without using signed squashfs images.

So perhaps we shouldn't make host-mksquashfs a mandatory dependency
like your patch does?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
