From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 12:43:52 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <CAD6XyYyJn23DXau0VfHOAL03ouY72Pt2GoFu8sQ3rU6xDugVgg@mail.gmail.com>
References: <20180726103630.8643-1-david.degrave@mind.be>
 <20180726103630.8643-2-david.degrave@mind.be>
 <20180728214834.3496b200@windsurf>
 <CAD6XyYyrv809pmGMg3M_9wFekQ2c1JfnKRQ3w8bvqFhG4tVYeA@mail.gmail.com>
 <20180731205154.62967de8@windsurf>
 <ea2ac147-3c9f-a85d-83ea-84f33a0d52e4@mind.be>
 <20180801090548.0c92457b@windsurf>
 <CAD6XyYyJn23DXau0VfHOAL03ouY72Pt2GoFu8sQ3rU6xDugVgg@mail.gmail.com>
Message-ID: <20180801124352.0dfa6670@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Aug 2018 12:36:16 +0200, David De Grave wrote:

> In the other hand, using the host-dtc is working but lead to other problems:

So, using the U-Boot provided DTC is better when available. So indeed,
I think you should just fix U-Boot so that when it
uses ./scripts/dtc/dtc, it builds it first :-)

> - If we upgrade DTC to version 1.4.7 (who is the case now I guess), then it
> still can't find a "unset.dtb" target that I can't figure out from where it
> comes:

dts/Makefile contains:

DEVICE_TREE ?= $(CONFIG_DEFAULT_DEVICE_TREE:"%"=%)
ifeq ($(DEVICE_TREE),)
DEVICE_TREE := unset
endif

This is where your unset.dts comes from.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
