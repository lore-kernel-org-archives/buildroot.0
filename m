From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Wed, 18 Nov 2015 10:39:27 +0000
Subject: [Buildroot] [PATCH v8] board: add support for Intel Galileo Gen
 2
In-Reply-To: <20151118091716.0edc0975@free-electrons.com>
References: <1447778330.2974.66.camel@intel.com>
 <20151117232830.42e68602@free-electrons.com>
 <1447834278.2751.8.camel@intel.com>
 <20151118091716.0edc0975@free-electrons.com>
Message-ID: <1447843167.2751.17.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Is mtools *always* used by genimage, or only if you build a vfat
> partition? I guess the later. And if that's the case, then it's a bit
> annoying to have host-genimage unconditionally select host-mtools.

Your correct the latter, you risk head scratching if a users try to use
genimage 
and get an error because mtools are missing. mtools is not a huge build
cost to incur?

I explicitly set

BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
 
to take care of this, but ideally I would only need to set
BR2_PACKAGE_HOST_GENIMAGE. 
