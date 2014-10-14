From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 14 Oct 2014 10:16:33 -0700
Subject: [Buildroot] [PATCH] gst1-plugins-imx: add package
In-Reply-To: <543D33DF.8070005@mind.be>
References: <1412545628-12153-1-git-send-email-bisson.gary@gmail.com>
 <543A9384.8050803@lucaceresoli.net> <543B52A0.6060007@gmail.com>
 <543BC031.60606@lucaceresoli.net> <543D33DF.8070005@mind.be>
Message-ID: <CADCpmyO_-VD52UDJf5MpZGDnTtzJwxyXcOONYwG-rsd4K_7DLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On Tue, Oct 14, 2014 at 7:31 AM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> [snip]
> > # Required by gpu-viv-bin-mx6q
> > comment "gst1-plugins-imx needs an (e)glibc toolchain"
> >     depends on BR2_arm
> >     depends on !BR2_TOOLCHAIN_USES_GLIBC
>
>  That's not the right place for pointing to gpu-viv-bin-mx6q. It should be
> something like:
>
> config BR2_PACKAGE_GST1_PLUGINS_IMX
>         bool "gst1-plugins-imx"
>         depends on BR2_LINUX_KERNEL
>         depends on BR2_arm # Only relevant for i.MX
>         depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
>         select BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>         # Cannot select libfslvpuwrap because user must select the CPU
>         depends on BR2_PACKAGE_LIBFSLVPUWRAP
>
> (I added that thing about libfslvpuwrap but I'm not sure of it...)
>
>
That is actually what I said in the first e-mail, I am not proud of all
those dependencies but I couldn't find a way to select GPU_VIV_MX6Q as it
is only selectable if  FREESCALE_IMX_PLATFORM is set
to FREESCALE_IMX_PLATFORM_IMX6Q. A select like above would give an error
but I'm open to any other solution.

Thanks,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141014/98b98695/attachment.html>
