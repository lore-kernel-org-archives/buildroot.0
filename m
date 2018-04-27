From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 15:46:50 +0200
Subject: [Buildroot] [PATCH RFC] legal-info: add option to store
 manifest in rootfs
In-Reply-To: <20180426193252.19616-1-yann.morin.1998@free.fr>
References: <20180426193252.19616-1-yann.morin.1998@free.fr>
Message-ID: <20180427154650.3710e52e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Florian,

On Thu, 26 Apr 2018 21:32:52 +0200, Yann E. MORIN wrote:
> Some users want to be able to easily ship the manifest of the legal-info
> directly in the target filesystem.
> 
> Those users currently hack their ways around, usign a post-build script
> that calls back to generate legal-info; this is a bit hackish...
> 
> Add an option to that effect.
> 
> Reported-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I'd like to challenge the usefulness of having the manifest on the
target. What is the actual use case ?

Indeed, for license compliance of copyleft license (i.e at least GPL,
LGPL), having the name of the software package, its version and its
license is not sufficient, you also need to provide the full
corresponding source code.

So what is the need for having just the manifest ? Obviously the
complexity of the patch is low, but it's yet another Config.in option,
so I'd like to be sure there is a real, useful use case for it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
