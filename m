From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Mar 2016 22:59:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-03-03
In-Reply-To: <CAAMH-yvg94GdZ-cdDi_CyoHod3MMbiZzbgvxDA1BhTyAXzC2=A@mail.gmail.com>
 (Gary Bisson's message of "Mon, 7 Mar 2016 11:07:10 +0100")
References: <20160304073022.647E6102375@stock.ovh.net>
 <CAAMH-ytHBRRC7A3aOynB6TVyJgr82dge8s1pMemreE4N_aXF5w@mail.gmail.com>
 <20160304212419.6529ec0c@free-electrons.com>
 <CAAMH-yvg94GdZ-cdDi_CyoHod3MMbiZzbgvxDA1BhTyAXzC2=A@mail.gmail.com>
Message-ID: <878u1s4onc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

Hi,

>> > I'm looking into a solution but those FREESCALE_IMX_PLATFORM_* are not
 >> > easy to play with.
 >> 
 >> What do you find not easy with those options?

 > The problem with those platform variables is that you can't select
 > them nor you can make imx-vpu easily dependent of them.

 > It requires to change all the packages that select imx-vpu
 > (libimxvpuapi, libfslvpuwrap, gst-fsl-plugins) with redundant
 > information like:
 > depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS || \
 >         BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || \
 >         BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 || \
 >         BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q

 > Although I don't think it's possible, it'd be great to have a macro like:
 > depends on FREESCALE_IMX_PLATFORM_HAS_VPU()

Those _IMX_PLATFORM_IMXx option could presumably select a hidden
_FREESCALE_IMX_PLATFORM_HAS_VPU and then use it somewhat similar to our
BR2_PACKAGE_FOO_ARCH_SUPPORTS options.

 > Or we could drop old platforms support as well as gstreamer0.10 fsl
 > plugins like Yocto did, keeping only mx51/53/6q which are the only we
 > truly support.
 > https://github.com/Freescale/meta-fsl-arm/commit/83b240e7
 > https://github.com/Freescale/meta-fsl-arm/commit/3b698004

The question is, do we have users of the older variants? Does the old
stuff block anything?

-- 
Bye, Peter Korsgaard
