From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 22:37:01 +0200
Subject: [Buildroot] [PATCH 2/2] python-falcon: new package
In-Reply-To: <32a0a4a5-a2c4-c42b-50b4-5e618eaf73ef@blach.pl>
References: <20180828101618.4746-1-grzegorz@blach.pl>
 <20180828101618.4746-2-grzegorz@blach.pl>
 <CAMWSM7jvM=oqzCns6RAx32RDDdnFF0ikvhMjXdDCPRoB_d27cA@mail.gmail.com>
 <20180829214758.718d5e7f@windsurf>
 <32a0a4a5-a2c4-c42b-50b4-5e618eaf73ef@blach.pl>
Message-ID: <20180829223701.7a5a0299@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Aug 2018 22:25:30 +0200, Grzegorz Blach wrote:

> If BR2_PACKAGE_HOST_PYTHON_CYTHON is enabled in config, Falcon uses 
> Cython to compile own code.  Cython on target is not required in this 
> case.

OK.

> Settings PYTHON_FALCON_DEPENDENCIES += host-python-cython
> in python-falcon/Config.in also is not required, but may be usable to 
> guarantee, that host-python-cython is always installed
> before python-falcon.

Actually our policy is that when a package A can optionally be used by
package B, then package B should have a dependency on package A when
package A is enabled, which is what Joseph was suggesting.

This ensures that package B gets the additional feature
provided/enabled by package A, regardless of the package build order,
and generally makes sure that the features provided by package A
benefits all package that can make use of it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
