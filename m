From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:33:13 +0200
Subject: [Buildroot] [PATCH 02/10] gst1-imx: bump to version 0.12.1
In-Reply-To: <1acf85bcc2a25fa6282c6057699b20e26548d905.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <1acf85bcc2a25fa6282c6057699b20e26548d905.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-yucxbR7vdu5mF=m5q=6btK1UzHjfa8=obVnuD0J90Wttw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 3, 2016 at 3:10 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> * compositor: Rename ImxCompositor(Pad) to ImxVideoCompositor(Pad)
>   This prevents conflicts if both the NXP plugins and the gstreamer-imx
>   are installed in the same rootfs
>
> * Add switches to wscript configuration to enable/disable plugins
>   Until now, all plugins were built (unless their dependencies were
>   missing). On some i.MX machines, some features are missing. For
>   example, the i.MX7 has no VPU. To ensure deterministic builds, it is
>   useful to selectively disable plugins in the build.

This update is actually very important, we can now explicitly select
which element we want to be built. As said to Baruch[1], I think this
package should be reworked more deeply in order to have a menu
allowing to select the elements to be built.

Since the switches to wscript configuration are brought by this
update, my opinion is that it should be done in one patch. I can take
care of it if you don't want to.

Regards,
Gary

[1]: http://patchwork.ozlabs.org/patch/611642/
