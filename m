From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Thu, 16 Feb 2012 15:17:06 +0100
Subject: [Buildroot] [PATCH 2/3 v2] uboot: add a new binary format for
	u-boot.img
In-Reply-To: <201202160101.08184.arnout@mind.be>
References: <1329343455-32714-1-git-send-email-n-dechesne@ti.com>
 <1329343455-32714-3-git-send-email-n-dechesne@ti.com>
 <201202160101.08184.arnout@mind.be>
Message-ID: <CALB96N=x1Q6Kf23EWrTdK5vRVOWgmGo07y=Vis4ySDcCg-hfVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 16, 2012 at 1:01 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On Wednesday 15 February 2012 23:04:14 Nicolas Dechesne wrote:
> > For some platforms like OMAP, a new binary format is now being used
> > for u-boot: u-boot.img. It is basically u-boot.bin which has been
> > processed with mkimage.
>
>  Isn't this mainly SPL that requires the .img?  If so, I would make
> IMG the default format if SPL is selected.  I'm not sure if that's
> possible in Kconfig, though.
>

.img is not required by SPL. in OMAP SPL code in uboot, the name u-boot.img
is hardcoded. When actually loading the file (see
http://git.denx.de/?p=u-boot.git;a=blob;f=arch/arm/cpu/armv7/omap-common/spl.c;h=9c1f7e3eda6ce2c405b6c4aa123436036b0f2209;hb=master#l68)
we first check if the u-boot.img is using a mkimage file format, otherwise
we assume it's a raw .bin format. but the filename is still hardcoded, so
we can have platform with SPL but with u-boot.bin



> >
> > Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120216/eed2a075/attachment.html>
