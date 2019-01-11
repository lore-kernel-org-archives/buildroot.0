From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 11 Jan 2019 18:27:21 +0100
Subject: [Buildroot] imx6 solo VPU support in Buildroot
In-Reply-To: <CAE58QoOdeCvOVNBVx=oWzYLgiO-R8A-S2zC1ZtR4-3wGbUVCJw@mail.gmail.com>
References: <CAE58QoON4RUMgNdtUjBQDpYrmUSqTzjTyxJ+3LGPa=V=Q8kTRw@mail.gmail.com>
 <CAOMZO5Aso5o=qeRWYcXoQfQb714APBi7ZgR3aszXgvxEmx8UJA@mail.gmail.com>
 <CAE58QoOdeCvOVNBVx=oWzYLgiO-R8A-S2zC1ZtR4-3wGbUVCJw@mail.gmail.com>
Message-ID: <CAAMH-ytuk2w9Tj19TzrXyU4R1qCqS-=CfLRyGnicJw_dOYK=fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Otherwise, the reason it has been removed is that IMX6S in NXP's
packages doesn't refer to the i.MX6 Solo processors but to the i.MX6
SoloLite and i.MX6 Solo X which do not have a VPU.

You can see it in the menuconfig or package/freescale-imx/Config.in:
config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
    bool "imx6q/imx6dl"

config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
    bool "imx6sl/imx6sx"

So for a i.MX6 Solo processor, you should use the IMX6Q platform as it
is meant for i.MX6 DualLite which is equivalent to the Solo.

I know it all sounds confusing but that's how NXP/Freescale chose to
differentiate their CPU and we decided to match their naming
convention.

Regards,
Gary

Gary Bisson
Boundary Devices, LLC
www.boundarydevices.com


On Fri, Jan 11, 2019 at 1:59 PM Juan A. Rubio <jarubio2001@gmail.com> wrote:
>
> Thanks!,
>
> I'll try this other route.
>
>
> On Fri, 11 Jan 2019 at 12:17 Fabio Estevam <festevam@gmail.com> wrote:
>>
>> Hi Juan,
>>
>> On Fri, Jan 11, 2019 at 9:39 AM Juan A. Rubio <jarubio2001@gmail.com> wrote:
>> >
>> > Hi,
>> >
>> > I've noticed that the imx6 solo VPU is not supported in Buildroot
>> > starting from 2018.02.x
>> >
>> > There is some information about this in this commit:
>> > https://github.com/buildroot/buildroot/commit/b86b227fda97ef439a3cc0da03da0ebcad5c203a
>>
>> This is related to the VPU library used by the NXP vendor code.
>>
>> >
>> > Has anyone come up with a solution to successfully enable the VPU
>> > libraries on imx6 solo with Buildroot?. Is there any more information
>> > about this that might help to get this to work somehow?
>>
>> I am able to use VPU on mx6 with Buildroot using mainline kernel.
>>
>> You can use configs/imx6-sabresd_qt5_defconfig as a reference.
>>
>> Please check this post with the details:
>> https://imxdev.gitlab.io/tutorial/Decoding_video_with_a_mainline_kernel_on_i.MX6/
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
