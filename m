From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 22 Feb 2017 10:27:57 -0800
Subject: [Buildroot] [PATCH 1/1] libimxvpuapi: bump to version 0.10.3
In-Reply-To: <CAAMH-ysR8MWqExv+ojwc-KNUZKAC7x7XREJ7Cr38SHLqA93Jvw@mail.gmail.com>
References: <1487732219-2215-1-git-send-email-danomimanchego123@gmail.com>
 <CAAMH-ysR8MWqExv+ojwc-KNUZKAC7x7XREJ7Cr38SHLqA93Jvw@mail.gmail.com>
Message-ID: <CANxTyt5FT7-ZGE12GA7SBkkLWTZX69nVpSg7wa6=y5PjQbt29A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, Feb 22, 2017 at 12:37 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> Hi Danomi,
>
> On Wed, Feb 22, 2017 at 3:56 AM, Danomi Manchego
> <danomimanchego123@gmail.com> wrote:
>>
>> Because with libimxvpuapi older than 0.10.3, the gst1-imx-0.12.3 "imxvpu"
>> plugin will not build:
>
> Good catch, I wasn't aware gst1-imx got bumped in the first place (not
> in the loop).
>
>> Checking for 'libimxvpuapi >= 0.10.3'                            : not found
>> could not find installed imxvpuapi library - VPU elements will not be built
>>
>> After this mod:
>>
>> Checking for 'libimxvpuapi >= 0.10.3'                            : yes
>> found installed imxvpuapi library - VPU elements will be built
>
> I'd remove that part of the commit log, I think the first sentence is
> explicit enough.

Okay.

> However, I would add the version changelog so people know what this
> bump brings to the table.
>
> You can have the changelog list from the release commit:
> https://github.com/Freescale/libimxvpuapi/commit/81a2bbd8

I'm not really in agreement with this - it does not seem like normal
buildroot practice to add much detail on the package bumps that are
not security related.  But that said, it does not hurt to do so, and
unbreaking the gst1-imx VPU plugin is more important than the commit
log, so I'll spin a V2 tonight as you advised.

Thanks,
Danomi -


> Otherwise:
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> Regards,
> Gary
