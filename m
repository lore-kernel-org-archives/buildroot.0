From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 27 Apr 2021 15:25:03 +0200
Subject: [Buildroot] [PATCH] package/freescale-imx/imx-gpu-viv: force
 wayland backend for all i.MX8
In-Reply-To: <0fb11be5-801a-0125-1146-71746246038e@armadeus.com>
References: <20210427120438.1192346-1-gary.bisson@boundarydevices.com>
 <0fb11be5-801a-0125-1146-71746246038e@armadeus.com>
Message-ID: <YIgQr8MhzXxMwg7Q@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Apr 27, 2021 at 03:04:46PM +0200, S?bastien Szymanski wrote:
> Hello Gary,
> 
> On 4/27/21 2:04 PM, Gary Bisson wrote:
> > - As Vivante blobs only support Wayland for all i.MX 8
> 
> Are you sure about that ? The examples (vv_launcher, tiger and
> cover_flow) are working fine on my i.MX8MM platform with the Framebuffer
> output.

Well the thing is the package doesn't include a framebuffer backend, so
you really use the libraries meant for Wayland.

> The libraries need libdrm, though. I will send a patch to fix the
> missing dependency here.

Yes, the Wayland libraries can be used with with libgbm without a
Wayland compositor (what Qt does), but the libraries are still for
"Wayland" backend.

Please review the ARM32 package and compare with ARM64, you'll see the
difference.

Regards,
Gary
