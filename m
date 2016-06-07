From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 7 Jun 2016 09:36:55 +0200
Subject: [Buildroot] [PATCH 01/10] firmware-imx: bump to version 5.4
In-Reply-To: <282d0384157042e28d80a63646119b3b@WEBMAIL.arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <642a0f54088507a92effa0f935950326f752d0c8.1464958470.git.awebster@arcx.com>
 <CAAMH-ysqVQDCw1_OmC79tqOEKrTftaOJk=0gNrW7-j3fNMHURQ@mail.gmail.com>
 <282d0384157042e28d80a63646119b3b@WEBMAIL.arcx.com>
Message-ID: <CAAMH-ysUdKhcab9-F6CjhYJQVFsq__jQ__pOQUU7+Hf03ipofg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Mon, Jun 6, 2016 at 7:12 PM, Andrew Webster <Awebster@arcx.com> wrote:
>> -----Original Message-----
>> From: Gary Bisson [mailto:gary.bisson at boundarydevices.com]
>> Sent: Monday, June 06, 2016 10:33 AM
>> To: Andrew Webster
>> Cc: buildroot at buildroot.org
>> Subject: Re: [Buildroot] [PATCH 01/10] firmware-imx: bump to version 5.4
>>
>> Andrew, All,
>>
>> On Fri, Jun 3, 2016 at 3:10 PM, Andrew Webster <awebster@arcx.com>
>> wrote:
>> > Changelog:
>> > - Upgrade to FW v3.1.1_r46072
>> > - v3.1.1_r46070 plus 2 patches 391/392
>> > - FSLARIK-391 [Decoder/H.264] VPU is always busy when decoding an
>> > erroneous H264 bitstream
>> > - FSLARIK-392 [Decoder/VC1] VPU outputs only 1 picture
>> > - Change to the format of Linux coda driver firmware
>>
>> Hmm, that's cool because it means the firmware can now be used by
>> mainline kernel seamlessly, but it also means that it won't work on any kernel
>> < 4.1.15. Do you confirm you've tried it on 4.1.15 kernel only?
>
> Correct, tested against the 4.1.15 kernel only.

I'll try but I'm pretty sure this won't work on 3.14.52.

>> This means that updating defconfig should also be part of this series in my
>> opinion, at least for the NXP platforms.
>
> What would be the verification plan for defconfig updates?  Build each one and check for build errors?

Yes a build check is sufficient, that is what I've been doing before.

>> > This patch is based on the Yocto equivalent:
>> > https://github.com/Freescale/meta-fsl-arm/commit/dbb8773
>>
>> Please share how you've tested the VPU firmware for instance.
>
> I followed the same tests from your previous version bumps (e.g. gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! matroskademux ! imxvpudec ! imxipuvideosink).  I can add the test(s) performed to the commit messages if you like.

Yes please, at least in the cover letter so anyone knows how to make
sure the package actually works.

Thanks,
Gary
