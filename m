From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Jan 2021 08:16:41 -0300
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <d6faa5af-c22c-67b2-65a0-5721bf4aa2bf@gmail.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>
 <636366db-0dd3-4a30-7097-d09423d91aa8@gmail.com>
 <CAOMZO5CQ8-rHcZyKPmmSGCo+MSSEKRcbMJMDiFHp5VQDahG+Ug@mail.gmail.com>
 <CAOMZO5AZXr8oY1Z6K30-Bq+a3dF8RAaRmBB1S_51Fh_9UDWgdw@mail.gmail.com>
 <d6faa5af-c22c-67b2-65a0-5721bf4aa2bf@gmail.com>
Message-ID: <CAOMZO5DR1AdSHah4Y1JAGoK+UfiZGGAuLjjC7a6OnshCFcGbbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Wed, Jan 13, 2021 at 5:10 AM Romain Naour <romain.naour@gmail.com> wrote:

> I'm not sure if we should install the vpu firmware directly in "/lib/firmware/"
> or "/lib/firmware/vpu". Feel free to submit a patch to discuss about this change.

Mainline kernels search first inside /lib/firmware and then inside
/lib/firmware/vpu

The NXP BSPs search the VPU firmware inside /lib/firmware/vpu, so I
think we need to use this location, which can make vendor and mainline
kernels happy.

However, it is not working for me if I place it inside
/lib/firmware/vpu with a 5.10 kernel.

I will investigate this when I have a chance.

Thanks
