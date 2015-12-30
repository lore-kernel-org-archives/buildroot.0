From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 10:10:06 +0100
Subject: [Buildroot] [PATCH 1/3] package/c-libraries: need linux-headers
In-Reply-To: <4f9bb8b34299566e342cf9514f9bcdedc427b579.1451430505.git.yann.morin.1998@free.fr>
References: <cover.1451430505.git.yann.morin.1998@free.fr>
 <4f9bb8b34299566e342cf9514f9bcdedc427b579.1451430505.git.yann.morin.1998@free.fr>
Message-ID: <20151230101006.07525f39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 30 Dec 2015 00:10:38 +0100, Yann E. MORIN wrote:
> Now that we check that a target package in the _DEPENDENCIES of another
> package has to be enabled in config, all target packages must have a
> kconfig symbol.
> 
> Add a Kconfig symbol for linux-headers, and select it from the packages
> that depends on it (C libraries).
> 
> Also remove the now-misleading comments "for legal-info" from the C
> libraries.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/2a9/2a9e5d27b34357819b44f573a834da1ba5079030/
>     ... and numerous similar failures ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Note: all target packages must have a kconfig symbol. Let's take care
> of the most problematic one for now; other patches will come later...

I've applied, even though I'm not super happy with the fact that we
already had a (useless?) BR2_PACKAGE_HOST_LINUX_HEADERS option, and we
now have both a Config.in.host and a Config.in file for what is really
a target package...

Ideally, we would move all the options to the Config.in file, and
rename them.. but that would cause so much Config.in.legacy trouble :-/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
